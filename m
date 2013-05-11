From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH V2 1/3] clk: samsung: register audio subsystem clocks
 using common clock framework
Date: Sat, 11 May 2013 13:42:11 +0200
Message-ID: <518E2E93.7030104@gmail.com>
References: <1367909016-19657-1-git-send-email-padma.v@samsung.com> <1367909016-19657-2-git-send-email-padma.v@samsung.com> <1730722.Al2EYiRntt@flatron> <CAAgF-BfeCZn8-_W-QxXw1QhU-Day-TEMtApiykw1mr7_aA=qTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:62264 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627Ab3EKLmR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 May 2013 07:42:17 -0400
Received: by mail-ee0-f48.google.com with SMTP id c4so2264128eek.21
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 May 2013 04:42:16 -0700 (PDT)
In-Reply-To: <CAAgF-BfeCZn8-_W-QxXw1QhU-Day-TEMtApiykw1mr7_aA=qTQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi,

On 05/11/2013 12:13 PM, Padma Venkat wrote:
>>> +CLK_OF_DECLARE(exynos4210_audss_clk, "samsung,exynos4210-audss-clock",
>>> >>  +             samsung_audss_clk_init);
>>> >>  +CLK_OF_DECLARE(exynos5250_audss_clk, "samsung,exynos5250-audss-clock",
>>> >>  +             samsung_audss_clk_init);
>> >
>> >  Also if both Exynos4210 and Exynos5250 have exactly the same audss clock
>> >  layout, there is no reason to have two compatibles for them - the
>> >  convention is that just the first model that had this hardware is enough -
>> >  in this case Exynos4210.
>> >
>> >  Having two different compatibles suggests that those two SoCs differ in a
>> >  way that needs special handling, which is misleading, based on the fact
>> >  that there is no such special handling in the driver.
>
> There is only one difference between Exynos4 and Exynos5 is bit 1 of
> CLK_GATE register where in Exynos5 it is reserved and Exynos4 it is
> gate to IntMEM. I am not sure if we use this bit some where? So is it
> okey to have same compatible with this diff?

I think such difference warrants separate compatible properties, as 
Exynos5250
seems to be not compatible with Exynos4210 in that case. Reserved bits 
should
be left untouched.

I wouldn't be surprised to see more differences we might be overlooking 
now.
IMHO it's better to be save than sorry, keeping both 'compatible' 
strings as
they are now.

Regards,
Sylwester
