control "V-94611" do
  title "The unexposed feature keyword
isolation.tools.guestDnDVersionSet.disable must be set on the virtual machine."
  desc  "Some virtual machine advanced settings parameters do not apply on
vSphere because VMware virtual machines work on both vSphere and hosted
virtualization platforms such as Workstation and Fusion. Explicitly disabling
these features reduces the potential for vulnerabilities because it reduces the
number of ways in which a guest can affect the host."
  impact 0.3
  tag severity: nil
  tag gtitle: "SRG-OS-000480-VMM-002000"
  tag gid: "V-94611"
  tag rid: "SV-104441r1_rule"
  tag stig_id: "VMCH-65-000026"
  tag fix_id: "F-100729r1_fix"
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
Edit Configuration. Verify the isolation.tools.guestDnDVersionSet.disable value
is set to true.

or

From a PowerCLI command prompt while connected to the ESXi host or vCenter
server, run the following command:

Get-VM \"VM Name\" | Get-AdvancedSetting -Name
isolation.tools.guestDnDVersionSet.disable

If the virtual machine advanced setting
isolation.tools.guestDnDVersionSet.disable does not exist or is not set to
true, this is a finding."
  tag fix: "From the vSphere Web Client right-click the Virtual Machine and go
to Edit Settings >> VM Options >> Advanced >> Configuration Parameters >> Edit
Configuration. Find the isolation.tools.guestDnDVersionSet.disable value and
set it to true. If the setting does not exist, add the Name and Value setting
at the bottom of screen.

Note: The VM must be powered off to configure the advanced settings through the
vSphere Web Client so it is recommended to configure these settings with
PowerCLI as it can be done while the VM is powered on. Settings do not take
effect via either method until the virtual machine is cold started, not
rebooted.

or

From a PowerCLI command prompt while connected to the ESXi host or vCenter
server, run the following command:

If the setting does not exist, run:

Get-VM \"VM Name\" | New-AdvancedSetting -Name
isolation.tools.guestDnDVersionSet.disable -Value true

If the setting exists, run:

Get-VM \"VM Name\" | Get-AdvancedSetting -Name
isolation.tools.guestDnDVersionSet.disable | Set-AdvancedSetting -Value true"
end

