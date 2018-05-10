From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 25/26] drm/bridge: require the owner .odev to be
 filled in on drm_bridge_add/attach
Date: Thu, 10 May 2018 09:13:16 +0200
Message-ID: <6278e7a4-c67a-6198-364e-526042acc393@samsung.com>
References: <20180504135212.26977-1-peda@axentia.se>
 <CGME20180504135352epcas5p48cd98762cd4476621f98b0356b891f7e@epcas5p4.samsung.com>
 <20180504135212.26977-26-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504135212.26977-26-peda@axentia.se>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Peter Senna Tschudin <peter.senna@collabora.com>, Martin Donnelly <martin.donnelly@ge.com>, linux-arm-msm@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDQuMDUuMjAxOCAxNTo1MiwgUGV0ZXIgUm9zaW4gd3JvdGU6Cj4gVGhlIC5vZGV2IG93bmVy
IGRldmljZSB3aWxsIGJlIGhhbmR5IHRvIGhhdmUgYXJvdW5kLgo+Cj4gU2lnbmVkLW9mZi1ieTog
UGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEg
PGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplago+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gaW5kZXggZGYwODRkYjMzNDk0Li43
OGQxODZiNjgzMWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKPiBAQCAtNzAsNiArNzAsOSBAQCBz
dGF0aWMgTElTVF9IRUFEKGJyaWRnZV9saXN0KTsKPiAgICovCj4gIHZvaWQgZHJtX2JyaWRnZV9h
ZGQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgewo+ICsJaWYgKFdBUk5fT04oIWJyaWRn
ZS0+b2RldikpCj4gKwkJcmV0dXJuOwo+ICsKPiAgCW11dGV4X2xvY2soJmJyaWRnZV9sb2NrKTsK
PiAgCWxpc3RfYWRkX3RhaWwoJmJyaWRnZS0+bGlzdCwgJmJyaWRnZV9saXN0KTsKPiAgCW11dGV4
X3VubG9jaygmYnJpZGdlX2xvY2spOwo+IEBAIC0xMTUsNiArMTE4LDkgQEAgaW50IGRybV9icmlk
Z2VfYXR0YWNoKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwgc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSwKPiAgCWlmICghZW5jb2RlciB8fCAhYnJpZGdlKQo+ICAJCXJldHVybiAtRUlOVkFM
Owo+ICAKPiArCWlmIChXQVJOX09OKCFicmlkZ2UtPm9kZXYpKQo+ICsJCXJldHVybiAtRUlOVkFM
Owo+ICsKPiAgCWlmIChwcmV2aW91cyAmJiAoIXByZXZpb3VzLT5kZXYgfHwgcHJldmlvdXMtPmVu
Y29kZXIgIT0gZW5jb2RlcikpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
