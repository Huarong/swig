/* Tests the Java specific directives */

%module java_typemaps_proxy


%typemap(javaimports) SWIGTYPE "import java.math.*;";
%typemap(javacode) Farewell %{
  public void saybye(BigDecimal num_times) {
    // BigDecimal requires the java.math library
  }
%}
%typemap(javaclassmodifiers) Farewell "public final";

%typemap(javaimports) Greeting %{
import java.util.*; // for EventListener
import java.lang.*; // for Exception
%};

%typemap(javabase) Greeting "Exception";
%typemap(javainterfaces) Greeting "EventListener";
%typemap(javacode) Greeting %{
  // Pure Java code generated using %typemap(javacode) 
  public void sayhello() {
    hello();
  }

  public static void cheerio(EventListener e) {
  }
%}


%inline %{
class Greeting {
public:
    void hello() {}
};
class Farewell {
};
%}
