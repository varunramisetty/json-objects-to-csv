%dw 2.0
output csv
 
fun flattenObject (parentKey,val) = val mapObject ((value, key, index) -> 
                                        if(typeOf(value) == Object) 
                                            flattenObject(parentKey++ '_' ++ key,value)
                                          else 
                                             (parentKey++ '_' ++ key):value
                                          )
 
---
payload mapObject ((value, key, index) -> if(typeOf(value) == Object) 
                                            flattenObject(key,value)
                                          else 
                                             (key):value
                                          )