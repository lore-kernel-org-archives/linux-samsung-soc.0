From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 04/24] mfd: max77686: Make platform data over-rule DT
Date: Fri, 18 Jul 2014 09:17:59 +0100
Message-ID: <20140718081759.GN30888@lee--X1>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404505467-26526-5-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1404505467-26526-5-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, Yadwinder Singh Brar <yadi.brar01@gmail.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Doug Anderson <dianders@chromium.org>, Tushar Behera <trblinux@gmail.com>, Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gRnJpLCAwNCBKdWwgMjAxNCwgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIHdyb3RlOgoKPiBU
aGUgZnVuY3Rpb24gbWF4Nzc4MDJfaTJjX3BhcnNlX2R0X3BkYXRhKCkgc2hvdWxkIG9ubHkgYmUg
Y2FsbGVkCj4gaWYgdGhlcmUgaXNuJ3QgYWxyZWFkeSBwbGF0Zm9ybSBkYXRhIGZvciB0aGUgZGV2
aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVy
Lm1hcnRpbmV6QGNvbGxhYm9yYS5jby51az4KPiAtLS0KPiAgZHJpdmVycy9tZmQvbWF4Nzc2ODYu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpBcHBsaWVkIG5vdywgdGhhbmtzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbWF4Nzc2
ODYuYyBiL2RyaXZlcnMvbWZkL21heDc3Njg2LmMKPiBpbmRleCBkMWY5ZDA0Li4xMmQ0YzE3IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL21heDc3Njg2LmMKPiArKysgYi9kcml2ZXJzL21mZC9t
YXg3NzY4Ni5jCj4gQEAgLTEyNCw3ICsxMjQsNyBAQCBzdGF0aWMgaW50IG1heDc3Njg2X2kyY19w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjLAo+ICAJdW5zaWduZWQgaW50IGRhdGE7Cj4gIAlp
bnQgcmV0ID0gMDsKPiAgCj4gLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfT0YpICYmIGkyYy0+ZGV2
Lm9mX25vZGUpCj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfT0YpICYmIGkyYy0+ZGV2Lm9mX25v
ZGUgJiYgIXBkYXRhKQo+ICAJCXBkYXRhID0gbWF4Nzc2ODZfaTJjX3BhcnNlX2R0X3BkYXRhKCZp
MmMtPmRldik7Cj4gIAo+ICAJaWYgKCFwZGF0YSkgewoKLS0gCkxlZSBKb25lcwpMaW5hcm8gU1RN
aWNyb2VsZWN0cm9uaWNzIExhbmRpbmcgVGVhbSBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
