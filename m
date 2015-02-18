From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 0/6] ASoC: samsung: Spring sound support
Date: Wed, 18 Feb 2015 19:25:53 +0100
Message-ID: <1424283959-16289-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8sCgpUaGlzIHNlcmllcyBwcmVwYXJlcyBzb3VuZCBzdXBwb3J0IGZvciB0aGUgSFAgQ2hy
b21lYm9vayAxMS4KClJlZ2FyZHMsCkFuZHJlYXMKCgpBbmRyZWFzIEbDpHJiZXIgKDYpOgogIEFT
b0M6IG1heDk4MDg4OiBEb2N1bWVudCBEVCBiaW5kaW5ncwogIEFTb0M6IG1heDk4MDg4OiBBZGQg
RFQgYmluZGluZ3MKICBBUk06IGR0czogQWRkIG1heDk4MDg5IHRvIGV4eW5vczUyNTAtc3ByaW5n
CiAgQVNvQzogc2Ftc3VuZzogRG9jdW1lbnQgYmluZGluZyBmb3IgbWF4OTgwODkgYmFzZWQgU25v
dyBkcml2ZXIKICBBU29DOiBzYW1zdW5nOiBFeHRlbmQgU25vdyBkcml2ZXIgdG8gc3VwcG9ydCBt
YXg5ODA4OQogIEFSTTogZHRzOiBBZGQgc291bmQgc3VwcG9ydCB0byBleHlub3M1MjUwLXNwcmlu
ZwoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL21heDk4MDg4LnR4dCAgICAgICAgIHwg
MTYgKysrKysrKysrKysrCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
c25vdy50eHQgICB8ICAxICsKIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczUyNTAtc3ByaW5nLmR0
cyAgICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKwogc291bmQvc29jL2NvZGVj
cy9tYXg5ODA4OC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysKIHNvdW5kL3Nv
Yy9zYW1zdW5nL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogc291bmQv
c29jL3NhbXN1bmcvc25vdy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiA2IGZp
bGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbWF4OTgwODgudHh0CgotLSAKMi4xLjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
