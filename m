From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 13/30] video/s3c: move platform_data out of arch/arm
Date: Thu, 11 Apr 2013 14:12:18 +0900
Message-ID: <003301ce3673$23ae2f80$6b0a8e80$%han@samsung.com>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
 <1365638712-1028578-14-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23174 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751183Ab3DKFMV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 01:12:21 -0400
In-reply-to: <1365638712-1028578-14-git-send-email-arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: 'Tomi Valkeinen' <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, April 11, 2013 9:05 AM, Arnd Bergmann wrote:
> 
> The s3c-fb driver requires header files from the samsung platforms
> to find its platform_data definition, but this no longer works on
> multiplatform kernels, so let's move the data into a new header
> file under include/linux/platform_data.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/plat-samsung/include/plat/fb.h | 50 +-----------------------------
>  drivers/video/s3c-fb.c                  |  3 +-
>  include/linux/platform_data/video_s3c.h | 54 +++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 51 deletions(-)
>  create mode 100644 include/linux/platform_data/video_s3c.h
> 

[.....]

> +struct s3c_fb_platdata {
> +	void	(*setup_gpio)(void);
> +
> +	struct s3c_fb_pd_win	*win[S3C_FB_MAX_WIN];
> +	struct fb_videomode     *vtiming;
> +
> +	u32			 vidcon0;
> +	u32			 vidcon1;
> +};
> + 

There is an unnecessary space.
When the patch is merged, this space should be removed.


Best regards,
Jingoo Han

> +#endif
> --
> 1.8.1.2
