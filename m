From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: S5P6440: Add IO descriptor for ChipID block.
Date: Tue, 19 Jan 2010 07:16:16 +0000
Message-ID: <20100119071616.GC26562@trinity.fluff.org>
References: <1263867699-28672-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:53589 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751932Ab0ASHQU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jan 2010 02:16:20 -0500
Content-Disposition: inline
In-Reply-To: <1263867699-28672-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jan 19, 2010 at 11:21:39AM +0900, Kukjin Kim wrote:
> This patch adds the IO descriptor for ChipID block in S5P6440.

ok, willapply.
 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/include/mach/map.h |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p6440/include/mach/map.h b/arch/arm/mach-s5p6440/include/mach/map.h
> index b370329..dc922d6 100644
> --- a/arch/arm/mach-s5p6440/include/mach/map.h
> +++ b/arch/arm/mach-s5p6440/include/mach/map.h
> @@ -15,6 +15,11 @@
>  
>  #include <plat/map-base.h>
>  
> +/* Chip ID */
> +#define S5P6440_PA_CHIPID	(0xE0000000)
> +#define S5P_PA_CHIPID		S5P6440_PA_CHIPID
> +#define S5P_VA_CHIPID		S3C_ADDR(0x00700000)
> +
>  /* SYSCON */
>  #define S5P6440_PA_SYSCON	(0xE0100000)
>  #define S5P_PA_SYSCON		S5P6440_PA_SYSCON
> -- 
> 1.6.2.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
