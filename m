From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 4/7] Samsung pinctrl for v3.8
Date: Wed, 21 Nov 2012 00:05:11 +0900
Message-ID: <50AB9C27.9060204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55868 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969Ab2KTPFR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 10:05:17 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so4333289pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Nov 2012 07:05:16 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Arnd, Olof

Here is Samsung pinctrl stuff and most of them are from Linus' 
pinctrl/samsung which has been dropped in his tree.

Because Samsung Exynos4x12 stuff which is in Samsung tree depends on 
some patches of pinctrl/samsung so I and Linus decided that I handle 
pinctrl/samsung in Samsung tree.

Please pull Samsung pinctrl from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/pinctrl-samsung

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 3d70f8c617a436c7146ecb81df2265b4626dfe89:

   Linux 3.7-rc4 (2012-11-04 11:07:39 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/pinctrl-samsung

Kukjin Kim (1):
       Merge remote-tracking branch 'pinctrl/samsung' into 
next/pinctrl-samsung

Tomasz Figa (16):
       pinctrl: samsung: Detect and handle unsupported configuration types
       pinctrl: samsung: Do not pass gpio_chip to pin_to_reg_bank
       pinctrl: samsung: Assing pin numbers dynamically
       pinctrl: samsung: Remove static pin enumerations
       pinctrl: samsung: Distinguish between pin group and bank nodes
       ARM: dts: exynos4210-pinctrl: Add nodes for pin banks
       pinctrl: samsung: Match pin banks with their device nodes
       pinctrl: samsung: Hold pointer to driver data in bank struct
       pinctrl: samsung: Include bank-specific eint offset in bank struct
       pinctrl: exynos: Use one IRQ domain per pin bank
       pinctrl: samsung: Use one GPIO chip per pin bank
       pinctrl: samsung: Use per-bank IRQ domain for wake-up interrupts
       pinctrl: exynos: Set pin function to EINT in irq_set_type of 
wake-up EINT
       pinctrl: samsung: Add GPIO to IRQ translation
       Documentation: Update samsung-pinctrl device tree bindings 
documentation
       pinctrl: samsung: Add support for EXYNOS4X12

Tushar Behera (1):
       pinctrl: samsung: Update error check for unsigned variables

  .../bindings/pinctrl/samsung-pinctrl.txt           |  119 ++++-
  arch/arm/boot/dts/exynos4210-pinctrl.dtsi          |  278 ++++++++++++
  arch/arm/boot/dts/exynos4210.dtsi                  |  241 +----------
  drivers/pinctrl/pinctrl-exynos.c                   |  477 
++++++++++++--------
  drivers/pinctrl/pinctrl-exynos.h                   |  170 ++------
  drivers/pinctrl/pinctrl-samsung.c                  |  207 ++++++---
  drivers/pinctrl/pinctrl-samsung.h                  |   30 +-
  7 files changed, 856 insertions(+), 666 deletions(-)
