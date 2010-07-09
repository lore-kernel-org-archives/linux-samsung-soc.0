From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 01/19] s3c-fb: Change to depending on CONFIG_S3C_FB_DEV
Date: Fri, 09 Jul 2010 20:33:28 +0900
Message-ID: <028801cb1f5a$8fe5c970$afb15c50$%kim@samsung.com>
References: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
 <1278665407-18002-2-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61074 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755721Ab0GILd0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jul 2010 07:33:26 -0400
In-reply-to: <1278665407-18002-2-git-send-email-p.osciak@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pawel Osciak' <p.osciak@samsung.com>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, akpm@linux-foundation.org, ben-linux@fluff.org, m.szyprowski@samsung.com

Pawel Osciak wrote:
> 
> From: Ben Dooks <ben-linux@fluff.org>
> 
> As suggested by Marek Szyprowski, we should make the driver depend on
> the configuration currently being used to build the platform device
> into the kernel.
> 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Pawel Osciak <p.osciak@samsung.com>

Actually, already submitted by Ben Dooks.
http://lists.infradead.org/pipermail/linux-arm-kernel/2010-May/015616.html

So...I'm not sure adding your signedoff and re-submitting are right.

In my opinion, it's enough to add comments which includes information about
that without re-submitting.

> ---
>  drivers/video/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 3d94a14..858f1ca 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -1930,7 +1930,7 @@ config FB_TMIO_ACCELL
> 
>  config FB_S3C
>  	tristate "Samsung S3C framebuffer support"
> -	depends on FB && ARCH_S3C64XX
> +	depends on FB && S3C_DEV_FB
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
