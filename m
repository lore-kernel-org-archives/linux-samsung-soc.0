From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/6] pinctrl: Remove unneded semicolons in drivers
Date: Wed, 16 Sep 2015 10:28:25 +0200
Message-ID: <1442392111-8448-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:36416 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752007AbbIPI2q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Sep 2015 04:28:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Axel Lin <axel.lin@ingics.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Wei Chen <Wei.Chen@csr.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Hans de Goede <hdegoede@redhat.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Matthias Brugger <matthias.bgg@gmail.com>, Kukjin Kim <kgene@kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>

Hello Linus,

This series contains trivial patches that removes unneeded
semicolons in pinctrl drivers. These are clearly typo errors
and are just creating null statements.

Best regards,
Javier


Javier Martinez Canillas (6):
  pinctrl: tz1090: Remove unneded semicolons
  pinctrl: tz1090-pdc: Remove unneded semicolons
  pinctrl: mxs: Remove unneded semicolon
  pinctrl: sunxi: Remove unneeded semicolon
  pinctrl: mediatek: Remove unneded semicolon
  pinctrl: samsung: Remove unneded semicolon

 drivers/pinctrl/freescale/pinctrl-mxs.c       | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
 drivers/pinctrl/pinctrl-tz1090-pdc.c          | 4 ++--
 drivers/pinctrl/pinctrl-tz1090.c              | 4 ++--
 drivers/pinctrl/samsung/pinctrl-exynos5440.c  | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.4.3
