From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 4/6] ARM: SAMSUNG: Fix rebase error in pm-debug.c
Date: Fri, 21 Mar 2014 03:08:21 +0900
Message-ID: <532B2E95.50608@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com> <1395162964-5916-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:38588 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754731AbaCTSIY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 14:08:24 -0400
Received: by mail-pd0-f173.google.com with SMTP id z10so1254348pdj.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 11:08:24 -0700 (PDT)
In-Reply-To: <1395162964-5916-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On 03/19/14 02:16, Tomasz Figa wrote:
> Recent Samsung header clean-up series did heavy reorganization of
> various Samsung-specific headers, unfortunately causing a conflict with
> Samsung PM consolidation series part 2 - multiplatform) and resulting
> with a merge error that caused a build failure, due to a missing header
> being included.
>
> This patch fixes this by removing incorrect header inclusion.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> ---
>   arch/arm/plat-samsung/pm-debug.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/plat-samsung/pm-debug.c b/arch/arm/plat-samsung/pm-debug.c
> index 602998b..88bb4cf 100644
> --- a/arch/arm/plat-samsung/pm-debug.c
> +++ b/arch/arm/plat-samsung/pm-debug.c
> @@ -20,7 +20,6 @@
>
>   #include<plat/cpu.h>
>   #include<plat/pm-common.h>
> -#include<plat/regs-serial.h>
>
>   #ifdef CONFIG_SAMSUNG_ATAGS
>   #include<mach/pm-core.h>

OK, applied into s2r-pm-samsung-2 branch.

Thanks,
Kukjin
