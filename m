From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v5 04/10] ARM: dts: Fill in bootargs for exynos5250-snow
Date: Fri,  1 Aug 2014 06:54:51 +0200
Message-ID: <1406868897-26874-5-git-send-email-afaerber@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406868897-26874-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

ZXh5bm9zNTI1MC1jcm9zLWNvbW1vbi5kdHNpIGhhZCBhbiBlbXB0eSAvY2hvc2VuIG5vZGUuCkZp
bGwgaW4gZXhlbXBsYXJ5IGJvb3QgYXJndW1lbnRzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBG
w6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIHY1OiBOZXcKIENsZWFudXAgZm9yIC9jaG9z
ZW4gbm9kZSBtb3ZlZCBpbnRvIC1zbm93LmR0cy4KCiBhcmNoL2FybS9ib290L2R0cy9leHlub3M1
MjUwLXNub3cuZHRzIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLXNub3cuZHRzIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNTI1MC1zbm93LmR0cwppbmRleCA3NjgwZDVlMDNmYjMuLmM0YjBjNzNj
NzM2ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC1zbm93LmR0cwor
KysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLXNub3cuZHRzCkBAIC0yNyw2ICsyNyw3
IEBACiAJfTsKIAogCWNob3NlbiB7CisJCWJvb3RhcmdzID0gImNvbnNvbGU9dHR5MSI7CiAJfTsK
IAogCWdwaW8ta2V5cyB7Ci0tIAoxLjkuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
