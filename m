From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 05/12] ARM: EXYNOS: add support uart for EXYNOS4 and
 EXYNOS5
Date: Wed, 14 Mar 2012 00:06:26 -0700
Message-ID: <4F604372.3040507@samsung.com>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com> <1331652643-12626-6-git-send-email-kgene.kim@samsung.com> <201203131613.10620.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:50799 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752229Ab2CNHGd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 03:06:33 -0400
Received: by yhmm54 with SMTP id m54so1447956yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 00:06:33 -0700 (PDT)
In-Reply-To: <201203131613.10620.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, olof@lixom.net

On 03/13/12 09:13, Arnd Bergmann wrote:
> On Tuesday 13 March 2012, Kukjin Kim wrote:
>> Actually, the base address of uart is different between EXYNOS4
>> and EXYNOS5 and this patch enables to support uart for EXYNOS4
>> and EXYNOS5 SoCs at runtime.
>
> Can you explain why this patch is still needed? The exynos5250_dt_map_io
> function does not call s3c24xx_init_uarts() at all, so it seems that most
> of this patch just adds dead code that would only be needed for the non-dt
> case.
>
Yes, as you said, dt can support uart without most of this changes so we 
can drop adding/setup platform devices for uart here. But I thought 
non-dt exynos4 supporting is still available in mach-exynos/ and 
actually it is used for many product now and exynos5 can be selected for 
single zImage without CONFIG_OF. Even though we will move to only 
supporting dt world in mach-exynos/ for all of EXYNOS SoCs in the near 
future. So would be removed it when non-dt exynos4 does not support.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
