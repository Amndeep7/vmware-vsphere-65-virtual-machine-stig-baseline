control "V-94623" do
  title "Console connection sharing must be limited on the virtual machine."
  desc  "By default, remote console sessions can be connected to by more than
one user at a time.  When multiple sessions are activated, each terminal window
gets a notification about the new session. If an administrator in the VM logs
in using a VMware remote console during their session, a non-administrator in
the VM might connect to the console and observe the administrator's actions.
Also, this could result in an administrator losing console access to a virtual
machine. For example, if a jump box is being used for an open console session
and the admin loses connection to that box, then the console session remains
open. Allowing two console sessions permits debugging via a shared session.
For highest security, only one remote console session at a time should be
allowed."
  impact 0.5
  tag severity: nil
  tag gtitle: "SRG-OS-000480-VMM-002000"
  tag gid: "V-94623"
  tag rid: "SV-104453r1_rule"
  tag stig_id: "VMCH-65-000033"
  tag fix_id: "F-100741r1_fix"
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
Edit Configuration. Verify the RemoteDisplay.maxConnections value is set to 1.

or

From a PowerCLI command prompt while connected to the ESXi host or vCenter
server, run the following command:

Get-VM \"VM Name\" | Get-AdvancedSetting -Name RemoteDisplay.maxConnections

If the virtual machine advanced setting RemoteDisplay.maxConnections does not
exist or is not set to 1, this is a finding."
  tag fix: "From the vSphere Web Client right-click the Virtual Machine and go
to Edit Settings >> VM Options >> Advanced >> Configuration Parameters >> Edit
Configuration. Find the RemoteDisplay.maxConnections value and set it to 1. If
the setting does not exist, add the Name and Value setting at the bottom of
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

Get-VM \"VM Name\" | New-AdvancedSetting -Name RemoteDisplay.maxConnections
-Value 1

If the setting exists, run:

Get-VM \"VM Name\" | Get-AdvancedSetting -Name RemoteDisplay.maxConnections |
Set-AdvancedSetting -Value 1"
end

