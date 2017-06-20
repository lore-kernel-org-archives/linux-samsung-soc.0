From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/2] drm/exynos/decon: Add include guard to the Exynos7
 header
Date: Tue, 20 Jun 2017 10:53:51 +0100
Message-ID: <CACvgo51db4Gk+GHAO-F=rz8vLTG6A66f1ZeHPNuAQV1Qthaavw@mail.gmail.com>
References: <20170619163110.28173-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170619163110.28173-1-krzk@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTkgSnVuZSAyMDE3IGF0IDE3OjMxLCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IEFsdGhvdWdoIGhlYWRlciBpcyBpbmNsdWRlZCBvbmx5IG9uY2UgYnV0
IHN0aWxsIGhhdmluZyBhbiBpbmNsdWRlIGd1YXJkCj4gaXMgYSBnb29kIHByYWN0aWNlLiAgVG8g
YXZvaWQgY29uZnVzaW9uLCBhZGQgU29DIHByZWZpeCB0byBleGlzdGluZwo+IEV4eW5vczU0MzMg
aGVhZGVyIGluY2x1ZGUgZ3VhcmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGluY2x1ZGUvdmlkZW8vZXh5bm9zNTQzM19k
ZWNvbi5oIHwgNiArKystLS0KPiAgaW5jbHVkZS92aWRlby9leHlub3M3X2RlY29uLmggICAgfCA1
ICsrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdmlkZW8vZXh5bm9zNTQzM19kZWNvbi5oIGIvaW5j
bHVkZS92aWRlby9leHlub3M1NDMzX2RlY29uLmgKPiBpbmRleCA3ODk1N2M5NjI2ZjUuLmIzMDM2
MmRhNTY5MiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3ZpZGVvL2V4eW5vczU0MzNfZGVjb24uaAo+
ICsrKyBiL2luY2x1ZGUvdmlkZW8vZXh5bm9zNTQzM19kZWNvbi5oCj4gQEAgLTYsOCArNiw4IEBA
Cj4gICAqIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9ucgo+ICAgKi8K
Pgo+IC0jaWZuZGVmIEVYWU5PU19SRUdTX0RFQ09OX0gKPiAtI2RlZmluZSBFWFlOT1NfUkVHU19E
RUNPTl9ICj4gKyNpZm5kZWYgRVhZTk9TNTQzM19SRUdTX0RFQ09OX0gKPiArI2RlZmluZSBFWFlO
T1M1NDMzX1JFR1NfREVDT05fSAo+CkRyb3AgdGhlIF9SRUdTXyBwYXJ0IGZyb20gdGhlIGd1YXJk
IG9uIGVhY2ggaGVhZGVyPyBUaGUgZmlsZSBuYW1lL3BhdGgKZG9lcyBub3QgaGF2ZSBpdCwgcGx1
cyBpdCdsbCBzYXZlIHNvbWUgV1RGIG1vbWVudHMgd2hlbgpleHlub3N7NTQzMyw3fV9yZWdzX2Rl
Y29uLmggY29tZXMgYWJvdXQuCgpSZWdhcmRzLApFbWlsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
