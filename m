From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH 0/2] Add GPLL, APLL, KPLL, EPLL and VPLL freq table for
 exynos5420 and exynos5250
Date: Thu, 22 Aug 2013 12:30:20 +0530
Message-ID: <CAGm_ybg9GGpmXfD4qMC76aLwVpUhC=t6whtZA33KjVz2+63g1w@mail.gmail.com>
References: <1376301734-21847-1-git-send-email-vikas.sajjan@linaro.org>
	<CAGm_ybjdmO3Oisco7eYbQ3=bLjsAi7A4mt8R53tqM=z96m0QjA@mail.gmail.com>
	<6501649.Hcij7zmiRh@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:54556 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753608Ab3HVHAV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 03:00:21 -0400
Received: by mail-wi0-f178.google.com with SMTP id j17so238952wiw.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 00:00:20 -0700 (PDT)
In-Reply-To: <6501649.Hcij7zmiRh@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, patches@linaro.org, linaro-kernel@lists.linaro.org, Tomasz Figa <t.figa@samsung.com>

Hi Mike,

On Wed, Aug 14, 2013 at 9:07 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Vikas,
>
> On Wednesday 14 of August 2013 10:36:53 Vikas Sajjan wrote:
>> Hi Mike,
>>
>> On Mon, Aug 12, 2013 at 3:32 PM, Vikas Sajjan <vikas.sajjan@linaro.org>
> wrote:
>> > Adds GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and
>> > exynos5250.
>> >
>> > is rebased on Mike's
>> > https://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=shortlog;
>> > h=refs/heads/clk-next>
>> > Vikas Sajjan (2):
>> >   clk: samsung: Add GPLL freq table for exynos5250 SoC
>> >   clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420
>> >
>> >     SoC
>> >
>> >  drivers/clk/samsung/clk-exynos5250.c |   19 +++++++-
>> >  drivers/clk/samsung/clk-exynos5420.c |   81
>> >  ++++++++++++++++++++++++++++++++++ 2 files changed, 99 insertions(+),
>> >  1 deletion(-)
>>
>> Can you apply this patchset.
>
> Please give few more days for the patch to be reviewed by people.
>
> A reasonable period of time which should pass after submitting a patch to
> ping the maintainers is around a week. This allows people to find some time
> to read your patches and share their opinions (and/or give their reviewed-
> by/acked-by tags).
>

any comments on this.


> Best regards,
> Tomasz
