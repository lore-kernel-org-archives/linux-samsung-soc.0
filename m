From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4210-trats: Split memory into 4 sections
Date: Mon, 15 Oct 2012 23:18:23 +0900
Message-ID: <10e301cdaadf$ef547150$cdfd53f0$%kim@samsung.com>
References: <1349779199-30665-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15319 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722Ab2JOOSZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Oct 2012 10:18:25 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBX00IR1UELNC90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 23:18:23 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBX00GPUUENPN90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 23:18:23 +0900 (KST)
In-reply-to: <1349779199-30665-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

Tomasz Figa wrote:
> 
> Since the maximum section size on mach-exynos is set to 256MiB, boards
> with memory configuration defined using sections bigger than 256MiB will
> fail to boot with a kernel panic.
> 
I don't think so and it works fine in my side. Probably, the reason of
kernel panic you said is not a maximum sections size?

> This patch modifies the dts file of Samsung Trats board to define four
> sections of 256MiB instead of two of 512MiB to fix the boot problem.
> 
BTW, if this patch can fix the problem, OK, I will apply this for now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-trats.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-trats.dts
> b/arch/arm/boot/dts/exynos4210-trats.dts
> index 73567b8..a21511c 100644
> --- a/arch/arm/boot/dts/exynos4210-trats.dts
> +++ b/arch/arm/boot/dts/exynos4210-trats.dts
> @@ -20,8 +20,10 @@
>  	compatible = "samsung,trats", "samsung,exynos4210";
> 
>  	memory {
> -		reg =  <0x40000000 0x20000000
> -			0x60000000 0x20000000>;
> +		reg =  <0x40000000 0x10000000
> +			0x50000000 0x10000000
> +			0x60000000 0x10000000
> +			0x70000000 0x10000000>;
>  	};
> 
>  	chosen {
> --
> 1.7.12
