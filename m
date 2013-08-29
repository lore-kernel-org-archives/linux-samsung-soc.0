From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v2 0/2] Add GPLL, APLL, KPLL, EPLL and VPLL freq table for
 exynos5420 and exynos5250
Date: Thu, 29 Aug 2013 09:24:13 +0530
Message-ID: <CAD025yRTj2buv12T_DFJ4aLB8a6g_=JN8rM84_JZTpKry_q=Qg@mail.gmail.com>
References: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org> <20130829024244.10934.6393@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:41092 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755559Ab3H2Dye (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 23:54:34 -0400
Received: by mail-lb0-f182.google.com with SMTP id r12so259252lbi.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 20:54:33 -0700 (PDT)
In-Reply-To: <20130829024244.10934.6393@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim" <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org, sunil joshi <joshi@samsung.com>

Sure, Mike.


On 29 August 2013 08:12, Mike Turquette <mturquette@linaro.org> wrote:
> Quoting Vikas Sajjan (2013-08-28 06:39:56)
>> Adds GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and exynos5250.
>>
>> changes since v1:
>>         - addressed comments from Tomasz Figa <tomasz.figa@gmail.com>
>>
>> is rebased on Mike's
>> https://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=shortlog;h=refs/heads/clk-next
>> and on top of Tomasz Figa's clk clean-up patch series
>> http://www.spinics.net/lists/arm-kernel/msg269848.html
>
> Looks good to me but it will have to wait until Tomasz's cleanup series
> is merged. I'm waiting on that get to get reviewed-by's and then I'll
> take them both in.
>
> Regards,
> Mike
>
>>
>>
>> Vikas Sajjan (2):
>>   clk: samsung: Add GPLL freq table for exynos5250 SoC
>>   clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420
>>     SoC
>>
>>  drivers/clk/samsung/clk-exynos5250.c |   19 ++++++++-
>>  drivers/clk/samsung/clk-exynos5420.c |   78 ++++++++++++++++++++++++++++++++++
>>  2 files changed, 96 insertions(+), 1 deletion(-)
>>
>> --
>> 1.7.9.5



-- 
Thanks and Regards
 Vikas Sajjan
