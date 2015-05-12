// button.cpp
//
#include <iostream>
#include <string>

#include <boost/phoenix/phoenix.hpp>
// Nana
#include <nana/gui.hpp>
#include <nana/gui/widgets/button.hpp>

int main(int argc, char* argv[])
{
    namespace phoenix = boost::phoenix;

    nana::form fm;
    fm.caption(STR("hello"));
    nana::button btn(fm, nana::rectangle(20, 20, 150, 30));
    btn.caption(STR("ok"));
    //btn.events().click(std::cout << phoenix::val("hello world"));
    btn.events().click(nana::API::exit);
    fm.show();
    nana::exec();

    return 0;
}
