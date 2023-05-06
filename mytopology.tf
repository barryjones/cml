provider "cml" {
  host = "cml-controller.home.arpa"
  username = "admin"
  password = "tnm0KEP6bgm*udk6tke"
}

resource "cml_topology" "mytopology" {
  name = "My Topology"
  node_templates = [
    {
      name = "Router1"
      type = "router"
    },
    {
      name = "Switch1"
      type = "switch"
    }
  ]
}

resource "cml_link" "mylink" {
  topology_name = cml_topology.mytopology.name
  node_a = "Router1"
  interface_a = "GigabitEthernet0/1"
  node_b = "Switch1"
  interface_b = "GigabitEthernet1/0"
}
