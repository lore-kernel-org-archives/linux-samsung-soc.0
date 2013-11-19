From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] pinctrl: samsung: Allow pin value to be initialized using
 pinfunc.
Date: Tue, 19 Nov 2013 18:15:51 +0100
Message-ID: <1384881351-10782-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29802 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752139Ab3KSRQK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Nov 2013 12:16:10 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Doug Anderson <dianders@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch extends the range of settings configurable via pinfunc API
to cover pin value as well. This allows configuration of default values
of pins.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
 drivers/pinctrl/pinctrl-samsung.c                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index fe34cbb..ed4cc9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -74,6 +74,7 @@ Required Properties:
   "samsung,pins" property of the child node. The following pin configuration
   properties are supported.
 
+  - samsung,pin-val: Initial value of pin output buffer.
   - samsung,pin-pud: Pull up/down configuration.
   - samsung,pin-drv: Drive strength configuration.
   - samsung,pin-pud-pdn: Pull up/down configuration in power down mode.
diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index c752de4..6b2194a 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -47,6 +47,7 @@ static struct pin_config {
 	{ "samsung,pin-drv", PINCFG_TYPE_DRV },
 	{ "samsung,pin-con-pdn", PINCFG_TYPE_CON_PDN },
 	{ "samsung,pin-pud-pdn", PINCFG_TYPE_PUD_PDN },
+	{ "samsung,pin-val", PINCFG_TYPE_DAT },
 };
 
 /* Global list of devices (struct samsung_pinctrl_drv_data) */
-- 
1.8.4.2
