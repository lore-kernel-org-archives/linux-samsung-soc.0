From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5420: Add CLK_SET_RATE_PARENT flag
 to mout_mau_epll_clk
Date: Mon, 12 Mar 2018 11:29:47 +0100
Message-ID: <6c79e24e-4127-4702-1dee-80fa0c409966@samsung.com>
References: <CGME20180307164708epcas1p27e6599e85617f559c5c4c8eb92a70a47@epcas1p2.samsung.com>
 <20180307164656.12194-1-s.nawrocki@samsung.com>
 <5AA09F22.2070903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <5AA09F22.2070903@samsung.com>
Content-language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sboyd@kernel.org, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDMvMDgvMjAxOCAwMzoyNSBBTSwgQ2hhbndvbyBDaG9pIHdyb3RlOgo+IE9uIDIwMTjrhYQg
MDPsm5QgMDjsnbwgMDE6NDYsIFN5bHdlc3RlciBOYXdyb2NraSB3cm90ZToKPj4gVGhpcyBhbGxv
d3MgY2hhbmdpbmcgdGhlIEVQTEwgb3V0cHV0IGZyZXF1ZW5jeSB0aHJvdWdoIHRoZSBhdWRpbyBz
dWJzeXN0ZW0KPj4gY2xvY2sgdHJlZSBsZWFmIGNsb2Nrcy4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVk
IHRvIHN1cHBvcnQgYXVkaW8gb24gdGhlIEhETUkKPj4gaW50ZXJmYWNlIG9uIFBlYWNoLVBpKHQp
IENocm9tZWJvb2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFN5bHdlc3RlciBOYXdyb2NraSA8cy5u
YXdyb2NraUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2Nsay9zYW1zdW5nL2Nsay1l
eHlub3M1NDIwLmMgfCAzICsrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGst
ZXh5bm9zNTQyMC5jIGIvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQyMC5jCj4+IGlu
ZGV4IDhjMDUwZmY2MzUzNi4uMWYyMDRiYTM3ZjBmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Ns
ay9zYW1zdW5nL2Nsay1leHlub3M1NDIwLmMKPj4gKysrIGIvZHJpdmVycy9jbGsvc2Ftc3VuZy9j
bGstZXh5bm9zNTQyMC5jCj4+IEBAIC02MjEsNyArNjIxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzYW1zdW5nX211eF9jbG9jayBleHlub3M1NDIwX211eF9jbGtzW10gX19pbml0Y29uc3QgPSB7
Cj4+ICAKPj4gIAlNVVgoQ0xLX01PVVRfTVhfTVNQTExfQ0NPUkUsICJtb3V0X214X21zcGxsX2Nj
b3JlIiwKPj4gIAkJCW1vdXRfZ3JvdXA1XzU4MDBfcCwgU1JDX1RPUDcsIDE2LCAyKSwKPj4gLQlN
VVgoMCwgIm1vdXRfbWF1X2VwbGxfY2xrIiwgbW91dF9tYXVfZXBsbF9jbGtfcCwgU1JDX1RPUDcs
IDIwLCAyKSwKPj4gKwlNVVhfRigwLCAibW91dF9tYXVfZXBsbF9jbGsiLCBtb3V0X21hdV9lcGxs
X2Nsa19wLCBTUkNfVE9QNywgMjAsIDIsCj4+ICsJICAgICAgQ0xLX1NFVF9SQVRFX1BBUkVOVCwg
MCksCj4+ICAKPj4gIAlNVVgoMCwgIm1vdXRfZmltZDEiLCBtb3V0X2dyb3VwM19wLCBTUkNfRElT
UDEwLCA0LCAxKSwKPj4gIH07Cj4+Cj4gTG9va3MgZ29vZCB0byBtZS4KPiBBY2tlZC1ieTogQ2hh
bndvbyBDaG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+CgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3
LCBwYXRjaCBhcHBsaWVkIHRvIHRoZSBjbGsvc2Ftc3VuZyB0cmVlLgoKLS0gClJlZ2FyZHMsClN5
bHdlc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXJtLWtlcm5lbAo=
