From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 6/7] ARM: S5PV210: clock registers (CLK_DIV/SRC/STAT)
Date: Wed, 04 Aug 2010 20:34:43 +0900
Message-ID: <001b01cb33c9$0fa33b70$2ee9b250$%kim@samsung.com>
References: <1280829866-26001-1-git-send-email-myungjoo.ham@samsung.com>
 <1280829866-26001-2-git-send-email-myungjoo.ham@samsung.com>
 <1280829866-26001-3-git-send-email-myungjoo.ham@samsung.com>
 <1280829866-26001-4-git-send-email-myungjoo.ham@samsung.com>
 <1280829866-26001-5-git-send-email-myungjoo.ham@samsung.com>
 <1280829866-26001-6-git-send-email-myungjoo.ham@samsung.com>
 <1280829866-26001-7-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:8237 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932272Ab0HDLep (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Aug 2010 07:34:45 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6M0042HLHU9I10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Aug 2010 20:34:42 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6M00BUHLHUCF@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Aug 2010 20:34:42 +0900 (KST)
In-reply-to: <1280829866-26001-7-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

MyungJoo Ham wrote:
> 
> Previously, most of CLK_DIV/SRC register accessing mask and shift
> values were used at arch/arm/mach-s5pv210/clock.c only; thus we
> had not been using macros for these. However, as CPUFREQ uses
> those shift and mask values as well, we'd better define them at a single
> location, whose proper location would be regs-clock.h.
> 
> Note that only the information about registers used by CPUFREQ are
> defined. However, we may need to define other registers later if we add
> other parts. Besides, later, we will probably need to use these macros
> at arch/arm/mach-s5pv210/clock.c as well especially for entries that are
> used out of clock.c as well.
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/regs-clock.h |   60
> +++++++++++++++++++++-
>  1 files changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
b/arch/arm/mach-
> s5pv210/include/mach/regs-clock.h
> index 2a25ab4..f370ae8 100644
> --- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> +++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> @@ -66,11 +66,30 @@
>  #define S5P_CLKGATE_BUS0	S5P_CLKREG(0x484)
>  #define S5P_CLKGATE_BUS1	S5P_CLKREG(0x488)
>  #define S5P_CLK_OUT		S5P_CLKREG(0x500)
> +#define S5P_CLK_DIV_STAT0   S5P_CLKREG(0x1000)
> +#define S5P_CLK_DIV_STAT1   S5P_CLKREG(0x1004)
> +#define S5P_CLK_MUX_STAT0   S5P_CLKREG(0x1100)
> +#define S5P_CLK_MUX_STAT1   S5P_CLKREG(0x1104)
> +
> +#define S5P_ARM_MCS_CON		S5P_CLKREG(0x6100)
> 
>  /* CLKSRC0 */
> -#define S5P_CLKSRC0_MUX200_MASK		(0x1<<16)
> -#define S5P_CLKSRC0_MUX166_MASK		(0x1<<20)
> -#define S5P_CLKSRC0_MUX133_MASK		(0x1<<24)
> +#define S5P_CLKSRC0_APLL_MASK		(0x1 << 0)
> +#define S5P_CLKSRC0_APLL_SHIFT		(0)
> +#define S5P_CLKSRC0_MPLL_MASK		(0x1 << 4)
> +#define S5P_CLKSRC0_MPLL_SHIFT		(4)
> +#define S5P_CLKSRC0_EPLL_MASK		(0x1 << 8)
> +#define S5P_CLKSRC0_EPLL_SHIFT		(8)
> +#define S5P_CLKSRC0_VPLL_MASK		(0x1 << 12)
> +#define S5P_CLKSRC0_VPLL_SHIFT		(12)

I didn't find anywhere above definitions are used....
As I said, please don't add unnecessary definitions.

> +#define S5P_CLKSRC0_MUX200_MASK		(0x1 << 16)
> +#define S5P_CLKSRC0_MUX200_SHIFT	(16)
> +#define S5P_CLKSRC0_MUX166_MASK		(0x1 << 20)
> +#define S5P_CLKSRC0_MUX166_SHIFT	(20)
> +#define S5P_CLKSRC0_MUX133_MASK		(0x1 << 24)
> +#define S5P_CLKSRC0_MUX133_SHIFT	(24)

> +#define S5P_CLKSRC0_ONENAND_MASK	(0x1 << 28)
> +#define S5P_CLKSRC0_ONENAND_SHIFT	(28)

Same...unnecessary.

> 
>  /* CLKDIV0 */
>  #define S5P_CLKDIV0_APLL_SHIFT		(0)
> @@ -90,6 +109,41 @@
>  #define S5P_CLKDIV0_PCLK66_SHIFT	(28)
>  #define S5P_CLKDIV0_PCLK66_MASK		(0x7 <<
> S5P_CLKDIV0_PCLK66_SHIFT)
> 
> +/* CLKSRC2 */
> +#define S5P_CLKSRC2_G3D_MASK		(0x3 << 0)
> +#define S5P_CLKSRC2_G3D_SHIFT		(0)
> +#define S5P_CLKSRC2_MFC_MASK		(0x3 << 4)
> +#define S5P_CLKSRC2_MFC_SHIFT		(4)
> +#define S5P_CLKSRC2_G2D_MASK		(0x3 << 8)
> +#define S5P_CLKSRC2_G2D_SHIFT		(8)
> +
> +/* CLKDIV2 */
> +#define S5P_CLKDIV2_G3D_MASK		(0xF << 0)
> +#define S5P_CLKDIV2_G3D_SHIFT		(0)
> +#define S5P_CLKDIV2_MFC_MASK		(0xF << 4)
> +#define S5P_CLKDIV2_MFC_SHIFT		(4)
> +#define S5P_CLKDIV2_G2D_MASK		(0xF << 8)
> +#define S5P_CLKDIV2_G2D_SHIFT		(8)
> +
> +/* CLKDIV6 */
> +#define S5P_CLKDIV6_ONEDRAM_MASK	(0xf<<28)
> +#define S5P_CLKDIV6_ONEDRAM_SHIFT	(28)
> +
> +/* CLK_DIV_STAT0 */
> +#define S5P_CLKDIV_STAT0_G3D		(1 << 16)
> +#define S5P_CLKDIV_STAT0_MFC		(1 << 17)
> +
> +/* CLK_DIV_STAT1 */
> +#define S5P_CLKDIV_STAT1_G2D		(1 << 20)
> +
> +/* CLK_MUX_STAT0 */
> +#define S5P_CLKMUX_STAT0_MUX200		(1 << 18)
> +
> +/* CLK_MUX_STAT1 */
> +#define S5P_CLKMUX_STAT1_G3D		(1 << 3)
> +#define S5P_CLKMUX_STAT1_MFC		(1 << 7)
> +#define S5P_CLKMUX_STAT1_G2D		(1 << 27)
> +
>  /* Registers related to power management */
>  #define S5P_PWR_CFG		S5P_CLKREG(0xC000)
>  #define S5P_EINT_WAKEUP_MASK	S5P_CLKREG(0xC004)
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
