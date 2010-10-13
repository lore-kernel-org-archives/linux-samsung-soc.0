From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S5PV310: Add support SROMC
Date: Wed, 13 Oct 2010 15:04:46 +0200
Message-ID: <00e301cb6ad7$3842b5c0$a8c82140$%szyprowski@samsung.com>
References: <1286972144-763-1-git-send-email-sbkim73@samsung.com>
 <1286972144-763-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31269 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752532Ab0JMNFH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 09:05:07 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA800HX4CC8AB10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Oct 2010 22:04:56 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA8007J5CBZR0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Oct 2010 22:04:56 +0900 (KST)
In-reply-to: <1286972144-763-2-git-send-email-sbkim73@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Daein Moon' <moon9124@samsung.com>, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

On Wednesday, October 13, 2010 2:16 PM Sangbeom Kim wrote:

> From: Daein Moon <moon9124@samsung.com>
> 
> This patch adds support SROMC for S5PV310 and S5PC210.
> 
> Signed-off-by: Daein Moon <moon9124@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5pv310/cpu.c                    |    5 ++
>  arch/arm/mach-s5pv310/include/mach/map.h       |    4 ++
>  arch/arm/mach-s5pv310/include/mach/regs-srom.h |   50 ++++++++++++++++++++++++
>  3 files changed, 59 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv310/include/mach/regs-srom.h
> 
> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.c
> index ffed262..873783a 100644
> --- a/arch/arm/mach-s5pv310/cpu.c
> +++ b/arch/arm/mach-s5pv310/cpu.c
> @@ -81,6 +81,11 @@ static struct map_desc s5pv310_iodesc[] __initdata = {
>  		.pfn		= __phys_to_pfn(S3C_PA_UART),
>  		.length		= SZ_512K,
>  		.type		= MT_DEVICE,
> +	}, {
> +		.virtual	= (unsigned long)S5P_VA_SROMC,
> +		.pfn		= __phys_to_pfn(S5PV310_PA_SROMC),
> +		.length		= SZ_4K,
> +		.type		= MT_DEVICE,
>  	},
>  };

Do You really need to make a permanent mapping for the SROMC area? Cannot the
setup code in the mach-smdk*.c call ioremap(S5PV310_PA_SROMC) and put the address it
got to the ethernet device? This area will be probably useless for boards other than
SMDK.

<snip>

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
