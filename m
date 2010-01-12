From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PC1XX: Remove definitions deleted by previous
 clksrc changes
Date: Tue, 12 Jan 2010 09:51:47 +0100
Message-ID: <000501ca9364$7cba3070$762e9150$%szyprowski@samsung.com>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-4-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-5-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-6-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-7-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-8-git-send-email-ben@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65492 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752138Ab0ALIwu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 03:52:50 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KW400CD9M00NT@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 17:52:48 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KW400CKALZUGX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 17:52:48 +0900 (KST)
In-reply-to: <1263270017-25155-8-git-send-email-ben@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@trinity.fluff.org>, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Tuesday, January 12, 2010 5:20 AM Ben Dooks wrote:

> From: Ben Dooks <ben-linux@fluff.org>
> 
> Remove the definitions we've deleted in the previous updates to the
> clksrc_clk for arch/arm/plat-s5pc1xx/include/plat/regs-clock.h.
> 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  arch/arm/plat-s5pc1xx/include/plat/regs-clock.h |   60 -----------------------
>  1 files changed, 0 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h b/arch/arm/plat-
> s5pc1xx/include/plat/regs-clock.h
> index c5cc86e..e88562e 100644
> --- a/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
> +++ b/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
> @@ -62,53 +62,16 @@
>  #define S5PC100_EPLLVAL(_m, _p, _s)	((_m) << 16 | ((_p) << 8) | ((_s)))
> 
>  /* CLKSRC0 */
> -#define S5PC100_CLKSRC0_APLL_MASK		(0x1<<0)
> -#define S5PC100_CLKSRC0_APLL_SHIFT		(0)
> -#define S5PC100_CLKSRC0_MPLL_MASK		(0x1<<4)
> -#define S5PC100_CLKSRC0_MPLL_SHIFT		(4)
> -#define S5PC100_CLKSRC0_EPLL_MASK		(0x1<<8)
> -#define S5PC100_CLKSRC0_EPLL_SHIFT		(8)
> -#define S5PC100_CLKSRC0_HPLL_MASK		(0x1<<12)
> -#define S5PC100_CLKSRC0_HPLL_SHIFT		(12)
> -#define S5PC100_CLKSRC0_AMMUX_MASK		(0x1<<16)
> -#define S5PC100_CLKSRC0_AMMUX_SHIFT		(16)
>  #define S5PC100_CLKSRC0_HREF_MASK		(0x1<<20)
>  #define S5PC100_CLKSRC0_HREF_SHIFT		(20)
> -#define S5PC100_CLKSRC0_ONENAND_MASK	(0x1<<24)
> -#define S5PC100_CLKSRC0_ONENAND_SHIFT	(24)
> ...
>  /* CLKDIV2 */
>  #define S5PC100_CLKDIV2_UART_MASK		(0x7<<0)
> -#define S5PC100_CLKDIV2_UART_SHIFT		(0)
>  #define S5PC100_CLKDIV2_SPI0_MASK		(0xf<<4)
> -#define S5PC100_CLKDIV2_SPI0_SHIFT		(4)
>  #define S5PC100_CLKDIV2_SPI1_MASK		(0xf<<8)
> -#define S5PC100_CLKDIV2_SPI1_SHIFT		(8)
>  #define S5PC100_CLKDIV2_SPI2_MASK		(0xf<<12)
> -#define S5PC100_CLKDIV2_SPI2_SHIFT		(12)
>  #define S5PC100_CLKDIV2_IRDA_MASK		(0xf<<16)
>  #define S5PC100_CLKDIV2_IRDA_SHIFT		(16)
>  #define S5PC100_CLKDIV2_UHOST_MASK		(0xf<<20)
> -#define S5PC100_CLKDIV2_UHOST_SHIFT		(20)

> ...

IMHO it is not a good idea to remove these defines selectively. Header
would look strange and one might conclude that something is missing.

Removing all of them is also a bad idea, because some important
information is lost in such case (it would be harder to add missing
clocks to the system). Half of these defines are redundant anyway,
so maybe we should leave only *_MASK defines for informational purpose? 

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
