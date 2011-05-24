#assert_generates(path, options, defaults={}, extras={}, message=nil)

def test_generates
  assert_generates("/", :controller => "store", :action => "index")
  assert_generates("/products", { :controller => "products", :action => "index"})
  assert_generates("/line_items", { :controller => "line_items", :action => "create", :product_id => "1"}, 
                  {:method => :post}, { :product_id => "1"})
end

#assert_recognizes(options, path, extras={}, message=nil)

def test_recognizes 
  #Check the default index action gets generated
  asserts_recognizes({"controller" => "store", "action" => "index"}, "/")
  
  #Check routing to an action
  assert_recognizes({"controller" => "products", "action" => "index"}, "/products")
  
  #And routing with a paramter
  assert_recognizes({"controller" => "line_items", "action" => "create", "product_id" => "1"}, {:path => "/line_items", :method => :post}, {"product_id" => "1"})
end

#assert_routing(path, options, defaults={}, extras={}, message=nil)

def test_routing
  assert_routing("/", :controller => "store", :action => "index")
  assert_routing("/products", :controller => "products", :action => "index")
  assert_routing({:path => "/line_items", :method => :post},
                  {:controller => "line_items", :action => "create", :product_id => "1"},
                  {}, { :product_id => "1"})
end