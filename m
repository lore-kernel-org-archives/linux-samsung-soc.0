From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v4 5/5] dt-bindings: samsung: Document bindings for SGH-T959P
 board
Date: Sat,  7 Jul 2018 12:09:43 +0200
Message-ID: <1530958183-10956-6-git-send-email-pawel.mikolaj.chmiel@gmail.com>
References: <1530958183-10956-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530958183-10956-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, xc-racer2@live.ca, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, pawel.mikolaj.chmiel@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogSm9uYXRoYW4gQmFra2VyIDx4Yy1yYWNlcjJAbGl2ZS5jYT4KCkRvY3VtZW50IHRoZSBi
aW5kaW5nIGZvciBTYW1zdW5nIEdhbGF4eSBTIEZhc2NpbmF0ZSA0RyAoU0dILVQ5NTlQKS4KClNp
Z25lZC1vZmYtYnk6IEpvbmF0aGFuIEJha2tlciA8eGMtcmFjZXIyQGxpdmUuY2E+ClNpZ25lZC1v
ZmYtYnk6IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNvbT4KQWNr
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tCkNoYW5nZXMgZnJvbSB2MjoK
ICAtIEFkZGVkIEFja2VkLWJ5CgpDaGFuZ2VzIGZyb20gdjE6CiAgLSBBZGRlZCBtaXNzaW5nIGNv
bW1pdCBtc2cuCi0tCi0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9z
YW1zdW5nL3NhbXN1bmctYm9hcmRzLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9zYW1zdW5nL3NhbXN1bmctYm9hcmRzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vc2Ftc3VuZy9zYW1zdW5nLWJvYXJkcy50eHQKaW5kZXggM2ZhMjg3YTg2MzAw
Li4zN2U5NmU0OGM0OGMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vc2Ftc3VuZy9zYW1zdW5nLWJvYXJkcy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5nL3NhbXN1bmctYm9hcmRzLnR4dApAQCAtMyw2
ICszLDcgQEAKIFJlcXVpcmVkIHJvb3Qgbm9kZSBwcm9wZXJ0aWVzOgogICAgIC0gY29tcGF0aWJs
ZSA9IHNob3VsZCBiZSBvbmUgb3IgbW9yZSBvZiB0aGUgZm9sbG93aW5nLgogCS0gInNhbXN1bmcs
YXJpZXMiCS0gZm9yIFM1UFYyMTAtYmFzZWQgU2Ftc3VuZyBBcmllcyBib2FyZC4KKwktICJzYW1z
dW5nLGZhc2NpbmF0ZTRnIgktIGZvciBTNVBWMjEwLWJhc2VkIFNhbXN1bmcgR2FsYXh5IFMgRmFz
Y2luYXRlIDRHIChTR0gtVDk1OVApIGJvYXJkLgogCS0gInNhbXN1bmcsZ2FsYXh5cyIJLSBmb3Ig
UzVQVjIxMC1iYXNlZCBTYW1zdW5nIEdhbGF4eSBTIChpOTAwMCkgIGJvYXJkLgogCS0gInNhbXN1
bmcsYXJ0aWs1IgktIGZvciBFeHlub3MzMjUwLWJhc2VkIFNhbXN1bmcgQVJUSUs1IG1vZHVsZS4K
IAktICJzYW1zdW5nLGFydGlrNS1ldmFsIiAtIGZvciBFeHlub3MzMjUwLWJhc2VkIFNhbXN1bmcg
QVJUSUs1IGV2YWwgYm9hcmQuCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
