From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 09/12] ARM: EXYNOS: add support get_core_count() for
 EXYNOS5250
Date: Tue, 13 Mar 2012 23:49:37 -0700
Message-ID: <4F603F81.8040505@samsung.com>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com> <1331652643-12626-10-git-send-email-kgene.kim@samsung.com> <201203131615.49846.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:33889 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752229Ab2CNGtk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 02:49:40 -0400
Received: by yenl12 with SMTP id l12so1448690yen.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 23:49:39 -0700 (PDT)
In-Reply-To: <201203131615.49846.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, olof@lixom.net

On 03/13/12 09:15, Arnd Bergmann wrote:
> On Tuesday 13 March 2012, Kukjin Kim wrote:
>> The EXYNOS5250 has two Cortex-A15 cores and there's no
>> need to call scu_enable() in platform_smp_prepare_cpus().
>>
>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>
> Can you explain this patch more? It only seems to make the
> code less generic, but there is no indication if calling
> the scu_get_core_count() function is actually wrong on
> exynos5.
>
Contrary to Cortex-A9, Cortex-A15 has no regarding scu register so 
EXYNO5250 can not get the number of core from that like EXYNOS4 SoCs.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
