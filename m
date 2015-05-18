From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCH v1 1/1] ARM: EXYNOS: fix DEBUG_LL on Cortex-A7.
Date: Mon, 18 May 2015 10:52:14 +0900
Message-ID: <CAPTzV17YWyTiFU4wGs=Wy9quC_NzguXuqrheY_JoqAWN=VRniA@mail.gmail.com>
References: <1431844923-4654-1-git-send-email-t.dakhran@gmail.com>
	<1431844923-4654-2-git-send-email-t.dakhran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:36194 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751958AbbERBwP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 May 2015 21:52:15 -0400
In-Reply-To: <1431844923-4654-2-git-send-email-t.dakhran@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tarek Dakhran <t.dakhran@gmail.com>
Cc: kgene@kernel.org, Russell King <linux@arm.linux.org.uk>, k.kozlowski@samsung.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jy0922.shim@samsung.com

Hi Tarek,

On Sun, May 17, 2015 at 3:42 PM, Tarek Dakhran <t.dakhran@gmail.com> wrote:
> Cortex-A7 has EXYNOS5_PA_UART base address for UART.
> If system boots from Cortex-A7 CPU addruart loads wrong
> address. This patch fixex this.
>
> Signed-off-by: Tarek Dakhran <t.dakhran@gmail.com>
> ---
>  arch/arm/include/debug/exynos.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/include/debug/exynos.S b/arch/arm/include/debug/exynos.S
> index b17fdb7..a61b3ea 100644
> --- a/arch/arm/include/debug/exynos.S
> +++ b/arch/arm/include/debug/exynos.S
> @@ -24,6 +24,7 @@
>                 mrc     p15, 0, \tmp, c0, c0, 0
>                 and     \tmp, \tmp, #0xf0
>                 teq     \tmp, #0xf0             @@ A15
> +               teqne   \tmp, #0x70             @@ A7
>                 ldreq   \rp, =EXYNOS5_PA_UART
>                 movne   \rp, #EXYNOS4_PA_UART   @@ EXYNOS4
>                 ldr     \rv, =S3C_VA_UART
> --
> 1.9.1
>

Please see previous Joonyoung's patch. Your patch could break
exynos3250 because it has not only two cortex-a7 cpus but also uses
EXYOS4_PA_UART.

http://www.spinics.net/lists/linux-samsung-soc/msg37318.html

-- 
Best Regards,
Chanho Park
