From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: SAMSUNG: fix to support for missing cpu specific map_io
Date: Tue, 30 Jul 2013 10:08:26 +0530
Message-ID: <CAK9yfHwMANp2TfQWHQVXGZ2C-t-KrwGHJOpFT+hedDFYTDng6Q@mail.gmail.com>
References: <190501ce8cdd$2abd6780$80383680$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:35060 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753185Ab3G3Ei1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 00:38:27 -0400
Received: by mail-oa0-f46.google.com with SMTP id l10so746448oag.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 21:38:26 -0700 (PDT)
In-Reply-To: <190501ce8cdd$2abd6780$80383680$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

On 30 July 2013 09:57, Kukjin Kim <kgene.kim@samsung.com> wrote:
>
> Since commit 7ed76e08 (ARM: EXYNOS: Fix low level debug support)
> map_io() is not needed for exynos5440 so need to fix to lookup
> cpu which using map_io(). Without this, kernel boot log complains
> 'CPU EXYNOS5440 support not enabled' on exynos5440 and panic().
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/plat-samsung/init.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
> index 3e5c461..50a3ea0 100644
> --- a/arch/arm/plat-samsung/init.c
> +++ b/arch/arm/plat-samsung/init.c
> @@ -55,12 +55,13 @@ void __init s3c_init_cpu(unsigned long idcode,
>
>         printk("CPU %s (id 0x%08lx)\n", cpu->name, idcode);
>
> -       if (cpu->map_io == NULL || cpu->init == NULL) {
> +       if (cpu->init == NULL) {
>                 printk(KERN_ERR "CPU %s support not enabled\n", cpu->name);
>                 panic("Unsupported Samsung CPU");

While at it you could probably remove the printk and have that message
printed by panic instead?

-- 
With warm regards,
Sachin
