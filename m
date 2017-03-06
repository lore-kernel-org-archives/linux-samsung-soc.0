From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Mon, 6 Mar 2017 11:42:04 -0300
Message-ID: <7fb60ffc-086f-9e68-137a-a8aa1411ba40@osg.samsung.com>
References: <1487574582-15746-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170220071001epcas1p3c2b32665942ba55c3ed4e06d2c66d661@epcas1p3.samsung.com>
 <5be15c1c-ba4c-94d9-30be-8d161e9be7b3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5be15c1c-ba4c-94d9-30be-8d161e9be7b3@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jh80.chung@samsung.com, andi.shyti@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gSG9lZ2V1biwKCk9uIDAyLzIxLzIwMTcgMTA6MDkgUE0sIEhvZWdldW4gS3dvbiB3cm90
ZToKPiBGcm9tOiBIeXVuZ3dvbiBId2FuZyA8aHVtYW4uaHdhbmdAc2Ftc3VuZy5jb20+Cj4gCj4g
VGhpcyBwYXRjaCBhZGQgdGhlIHBhbmVsIGRldmljZSB0cmVlIG5vZGUgZm9yIFM2RTNIQTIgZGlz
cGxheQo+IGNvbnRyb2xsZXIgdG8gVE0yIGR0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIeXVuZ3dv
biBId2FuZyA8aHVtYW4uaHdhbmdAc2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcnpl
aiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFud29vIENo
b2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24g
PGhvZWdldW4ua3dvbkBzYW1zdW5nLmNvbT4KPiBUZXN0ZWQtYnk6IENoYW53b28gQ2hvaSA8Y3cw
MC5jaG9pQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9l
eHlub3M1NDMzLXRtMi5kdHMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlu
b3MvZXh5bm9zNTQzMy10bTIuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9z
NTQzMy10bTIuZHRzCj4gaW5kZXggZGVhMGE2Zi4uZGIzZmVkMiAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMKPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMKPiBAQCAtNTIsNiArNTIsMTgg
QEAKPiAgICAgIGFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI1MDAwMDAwMD4sIDw0MDAwMDAwMDA+
Owo+ICB9OwoKSSB3b3VsZCBhZGQgYSBsaW5lIGhlcmUuCgo+ICArJmRzaSB7Cj4gKyAgICBwYW5l
bEAwIHsKPiArICAgICAgICBjb21wYXRpYmxlID0gInNhbXN1bmcsczZlM2hhMiI7Cj4gKyAgICAg
ICAgcmVnID0gPDA+Owo+ICsgICAgICAgIHZkZDMtc3VwcGx5ID0gPCZsZG8yN19yZWc+Owo+ICsg
ICAgICAgIHZjaS1zdXBwbHkgPSA8JmxkbzI4X3JlZz47Cj4gKyAgICAgICAgcmVzZXQtZ3Bpb3Mg
PSA8JmdwZzAgMCBHUElPX0FDVElWRV9MT1c+Owo+ICsgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwm
Z3BmMSA1IEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsgICAgICAgIHRlLWdwaW9zID0gPCZncGYxIDMg
R1BJT19BQ1RJVkVfSElHSD47Cj4gKyAgICB9Owo+ICt9Owo+ICsKClJldmlld2VkLWJ5OiBKYXZp
ZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllckBvc2cuc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2Fy
ZHMsCi0tIApKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMKT3BlbiBTb3VyY2UgR3JvdXAKU2Ftc3Vu
ZyBSZXNlYXJjaCBBbWVyaWNhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
