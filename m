From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Add support for s6e3hf2 panel
 device on TM2e board
Date: Tue, 18 Apr 2017 16:44:40 +0900
Message-ID: <f2acb724-ba41-175c-061a-7be765cc1939@samsung.com>
References: <1492408934-22096-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170417060220epcas5p42f6ed43d9db94779382e84a129b9da2d@epcas5p4.samsung.com>
 <1492408934-22096-4-git-send-email-hoegeun.kwon@samsung.com>
 <b9bfcdd9-5576-34c3-6c7d-556b6c81946d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <b9bfcdd9-5576-34c3-6c7d-556b6c81946d@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDQvMTgvMjAxNyAwMzowMCBQTSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBPbiAxNy4wNC4y
MDE3IDA4OjAyLCBIb2VnZXVuIEt3b24gd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggYWRkIHRoZSBwYW5l
bCBkZXZpY2UgdHJlZSBub2RlIGZvciBzNmUzaGYyIGRpc3BsYXkKPj4gY29udHJvbGxlciB0byBU
TTJlIGR0cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSG9lZ2V1biBLd29uIDxob2VnZXVuLmt3b25A
c2Ftc3VuZy5jb20+Cj4gTWF5YmUgaXQgd291bGQgYmUgZ29vZCB0byByZW1vdmUgdGUtZ3Bpb3Mg
cHJvcGVydHkgLSB0bTIvdG0yZSB1c2VzCj4gaGFyZHdhcmUgdHJpZ2dlciwgc28gaXQgaXMgbm90
IG5lY2Vzc2FyeSBhbmQgZ2VuZXJhdGVzIHVzZWxlc3MgaW50ZXJydXB0cy4KClRoYW5rcyBmb3Ig
eW91ciByZXZpZXcuCgpJIGFncmVlLCBidXQgSSB0aGlua3MgcmVtb3ZlIHRoZSB0ZS1ncGlvIHBy
b3BlcnR5IGFmdGVyIHlvdXIgcGF0Y2ggWzFdIApoYXMgYmVlbiBtZXJnZWQuCgoKWzFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTYyNTM4My8KCkJlc3QgcmVnYXJkcywKSG9l
Z2V1bgoKPgo+IEJlc2lkZSB0aGlzOgo+IFJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhh
amRhQHNhbXN1bmcuY29tPgo+ICAgLS0KPiBSZWdhcmRzCj4gQW5kcnplago+PiAtLS0KPj4gICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMmUuZHRzIHwgMTIgKysrKysr
KysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yZS5kdHMgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMmUuZHRzCj4+IGluZGV4IDY5
NDcxN2EuLjk4YWQwOTQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9z
L2V4eW5vczU0MzMtdG0yZS5kdHMKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3Mv
ZXh5bm9zNTQzMy10bTJlLmR0cwo+PiBAQCAtNTIsNiArNTIsMTggQEAKPj4gICAJYXNzaWduZWQt
Y2xvY2stcmF0ZXMgPSA8Mjc4MDAwMDAwPiwgPDQwMDAwMDAwMD47Cj4+ICAgfTsKPj4gICAKPj4g
KyZkc2kgewo+PiArCXBhbmVsQDAgewo+PiArCQljb21wYXRpYmxlID0gInNhbXN1bmcsczZlM2hm
MiI7Cj4+ICsJCXJlZyA9IDwwPjsKPj4gKwkJdmRkMy1zdXBwbHkgPSA8JmxkbzI3X3JlZz47Cj4+
ICsJCXZjaS1zdXBwbHkgPSA8JmxkbzI4X3JlZz47Cj4+ICsJCXJlc2V0LWdwaW9zID0gPCZncGcw
IDAgR1BJT19BQ1RJVkVfTE9XPjsKPj4gKwkJZW5hYmxlLWdwaW9zID0gPCZncGYxIDUgR1BJT19B
Q1RJVkVfSElHSD47Cj4+ICsJCXRlLWdwaW9zID0gPCZncGYxIDMgR1BJT19BQ1RJVkVfSElHSD47
Cj4+ICsJfTsKPj4gK307Cj4+ICsKPj4gICAmbGRvMzFfcmVnIHsKPj4gICAJcmVndWxhdG9yLW5h
bWUgPSAiVFNQX1ZERF8xLjhWX0FQIjsKPj4gICAJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8
MTgwMDAwMD47Cj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
