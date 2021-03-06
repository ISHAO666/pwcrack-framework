#!/usr/bin/env ruby
#
# Plugin objectif_securite
# Author L
#

plugin 'objectif_securite' do 
  web_server 'https://cracker.okx.ch'
  supported_algorithm :ntlm

  crack {
    data = {"value": passwd}
    r = post_json '/crack', data
    msg = r.body.extract(/"msg":"(.+?)"/)
    if msg.match?(/ ?queue\.? /i)
      raise Later
    elsif not msg.include?('Password not found')
      msg
    end
  }
end

