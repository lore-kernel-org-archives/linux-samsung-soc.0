From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 1/7] arm64: dts: exynos: Add the burst and esc clock
 frequency properties for exynos5433 dts
Date: Thu, 02 Mar 2017 19:20:13 +0900
Message-ID: <1488450019-6482-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170302102113epcas5p4992ba2da58333ee0e3fe988334aad9a9@epcas5p4.samsung.com>
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
IGFyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5kdHNpIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5kdHNpIGIvYXJjaC9h
cm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKaW5kZXggNmNl
OTNhMy4uZTMxZTIwYyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5
bm9zNTQzMy10bTItY29tbW9uLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3Mv
ZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKQEAgLTI5OCw2ICsyOTgsOCBAQAogCXN0YXR1cyA9
ICJva2F5IjsKIAl2ZGRjb3JlLXN1cHBseSA9IDwmbGRvNl9yZWc+OwogCXZkZGlvLXN1cHBseSA9
IDwmbGRvN19yZWc+OworCXNhbXN1bmcsYnVyc3QtY2xvY2stZnJlcXVlbmN5ID0gPDUxMjAwMDAw
MD47CisJc2Ftc3VuZyxlc2MtY2xvY2stZnJlcXVlbmN5ID0gPDE2MDAwMDAwPjsKIAlzYW1zdW5n
LHBsbC1jbG9jay1mcmVxdWVuY3kgPSA8MjQwMDAwMDA+OwogCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7CiAJcGluY3RybC0wID0gPCZ0ZV9pcnE+OwotLSAKMS45LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
