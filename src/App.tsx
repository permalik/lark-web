import {
  NavigationMenu,
  NavigationMenuItem,
  NavigationMenuLink,
  NavigationMenuList,
  navigationMenuTriggerStyle,
} from "@/components/ui/navigation-menu";
import { ChatForm } from "./components/ui/chat/chat";
import "./styles/main.css";
import { Link } from "@radix-ui/react-navigation-menu";

function App() {
  return (
    <>
      <header className="mx-3.5 mb-16 pt-3 flex items-center justify-between">
        <a href="/" className="px-4 py-2 rounded-md font-semibold">
          Lark
        </a>
        <NavigationMenu>
          <NavigationMenuList>
            <NavigationMenuItem>
              <NavigationMenuLink
                asChild
                className={navigationMenuTriggerStyle()}
              >
                <Link href="/">Dashboard</Link>
              </NavigationMenuLink>
            </NavigationMenuItem>
            <NavigationMenuItem>
              <NavigationMenuLink
                asChild
                className={navigationMenuTriggerStyle()}
              >
                <Link href="/">Chat</Link>
              </NavigationMenuLink>
            </NavigationMenuItem>
          </NavigationMenuList>
        </NavigationMenu>
      </header>
      <main className="px-[clamp(0.5rem,2vw,5rem)] flex flex-col">
        <ChatForm />
      </main>
    </>
  );
}

export default App;
