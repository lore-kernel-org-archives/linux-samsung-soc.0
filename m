From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 RESEND 1/4] arm/exynos: add asynchronous bridge clock
 bindings
Date: Thu, 12 Mar 2015 14:37:08 +0100
Message-ID: <1426167431-24470-2-git-send-email-a.hajda@samsung.com>
References: <1426167431-24470-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1426167431-24470-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Liquid.Acid@gmx.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, javier.martinez@collabora.co.uk, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIHBhdGNoIGFkZHMgYmluZGluZ3MgZm9yIGNsb2NrcyByZXF1aXJlZCBieSBhc3luYy1icmlk
Z2VzCnByZXNlbnQgaW4gdGhlIHBhcnRpY3VsYXIgcG93ZXIgZG9tYWluLgoKU2lnbmVkLW9mZi1i
eTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVyLm1hcnRpbmV6QGNvbGxhYm9yYS5jby51az4KVGVz
dGVkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllci5tYXJ0aW5lekBjb2xsYWJv
cmEuY28udWs+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9leHlu
b3MvcG93ZXJfZG9tYWluLnR4dCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9l
eHlub3MvcG93ZXJfZG9tYWluLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vZXh5bm9zL3Bvd2VyX2RvbWFpbi50eHQKaW5kZXggMWUwOTcwMy4uNWRhMzhjNSAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9leHlub3MvcG93
ZXJfZG9tYWluLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2V4eW5vcy9wb3dlcl9kb21haW4udHh0CkBAIC0yMiw2ICsyMiw5IEBAIE9wdGlvbmFsIFByb3Bl
cnRpZXM6CiAJLSBwY2xrTiwgY2xrTjogUGFpcnMgb2YgcGFyZW50IG9mIGlucHV0IGNsb2NrIGFu
ZCBpbnB1dCBjbG9jayB0byB0aGUKIAkJZGV2aWNlcyBpbiB0aGlzIHBvd2VyIGRvbWFpbi4gTWF4
aW11bSBvZiA0IHBhaXJzIChOID0gMCB0byAzKQogCQlhcmUgc3VwcG9ydGVkIGN1cnJlbnRseS4K
KwktIGFzYk46IENsb2NrcyByZXF1aXJlZCBieSBhc3luY2hyb25vdXMgYnJpZGdlcyAoQVNCKSBw
cmVzZW50IGluCisJCXRoZSBwb3dlciBkb21haW4uIFRoZXNlIGNsb2NrIHNob3VsZCBiZSBlbmFi
bGVkIGR1cmluZyBwb3dlcgorCQlkb21haW4gb24vb2ZmIG9wZXJhdGlvbnMuCiAtIHBvd2VyLWRv
bWFpbnM6IHBoYW5kbGUgcG9pbnRpbmcgdG8gdGhlIHBhcmVudCBwb3dlciBkb21haW4sIGZvciBt
b3JlIGRldGFpbHMKIAkJIHNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93
ZXIvcG93ZXJfZG9tYWluLnR4dAogCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
