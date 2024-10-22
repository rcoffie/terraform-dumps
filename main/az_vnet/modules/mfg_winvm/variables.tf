variable "vm_map" {
  type = map(object({
    name = string
  }))
default = {
  "vm1" = {
    name = "test1"
  }
  "vm2"={
    name="test2"
  }
}
}


variable "mfg_winvm_subnet" {
  type = any 
  default = []
}