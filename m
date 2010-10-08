From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P64X0: Replace the 6440 system device class
 definition with 64x0
Date: Fri, 08 Oct 2010 17:06:38 +0900
Message-ID: <000101cb66bf$c3427410$49c75c30$%kim@samsung.com>
References: <1286428163-18685-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64918 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490Ab0JHIGb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 04:06:31 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y00LNLP6TJ860@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 17:06:29 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y0014CP6TMG@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 17:06:29 +0900 (KST)
In-reply-to: <1286428163-18685-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Sangbeom Kim wrote:
> 
> From: Abhilash Kesavan <a.kesavan@samsung.com>
> 
> s5p64x0_sysclass should be used in place of the obselete s5p6440_sysclass
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/plat-samsung/include/plat/cpu.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-
> samsung/include/plat/cpu.h
> index 6412933..9addb3d 100644
> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -79,7 +79,7 @@ extern struct sysdev_class s3c2442_sysclass;
>  extern struct sysdev_class s3c2443_sysclass;
>  extern struct sysdev_class s3c6410_sysclass;
>  extern struct sysdev_class s3c64xx_sysclass;
> -extern struct sysdev_class s5p6440_sysclass;
> +extern struct sysdev_class s5p64x0_sysclass;
>  extern struct sysdev_class s5p6442_sysclass;
>  extern struct sysdev_class s5pv210_sysclass;
> 
> --
Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
