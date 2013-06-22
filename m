From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v3 10/18] pwm: samsung: Rename to pwm-samsung-legacy
Date: Sat, 22 Jun 2013 15:09:02 +0200
Message-ID: <72206051.D6kXZYm5YD@flatron>
References: <1371766383-29077-1-git-send-email-tomasz.figa@gmail.com> <1371766383-29077-11-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:53265 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756113Ab3FVNJE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Jun 2013 09:09:04 -0400
In-Reply-To: <1371766383-29077-11-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thierry Reding <thierry.reding@gmail.com>

This patch renames the old pwm-samsung driver to pwm-samsung-legacy to
create place for the new, rewritten, DT- and multiplatform- aware
pwm-samsung driver that will be added in further patch.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/pwm/Makefile                                | 2 +-
 drivers/pwm/{pwm-samsung.c => pwm-samsung-legacy.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/pwm/{pwm-samsung.c => pwm-samsung-legacy.c} (100%)

Changes since v2:
 - Used git format-patch -M to detect rename.
 - Corrected commit message.

diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 94ba21e..229a599 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_PWM_LPC32XX)	+= pwm-lpc32xx.o
 obj-$(CONFIG_PWM_MXS)		+= pwm-mxs.o
 obj-$(CONFIG_PWM_PUV3)		+= pwm-puv3.o
 obj-$(CONFIG_PWM_PXA)		+= pwm-pxa.o
-obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
+obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung-legacy.o
 obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
 obj-$(CONFIG_PWM_TEGRA)		+= pwm-tegra.o
 obj-$(CONFIG_PWM_TIECAP)	+= pwm-tiecap.o
diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung-legacy.c
similarity index 100%
rename from drivers/pwm/pwm-samsung.c
rename to drivers/pwm/pwm-samsung-legacy.c
-- 
1.8.2.1
