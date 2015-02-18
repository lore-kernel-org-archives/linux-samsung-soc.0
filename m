From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 5/6] ASoC: samsung: Extend Snow driver to support max98089
Date: Wed, 18 Feb 2015 19:25:58 +0100
Message-ID: <1424283959-16289-6-git-send-email-afaerber@suse.de>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424283959-16289-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Jaroslav Kysela <perex@perex.cz>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBpcyBuZWVkZWQgZm9yIFNwcmluZy4KClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJl
ciA8YWZhZXJiZXJAc3VzZS5kZT4KLS0tCiBzb3VuZC9zb2Mvc2Ftc3VuZy9LY29uZmlnIHwgMSAr
CiBzb3VuZC9zb2Mvc2Ftc3VuZy9zbm93LmMgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zYW1zdW5nL0tjb25maWcgYi9zb3Vu
ZC9zb2Mvc2Ftc3VuZy9LY29uZmlnCmluZGV4IDNjZWJmNmNhMDNkZi4uMjIyMTgxNjU1ZTRmIDEw
MDY0NAotLS0gYS9zb3VuZC9zb2Mvc2Ftc3VuZy9LY29uZmlnCisrKyBiL3NvdW5kL3NvYy9zYW1z
dW5nL0tjb25maWcKQEAgLTIxNCw2ICsyMTQsNyBAQCBjb25maWcgU05EX1NPQ19MSVRUTEVNSUxM
CiBjb25maWcgU05EX1NPQ19TTk9XCiAJdHJpc3RhdGUgIkF1ZGlvIHN1cHBvcnQgZm9yIEdvb2ds
ZSBTbm93IGJvYXJkcyIKIAlkZXBlbmRzIG9uIFNORF9TT0NfU0FNU1VORyAmJiBJMkMKKwlzZWxl
Y3QgU05EX1NPQ19NQVg5ODA4OAogCXNlbGVjdCBTTkRfU09DX01BWDk4MDkwCiAJc2VsZWN0IFNO
RF9TT0NfTUFYOTgwOTUKIAlzZWxlY3QgU05EX1NBTVNVTkdfSTJTCmRpZmYgLS1naXQgYS9zb3Vu
ZC9zb2Mvc2Ftc3VuZy9zbm93LmMgYi9zb3VuZC9zb2Mvc2Ftc3VuZy9zbm93LmMKaW5kZXggNzY1
MWRjOTI0MTYxLi44OWQ3ZTM5YjIwNmUgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zYW1zdW5nL3Nu
b3cuYworKysgYi9zb3VuZC9zb2Mvc2Ftc3VuZy9zbm93LmMKQEAgLTEwNSw2ICsxMDUsNyBAQCBz
dGF0aWMgaW50IHNub3dfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIH0KIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc25vd19vZl9tYXRjaFtdID0geworCXsg
LmNvbXBhdGlibGUgPSAiZ29vZ2xlLHNub3ctYXVkaW8tbWF4OTgwODkiLCB9LAogCXsgLmNvbXBh
dGlibGUgPSAiZ29vZ2xlLHNub3ctYXVkaW8tbWF4OTgwOTAiLCB9LAogCXsgLmNvbXBhdGlibGUg
PSAiZ29vZ2xlLHNub3ctYXVkaW8tbWF4OTgwOTEiLCB9LAogCXsgLmNvbXBhdGlibGUgPSAiZ29v
Z2xlLHNub3ctYXVkaW8tbWF4OTgwOTUiLCB9LAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
