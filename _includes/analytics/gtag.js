var gtagScript = document.createElement('script');
gtagScript.type = "text/javascript";
gtagScript.src = "https://www.googletagmanager.com/gtag/js?id={{ include.gtag }}";
gtagScript.async = true;
document.getElementsByTagName('head')[0].appendChild(gtagScript);
window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', '{{ include.gtag }}');
