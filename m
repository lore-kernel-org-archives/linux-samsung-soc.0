From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 2/4] ARM: S3C2416: Set name of the framebuffer device
 only	if it present
Date: Mon, 18 Oct 2010 21:00:25 +0900
Message-ID: <049401cb6ebc$0eb8cc10$2c2a6430$%kim@samsung.com>
References: <1277220124-16225-1-git-send-email-jekhor@gmail.com>
 <1277220124-16225-3-git-send-email-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42076 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910Ab0JRMAH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Oct 2010 08:00:07 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAH006G7IO6XQ90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Oct 2010 21:00:06 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAH00ATKIO611@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Oct 2010 21:00:06 +0900 (KST)
In-reply-to: <1277220124-16225-3-git-send-email-jekhor@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Yauhen Kharuzhy' <jekhor@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Yauhen Kharuzhy wrote:
> 
> Fix case when board doesn't have LCD connected and doesn't have
> corresponding platform device compiled.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  arch/arm/mach-s3c2416/s3c2416.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c2416/s3c2416.c b/arch/arm/mach-
> s3c2416/s3c2416.c
> index 35dabcc..355ab62 100644
> --- a/arch/arm/mach-s3c2416/s3c2416.c
> +++ b/arch/arm/mach-s3c2416/s3c2416.c
> @@ -90,7 +90,9 @@ int __init s3c2416_init(void)
>  	s3c_i2c0_setname("s3c2440-i2c");
>  	s3c_i2c1_setname("s3c2440-i2c");
> 
> +#ifdef CONFIG_S3C_DEV_FB
>  	s3c_device_fb.name = "s3c2443-fb";
> +#endif

Could you please use s3c_fb_setname() instead?
There is in plat-samsung/include/plat/fb-core.h...

> 
>  	return sysdev_register(&s3c2416_sysdev);
>  }
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
