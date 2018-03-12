From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5420: Add more entries to EPLL rate
 table
Date: Mon, 12 Mar 2018 11:31:23 +0100
Message-ID: <848fd858-ab59-a54a-41dd-37ce606a52f5@samsung.com>
References: <20180307164656.12194-1-s.nawrocki@samsung.com>
 <CGME20180307164733epcas1p3695c022315be8d2839ac9e88016e3a76@epcas1p3.samsung.com>
 <20180307164656.12194-2-s.nawrocki@samsung.com>
 <5AA097FA.5070704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <5AA097FA.5070704@samsung.com>
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
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDMvMDgvMjAxOCAwMjo1NSBBTSwgQ2hhbndvbyBDaG9pIHdyb3RlOgo+IE9uIDIwMTjrhYQg
MDPsm5QgMDjsnbwgMDE6NDYsIFN5bHdlc3RlciBOYXdyb2NraSB3cm90ZToKPj4gQWRkaW5nIHRo
ZXNlIEVQTEwgb3V0cHV0IGZyZXF1ZW5jeSBlbnRyaWVzIGFsbG93cyB0byBzdXBwb3J0IGFsbCBy
ZXF1aXJlZAo+PiBhdWRpbyBzYW1wbGUgcmF0ZXMgb24gdGhlIENPREVDIGFuZCB0aGUgSERNSSBp
bnRlcmZhY2Ugb24gUGVhY2gtUGl0Cj4+IENocm9tZWJvb2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFN5bHdlc3RlciBOYXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBk
cml2ZXJzL2Nsay9zYW1zdW5nL2Nsay1leHlub3M1NDIwLmMgfCAzICsrKwo+PiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc2Ft
c3VuZy9jbGstZXh5bm9zNTQyMC5jIGIvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQy
MC5jCj4+IGluZGV4IDFmMjA0YmEzN2YwZi4uZjI2MDdjYjk3YTk3IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2Nsay9zYW1zdW5nL2Nsay1leHlub3M1NDIwLmMKPj4gKysrIGIvZHJpdmVycy9jbGsv
c2Ftc3VuZy9jbGstZXh5bm9zNTQyMC5jCj4+IEBAIC0xMzYwLDggKzEzNjAsMTEgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzYW1zdW5nX3BsbF9yYXRlX3RhYmxlIGV4eW5vczU0MjBfZXBsbF8yNG1o
el90YmxbXSA9IHsKPj4gIAlQTExfMzZYWF9SQVRFKDE4MDYzMzYwOVUsIDMwMSwgNSwgMywgMzY3
MSksCj4+ICAJUExMXzM2WFhfUkFURSgxMzEwNzIwMDZVLCAxMzEsIDMsIDMsIDQ3MTkpLAo+PiAg
CVBMTF8zNlhYX1JBVEUoMTAwMDAwMDAwVSwgMjAwLCAzLCA0LCAwKSwKPj4gKwlQTExfMzZYWF9S
QVRFKCA3MzcyODAwMFUsIDk4LCAyLCA0LCAxOTkyMyksCj4+ICsJUExMXzM2WFhfUkFURSggNjc3
Mzc2MDJVLCA5MCwgMiwgNCwgMjA3NjIpLAo+PiAgCVBMTF8zNlhYX1JBVEUoIDY1NTM2MDAzVSwg
MTMxLCAzLCA0LCA0NzE5KSwKPj4gIAlQTExfMzZYWF9SQVRFKCA0OTE1MjAwMFUsIDE5NywgMywg
NSwgLTI1NjkwKSwKPj4gKwlQTExfMzZYWF9SQVRFKCA0NTE1ODQwMVUsIDkwLCAzLCA0LCAyMDc2
MiksCj4+ICAJUExMXzM2WFhfUkFURSggMzI3NjgwMDFVLCAxMzEsIDMsIDUsIDQ3MTkpLAo+PiAg
fTsKPj4gIAo+Pgo+IExvb2tzIGdvb2QgdG8gbWUuCj4gQWNrZWQtYnk6IENoYW53b28gQ2hvaSA8
Y3cwMC5jaG9pQHNhbXN1bmcuY29tPgoKVGhhbmtzIGZvciB5b3VyIHJldmlldywgcGF0Y2ggYXBw
bGllZCB0byB0aGUgY2xrL3NhbXN1bmcgdHJlZS4KCi0tIApSZWdhcmRzLApTeWx3ZXN0ZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
