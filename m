From: Kukjin Kim <kgene.kim@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: devs: Add names to fimd0 IRQ resources
Date: Sat, 25 May 2013 06:46:28 +0900
Message-ID: <519FDFB4.50402@gmail.com>
References: <1368630584-30147-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:36376 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753642Ab3EXVqb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 17:46:31 -0400
Received: by mail-pa0-f44.google.com with SMTP id wp1so2177650pac.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 May 2013 14:46:31 -0700 (PDT)
In-Reply-To: <1368630584-30147-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Kyungmin Park <kyungmin.park@samsung.com>

On 05/16/13 00:09, Tomasz Figa wrote:
> Since commit 1977e6d8 (drm/exynos: change the method for getting the
> interrupt) the Exynos DRM FIMD driver requires IRQ resources to be
> named. This patch fixes probe failure in non-DT cases by adding
> appropriate resource names to fimd0 platform device.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/plat-samsung/devs.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 30c2fe2..0f9c3f4 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -311,9 +311,9 @@ struct platform_device s5p_device_jpeg = {
>   #ifdef CONFIG_S5P_DEV_FIMD0
>   static struct resource s5p_fimd0_resource[] = {
>   	[0] = DEFINE_RES_MEM(S5P_PA_FIMD0, SZ_32K),
> -	[1] = DEFINE_RES_IRQ(IRQ_FIMD0_VSYNC),
> -	[2] = DEFINE_RES_IRQ(IRQ_FIMD0_FIFO),
> -	[3] = DEFINE_RES_IRQ(IRQ_FIMD0_SYSTEM),
> +	[1] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_VSYNC, "vsync"),
> +	[2] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_FIFO, "fifo"),
> +	[3] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_SYSTEM, "lcd_sys"),
>   };
>
>   struct platform_device s5p_device_fimd0 = {

Applied into fixes.

Thanks.

- Kukjin
