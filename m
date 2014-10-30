From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/4] drm/exynos/dsi: remove global display variable
Date: Thu, 30 Oct 2014 21:59:59 +0900
Message-ID: <5452364F.2070402@samsung.com>
References: <1412683271-15835-1-git-send-email-a.hajda@samsung.com>
 <5452318C.1030107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <5452318C.1030107@samsung.com>
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
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAxMOyblCAzMOydvCAyMTozOSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBPbiAx
MC8wNy8yMDE0IDAyOjAxIFBNLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+PiBIaSBJbmtpLAo+Pgo+
PiBNYW55IEV4eW5vcyBEUk0gZHJpdmVycyB1c2VzIGdsb2JhbCB2YXJpYWJsZXMgdG8gcmVwcmVz
ZW50IGFzc29jaWF0ZWQgZGV2aWNlcwo+PiBpbiBFeHlub3MgRFJNIGludGVybmFsIGZyYW1ld29y
ay4gSXQgaXMgcXVpdGUgY29uZnVzaW5nLCBpdCBhZGRzIGRhdGEgZHVwbGljYXRpb24KPj4gYW5k
IGZpbmFsbHkgaXQgZG9lcyBub3QgYWxsb3cgdG8gaGFuZGxlIG1vcmUgdGhhbiBvbmUgZGV2aWNl
IGluIHN5c3RlbS4KPj4gSXQgc2VlbXMgYmV0dGVyIHRvIGVtYmVkIHN1Y2ggc3RydWN0dXJlcyBp
biBwcml2YXRlIGNvbnRleHQgb2YgdGhlIGRldmljZS4KPiAKPiBHZW50bHkgcGluZy4KClRoaXMg
cGF0Y2ggc2VyaWVzIGFscmVhZHkgaXMgaW4gZXh5bm9zLWRybS1uZXh0LXRvZG8gYnJhbmNoLiBJ
IHdpbGwgbW92ZQppdCB0byBleHlub3MtZHJtLW5leHQgYWZ0ZXIgY2hlY2tpbmcuCgpUaGFua3Ms
Cklua2kgRGFlCgo+IAo+IFJlZ2FyZHMKPiBBbmRyemVqCj4gCj4+Cj4+IFRoZSBwYXRjaHNldCBp
cyBiYXNlZCBvbiBleHlub3NfZHJtX25leHQgcGx1cyBteSBwYXRjaCBbMV06Cj4+ICdkcm0vZXh5
bm9zOiByZW1vdmUgZXhwbGljaXQgZW5jb2Rlci9jb25uZWN0b3IgZGUtaW5pdGlhbGl6YXRpb24n
Lgo+Pgo+PiBJZiB0aGUgcGF0Y2hzZXQgaXMgT0sgZm9yIHlvdSBJIGNhbiBwcmVwYXJlIHNpbWls
YXIgcGF0Y2hlcyBmb3Igb3RoZXIgRXh5bm9zIERSTSBjb21wb25lbnRzLgo+Pgo+PiBbMV06IGh0
dHBzOi8vbGttbC5vcmcvbGttbC8yMDE0LzkvMjIvMTQ4Cj4+Cj4+IFJlZ2FyZHMKPj4gQW5kcnpl
ago+Pgo+Pgo+PiBBbmRyemVqIEhhamRhICg0KToKPj4gICBkcm0vZXh5bm9zL2RzaTogcmVtb3Zl
IGdsb2JhbCB2YXJpYWJsZSBleHlub3NfZHNpX2Rpc3BsYXkKPj4gICBkcm0vZXh5bm9zL2RzaTog
c2ltcGxpZnkgZGV2aWNlIHBvaW50ZXIgZXZhbHVhdGlvbgo+PiAgIGRybS9leHlub3MvZHNpOiBy
ZW1vdmUgcmVkdW5kYW50IGVuY29kZXIgZmllbGQKPj4gICBkcm0vZXh5bm9zL2RzaTogc3RvcCB1
c2luZyBkaXNwbGF5LT5jdHggcG9pbnRlcgo+Pgo+PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2RzaS5jIHwgOTYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+
ICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCj4+Cj4g
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
