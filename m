From: =?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable USB3503 driver
Date: Thu, 28 Sep 2017 04:40:22 +0200
Message-ID: <20170928024022.2071-1-linus.luessing@c0d3.blue>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing@c0d3.blue>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIE9kcm9pZCBVMyAoRXh5bm9zIDQ0MTIgYmFzZWQpIGZvciBpbnN0YW5jZSBuZWVkcyB0aGlz
IGRyaXZlciwKb3RoZXJ3aXNlIGl0cyBVU0IgaHViIHdpbGwgbm90IGNvbWUgdXAuCgpleHlub3Nf
ZGVmY29uZmlnIGFscmVhZHkgaGFzIHRoaXMgZW5hYmxlZCBhcyBidWlsdC1pbiwgdG9vLiBTbwpq
dXN0IGRvaW5nIHRoZSBzYW1lIGhlcmUgaW4gbXVsdGlfdjdfZGVmY29uZmlnLgoKU2lnbmVkLW9m
Zi1ieTogTGludXMgTMO8c3NpbmcgPGxpbnVzLmx1ZXNzaW5nQGMwZDMuYmx1ZT4KCi0tLQpUaGFu
a3MgdG8gVG9iaWFzIEpha29iaSwgd2hvIGluZGlyZWN0bHkgbWFkZSBtZSBhd2FyZSBvZiB3aHkg
VVNCCmRpZCBub3Qgd29yayBmb3IgbWUuCgogYXJjaC9hcm0vY29uZmlncy9tdWx0aV92N19kZWZj
b25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9t
dWx0aV92N19kZWZjb25maWcKaW5kZXggMGNhY2RiZi4uYzI0ODRlZiAxMDA2NDQKLS0tIGEvYXJj
aC9hcm0vY29uZmlncy9tdWx0aV92N19kZWZjb25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9t
dWx0aV92N19kZWZjb25maWcKQEAgLTY5Myw2ICs2OTMsNyBAQCBDT05GSUdfVVNCX01VU0JfSERS
Qz1tCiBDT05GSUdfVVNCX01VU0JfU1VOWEk9bQogQ09ORklHX1VTQl9EV0MzPXkKIENPTkZJR19V
U0JfRFdDMj15CitDT05GSUdfVVNCX0hTSUNfVVNCMzUwMz15CiBDT05GSUdfVVNCX0NISVBJREVB
PXkKIENPTkZJR19VU0JfQ0hJUElERUFfVURDPXkKIENPTkZJR19VU0JfQ0hJUElERUFfSE9TVD15
Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK
