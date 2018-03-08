From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5420: Add more entries to EPLL rate
 table
Date: Thu, 08 Mar 2018 10:55:06 +0900
Message-ID: <5AA097FA.5070704@samsung.com>
References: <20180307164656.12194-1-s.nawrocki@samsung.com>
 <CGME20180307164733epcas1p3695c022315be8d2839ac9e88016e3a76@epcas1p3.samsung.com>
 <20180307164656.12194-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20180307164656.12194-2-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sboyd@kernel.org, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxOOuFhCAwM+yblCAwOOydvCAwMTo0NiwgU3lsd2VzdGVyIE5hd3JvY2tpIHdyb3RlOgo+
IEFkZGluZyB0aGVzZSBFUExMIG91dHB1dCBmcmVxdWVuY3kgZW50cmllcyBhbGxvd3MgdG8gc3Vw
cG9ydCBhbGwgcmVxdWlyZWQKPiBhdWRpbyBzYW1wbGUgcmF0ZXMgb24gdGhlIENPREVDIGFuZCB0
aGUgSERNSSBpbnRlcmZhY2Ugb24gUGVhY2gtUGl0Cj4gQ2hyb21lYm9vay4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTeWx3ZXN0ZXIgTmF3cm9ja2kgPHMubmF3cm9ja2lAc2Ftc3VuZy5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5vczU0MjAuYyB8IDMgKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsv
c2Ftc3VuZy9jbGstZXh5bm9zNTQyMC5jIGIvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9z
NTQyMC5jCj4gaW5kZXggMWYyMDRiYTM3ZjBmLi5mMjYwN2NiOTdhOTcgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQyMC5jCj4gKysrIGIvZHJpdmVycy9jbGsv
c2Ftc3VuZy9jbGstZXh5bm9zNTQyMC5jCj4gQEAgLTEzNjAsOCArMTM2MCwxMSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNhbXN1bmdfcGxsX3JhdGVfdGFibGUgZXh5bm9zNTQyMF9lcGxsXzI0bWh6
X3RibFtdID0gewo+ICAJUExMXzM2WFhfUkFURSgxODA2MzM2MDlVLCAzMDEsIDUsIDMsIDM2NzEp
LAo+ICAJUExMXzM2WFhfUkFURSgxMzEwNzIwMDZVLCAxMzEsIDMsIDMsIDQ3MTkpLAo+ICAJUExM
XzM2WFhfUkFURSgxMDAwMDAwMDBVLCAyMDAsIDMsIDQsIDApLAo+ICsJUExMXzM2WFhfUkFURSgg
NzM3MjgwMDBVLCA5OCwgMiwgNCwgMTk5MjMpLAo+ICsJUExMXzM2WFhfUkFURSggNjc3Mzc2MDJV
LCA5MCwgMiwgNCwgMjA3NjIpLAo+ICAJUExMXzM2WFhfUkFURSggNjU1MzYwMDNVLCAxMzEsIDMs
IDQsIDQ3MTkpLAo+ICAJUExMXzM2WFhfUkFURSggNDkxNTIwMDBVLCAxOTcsIDMsIDUsIC0yNTY5
MCksCj4gKwlQTExfMzZYWF9SQVRFKCA0NTE1ODQwMVUsIDkwLCAzLCA0LCAyMDc2MiksCj4gIAlQ
TExfMzZYWF9SQVRFKCAzMjc2ODAwMVUsIDEzMSwgMywgNSwgNDcxOSksCj4gIH07Cj4gIAo+IAoK
TG9va3MgZ29vZCB0byBtZS4KQWNrZWQtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1
bmcuY29tPgoKLS0gCkJlc3QgUmVnYXJkcywKQ2hhbndvbyBDaG9pClNhbXN1bmcgRWxlY3Ryb25p
Y3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwK
