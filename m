From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 4/4] ARM: defconfig: Exynos for v4.9
Date: Fri, 02 Sep 2016 17:47:11 +0200
Message-ID: <4575445.BeuOIIGatt@wuerfel>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com> <1472548739-20050-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:56794 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932236AbcIBPr2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 11:47:28 -0400
In-Reply-To: <1472548739-20050-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

On Tuesday, August 30, 2016 11:18:56 AM CEST Krzysztof Kozlowski wrote:
> Expected conflict in multi_v7 - take all the changes:
> 
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@@ -135,8 -136,7 +136,8 @@@ CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=
>   CONFIG_CPU_FREQ_GOV_POWERSAVE=m
>   CONFIG_CPU_FREQ_GOV_USERSPACE=m
>   CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
> - CONFIG_CPU_FREQ_GOV_SCHEDUTIL=m
> + CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
>  +CONFIG_ARM_IMX6Q_CPUFREQ=y
>   CONFIG_QORIQ_CPUFREQ=y
>   CONFIG_CPU_IDLE=y
>   CONFIG_ARM_CPUIDLE=y
> 
> 

I pulled this into next/defconfig, but didn't see the conflict,
presumably I'll get it after merging the other branches?

	Arnd
