Feature: API should return localisation information of the host associated to a public IPV4/IPV4/DNS Record

  API exploited is freegeoip.com which is a publix open API :
  https://freegeoip.app/json/[IPV4/IPV6/DNS Record]

  Scenario:  Locate a valid public IPV4/IPV6/DNS Record address
    Given the following inputs : 192.168.0.1
    When API is called
    Then API should return [JSON]

  Scenario: Locate an invalid public/private IPV4/IPV6/DNS Record
    Given the following IP address 192.168.0.1
    When API is called
    Then API should return [JSON]