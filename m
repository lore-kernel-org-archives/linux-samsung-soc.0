From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v5 7/7] clk: samsung: Add EPLL and VPLL freq table for
 exynos5250 SoC
Date: Tue, 18 Jun 2013 12:40:39 +0530
Message-ID: <CAD025yQ3MnPyVmDCCdGNsvkCPeGRLyAuf7KNgxfKc9JL08qXDw@mail.gmail.com>
References: <1370712862-10501-1-git-send-email-yadi.brar@samsung.com>
 <1370712862-10501-8-git-send-email-yadi.brar@samsung.com> <CAL1qeaHSmMajbuChS6BLzW=jQWBF7Dse8pvSLGsZibzCUdx_hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:49316 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470Ab3FRHLB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 03:11:01 -0400
Received: by mail-lb0-f180.google.com with SMTP id o10so3228011lbi.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 00:11:00 -0700 (PDT)
In-Reply-To: <CAL1qeaHSmMajbuChS6BLzW=jQWBF7Dse8pvSLGsZibzCUdx_hQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Yadwinder Singh Brar <yadi.brar@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Hi Andrew,

On 18 June 2013 01:38, Andrew Bresticker <abrestic@chromium.org> wrote:
>> +static __initdata struct samsung_pll_rate_table epll_24mhz_tbl[] = {
>> +       /* sorted in descending order */
>> +       /* PLL_36XX_RATE(rate, m, p, s, k) */
>> +       PLL_36XX_RATE(192000000, 48, 3, 1, 0),
>> +       PLL_36XX_RATE(180633600, 45, 3, 1, 10381),
>> +       PLL_36XX_RATE(180000000, 45, 3, 1, 0),
>> +       PLL_36XX_RATE(73728000, 73, 3, 3, 47710),
>> +       PLL_36XX_RATE(67737600, 90, 4, 3, 20762),
>> +       PLL_36XX_RATE(49152000, 49, 3, 3, 9962),
>> +       PLL_36XX_RATE(45158400, 45, 3, 3, 10381),
>> +       PLL_36XX_RATE(32768000, 131, 3, 5, 4719),
>> +       { },
>> +};
>
> I believe the UM says that 64 <= m <= 511.  Although the above seems
> to work on 5250 and 5420, it might be better to use a table that
> conforms to the constraint on m:
>

OK, will test with the below table and resend.


> PLL_36XX_RATE(192000000, 64, 2, 2, 0),
> PLL_36XX_RATE(180633600, 90, 3, 2, 20762),
> PLL_36XX_RATE(180000000, 90, 3, 2, 0),
> PLL_36XX_RATE(73728000, 98, 2, 4, 19923),
> PLL_36XX_RATE(67737600, 90, 2, 4, 20762),
> PLL_36XX_RATE(49152000, 98, 3, 4, 19923),
> PLL_36XX_RATE(45158400, 90, 3, 4, 20762),
> PLL_36XX_RATE(32768000, 131, 3, 5, 4719)
>
> Thanks,
> Andrew



--
Thanks and Regards
 Vikas Sajjan
