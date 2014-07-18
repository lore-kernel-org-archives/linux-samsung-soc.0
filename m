From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 05/24] mfd: max77686: Return correct error when pdata
 isn't found
Date: Fri, 18 Jul 2014 09:18:15 +0100
Message-ID: <20140718081815.GO30888@lee--X1>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404505467-26526-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1404505467-26526-6-git-send-email-javier.martinez@collabora.co.uk>
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

T24gRnJpLCAwNCBKdWwgMjAxNCwgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIHdyb3RlOgoKPiBX
aGVuIHBsYXRmb3JtIGRhdGEgaXMgbm90IGZvdW5kIGFuIC1FSU8gKEkvTyBlcnJvcikgY29kZSBp
cyByZXR1cm5lZC4KPiBUaGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUgY29ycmVjdCBlcnJvciBz
byBiZXR0ZXIgcmV0dXJuIC1FSU5WQUwKPiAoSW52YWxpZCBhcmd1bWVudCkgd2hpY2ggaXMgd2hh
dCBtb3N0IGRyaXZlcnMgZG8gaW4gdGhpcyBjYXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVyLm1hcnRpbmV6QGNvbGxhYm9yYS5jby51az4KPiAt
LS0KPiAgZHJpdmVycy9tZmQvbWF4Nzc2ODYuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkIG5vdywgdGhhbmtzLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZmQvbWF4Nzc2ODYuYyBiL2RyaXZlcnMvbWZkL21heDc3Njg2LmMK
PiBpbmRleCAxMmQ0YzE3Li5hZGE0OTc2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL21heDc3
Njg2LmMKPiArKysgYi9kcml2ZXJzL21mZC9tYXg3NzY4Ni5jCj4gQEAgLTEyOSw3ICsxMjksNyBA
QCBzdGF0aWMgaW50IG1heDc3Njg2X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjLAo+
ICAKPiAgCWlmICghcGRhdGEpIHsKPiAgCQlkZXZfZXJyKCZpMmMtPmRldiwgIk5vIHBsYXRmb3Jt
IGRhdGEgZm91bmQuXG4iKTsKPiAtCQlyZXR1cm4gLUVJTzsKPiArCQlyZXR1cm4gLUVJTlZBTDsK
PiAgCX0KPiAgCj4gIAltYXg3NzY4NiA9IGRldm1fa3phbGxvYygmaTJjLT5kZXYsCgotLSAKTGVl
IEpvbmVzCkxpbmFybyBTVE1pY3JvZWxlY3Ryb25pY3MgTGFuZGluZyBUZWFtIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
