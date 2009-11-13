From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 12/18] drivers: fb: enable S3C FrameBuffer on S5PC1XX
	platform
Date: Fri, 13 Nov 2009 23:34:39 +0000
Message-ID: <20091113233439.GS4808@trinity.fluff.org>
References: <1258014122-18185-4-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-5-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-6-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-7-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-8-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-9-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-10-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-11-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-12-git-send-email-m.szyprowski@samsung.com> <1258014122-18185-13-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:48007 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932506AbZKMXef (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2009 18:34:35 -0500
Content-Disposition: inline
In-Reply-To: <1258014122-18185-13-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, laforge@gnumonks.org, kyungmin.park@samsung.com, bhmin@samsung.com, ben-linux@fluff.org

On Thu, Nov 12, 2009 at 09:21:56AM +0100, Marek Szyprowski wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Samsung S5PC100 SoC has LCD display controller compatible to the one
> known from S3C6410 SoCs. Enable support for s3c-fb driver also on S5PC1xx
> platform.

Pending the the resolution of the previous fb patches.
 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/video/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 9bbb285..bb2c7b6 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -1882,7 +1882,7 @@ config FB_TMIO_ACCELL
>  
>  config FB_S3C
>  	tristate "Samsung S3C framebuffer support"
> -	depends on FB && ARCH_S3C64XX
> +	depends on FB && (ARCH_S3C64XX || ARCH_S5PC1XX)
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> -- 
> 1.6.5
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
