From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/6] drm/exynos: g2d: rework sleep and runtime PM
Date: Wed, 28 Sep 2016 08:41:28 +0900
Message-ID: <57EB03A8.1060103@samsung.com>
References: <CGME20160927155105epcas1p2f38b5f490e87cdfd9893a01b28b30e54@epcas1p2.samsung.com>
 <1474991411-2937-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1474991411-2937-1-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

V2Ugd291bGQgbmVlZCB0byByZXZpZXcgdGhpcyBwYXRjaCBzZXJpZXMgZm9yIC1uZXh0IGluIGEg
aHVycnkuCkkgaGF2ZSB0byByZXF1ZXN0IGdpdC1wdWxsIHNvb24uCgoyMDE264WEIDA57JuUIDI4
7J28IDAwOjUw7JeQIFRvYmlhcyBKYWtvYmkg7J20KOqwgCkg7JO0IOq4gDoKPiBIZWxsbyBldmVy
eW9uZSwKPiAKPiBhcyBkaXNjdXNzZWQgd2l0aCBNYXJlayBJIGhhdmUgYnJva2VuIGRvd24gbXkg
aW5pdGlhbCBwYXRjaCBpbnRvIHNtYWxsZXIgcGllY2VyLgo+IAo+IEFueXdheSwgdGhpcyBzZXJp
ZXMgZml4ZXMgYSByZWdyZXNzaW9uIGludHJvZHVjZWQgYnkgY29tbWl0Cj4gYjA1OTg0ZTIxYTdl
MDAwYmY1MDc0YWNlMDBkN2E1NzQ5NDRiMmMxNi4KPiAKPiBXaXRoIGJlc3Qgd2lzaGVzLAo+IFRv
Ymlhcwo+IAo+IFRvYmlhcyBKYWtvYmkgKDYpOgo+ICAgUmV2ZXJ0ICJkcm0vZXh5bm9zOiBnMmQ6
IGZpeCBzeXN0ZW0gYW5kIHJ1bnRpbWUgcG0gaW50ZWdyYXRpb24iCj4gICBkcm0vZXh5bm9zOiBn
MmQ6IG1vdmUgUE0gbWFuYWdlbWVudCB0byBydW5xdWV1ZSB3b3JrZXIKPiAgIGRybS9leHlub3M6
IGcyZDogcmVtb3ZlIHJ1bnF1ZXVlIG5vZGVzIGluIGcyZF97Y2xvc2UscmVtb3ZlfSgpCj4gICBk
cm0vZXh5bm9zOiBnMmQ6IHdhaXQgZm9yIGVuZ2luZSB0byBmaW5pc2gKPiAgIGRybS9leHlub3M6
IGcyZDogdXNlIGF1dG9zdXNwZW5kIG1vZGUgZm9yIFBNIHJ1bnRpbWUKPiAgIGRybS9leHlub3M6
IGcyZDogc2ltcGxpZnkgZzJkX2ZyZWVfcnVucXVldWVfbm9kZSgpCj4gCj4gIGRyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyB8IDIzNyArKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTg4IGluc2VydGlvbnMoKyksIDQ5IGRlbGV0
aW9ucygtKQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
