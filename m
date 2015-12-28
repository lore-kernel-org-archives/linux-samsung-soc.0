From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: s3c64xx: fix pm-debug compilation
Date: Mon, 28 Dec 2015 10:54:10 +0900
Message-ID: <56809642.2060100@samsung.com>
References: <5515725.ojLSny3TOX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28817 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbbL1ByQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Dec 2015 20:54:16 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0100FWEPAEKC10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Dec 2015 01:54:14 +0000 (GMT)
In-reply-to: <5515725.ojLSny3TOX@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 18.12.2015 23:46, Arnd Bergmann wrote:
> I got one randconfig build that failed to compile plat-samsung/pm-debug.c
> on s3c64xx:
> 
> In file included from arch/arm/plat-samsung/pm-debug.c:27:0:
> arch/arm/mach-s3c64xx/include/mach/pm-core.h: In function 's3c_pm_debug_init_uart':
> arch/arm/mach-s3c64xx/include/mach/pm-core.h:25:25: error: 'S3C_VA_SYS' undeclared (first use in this function)
>   u32 tmp = __raw_readl(S3C_PCLK_GATE);
> arch/arm/mach-s3c64xx/include/mach/pm-core.h:25:25: note: each undeclared identifier is reported only once for each function it appears in
> arch/arm/mach-s3c64xx/include/mach/pm-core.h:39:2: error: implicit declaration of function 'udelay' [-Werror=implicit-function-declaration]
>   udelay(10);
> 
> I have not investigated why this does not show up much more often, I
> guess the headers are usually included from elsewhere, but adding
> explicit #include statements is an obvious fix.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I suspect this has been broken for a long time, so no rush, but please
> apply this to a cleanup branch.
> 

The dependencies for plat-samsung/SAMSUNG_PM_* symbols are little bit
mixed up:
1. pm-common.o depends on PM_SLEEP,
2. pm.o and pm-debug.o depend on PM and sometimes they use stuff from
pm-common.

It is possible to create a config with PM_SLEEP=n and PM=y so this is
confusing (pm-common won't be linked).

I think this still compiles fine because of various #ifdefs but it would
be nice to clean it up.

Anyway your patch looks correct:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
