From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v3 0/7] ARM: S5P6440: Add support for Samsung's S5P6440 SoC
Date: Mon, 11 Jan 2010 13:00:30 +0900
Message-ID: <000e01ca9272$9e3faa60$dabeff20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36715 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab0AKD6j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2010 22:58:39 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KW200A7UDPP6I@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Jan 2010 12:58:37 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KW200KFYDPOPB@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Jan 2010 12:58:36 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, =?ks_c_5601-1987?B?seixucH4L1MvVyBTb2x1dGlvbrCzud/GwChTLkxTSSkvRQ==?= =?ks_c_5601-1987?B?NSjDpcDTKS+777y6wPzA2g==?= <kgene.kim@samsung.com>

Hi All,

This patches add basic support for Samsung's S5P6440 SoC.
The feature set that is added are clock, timer, uart and interrupts.

The clock changes are based on Harald Welte's patch. This patch is
also based on Ben's plat-samsung patch.

This patch set includes the following patches.

[PATCH V3 1/7] ARM: S5P6440: Add new CPU initialization support
[PATCH V3 2/7] ARM: S5P6440: Add Clock and PLL support
[PATCH V3 3/7] ARM: S5P6440: Add IRQ support
[PATCH V3 4/7] ARM: S5P6440: Add Timer support
[PATCH V3 5/7] ARM: S5P6440: Add new Kconfig and Makefiles
[PATCH V3 6/7] ARM: S5P6440: Add Board and configuration file
[PATCH V3 7/7] ARM: S5P6440: Add serial port support

This patch set depends on the following patches.

1. [PATCH 1/3] ARM: SAMSUNG: Add config option for number of additional GPIO
pins.
2. [PATCH 2/3] ARM: SAMSUNG: Make clk_default_setrate and
clk_ops_def_setrate visible to other code.
3. [PATCH 3/3] ARM: SAMSUNG: Add idle support.

Changes since v2:

1. Removed unused clock module defines.
2. Modified PLL code to be generic.
3. IRQ Timer and IRQ UART code use common code.
4. S5P timer code is removed and common code in plat-s3c is used.
5. Moved some of the code from plat-s5p to plat-samsung.

Changes since v1:

1. Corrected parent clock sources for all the clocks.
2. Corrected the HCLK_LOW frequency calculation issue.
3. Added a menuconfig option "S5P_GPIO_EXTRA" to select the number
   of additional GPIO's required in file arch/arm/plat-s5p/Kconfig
4. Add PCLK_LOW and UCLK1 as clock sources for UART module.
5. Removed conditional inclusion of mach-s5p6440/Kconfig.
6. Other fixes and changes.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
