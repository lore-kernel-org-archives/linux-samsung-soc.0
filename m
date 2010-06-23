From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v2 2/4] ARM: S3C2416: Set name of the framebuffer device
 only if it present
Date: Wed, 23 Jun 2010 08:38:39 +0200
Message-ID: <002401cb129e$b93a75a0$2baf60e0$%szyprowski@samsung.com>
References: <1277220124-16225-1-git-send-email-jekhor@gmail.com>
 <1277220124-16225-3-git-send-email-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41584 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184Ab0FWGju (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 02:39:50 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4G007ZVFUBEF10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jun 2010 15:39:47 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4G0027MFU1KN@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jun 2010 15:39:47 +0900 (KST)
In-reply-to: <1277220124-16225-3-git-send-email-jekhor@gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Yauhen Kharuzhy' <jekhor@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello,

On Tuesday, June 22, 2010 5:22 PM Yauhen Kharuzhy wrote:

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

The above line should be rather removed completely in favor of a
solution proposed by Pawel Osciak in his s3c-fb patches:
http://www.spinics.net/lists/arm-kernel/msg90906.html

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
