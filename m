From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: fix multiple definition build error
Date: Fri, 26 Apr 2013 10:00:31 +0200
Message-ID: <1835608.J1o7g8oiCZ@flatron>
References: <1366952590-11652-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:40208 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754073Ab3DZIAg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 04:00:36 -0400
Received: by mail-ea0-f174.google.com with SMTP id g14so170249eak.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2013 01:00:35 -0700 (PDT)
In-Reply-To: <1366952590-11652-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, kyungmin.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Hi Inki,

On Friday 26 of April 2013 14:03:10 Inki Dae wrote:
> This patch fixes multiple definition error like below when building it
> as moudle with device tree support.
> 
> drivers/gpu/drm/exynos/exynos_drm_g2d.o: In function `.LANCHOR1':
> exynos_drm_g2d.c:(.rodata+0x6c): multiple definition of
> `__mod_of_device_table'
> drivers/gpu/drm/exynos/exynos_drm_fimd.o:exynos_drm_fimd.c:(.rodata+0x1
> 44): first defined here
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |    2 +-
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c  |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index 746b282..1e02d13
> 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -117,7 +117,7 @@ static const struct of_device_id
> fimd_driver_dt_match[] = { .data = &exynos5_fimd_driver_data },
>  	{},
>  };
> -MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
> +MODULE_DEVICE_TABLE(of_fimd, fimd_driver_dt_match);

I wonder if this change wouldn't break the purpose of having 
MODULE_DEVICE_TABLE at all.

As far as I remember, this is used to create a symbol with well known name 
that userspace tools can use to identify what devices are handled in this 
module. For example

MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);

results in creation of __mod_of_device_table symbol, of which tools, such 
as depmod are aware and can build a list of supported devices.

Your change will result in creation of __mod_of_fimd_device_table, which 
is unknown and won't be of any use.

By the way, looking at the definition of MODULE_DEVICE_TABLE, which is

139 #define MODULE_DEVICE_TABLE(type,name)          \
140   MODULE_GENERIC_TABLE(type##_device,name)

and then MODULE_GENERIC_TABLE

 85 #ifdef MODULE
 86 #define MODULE_GENERIC_TABLE(gtype,name)                        \
 87 extern const struct gtype##_id __mod_##gtype##_table            \
 88   __attribute__ ((unused, alias(__stringify(name))))
 89 
 90 #else  /* !MODULE */
 91 #define MODULE_GENERIC_TABLE(gtype,name)
 92 #endif

it seems like the exact line that will be generated after your change, 
will be

extern const struct of_fimd_device_id __mod_of_fimd_device_table
	__attribute__ ((unused, alias(__stringify(name))));

which seems wrong, because of_fimd_device_id is not a correct struct type.

Best regards,
Tomasz
