From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/8] drm/exynos/ipp: image post processing improvements
Date: Thu, 22 May 2014 20:53:01 +0900
Message-ID: <537DE51D.6080309@samsung.com>
References: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAwNeyblCAxOeydvCAxOTo1NCwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBUaGlz
IHNldCBvZiBpbmRlcGVuZGVudCBwYXRjaGVzIGNvbnRhaW5zIHZhcmlvdXMgaW1wcm92ZW1lbnQg
YW5kIGZpeGVzCj4gZm9yIGV4eW5vc19kcm0gaXBwIGZyYW1ld29yayBhbmQgZHJpdmVycy4KPiBU
aGUgcGF0Y2hzZXQgaXMgYmFzZWQgb24gZHJtLWV4eW5vcy9leHlub3MtZHJtLW5leHQgYnJhbmNo
LgoKVGhhbmtzIGZvciBjb250cmlidXRpb25zIGFuZCBtZXJnZWQuCgpUaGFua3MsCklua2kgRGFl
Cgo+IAo+IFJlZ2FyZHMKPiBBbmRyemVqCj4gCj4gCj4gQW5kcnplaiBIYWpkYSAoOCk6Cj4gICBk
cm0vZXh5bm9zL2lwcDogZml4IGdldF9wcm9wZXJ0eSBJT0NUTAo+ICAgZHJtL2V4eW5vcy9pcHA6
IGNvcnJlY3QgaXBwX2lkIGZpZWxkIGluaXRpYWxpemF0aW9uCj4gICBkcm0vZXh5bm9zL2lwcDog
c2ltcGxpZnkgcHJvcGVydHkgbGlzdCBhbGxvY2F0aW9uCj4gICBkcm0vZXh5bm9zL2ZpbWM6IHNp
bXBsaWZ5IHByZS1zY2FsZXIgcmF0aW8gY2FsY3VsYXRpb24KPiAgIGRybS9leHlub3MvZmltYzog
c2ltcGxpZnkgaXJxIG1hc2tpbmcgZnVuY3Rpb24KPiAgIGRybS9leHlub3MvZmltYzogcmVwbGFj
ZSBodyBhY2Nlc3MgbWFjcm9zIHdpdGggZnVuY3Rpb25zCj4gICBkcm0vZXh5bm9zL2ZpbWM6IHJl
cGxhY2UgbXV0ZXggYnkgc3BpbmxvY2sKPiAgIGRybS9leHlub3MvZmltYzogc2ltcGxpZnkgYW5k
IHJlbmFtZSBmaW1jX2RzdF9nZXRfYnVmX3NlcQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZmltYy5jICAgIHwgNDI3ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jICAgICB8ICAxMCArLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1faXBwLmMgICAgIHwgIDE2ICstCj4g
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pcHAuaCAgICAgfCAgIDMgKy0KPiAg
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3JvdGF0b3IuYyB8ICAgOCArLQo+ICA1
IGZpbGVzIGNoYW5nZWQsIDE5NiBpbnNlcnRpb25zKCspLCAyNjggZGVsZXRpb25zKC0pCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
