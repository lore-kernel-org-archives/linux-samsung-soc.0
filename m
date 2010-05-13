From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PC100: Modified the clock code to conform to
 Samsung clock API.
Date: Thu, 13 May 2010 11:16:13 +0200
Message-ID: <005b01caf27c$f3ab5980$db020c80$%szyprowski@samsung.com>
References: <1273713001-15028-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62266 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752702Ab0EMJQ6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 May 2010 05:16:58 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2C00CK8PS881@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 May 2010 18:16:56 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2C008UAPRU0P@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 May 2010 18:16:56 +0900 (KST)
In-reply-to: <1273713001-15028-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Abhilash Kesavan' <a.kesavan@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, ben-linux@fluff.org

Hello,

On Thursday, May 13, 2010 3:10 AM Kukjin Kim wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> Re-worked the existing clock code for Samsung's S5PC100 SoC to be in
> sync with new clock API.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pc100/Makefile                  |    2 +-
>  arch/arm/mach-s5pc100/clock.c                   | 1368
> +++++++++++++++++++++++
>  arch/arm/mach-s5pc100/include/mach/regs-clock.h |   71 ++
>  arch/arm/plat-s5p/clock.c                       |    2 +-
>  arch/arm/plat-s5p/include/plat/pll.h            |   22 +
>  arch/arm/plat-s5p/include/plat/s5p-clock.h      |    2 +
>  6 files changed, 1465 insertions(+), 2 deletions(-)
>  create mode 100755 arch/arm/mach-s5pc100/clock.c
>  create mode 100644 arch/arm/mach-s5pc100/include/mach/regs-clock.h
> 
> diff --git a/arch/arm/mach-s5pc100/Makefile b/arch/arm/mach-
> s5pc100/Makefile
> index 809ff10..8540509 100644
> --- a/arch/arm/mach-s5pc100/Makefile
> +++ b/arch/arm/mach-s5pc100/Makefile
> @@ -11,7 +11,7 @@ obj-				:=
> 
>  # Core support for S5PC100 system
> 
> -obj-$(CONFIG_CPU_S5PC100)	+= cpu.o
> +obj-$(CONFIG_CPU_S5PC100)	+= cpu.o clock.o
> 
>  # Helper and device support
> 
> diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
> new file mode 100755
> index 0000000..fac8ff0
> --- /dev/null
> +++ b/arch/arm/mach-s5pc100/clock.c
> @@ -0,0 +1,1368 @@

> ...

> +static struct clk init_clocks_disable[] = {
> +	{
> +		.name		= "cssys",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_0_ctrl,
> +		.ctrlbit	= (1 << 6),
> +	}, {
> +		.name		= "secss",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_0_ctrl,
> +		.ctrlbit	= (1 << 5),
> +	}, {
> +		.name		= "g2d",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_0_ctrl,
> +		.ctrlbit	= (1 << 4),
> +	}, {
> +		.name		= "mdma",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_0_ctrl,
> +		.ctrlbit	= (1 << 3),
> +	}, {
> +		.name		= "cfcon",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_0_ctrl,
> +		.ctrlbit	= (1 << 2),
> +	}, {
> +		.name		= "nfcon",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_1_ctrl,
> +		.ctrlbit	= (1 << 3),
> +	}, {
> +		.name		= "onenandc",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_1_ctrl,
> +		.ctrlbit	= (1 << 2),
> +	}, {
> +		.name		= "sdm",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_2_ctrl,
> +		.ctrlbit	= (1 << 2),
> +	}, {
> +		.name		= "seckey",
> +		.id		= -1,
> +		.parent		= &clk_div_d0_bus.clk,
> +		.enable		= s5pc100_d0_2_ctrl,
> +		.ctrlbit	= (1 << 1),
> +	}, {
> +		.name		= "hsmmc",
> +		.id		= 2,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_0_ctrl,
> +		.ctrlbit	= (1 << 7),
> +	}, {
> +		.name		= "hsmmc",
> +		.id		= 1,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_0_ctrl,
> +		.ctrlbit	= (1 << 6),
> +	}, {
> +		.name		= "hsmmc",
> +		.id		= 0,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_0_ctrl,
> +		.ctrlbit	= (1 << 5),
> +	}, {
> +		.name		= "modemif",
> +		.id		= -1,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_0_ctrl,
> +		.ctrlbit	= (1 << 4),
> +	}, {
> +		.name		= "usbotg",
> +		.id		= -1,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_0_ctrl,
> +		.ctrlbit	= (1 << 3),
> +	}, {
> +		.name		= "usbhost",
> +		.id		= -1,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_0_ctrl,
> +		.ctrlbit	= (1 << 2),
> +	}, {
> +		.name		= "pdma",
> +		.id		= 1,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_0_ctrl,
> +		.ctrlbit	= (1 << 1),
> +	}, {
> +		.name		= "pdma",
> +		.id		= 0,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_0_ctrl,
> +		.ctrlbit	= (1 << 0),
> +	}, {
> +		.name		= "fimd",
> +		.id		= -1,
> +		.parent		= &clk_div_d1_bus.clk,
> +		.enable		= s5pc100_d1_1_ctrl,
> +		.ctrlbit	= (1 << 0),

Use 'lcd' name for this clock. Current s3c-fb driver uses it to get the value
of HCLK clock to calculate the pixel clock value.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
