control "V-94629" do
  title "Unauthorized removal, connection and modification of devices must be
prevented on the virtual machine."
  desc  "In a virtual machine, users and processes without root or
administrator privileges can connect or disconnect devices, such as network
adaptors and CD-ROM drives, and can modify device settings. Use the virtual
machine settings editor or configuration editor to remove unneeded or unused
hardware devices. If you want to use the device again, you can prevent a user
or running process in the virtual machine from connecting, disconnecting, or
modifying a device from within the guest operating system. By default, a rogue
user with nonadministrator privileges in a virtual machine can:
    1. Connect a disconnected CD-ROM drive and access sensitive information on
the media left in the drive
    2. Disconnect a network adaptor to isolate the virtual machine from its
network, which is a denial of service
    3. Modify settings on a device
  "
  impact 0.5
  tag severity: nil
  tag gtitle: "SRG-OS-000480-VMM-002000"
  tag gid: "V-94629"
  tag rid: "SV-104459r1_rule"
  tag stig_id: "VMCH-65-000037"
  tag fix_id: "F-100747r1_fix"
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
Edit Configuration. Verify the isolation.device.connectable.disable value is
set to true.

or

From a PowerCLI command prompt while connected to the ESXi host or vCenter
server, run the following command:

Get-VM \"VM Name\" | Get-AdvancedSetting -Name
isolation.device.connectable.disable

If the virtual machine advanced setting isolation.device.connectable.disable
does not exist or is not set to true, this is a finding."
  tag fix: "From the vSphere Web Client right-click the Virtual Machine and go
to Edit Settings >> VM Options >> Advanced >> Configuration Parameters >> Edit
Configuration. Find the isolation.device.connectable.disable value and set it
to true. If the setting does not exist, add the Name and Value setting at the
bottom of screen.

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
isolation.device.connectable.disable -Value true

If the setting exists, run:

Get-VM \"VM Name\" | Get-AdvancedSetting -Name
isolation.device.connectable.disable | Set-AdvancedSetting -Value true"
end

