From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V2 16/17] ARM: exynos: cpuidle: Move the driver to drivers/cpuidle
 directory
Date: Mon, 07 Apr 2014 13:53:56 +0200
Message-ID: <534291D4.1010803@linaro.org>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>	<1396618989-2897-17-git-send-email-daniel.lezcano@linaro.org> <CAK9yfHzXk6ErtmNuT0Z-kMfUGT=GMmFugPR8J=-3SvPMagp6ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:49589 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754636AbaDGLxk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 07:53:40 -0400
Received: by mail-we0-f173.google.com with SMTP id w61so6559726wes.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2014 04:53:39 -0700 (PDT)
In-Reply-To: <CAK9yfHzXk6ErtmNuT0Z-kMfUGT=GMmFugPR8J=-3SvPMagp6ZA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On 04/07/2014 11:51 AM, Sachin Kamat wrote:
> Hi Daniel,
>
> On 4 April 2014 19:13, Daniel Lezcano <daniel.lezcano@linaro.org> wro=
te:
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>>   arch/arm/mach-exynos/Makefile                      |    1 -
>>   drivers/cpuidle/Kconfig.arm                        |    7 +++++++
>>   drivers/cpuidle/Makefile                           |    1 +
>>   .../cpuidle.c =3D> drivers/cpuidle/cpuidle-exynos.c  |    0
>>   4 files changed, 8 insertions(+), 1 deletion(-)
>>   rename arch/arm/mach-exynos/cpuidle.c =3D> drivers/cpuidle/cpuidle=
-exynos.c (100%)
>
> This driver now references platform header file (plat/cpu.h) for some
> Exynos5440 specific check
> which is not good considering multiplatform support. Any plan to get
> rid of this?

Yes. Prevent to register the platform device for this board and remove=20
these lines in the driver.

What is the benefit of having a single state WFI cpuidle driver ? That=20
pulls all the governor computation and decision for nothing.



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
