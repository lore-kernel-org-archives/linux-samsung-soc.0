From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 4/4] Samsung devel-dma for v3.4
Date: Sat, 10 Mar 2012 08:09:11 -0800
Message-ID: <4F5B7CA7.2010604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:36500 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733Ab2CJQJQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 11:09:16 -0500
Received: by ghrr11 with SMTP id r11so1583440ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 08:09:15 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Arnd, Olof,

This is for Samsung dma stuff for v3.4 and depends on following:
   next/cleanup-use-static
   next/cleanup-exynos-clock

Please pull from:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-dma

And conflicts will be happened in clock part. Here is my preferred 
resolution. The mach-exynos/clock.c can be removed with following:

arch/arm/mach-exynos/exynos-clock4.c

[...]

+ 		.ctrlbit	= (1 << 0),
+ 	}, {
+ 		.name		= "hsmmc",
  -		.devname	= "s3c-sdhci.0",
++		.devname	= "exynos4-sdhci.0",
+ 		.parent		= &exynos4_clk_aclk_133.clk,
+ 		.enable		= exynos4_clk_ip_fsys_ctrl,
+ 		.ctrlbit	= (1 << 5),
+ 	}, {
+ 		.name		= "hsmmc",
  -		.devname	= "s3c-sdhci.1",
++		.devname	= "exynos4-sdhci.1",
+ 		.parent		= &exynos4_clk_aclk_133.clk,
+ 		.enable		= exynos4_clk_ip_fsys_ctrl,
+ 		.ctrlbit	= (1 << 6),
+ 	}, {
+ 		.name		= "hsmmc",
  -		.devname	= "s3c-sdhci.2",
++		.devname	= "exynos4-sdhci.2",
+ 		.parent		= &exynos4_clk_aclk_133.clk,
+ 		.enable		= exynos4_clk_ip_fsys_ctrl,
+ 		.ctrlbit	= (1 << 7),
+ 	}, {
+ 		.name		= "hsmmc",
  -		.devname	= "s3c-sdhci.3",
++		.devname	= "exynos4-sdhci.3",
+ 		.parent		= &exynos4_clk_aclk_133.clk,
+ 		.enable		= exynos4_clk_ip_fsys_ctrl,
+ 		.ctrlbit	= (1 << 8),

[...]

+ static struct clksrc_clk exynos5_clk_sclk_mmc0 = {
+ 	.clk	= {
+ 		.name		= "sclk_mmc",
  -		.devname	= "s3c-sdhci.0",
++		.devname	= "exynos4-sdhci.0",
+ 		.parent		= &exynos4_clk_dout_mmc0.clk,
+ 		.enable		= exynos4_clksrc_mask_fsys_ctrl,
+ 		.ctrlbit	= (1 << 0),
[...]
+ static struct clksrc_clk exynos4_clk_sclk_mmc1 = {
+ 	.clk	= {
+ 		.name		= "sclk_mmc",
  -		.devname	= "s3c-sdhci.1",
++		.devname	= "exynos4-sdhci.1",
+ 		.parent		= &exynos4_clk_dout_mmc1.clk,
+ 		.enable		= exynos4_clksrc_mask_fsys_ctrl,
+ 		.ctrlbit	= (1 << 4),
[...]
+ static struct clksrc_clk exynos4_clk_sclk_mmc2 = {
+ 	.clk	= {
+ 		.name		= "sclk_mmc",
  -		.devname	= "s3c-sdhci.2",
++		.devname	= "exynos4-sdhci.2",
+ 		.parent		= &exynos4_clk_dout_mmc2.clk,
+ 		.enable		= exynos4_clksrc_mask_fsys_ctrl,
+ 		.ctrlbit	= (1 << 8),
[...]
+ static struct clksrc_clk exynos4_clk_sclk_mmc3 = {
+ 	.clk	= {
+ 		.name		= "sclk_mmc",
  -		.devname	= "s3c-sdhci.3",
++		.devname	= "exynos4-sdhci.3",
+ 		.parent		= &exynos4_clk_dout_mmc3.clk,
+ 		.enable		= exynos4_clksrc_mask_fsys_ctrl,
+ 		.ctrlbit	= (1 << 12),

[...]

+ static struct clk_lookup exynos4_clk_lookup[] = {
+ 	CLKDEV_INIT("exynos4210-uart.0", "clk_uart_baud0", 
&exynos4_clk_sclk_uart0.clk),
+ 	CLKDEV_INIT("exynos4210-uart.1", "clk_uart_baud0", 
&exynos4_clk_sclk_uart1.clk),
+ 	CLKDEV_INIT("exynos4210-uart.2", "clk_uart_baud0", 
&exynos4_clk_sclk_uart2.clk),
+ 	CLKDEV_INIT("exynos4210-uart.3", "clk_uart_baud0", 
&exynos4_clk_sclk_uart3.clk),
  -	CLKDEV_INIT("s3c-sdhci.0", "mmc_busclk.2", &exynos4_clk_sclk_mmc0.clk),
  -	CLKDEV_INIT("s3c-sdhci.1", "mmc_busclk.2", &exynos4_clk_sclk_mmc1.clk),
  -	CLKDEV_INIT("s3c-sdhci.2", "mmc_busclk.2", &exynos4_clk_sclk_mmc2.clk),
  -	CLKDEV_INIT("s3c-sdhci.3", "mmc_busclk.2", &exynos4_clk_sclk_mmc3.clk),
++	CLKDEV_INIT("exynos4-sdhci.0", "mmc_busclk.2", 
&exynos4_clk_sclk_mmc0.clk),
++	CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2", 
&exynos4_clk_sclk_mmc1.clk),
++	CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2", 
&exynos4_clk_sclk_mmc2.clk),
++	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2", 
&exynos4_clk_sclk_mmc3.clk),
+ 	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &exynos4_clk_pdma0),
+ 	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &exynos4_clk_pdma1),
+ 	CLKDEV_INIT("dma-pl330.2", "apb_pclk", &exynos4_clk_mdma1),

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit e914c89254a8f943d8d06a0bda67769fd27bf9c6:

   Merge branch 'next/cleanup-exynos-clock' into next/devel-samsung-dma 
(2012-03-10 03:32:19 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-dma

Boojin Kim (2):
       ARM: EXYNOS: Enable MDMA driver
       ARM: EXYNOS: add support DMA for EXYNOS4X12 SoC

Tushar Behera (1):
       ARM: EXYNOS: Add apb_pclk clkdev entry for mdma1

  arch/arm/mach-exynos/Kconfig                   |    3 +
  arch/arm/mach-exynos/clock-exynos4.c           |    9 ++
  arch/arm/mach-exynos/dma.c                     |  117 
++++++++++++++++++++++--
  arch/arm/mach-exynos/include/mach/irqs.h       |    2 +
  arch/arm/mach-exynos/include/mach/map.h        |    3 +-
  arch/arm/plat-samsung/include/plat/dma-pl330.h |   16 +++
  6 files changed, 141 insertions(+), 9 deletions(-)
