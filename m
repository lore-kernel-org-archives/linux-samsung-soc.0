From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 21 May 2014 13:50:06 +0530
Message-ID: <CAK9yfHxzvuPVt1pGdbt3f1i9g9mNzzL+Oa8oSRY+20xcNSMQ0A@mail.gmail.com>
References: <1400655169-21683-1-git-send-email-sachin.kamat@linaro.org>
	<1400655169-21683-3-git-send-email-sachin.kamat@linaro.org>
	<4352730.lnFJpo5XeV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:55069 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750883AbaEUIUH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 04:20:07 -0400
Received: by mail-oa0-f44.google.com with SMTP id o6so1852810oag.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 01:20:07 -0700 (PDT)
In-Reply-To: <4352730.lnFJpo5XeV@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 21 May 2014 13:46, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 21 May 2014 12:22:48 Sachin Kamat wrote:
>>  # Configuration options for the EXYNOS4
>>
>> +config ARCH_EXYNOS
>> +       bool "Samsung EXYNOS" if ARCH_MULTI_V7
>> +       select ARCH_HAS_BANDGAP
>> +       select ARCH_HAS_CPUFREQ
>> +       select ARCH_HAS_HOLES_MEMORYMODEL
>> +       select ARCH_REQUIRE_GPIOLIB
>> +       select ARM_AMBA
>> +       select ARM_GIC
>> +       select CLKSRC_OF
>> +       select COMMON_CLK_SAMSUNG
>> +       select CPU_V7
>> +       select GENERIC_CLOCKEVENTS
>> +       select HAVE_ARM_SCU if SMP
>> +       select HAVE_S3C2410_I2C if I2C
>> +       select HAVE_S3C2410_WATCHDOG if WATCHDOG
>> +       select HAVE_S3C_RTC if RTC_CLASS
>> +       select HAVE_SMP
>> +       select PINCTRL
>> +       select PINCTRL_EXYNOS
>> +       select PM_GENERIC_DOMAINS if PM_RUNTIME
>> +       select S5P_DEV_MFC
>> +       select SAMSUNG_DMADEV
>> +       select SPARSE_IRQ
>> +       select SRAM
>> +       select USE_OF
>> +       help
>> +         Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
>> +
>>
>
> A number of these can be removed now: SPARSE_IRQ, USE_OF, GENERIC_CLOCKEVENTS,
> CLKSRC_OF, CPU_V7 and HAVE_SMP are implied by ARCH_MULTIPLATFORM or ARCH_MULTI_V7,
> so we shouldn't duplicate them here.

OK.

>
> I believe SAMSUNG_DMADEV cannot work in multiplatform, but we also don't need
> it any more.

Yes this is no longer needed now that we use generic DMA engine. Will
remove this too.
Thanks for the review.

-- 
With warm regards,
Sachin
