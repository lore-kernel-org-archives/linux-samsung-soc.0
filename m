From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/7] Documentation: bindings: Add Exynos5433 PMU compatible
Date: Tue, 16 Aug 2016 10:15:20 +0200
Message-ID: <a7cbc817-964b-e7a3-ccc8-7867f97166fb@samsung.com>
References: <1471328843-26653-1-git-send-email-cw00.choi@samsung.com>
 <1471328843-26653-3-git-send-email-cw00.choi@samsung.com>
 <CGME20160816074111epcas1p2ef832dad29a5b0a81fc5e783aed70ee4@epcas1p2.samsung.com>
 <488f925b-4c37-1759-04a8-11d992405527@samsung.com>
 <57B2C9EE.6000005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <57B2C9EE.6000005@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: inki.dae@samsung.com, jonghwa3.lee@samsung.com, s.nawrocki@samsung.com, jy0922.shim@samsung.com, jaewon02.kim@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org, jh80.chung@samsung.com, a.hajda@samsung.com, human.hwang@samsung.com, chanwoo@kernel.org, ingi2.kim@samsung.com, m.szyprowski@samsung.com, beomho.seo@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDgvMTYvMjAxNiAxMDowOCBBTSwgQ2hhbndvbyBDaG9pIHdyb3RlOgo+IEhpIEtyenlzenRv
ZiwKPiAKPiBPbiAyMDE264WEIDA47JuUIDE27J28IDE2OjQwLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+PiBPbiAwOC8xNi8yMDE2IDA4OjI3IEFNLCBDaGFud29vIENob2kgd3JvdGU6Cj4+
PiBUaGlzIHBhdGNoIGFkZHMgdGhlIGV4eW5vczU0MzMgUE1VIGNvbXBhdGlibGUgdG8gc3VwcG9y
dCB0aGUgYWNjZXNzCj4+PiBvZiBQTVUgKFBvd2VyIE1hbmFnZW1lbnQgVW5pdCkgYmxvY2suCj4+
Pgo+Pj4gQ2M6IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5lbC5vcmc+Cj4+PiBDYzogS3J6eXN6dG9m
IEtvemxvd3NraSA8ay5rb3psb3dza2lAc2Ftc3VuZy5jb20+Cj4+PiBDYzogUm9iIEhlcnJpbmcg
PHJvYmgrZHRAa2VybmVsLm9yZz4KPj4+IENjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBh
cm0uY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNob2lAc2Ftc3Vu
Zy5jb20+Cj4+PiAtLS0KPj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3NhbXN1bmcvcG11LnR4dCB8IDEgKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL3NhbXN1bmcvcG11LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vc2Ftc3VuZy9wbXUudHh0Cj4+PiBpbmRleCAyZDYzNTZkOGRhZjQuLmJmNWZjNTlhNjkzOCAx
MDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc2Ft
c3VuZy9wbXUudHh0Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL3NhbXN1bmcvcG11LnR4dAo+Pj4gQEAgLTEwLDYgKzEwLDcgQEAgUHJvcGVydGllczoKPj4+
ICAJCSAgIC0gInNhbXN1bmcsZXh5bm9zNTI2MC1wbXUiIC0gZm9yIEV4eW5vczUyNjAgU29DLgo+
Pj4gIAkJICAgLSAic2Ftc3VuZyxleHlub3M1NDEwLXBtdSIgLSBmb3IgRXh5bm9zNTQxMCBTb0Ms
Cj4+PiAgCQkgICAtICJzYW1zdW5nLGV4eW5vczU0MjAtcG11IiAtIGZvciBFeHlub3M1NDIwIFNv
Qy4KPj4+ICsJCSAgIC0gInNhbXN1bmcsZXh5bm9zNTQzMy1wbXUiIC0gZm9yIEV4eW5vczU0MzMg
U29DLgo+Pj4gIAkJICAgLSAic2Ftc3VuZyxleHlub3M3LXBtdSIgLSBmb3IgRXh5bm9zNyBTb0Mu
Cj4+PiAgCQlzZWNvbmQgdmFsdWUgbXVzdCBiZSBhbHdheXMgInN5c2NvbiIuCj4+Cj4+IElzIHRo
ZXJlIGFueSBwbGFuIHRvIGFkZCBFeHlub3M1NDMzIHN1cHBvcnQgdG8KPj4gZHJpdmVycy9zb2Mv
c2Ftc3VuZy9leHlub3MtcG11LmM/IElmIG5vLi4uIHRoZW4gZXh5bm9zNy1wbXUgbWlnaHQgYmUK
Pj4gcmV1c2VkLiBJZiB5ZXMsIHRoZW4gdGhpcyBtYWtlcyBzZW5zZS4KPiAKPiBZZXMuCj4gSSds
bCBzdXBwb3J0IHRoZSBzdXNwZW5kLXRvLXJhbSBmb3IgRXh5bm9zNTQzMy4gQnV0IGl0IGlzIG5v
dCByaWdodCBub3cuCj4gYmVjYXVzZSB0aGUgY3VycmVudCBrZXJuZWwgc3VwcG9ydCB0aGUgc3Vz
cGVuZC10by1yYW0gZm9yIG9ubHkgMzItYml0IEV4eW5vcy4KPiBhbmQgdGhlIHBtL3N1c3BlbmQg
Y29kZSBhcmUgaW5jbHVkZWQgaW4gaW4gYXJjaC9hcm0vbWFjaC1leHlub3MvLgo+IAo+IFRvIHN1
cHBvcnQgdGhlIHN1c3BlbmQtdG8tcmFtIGZvciA2NGJpdCBFeHlub3MsIEkgbmVlZCBhIGxvdCBv
ZiB0aW1lCj4gdG8gc3VwcG9ydCB0aGUgNjQtYml0IHN1c3BlbmQuCgpPSywgbWFrZSBzZW5zZS4K
ClJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1zdW5nLmNv
bT4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
