From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ODROID-X: hkdk4412: Add new hardware based on Exynos4412
Date: Wed, 08 Aug 2012 11:23:30 +0900
Message-ID: <0a4301cd750c$cd29d2e0$677d78a0$%kim@samsung.com>
References: <1344262254-14648-1-git-send-email-dongjin.kim@agreeyamobility.net>
 <1344365401-18591-1-git-send-email-dongjin.kim@agreeyamobility.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30162 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753587Ab2HHCXc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 22:23:32 -0400
In-reply-to: <1344365401-18591-1-git-send-email-dongjin.kim@agreeyamobility.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Dongjin Kim' <tobetter@gmail.com>
Cc: 'Dongjin Kim' <dongjin.kim@agreeyamobility.net>, 'Russell King' <linux@arm.linux.org.uk>, 'Tony Lindgren' <tony@atomide.com>, 'Jon Medhurst' <tixy@yxit.co.uk>, 'Shawn Guo' <shawn.guo@linaro.org>, =?UTF-8?Q?'Uwe_Kleine-K=C3=B6nig'?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Dongjin Kim wrote:
> 
Hi,

Basically, we don't add more board file for non-DT for EXYNOS SoCs...

> The HKDK4412 is the CPU module developed by Hardkernel which is based on
> Exynos 4412.  mach_hkdk4412.c is to run on ODROID-X hardware and Machine
> ID
> (4289) is registered.
> 
This should be done at the link: http://www.arm.linux.org.uk/developer/machines/ by Russell King.

But I'm not sure whether it is worth to you without this patch for board file in mainline.

> Changes in v2:
>   -. Change regulator's display names
> 
> Change-Id: Iea6825a17b2e13f96bc6d892dd5135cad899b5df

No need gerrit Change-Id here.

> Signed-off-by: Dongjin Kim <dongjin.kim@agreeyamobility.net>

If there is no reason, please use same e-mail address in the field of author and sign-off.

Note, if you want to use e-mail 'agreeyamobility.net', just add 'From: Dongjin Kim <dongjin.kim@agreeyamobility.net>', it's ok.

> ---
>  arch/arm/mach-exynos/Kconfig         |   23 +
>  arch/arm/mach-exynos/Makefile        |    1 +
>  arch/arm/mach-exynos/mach-hkdk4412.c |  964
> ++++++++++++++++++++++++++++++++++
>  arch/arm/tools/mach-types            |    1 +
>  4 files changed, 989 insertions(+)
>  create mode 100644 arch/arm/mach-exynos/mach-hkdk4412.c
> 

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
