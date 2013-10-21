From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v2 0/2] Add GPLL, APLL, KPLL, EPLL and VPLL freq table for
 exynos5420 and exynos5250
Date: Mon, 21 Oct 2013 18:55:52 +0530
Message-ID: <CAGm_ybi_y84kCS_wE1a5_d=h1SnrN5zF3UVvkoYRdw4NOyfoNA@mail.gmail.com>
References: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
	<20130829024244.10934.6393@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:32920 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752779Ab3JUNZy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Oct 2013 09:25:54 -0400
Received: by mail-wi0-f180.google.com with SMTP id ey11so3975527wid.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2013 06:25:53 -0700 (PDT)
In-Reply-To: <20130829024244.10934.6393@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, patches@linaro.org, linaro-kernel@lists.linaro.org, sunil joshi <joshi@samsung.com>

Hi Mike,

On Thu, Aug 29, 2013 at 8:12 AM, Mike Turquette <mturquette@linaro.org> wrote:
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

Can you apply these patches.


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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
