From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH V3 0/2] Add RTC DT node to Exynos5420 SoC and Fix RTC DT
 node name for 5250 Soc
Date: Wed, 14 Aug 2013 17:37:47 +0530
Message-ID: <CAD025yRSX-8Yn1OKo7mZ_qtU057GRr=FOJ7ro-Of+2ePqoAHvA@mail.gmail.com>
References: <1376478181-27539-1-git-send-email-vikas.sajjan@linaro.org> <3054059.xbBShFpfCt@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:40978 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759580Ab3HNMIJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 08:08:09 -0400
Received: by mail-lb0-f172.google.com with SMTP id o7so6801227lbv.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 05:08:08 -0700 (PDT)
In-Reply-To: <3054059.xbBShFpfCt@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim" <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Hi Tomasz,

On 14 August 2013 17:00, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Vikas,
>
> On Wednesday 14 of August 2013 16:32:59 Vikas Sajjan wrote:
>> changes since v2:
>>       - split the 5250 related modifications into a separate patch.
>
> I'm not sure whether Kukjin's comment was about this, as it introduces a
> short bisect breakage between patch 1 and patch 2 from this series.
>
> IMHO it would be more sensible to make first patch simply fix name of the
> node and then a separate patch adding the rtc node for exynos5420.
>

Are you saying that
patch 1: should contain modifications for exynos5.dtsi and
exynos5250.dtsi   ( basically the RTC name change and status as
"okay")
patch 2: should contain modifications only for exynos5420.dtsi ( new
RTC DT node )


> Best regards,
> Tomasz
>
>>       - placed the RTC node as per the alphabetical order in the DTS file as
>>       suggested by Kukjin Kim <kgene@kernel.org>.
>>
>> changes since v1:
>>       - made DT node status as "okay" in the dtsi file itself.
>> -
>> Vikas Sajjan (2):
>>   ARM: dts: Add RTC DT node to Exynos5420 SoC
>>   ARM: dts: Fix the RTC DT node name for Exynos5250 SoC
>>
>>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>>  arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
>>  arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
>>  3 files changed, 9 insertions(+), 2 deletions(-)



-- 
Thanks and Regards
 Vikas Sajjan
