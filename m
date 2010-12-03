From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P64X0: Change gpiolib initialization for S5P64X0 to
 core_initcall
Date: Fri, 03 Dec 2010 18:53:02 +0900
Message-ID: <014e01cb92cf$e1c23d80$a546b880$%kim@samsung.com>
References: <1291337567-9064-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63314 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932347Ab0LCKBt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 05:01:49 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCU008YEJGHAVD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 18:53:05 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCU001E8JGHDL@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 18:53:05 +0900 (KST)
In-reply-to: <1291337567-9064-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Sangbeom Kim wrote:
> 
> From: Abhilash Kesavan <a.kesavan@samsung.com>
> 
> Changing the gpiolib initialization from arch_initcall to core_initcall
> will allow us to make use of gpio functions in smdk64x0_machine_init
> function.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/gpiolib.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p64x0/gpiolib.c b/arch/arm/mach-
> s5p64x0/gpiolib.c
> index 072668a..e7fb3b0 100644
> --- a/arch/arm/mach-s5p64x0/gpiolib.c
> +++ b/arch/arm/mach-s5p64x0/gpiolib.c
> @@ -508,4 +508,4 @@ static int __init s5p64x0_gpiolib_init(void)
> 
>  	return 0;
>  }
> -arch_initcall(s5p64x0_gpiolib_init);
> +core_initcall(s5p64x0_gpiolib_init);
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
