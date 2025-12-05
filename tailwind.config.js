/** @type {import('tailwindcss').Config} */
    export default {
      content: [
        "./index.html",
        "./src/**/*.{js,ts,jsx,tsx}",
      ],
      theme: {
        extend: {
          colors: {
            primary: '#EA4C36', // Red/Orange from screenshot
            secondary: '#1E293B', // Dark blue text
            bgLight: '#F8FAFC',
          },
          fontFamily: {
            sans: ['Inter', 'sans-serif'],
          }
        },
      },
      plugins: [],
    }
