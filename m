From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S3C24XX: Use module_platform_driver macro in
 mach-osiris-dvs.c
Date: Fri, 07 Sep 2012 07:09:14 +0900
Message-ID: <241a01cd8c7c$40323d00$c096b700$%kim@samsung.com>
References: <1346837969-11344-1-git-send-email-sachin.kamat@linaro.org>
 <1346837969-11344-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45219 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301Ab2IFWJQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 18:09:16 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9Y004FD87EO260@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 07:09:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9Y007ML87EB7C0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 07:09:14 +0900 (KST)
In-reply-to: <1346837969-11344-2-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> module_platform_driver simplifies the code by eliminating
> module_init and module_exit calls.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-s3c24xx/mach-osiris-dvs.c |   13 +------------
>  1 files changed, 1 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c b/arch/arm/mach-
> s3c24xx/mach-osiris-dvs.c
> index ad2792d..5876c6b 100644
> --- a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
> +++ b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
> @@ -175,18 +175,7 @@ static struct platform_driver osiris_dvs_driver = {
>  	},
>  };
> 
> -static int __init osiris_dvs_init(void)
> -{
> -	return platform_driver_register(&osiris_dvs_driver);
> -}
> -
> -static void __exit osiris_dvs_exit(void)
> -{
> -	platform_driver_unregister(&osiris_dvs_driver);
> -}
> -
> -module_init(osiris_dvs_init);
> -module_exit(osiris_dvs_exit);
> +module_platform_driver(osiris_dvs_driver);
> 
>  MODULE_DESCRIPTION("Simtec OSIRIS DVS support");
>  MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
