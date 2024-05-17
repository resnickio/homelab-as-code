# Image Creation with Packer

A collection of workflows for creating deployable operating system images.

## Supported Operating Systems

| Operating System          | Version   |
| :---                      | :---      |
| Red Hat Enterprise Linux  | 9         |
| Ubuntu                    | 22.04 LTS |
| Ubuntu                    | 24.04 LTS |

## Directory Structure

| Directory     | Description                                                                               |
| :---          | :---                                                                                      |
| `ansible`     | Contains the Ansible roles to prepare Linux machine image builds.                         |
| `artifacts`   | Contains the OVF artifacts exported by the builds, if enabled.                            |
| `builds`      | Contains the templates, variables, and configuration files for the machine image builds.  |
| `manifests`   | Manifests created after the completion of th emachine image builds.                       |
| `scripts`     | Contains the scripts to initialize and prepare Windows machine image builds.              |

## References

* [HashiCorp Packer Documentation](https://developer.hashicorp.com/packer) - Official Packer documentation.
* [VMware vSphere - vSphere ISO](https://developer.hashicorp.com/packer/integrations/hashicorp/vsphere/latest/components/builder/vsphere-iso) - Documentation for the vSphere ISO builder from the VMware vSphere Packer plugin by HashiCorp.
* [Packer Examples for vSphere](https://github.com/vmware-samples/packer-examples-for-vsphere/) - A collection of examples demonstrating how to automate the creation of virtual machine images for VMware vSphere environments.

## License

MIT License

Copyright (c) 2024 Michael Resnick

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
