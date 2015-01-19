From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: exynos: fix UART address selection for DEBUG_LL
Date: Mon, 19 Jan 2015 15:55:47 +0900
Message-ID: <54BCAA73.5080404@samsung.com>
References: <1411728234-29705-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10078 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180AbbASGzb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 01:55:31 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIE00IJDWKCDE70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jan 2015 15:55:24 +0900 (KST)
In-reply-to: <1411728234-29705-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: cw00.choi@samsung.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com, kgene@kernel.org

Hi kukjin,

On 09/26/2014 07:43 PM, Joonyoung Shim wrote:
> The exynos5 SoCs using A15+A7 can boot to A15 or A7. If it boots using
> A7, it can't detect right UART physical address only the part number of
> CP15. It's possible to solve as checking Cluster ID additionally.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  arch/arm/include/debug/exynos.S | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/include/debug/exynos.S b/arch/arm/include/debug/exynos.S
> index b17fdb7..60bf3c2 100644
> --- a/arch/arm/include/debug/exynos.S
> +++ b/arch/arm/include/debug/exynos.S
> @@ -24,7 +24,11 @@
>  		mrc	p15, 0, \tmp, c0, c0, 0
>  		and	\tmp, \tmp, #0xf0
>  		teq	\tmp, #0xf0		@@ A15
> -		ldreq	\rp, =EXYNOS5_PA_UART
> +		beq	100f
> +		mrc	p15, 0, \tmp, c0, c0, 5
> +		and	\tmp, \tmp, #0xf00
> +		teq	\tmp, #0x100		@@ A15 + A7 but boot to A7
> +100:		ldreq	\rp, =EXYNOS5_PA_UART
>  		movne	\rp, #EXYNOS4_PA_UART	@@ EXYNOS4
>  		ldr	\rv, =S3C_VA_UART
>  #if CONFIG_DEBUG_S3C_UART != 0
> 

Any comments?

Thanks.
