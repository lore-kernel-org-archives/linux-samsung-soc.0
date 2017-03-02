From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 4/7] arm: dts: Add the burst and esc clock frequency
 properties for exynos4210 dts
Date: Thu, 02 Mar 2017 19:20:16 +0900
Message-ID: <1488450019-6482-5-git-send-email-hoegeun.kwon@samsung.com>
References: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170302102113epcas5p491d4220b8ae7a037d1cd7ece49bb2d3e@epcas5p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIE9GIGdyYXBoIGlzIG5vdCBuZWVkZWQgYmVjYXVzZSB0aGUgcGFuZWwgaXMgYSBjaGlsZCBv
ZiBkc2kuIFNvCmFkZGVkIHRoZSBidXJzdCBhbmQgZXNjIGNsb2NrIGZyZXF1ZW5jeSBwcm9wZXJ0
aWVzIHRvIHRoZSBwYXJlbnQgKERTSQpub2RlKSwgdGFraW5nIGludG8gYWNjb3VudCB0aGUgYmlz
ZWN0YWJpbGl0eSBwcm9ibGVtIHNvIHRoYXQgcmVtb3ZlCnRoZSBPRiBncmFwaCBmcm9tIERTSSBu
b2RlLgoKU2lnbmVkLW9mZi1ieTogSG9lZ2V1biBLd29uIDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5j
b20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0K
IGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQyMTAtdHJhdHMuZHRzIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczQyMTAtdHJhdHMuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDIxMC10cmF0cy5k
dHMKaW5kZXggMGNhMWI0ZC4uMTc0M2NhOCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNDIxMC10cmF0cy5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDIxMC10
cmF0cy5kdHMKQEAgLTE5Nyw2ICsxOTcsOCBAQAogJmRzaV8wIHsKIAl2ZGRjb3JlLXN1cHBseSA9
IDwmdnVzYl9yZWc+OwogCXZkZGlvLXN1cHBseSA9IDwmdm1pcGlfcmVnPjsKKwlzYW1zdW5nLGJ1
cnN0LWNsb2NrLWZyZXF1ZW5jeSA9IDw1MDAwMDAwMDA+OworCXNhbXN1bmcsZXNjLWNsb2NrLWZy
ZXF1ZW5jeSA9IDwyMDAwMDAwMD47CiAJc2Ftc3VuZyxwbGwtY2xvY2stZnJlcXVlbmN5ID0gPDI0
MDAwMDAwPjsKIAlzdGF0dXMgPSAib2theSI7CiAKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
