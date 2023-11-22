import { createBrowserRouter, RouterProvider} from 'react-router-dom'
import Home from '../screens/Home'
import About from '../screens/About'
import Contact from '../screens/Contact'

const router = createBrowserRouter([
  {
    path: '/',
    element: <Home />
  },
  {
    path: '/about',
    element: <About />
  },
  {
    path: '/contact',
    element: <Contact />
  },
])

export const Provider = <RouterProvider router={router} />