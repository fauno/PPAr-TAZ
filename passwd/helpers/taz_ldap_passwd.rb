require 'ldap'

Passwd.helpers do
  # Basada en
  # http://www.iflowfor8hours.info/2012/02/ruby-webbased-ldap-password-changer/
  def taz_ldap_passwd(username, current, new)
    LDAP::Conn.set_option(LDAP::LDAP_OPT_PROTOCOL_VERSION, 3)

    conn = LDAP::Conn.new('127.0.0.1', LDAP::LDAP_PORT)

    conn.bind("mail=#{username}@partidopirata.com.ar,ou=pirates,dc=PPAR.local", "#{current}")

    changepw=[LDAP::Mod.new(LDAP::LDAP_MOD_REPLACE, 'userPassword', ["{SSHA}#{new}"]),]

    begin
      conn.modify("mail=#{username}@partidopirata.com.ar,ou=pirates,dc=PPAR.local", changepw)
      @return = true
    rescue LDAP::ResultError
      @return = false
    end

    conn.unbind
    @return
  end
end
