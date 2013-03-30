require 'ldap'
require 'digest'
require 'base64'

Passwd.helpers do
  # Basada en
  # http://www.iflowfor8hours.info/2012/02/ruby-webbased-ldap-password-changer/
  def taz_ldap_passwd(username, current, new)

    conn = LDAP::Conn.new('127.0.0.1', LDAP::LDAP_PORT)
    conn.set_option(LDAP::LDAP_OPT_PROTOCOL_VERSION, 3)

    # FIXME atrapar LDAP::ResultError (Invalid credentials)
    conn.bind("mail=#{username}@partidopirata.com.ar,ou=pirates,dc=PPAR.local", "#{current}")

    changepw=[LDAP::Mod.new(LDAP::LDAP_MOD_REPLACE, 'userPassword', [taz_ssha(new)]),]

    begin
      conn.modify("mail=#{username}@partidopirata.com.ar,ou=pirates,dc=PPAR.local", changepw)
      @return = true
    rescue LDAP::ResultError => reason
      @return = false
    end

    conn.unbind
    @return
  end

# http://youreference.blogspot.com.br/2010/10/web-based-ldap-reset-password.html
  def taz_ssha(password)
    salt = rand.hash.to_s

    "{SSHA}"+Base64.encode64(Digest::SHA1.digest("#{password}#{salt}")+salt).chomp!
  end
end
