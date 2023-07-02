'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/NOTICES": "a236aeb84572d29479d52225740c3379",
"assets/assets/logos/logo-no-background.png": "e8b6f3b2a1dc0a40d874d4a163249876",
"assets/assets/logos/MWHAHAH.png": "50795eddaaf82d19291712a347ea1ec6",
"assets/assets/logos/questify_1024.png": "c9f066487bfe900540ee6de26d931296",
"assets/assets/logos/MWHAHAH.svg": "c899e22150260388b8e6014b1ab256ac",
"assets/assets/logos/app_icon_1024.png": "83caada6888de0a5705136f850288010",
"assets/assets/logos/questify_svg.svg": "f6471cfd7fcbc76d1f424e2a770d32e2",
"assets/assets/logos/app_icon_android.png": "fdb8141a6f4802d897f2b9f0850024b0",
"assets/assets/logos/Questify_App_Icon.png": "86f37b47673ee083059f0c9afa2bcb92",
"assets/assets/icons/Vector.png": "da64a6f7e2099b3a0a8a01a8512f0898",
"assets/assets/icons/urgency.png": "52e9f7b6b5f808a08df8d90d0ef22a8e",
"assets/assets/icons/urgency.svg": "58514ba7b482ac025240d26c4fbd31e9",
"assets/assets/icons/emoji.png": "8d5b9d8b727b06320d4397464511229c",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "74fe8af1d2cc458c5d39c86ec41a7176",
"assets/AssetManifest.json": "c028d6959b192c7e0ee1d7366c64700e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/fonts/MaterialIcons-Regular.otf": "60178ca1d9b54230f90d75e07e4b45cb",
"index.html": "645643fa45f8be48a6fbe4d638b19371",
"/": "645643fa45f8be48a6fbe4d638b19371",
"main.dart.js": "02bcd9477d94b29540455def11c3be5a",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"version.json": "50ef152c90477868cd74e0ed0ccdd796",
"manifest.json": "33b45f8451768cc12592ce2a672b43f9",
"icons/Icon-512.png": "9f284cd426e250f8cceff5b0007a7f62",
"icons/Icon-maskable-512.png": "9f284cd426e250f8cceff5b0007a7f62",
"icons/Icon-maskable-192.png": "b2188c717aae7dd411c1c0c2ededb036",
"icons/Icon-192.png": "b2188c717aae7dd411c1c0c2ededb036",
"favicon.png": "c9b1be00d6a0a37d793463ac8b715406",
"splash/img/light-3x.png": "1eebf9b114e94a0bddfafdbf49a2fd37",
"splash/img/dark-2x.png": "c357b6ffd2c5bc948c5ce53e489fef6b",
"splash/img/dark-1x.png": "93f4c86f1f9ad7d276da267fa32d3d47",
"splash/img/dark-3x.png": "1eebf9b114e94a0bddfafdbf49a2fd37",
"splash/img/light-1x.png": "93f4c86f1f9ad7d276da267fa32d3d47",
"splash/img/light-4x.png": "e9d69265a446b2d43fc7a0b9f5a90dca",
"splash/img/dark-4x.png": "e9d69265a446b2d43fc7a0b9f5a90dca",
"splash/img/light-2x.png": "c357b6ffd2c5bc948c5ce53e489fef6b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
