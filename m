From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 0/7] ARM: S5P6440: Add support for Samsung's S5P6440 SoC
Date: Wed, 16 Dec 2009 18:46:16 +0900
Message-ID: <001e01ca7e34$9d3a18f0$d7ae4ad0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39604 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746AbZLPJo3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2009 04:44:29 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUQ00LH9OE220@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2009 18:44:26 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUQ00KA0OE27H@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2009 18:44:26 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, =?ks_c_5601-1987?B?seixucH4L0FQsLO538bAKFNZUy5MU0kpL0U1KMOlwNMpLw==?= =?ks_c_5601-1987?B?u++8usD8wNo=?= <kgene.kim@samsung.com>

Hi all,

This patches add basic support for Samsung's S5P6440 SoC.
The feature set that is added are clock, timer, uart and interrupts.

The clock changes are based on Harald Welte's patch. This patch is
also based on Ben's plat-samsung patch.

This patch set includes the following patches.

[PATCH v2 1/7] ARM: S5P6440: Add new CPU initialization support
[PATCH v2 2/7] ARM: S5P6440: Add Clock and PLL support
[PATCH v2 3/7] ARM: S5P6440: Add IRQ support
[PATCH v2 4/7] ARM: S5P6440: Add Timer support
[PATCH v2 5/7] ARM: S5P6440: Add new Kconfig and Makefiles
[PATCH v2 6/7] ARM: S5P6440: Add Board and configuration file
[PATCH v2 7/7] ARM: S5P6440: Add serial port support

Changes since v1:

1. Corrected parent clock sources for all the clocks.
2. Corrected the HCLK_LOW frequency calculation issue.
3. Added a menuconfig option "S5P_GPIO_EXTRA" to select the number 
   of additional GPIO's required in file arch/arm/plat-s5p/Kconfig
4. Add PCLK_LOW and UCLK1 as clock sources for UART module. 
5. Removed conditional inclusion of mach-s5p6440/Kconfig.
6. Other fixes and changes.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
