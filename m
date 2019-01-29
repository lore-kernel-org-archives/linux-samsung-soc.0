From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: gsc: Variable "gscblk_cfg" in function
 gsc_set_gscblk_fimd_wb() could be uninitialized
Date: Tue, 29 Jan 2019 09:40:33 +0100
Message-ID: <455d9474-253d-7f1c-f312-08dffad242f3@samsung.com>
References: <CGME20190128184257epcas2p1575d038676762164323e1946dffd1113@epcas2p1.samsung.com>
 <20190128182851.8558-1-yzhai003@ucr.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190128182851.8558-1-yzhai003@ucr.edu>
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
To: Yizhuo <yzhai003@ucr.edu>
Cc: csong@cs.ucr.edu, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, zhiyunq@cs.ucr.edu, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkKCk9uIDIwMTktMDEtMjggMTk6MjgsIFlpemh1byB3cm90ZToKPiBJbiBmdW5jdGlvbiBnc2Nf
c2V0X2dzY2Jsa19maW1kX3diKCksIGxvY2FsIHZhcmlhYmxlICJnc2NibGtfY2ZnIgo+IGNvdWxk
IGJlIHVuaW5pdGlhbGl6ZWQgb2YgZnVuY3Rpb24gcmVnbWFwX3JlYWQgcmV0dXJucyAtRUlOVkFM
Lgo+IEhvd2V2ZXIsIHRoaXMgdmFsdWUgd2lsbCBiZSAgd3JpdGUgdG8gdGhlIHJlZ2lzdGVyIGFm
dGVyICJvciIKPiBvcGVyYXRpb24uIFRoaXMgaXMgcG90ZW50aWFsbHkgdW5zYWZlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogWWl6aHVvIDx5emhhaTAwM0B1Y3IuZWR1Pgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMgfCA3ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nc2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9nc2MuYwo+IGluZGV4IDA1MDZiMmIxN2FjMS4uYjFkMGY5NzRmZTgwIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nc2MuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nc2MuYwo+IEBAIC00NDEsMTEg
KzQ0MSwxNiBAQCBzdGF0aWMgaW50IGdzY19zd19yZXNldChzdHJ1Y3QgZ3NjX2NvbnRleHQgKmN0
eCkKPiAgc3RhdGljIHZvaWQgZ3NjX3NldF9nc2NibGtfZmltZF93YihzdHJ1Y3QgZ3NjX2NvbnRl
eHQgKmN0eCwgYm9vbCBlbmFibGUpCgpUaGlzIGZ1bmN0aW9uIGhhcyBiZWVuIGNvbXBsZXRlbHkg
cmVtb3ZlZCBpbiBtYWlubGluZSBrZXJuZWwgYnkgY29tbWl0CjhiN2QzZWM4M2FiYSAoImRybS9l
eHlub3M6IGdzYzogQ29udmVydCBkcml2ZXIgdG8gSVBQIHYyIGNvcmUgQVBJIiksIHNvCnRoZXJl
IGlzIG5vIG5lZWQgZm9yIGFueSBmaXggYW55bW9yZS4KCj4gIHsKPiAgCXVuc2lnbmVkIGludCBn
c2NibGtfY2ZnOwo+ICsJaW50IHJldDsKPiAgCj4gIAlpZiAoIWN0eC0+c3lzcmVnKQo+ICAJCXJl
dHVybjsKPiAgCj4gLQlyZWdtYXBfcmVhZChjdHgtPnN5c3JlZywgU1lTUkVHX0dTQ0JMS19DRkcx
LCAmZ3NjYmxrX2NmZyk7Cj4gKwlyZXQgPSByZWdtYXBfcmVhZChjdHgtPnN5c3JlZywgU1lTUkVH
X0dTQ0JMS19DRkcxLCAmZ3NjYmxrX2NmZyk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJRFJNX0VSUk9S
KCJnc2M6IEZhaWwgdG8gcmVhZCBzeXN0ZW0gcmVnaXN0ZXJcbiIpOwo+ICsJCXJldHVybjsKPiAr
CX0KPiAgCj4gIAlpZiAoZW5hYmxlKQo+ICAJCWdzY2Jsa19jZmcgfD0gR1NDX0JMS19ESVNQMVdC
X0RFU1QoY3R4LT5pZCkgfAoKQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQaEQK
U2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
