From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v8 1/3] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Wed, 16 Apr 2014 13:38:14 +0530
Message-ID: <CAK9yfHztqGWhUJ=PNc7L-epu48PkEM6=v6JFDZ1n52NBeOUB8w@mail.gmail.com>
References: <1397620738-14431-1-git-send-email-rahul.sharma@samsung.com>
	<1397620738-14431-2-git-send-email-rahul.sharma@samsung.com>
	<534E3803.5010404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:46778 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754511AbaDPIIP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 04:08:15 -0400
Received: by mail-oa0-f41.google.com with SMTP id j17so12077133oag.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2014 01:08:14 -0700 (PDT)
In-Reply-To: <534E3803.5010404@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

Hi Tomasz,

On 16 April 2014 13:27, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
>
> On 16.04.2014 05:58, Rahul Sharma wrote:
>>
>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>
>> This patch add basic arch side support for exynos5260 SoC.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> ---
>>   arch/arm/mach-exynos/Kconfig |    5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index fc8bf18..bf4ed87 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -84,6 +84,11 @@ config SOC_EXYNOS5250
>>         help
>>           Enable EXYNOS5250 SoC support
>>
>> +config SOC_EXYNOS5260
>> +       bool "SAMSUNG EXYNOS5260"
>> +       default y
>> +       depends on ARCH_EXYNOS5
>> +
>>   config SOC_EXYNOS5420
>>         bool "SAMSUNG EXYNOS5420"
>>         default y
>>
>
> Is this patch necessary now? After Sachin's consolidation series there are
> no per SoC entries anymore.

Kukjin still wanted individual SoCs to be selectable. Please refer [1].

[1] http://www.spinics.net/lists/devicetree/msg27040.html

-- 
With warm regards,
Sachin
