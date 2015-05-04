From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm/exynos: Fix build breakage on !DRM_EXYNOS_FIMD
Date: Mon, 4 May 2015 12:34:51 +0100
Message-ID: <CAPj87rM-utcjuWD+ZB7_m01X3qUsNnwJmabCYZAAQUkAdRabaQ@mail.gmail.com>
References: <1430539706-2945-1-git-send-email-k.kozlowski.k@gmail.com>
 <55472339.8040408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55472339.8040408@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiA0IE1heSAyMDE1IGF0IDA4OjQzLCBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5j
b20+IHdyb3RlOgo+IE9uIDIwMTXrhYQgMDXsm5QgMDLsnbwgMTM6MDgsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+IFNlbGVjdGluZyBDT05GSUdfRkJfUzNDIGRpc2FibGVzIENPTkZJR19E
Uk1fRVhZTk9TX0ZJTUQgbGVhZGluZyB0byBidWlsZAo+PiBlcnJvcjoKPgo+IE5vLCBlRFAgaGFz
IG5vIGFueSBkZXBlbmRlbmN5IG9mIEZJTUQgYnV0IERFQ09OLiBKdXN0IGFkZCBkZXBlbmRlbmN5
Cj4gY29kZSBsaWtlIGJlbG93LAo+Cj4gIGNvbmZpZyBEUk1fRVhZTk9TN19ERUNPTgo+ICAgICAg
ICAgYm9vbCAiRXh5bm9zIERSTSBERUNPTiIKPiAtICAgICAgIGRlcGVuZHMgb24gRFJNX0VYWU5P
Uwo+ICsgICAgICAgZGVwZW5kcyBvbiBEUk1fRVhZTk9TICYmICFGQl9TM0MKCkJ1dCBpdCBkb2Vz
IGNsZWFybHkgYW5kIGV4cGxpY2l0bHkgY2FsbCBmaW1kX2RwX2Nsb2NrX2VuYWJsZSBmcm9tCmV4
eW5vc19kcF9wb3dlcm97bixmZn0uIFNvIHRoZSBkZXBlbmRlbmN5IHlvdSdyZSBwcm9wb3Npbmcg
c2VlbXMKYmFja3dhcmRzOiBpdCdzIG5vdCBhbiBleHByZXNzaW9uIG9mIHRoZSByZXF1aXJlbWVu
dHMgb2YgdGhlIGN1cnJlbnQKY29kZSAodGhhdCBGSU1EIERQIGNvZGUgYmUgYXZhaWxhYmxlLCBp
LmUuIENPTkZJR19EUk1fRVhZTk9TX0ZJTUQgaXMKc2VsZWN0ZWQpLCBidXQgYW4gaW5kaXJlY3Qg
ZXhwcmVzc2lvbiBvZiBhbm90aGVyIGRlcGVuZGVuY3kKKENPTkZJR19GQl9TM0MgZGlzYWJsZXMg
Q09ORklHX0RSTV9FWFlOT1NfRklNRCwgc28gZGlzYWJsZQpDT05GSUdfRkJfUzNDKS4KCkFkZGl0
aW9uYWxseSwgYXMgdGhlIGNhbGwgY29tZXMgZnJvbSBleHlub3NfZHBfY29yZS5jLCB3aGljaCBp
cyBidWlsdApieSBDT05GSUdfRFJNX0VYWU5PU19EUCAoYW4gZXhwbGljaXRseSB1c2VyLXNlbGVj
dGFibGUgb3B0aW9uKSwgd2h5CnNob3VsZG4ndCB0aGUgZGVwZW5kZW5jeSBiZSB0aGVyZT8gQWgs
IGJlY2F1c2UgdGhlIGRlcGVuZGVuY3kgb24gRFAgaXMKZm9yIChERUNPTiB8fCBGSU1EKSwgYnV0
IGFzIERFQ09OIGRvZXNuJ3QgcHJvdmlkZQpmaW1kX2RwX2Nsb2NrX2VuYWJsZSgpLCBpdCBkb2Vz
bid0IHNlZW0gbGlrZSBpdCB3b3VsZCBjb21waWxlIGlmIHlvdQpzZWxlY3RlZCBERUNPTiBhbmQg
bm90IEZJTUQuCgpTbywgZm9yIG1lLCB0aGUgY2xlYW5lc3Qgc29sdXRpb24gd291bGQgYmUgY29u
ZmlnIERSTV9FWFlOT1NfRFAgZ2FpbnMKYSBoYXJkIGRlcGVuZGVuY3kgb24gRFJNX0VYWU5PU19G
SU1ELCBhdCBsZWFzdCB1bnRpbCBpdCBjYW4gYmUgZml4ZWQKdG8gY29tcGlsZSB3aXRob3V0IEZJ
TUQuCgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
