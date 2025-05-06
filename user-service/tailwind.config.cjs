module.exports = {
  // purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      maxWidth: {
        '80vw': '80vw',
      },
      screens: {
        'md-ctm':'400px',
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
