From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v6 0/3] Add RTC DT node to Exynos5420 SoC and Fix RTC DT
 node name for Exynos5250
Date: Fri, 23 Aug 2013 08:19:25 +0530
Message-ID: <CAGm_ybgdC8B==GpCiDwnmWzV+L5hDFWr0ZP3tMq2MHWp-p9E1w@mail.gmail.com>
References: <1377176343-24859-1-git-send-email-vikas.sajjan@linaro.org>
	<2046167.RNzj0dOWkj@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:54146 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753486Ab3HWCt0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 22:49:26 -0400
In-Reply-To: <2046167.RNzj0dOWkj@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, Tomasz Figa <t.figa@samsung.com>

Hi Kukjin,

On Thu, Aug 22, 2013 at 6:37 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Vikas,
>
> On Thursday 22 of August 2013 18:29:00 Vikas Sajjan wrote:
>> This patchset does the following 3 things:
>>  1) Fixes the RTC DT node name for Exynos5250
>>  2) Update the "status" property of RTC DT node for Exynos5250 SoC
>>  3) Adds RTC DT node to Exynos5420 SoC
>>
>> changes since v5:
>>       - Fixed the RTC DT node name for Exynos5250 board files also,
>>       because otherwise it breaks RTC support in bisections.
>>
>> changes since v4:
>>       - removed "status" property of RTC DT node from exynos5250 board dts
>> files
>>
>> changes since v3:
>>       - split the 5250 related modifications into 2 separate patch as
>>       suggested by Tomasz Figa <t.figa@samsung.com>
>>
>> changes since v2:
>>       - split the 5250 related modifications into a separate patch.
>>       - placed the RTC node as per the alphabetical order in the DTS file as
>>       suggested by Kukjin Kim <kgene@kernel.org>.
>>
>> changes since v1:
>>       - made DT node status as "okay" in the dtsi file itself.
>>
>> Vikas Sajjan (3):
>>   ARM: dts: Fix the RTC DT node name for Exynos5250
>>   ARM: dts: Update the "status" property of RTC DT node for Exynos5250
>>     SoC
>>   ARM: dts: Add RTC DT node to Exynos5420 SoC
>>
>>  arch/arm/boot/dts/exynos5.dtsi           |    2 +-
>>  arch/arm/boot/dts/exynos5250-arndale.dts |    4 ----
>>  arch/arm/boot/dts/exynos5250-snow.dts    |    4 ----
>>  arch/arm/boot/dts/exynos5250.dtsi        |    3 ++-
>>  arch/arm/boot/dts/exynos5420.dtsi        |    6 ++++++
>>  5 files changed, 9 insertions(+), 10 deletions(-)
>
> Looks good to me now.
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>


Can you apply this patchset.

>
> Best regards,
> Tomasz
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
