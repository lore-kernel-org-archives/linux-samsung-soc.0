From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C24XX: Use module_platform_driver macro in
 h1940-bluetooth.c
Date: Fri, 07 Sep 2012 07:08:39 +0900
Message-ID: <241901cd8c7c$2b908fa0$82b1aee0$%kim@samsung.com>
References: <1346837969-11344-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52579 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751102Ab2IFWIl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 18:08:41 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9Y00GRI86B7CB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 07:08:40 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9Y0082F86GEX50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 07:08:40 +0900 (KST)
In-reply-to: <1346837969-11344-1-git-send-email-sachin.kamat@linaro.org>
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
>  arch/arm/mach-s3c24xx/h1940-bluetooth.c |   14 +-------------
>  1 files changed, 1 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/h1940-bluetooth.c b/arch/arm/mach-
> s3c24xx/h1940-bluetooth.c
> index a5eeb62..57aee91 100644
> --- a/arch/arm/mach-s3c24xx/h1940-bluetooth.c
> +++ b/arch/arm/mach-s3c24xx/h1940-bluetooth.c
> @@ -138,19 +138,7 @@ static struct platform_driver h1940bt_driver = {
>  	.remove		= h1940bt_remove,
>  };
> 
> -
> -static int __init h1940bt_init(void)
> -{
> -	return platform_driver_register(&h1940bt_driver);
> -}
> -
> -static void __exit h1940bt_exit(void)
> -{
> -	platform_driver_unregister(&h1940bt_driver);
> -}
> -
> -module_init(h1940bt_init);
> -module_exit(h1940bt_exit);
> +module_platform_driver(h1940bt_driver);
> 
>  MODULE_AUTHOR("Arnaud Patard <arnaud.patard@rtp-net.org>");
>  MODULE_DESCRIPTION("Driver for the iPAQ H1940 bluetooth chip");
> --
> 1.7.4.1

Applied, thanks.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
