From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Adds Samsung NURI board support
Date: Mon, 28 Feb 2011 17:26:50 +0900
Message-ID: <002801cbd721$42e4bad0$c8ae3070$%kim@samsung.com>
References: <4D676BB8.9040803@samsung.com>
	<002301cbd71b$1969bd00$4c3d3700$%kim@samsung.com>
	<4D6B5949.8020606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <4D6B5949.8020606@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Minkyu Kang' <mk7.kang@samsung.com>
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

TWlua3l1IEthbmcgd3JvdGU6Cj4gCj4gRGVhciBLdWtqaW4gS2ltLAo+IAo+IDIwMTEtMDItMjgg
7Jik7ZuEIDQ6NDIsIEt1a2ppbiBLaW0g7JO0IOq4gDoKPiA+IE1pbmt5dSBLYW5nIHdyb3RlOgo+
ID4+Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIFNhbXN1bmcgTlVSSSBib2FyZCBzdXBwb3J0Lgo+ID4+
Cj4gPj4gU2lnbmVkLW9mZi1ieTogTWlua3l1IEthbmcgPG1rNy5rYW5nQHNhbXN1bmcuY29tPgo+
ID4+IFNpZ25lZC1vZmYtYnk6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5j
b20+Cj4gPj4gLS0tCj4gPj4gVGhpcyBwYXRjaCBpcyBiYXNlIG9uIG5leHQtZXh5bm9zNCBicmFu
Y2ggYXQga2dlbmUgdHJlZS4KPiA+Pgo+ID4+ICBhcmNoL2FybS9jb25maWdzL2V4eW5vczRfZGVm
Y29uZmlnIHwgICAgMSArCj4gPj4gIGFyY2gvYXJtL21hY2gtZXh5bm9zNC9LY29uZmlnICAgICAg
fCAgIDE1ICsrKwo+ID4+ICBhcmNoL2FybS9tYWNoLWV4eW5vczQvTWFrZWZpbGUgICAgIHwgICAg
MSArCj4gPj4gIGFyY2gvYXJtL21hY2gtZXh5bm9zNC9tYWNoLW51cmkuYyAgfCAgMjMzCj4gPj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4gIDQgZmlsZXMgY2hhbmdl
ZCwgMjUwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCj4gPj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL2FybS9tYWNoLWV4eW5vczQvbWFjaC1udXJpLmMKPiA+Pgo+ID4KPiA+PiArZW51
bSBmaXhlZF9yZWd1bGF0b3JfaWQgewo+ID4+ICsJRklYRURfUkVHX0lEX01NQyA9IDAsCj4gPgo+
ID4gCUZJWEVEX1JFR19JRF9NTUMsCj4gPgo+ID4gKHNuaXApCj4gPgo+ID4+ICtzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSBlbW1jX2ZpeGVkX3ZvbHRhZ2UgPSB7Cj4gPj4gKwkubmFtZQkJ
CT0gInJlZy1maXhlZC12b2x0YWdlIiwKPiA+PiArCS5pZAkJCT0gRklYRURfUkVHX0lEX01NQywK
PiA+Cj4gPiBJcyB0aGVyZSBhbnkgcmVhc29uIHRvIHVzZSBGSVhFRF9SRUdfSURfTU1DIGluc3Rl
YWQgZGlyZWN0bHkgaWQgMD8KPiA+Cj4gCj4gSSdtIGdvaW5nIHRvIGFkZCBtb3JlIElEcyBvZiBm
aXhlZCByZWd1bGF0b3IgdGhhdCBhcmUgTENEIGFuZCBCYWNrbGlnaHQsIGFuZAo+IHNvIG9uLgo+
IFNvIHVzZSBlbnVtIHZhbHVlcyBmb3IgYXZvaWQgdGhlIGhhcmQgY29kaW5nLgo+IAoKT2ssIGFw
cGxpZWQgdGhpcyBhZnRlciByZW1vdmluZyAiaWZkZWYgV0FUQ0hET0ciLgpUaGFua3MuCgpCZXN0
IHJlZ2FyZHMsCktnZW5lLgotLQpLdWtqaW4gS2ltIDxrZ2VuZS5raW1Ac2Ftc3VuZy5jb20+LCBT
ZW5pb3IgRW5naW5lZXIsClNXIFNvbHV0aW9uIERldmVsb3BtZW50IFRlYW0sIFNhbXN1bmcgRWxl
Y3Ryb25pY3MgQ28uLCBMdGQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
