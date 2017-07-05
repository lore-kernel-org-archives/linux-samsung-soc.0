From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v4] drm/exynos/dsi: Remove error handling for
 bridge_node DT parsing
Date: Wed, 05 Jul 2017 16:09:43 +0900
Message-ID: <f27e4099-ee20-9a2c-6f71-02c209aa18d1@samsung.com>
References: <CGME20170621105143epcas5p4b5c7fbbc0263c6190e69df6822e63699@epcas5p4.samsung.com>
 <1498042303-5673-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1498042303-5673-1-git-send-email-hoegeun.kwon@samsung.com>
Content-language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, tjakobi@math.uni-bielefeld.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKCkNvdWxkIHlvdSBjaGVjayB0aGlzIHBhdGNoPyA6RAoKQmVzdCByZWdhcmRzLApI
b2VnZXVuCgpPbiAwNi8yMS8yMDE3IDA3OjUxIFBNLCBIb2VnZXVuIEt3b24gd3JvdGU6Cj4gUmVt
b3ZlIHRoZSBlcnJvciBoYW5kbGluZyBvZiBicmlkZ2Vfbm9kZSBiZWNhdXNlIHRoZSBicmlkZ2Vf
bm9kZSBpcwo+IG9wdGlvbmFsLgo+Cj4gRm9yIGV4YW1wbGUsIEluIGNhc2Ugb2YgRXh5bm9zIFNv
QywgYSBicmlkZ2UgZGV2aWNlIHN1Y2ggYXMgbUROSWUgYW5kCj4gTUlDIGNvdWxkIGJlIHBsYWNl
ZCBiZXR3ZWVuIERpc3BsYXkgQ29udHJvbGxlciBhbmQgTUlQSSBEU0kgZGV2aWNlIGJ1dAo+IHRo
ZSBicmlkZ2UgZGV2aWNlIGlzIG9wdGlvbmFsLgo+Cj4gU2lnbmVkLW9mZi1ieTogSG9lZ2V1biBL
d29uIDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5jb20+Cj4gLS0tCj4KPiBIaSBhbGwsCj4KPiBUaGFu
a3MgZm9yIEtyenlzenRvZidzIGFkdmljZS4KPgo+IENoYW5nZXMgZm9yIFY0Ogo+IC0gRml4ZWQg
dGhlIHdvcmQoJ29wdGlvbmFsJykgZnJvbSBjb21taXQgbWVzc2FnZS4KPgo+IENoYW5nZXMgZm9y
IFYzOgo+IC0gUmVtb3ZlZCB0aGUgd29yZCgncmVxdWlyZWQnKSBmcm9tIGNvbW1pdCBtZXNzYWdl
Lgo+Cj4gQ2hhbmdlcyBmb3IgVjI6Cj4gLSBNb2RpZmllZCB0aGUgY29tbWl0IG1lc3NhZ2UgaW4g
bW9yZSBkZXRhaWwgdGhhbiBiZWZvcmUuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gSG9lZ2V1bgo+Cj4g
ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgfCAyIC0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZHNpLmMKPiBpbmRleCBhMTFiNzk1Li42ZWUwZGFjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwo+IEBAIC0xNjUxLDggKzE2NTEsNiBAQCBzdGF0aWMg
aW50IGV4eW5vc19kc2lfcGFyc2VfZHQoc3RydWN0IGV4eW5vc19kc2kgKmRzaSkKPiAgIAkJcmV0
dXJuIHJldDsKPiAgIAo+ICAgCWRzaS0+YnJpZGdlX25vZGUgPSBvZl9ncmFwaF9nZXRfcmVtb3Rl
X25vZGUobm9kZSwgRFNJX1BPUlRfSU4sIDApOwo+IC0JaWYgKCFkc2ktPmJyaWRnZV9ub2RlKQo+
IC0JCXJldHVybiAtRUlOVkFMOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
