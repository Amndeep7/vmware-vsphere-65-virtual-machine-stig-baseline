input('virtual_machine')

control "V-94563" do
  title "Copy operations must be disabled on the virtual machine."
  desc  "Copy and paste operations are disabled by default; however, by
explicitly disabling this feature it will enable audit controls to check that
this setting is correct. Copy, paste, drag and drop, or GUI copy/paste
operations between the guest OS and the remote console could provide the means
for an attacker to compromise the VM."
  impact 0.3
  tag severity: nil
  tag gtitle: "SRG-OS-000480-VMM-002000"
  tag gid: "V-94563"
  tag rid: "SV-104393r1_rule"
  tag stig_id: "VMCH-65-000001"
  tag fix_id: "F-100679r1_fix"
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: false
  tag mitigations: nil
  tag severity_override_guidance: false
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: nil
  tag check: "From the vSphere Web Client right-click the Virtual Machine and
go to Edit Settings >> VM Options >> Advanced >> Configuration Parameters >>
Edit Configuration. Verify the isolation.tools.copy.disable value is set to
true.

or

From a PowerCLI command prompt while connected to the ESXi host or vCenter
server, run the following command:

Get-VM \"VM Name\" | Get-AdvancedSetting -Name isolation.tools.copy.disable

If the virtual machine advanced setting isolation.tools.copy.disable does not
exist or is not set to true, this is a finding."
  tag fix: "From the vSphere Web Client right-click the Virtual Machine and go
to Edit Settings >> VM Options >> Advanced >> Configuration Parameters >> Edit
Configuration. Find the isolation.tools.copy.disable value and set it to true.
If the setting does not exist, add the Name and Value setting at the bottom of
screen.

Note: The VM must be powered off to configure the advanced settings through the
vSphere Web Client so it is recommended to configure these settings with
PowerCLI as it can be done while the VM is powered on. Settings do not take
effect via either method until the virtual machine is cold started, not
rebooted.

or

From a PowerCLI command prompt while connected to the ESXi host or vCenter
server, run the following command:

If the setting does not exist, run:

Get-VM \"VM Name\" | New-AdvancedSetting -Name isolation.tools.copy.disable -Value true

If the setting exists, run:

Get-VM \"VM Name\" | Get-AdvancedSetting -Name isolation.tools.copy.disable |
Set-AdvancedSetting -Value true"

command = '(Get-VM vcsa | Get-AdvancedSetting -Name isolation.tools.copy.disable).value'

describe powercli_command(command) do
  its('stdout.strip') { should match "true" }
end

end

