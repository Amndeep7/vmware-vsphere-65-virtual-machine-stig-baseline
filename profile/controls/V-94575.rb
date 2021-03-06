control "V-94575" do
  title "Independent, non-persistent disks must be not be used on the virtual
machine."
  desc  "The security issue with nonpersistent disk mode is that successful
attackers, with a simple shutdown or reboot, might undo or remove any traces
that they were ever on the machine. To safeguard against this risk, production
virtual machines should be set to use persistent disk mode; additionally, make
sure that activity within the VM is logged remotely on a separate server, such
as a syslog server or equivalent Windows-based event collector. Without a
persistent record of activity on a VM, administrators might never know whether
they have been attacked or hacked.

    There can be valid use cases for these types of disks such as with an
application presentation solution where read only disks are desired and such
cases should be identified and documented.
  "
  impact 0.5
  tag severity: nil
  tag gtitle: "SRG-OS-000480-VMM-002000"
  tag gid: "V-94575"
  tag rid: "SV-104405r1_rule"
  tag stig_id: "VMCH-65-000007"
  tag fix_id: "F-100693r1_fix"
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
go to Edit Settings. Review the attached hard disks and verify they are not
configured as independent nonpersistent disks.

or

From a PowerCLI command prompt while connected to the ESXi host or vCenter
server, run the following command:

Get-VM \"VM Name\" | Get-HardDisk | Select Parent, Name, Filename, DiskType,
Persistence | FT -AutoSize

If the virtual machine has attached disks that are in independent nonpersistent
mode and are not documented, this is a finding."
  tag fix: "From the vSphere Web Client right-click the Virtual Machine and go
to Edit Settings. Select the target hard disk and change the mode to persistent
or uncheck Independent.

or

From a PowerCLI command prompt while connected to the ESXi host or vCenter
server, run the following command:

Get-VM \"VM Name\" | Get-HardDisk | Set-HardDisk -Persistence
IndependentPersistent

or

Get-VM \"VM Name\" | Get-HardDisk | Set-HardDisk -Persistence Persistent"
end

