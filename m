From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V2 17/17] ARM: exynos: config: Enable cpuidle
Date: Mon, 7 Apr 2014 09:28:39 -0700
Message-ID: <CAOesGMgkbfUX=cJ4rMf+-26Sq_fYUNW8m6unNiCXHKwj83dLbw@mail.gmail.com>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
	<1396618989-2897-18-git-send-email-daniel.lezcano@linaro.org>
	<5825506.2ErDt1UQ5r@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f49.google.com ([209.85.216.49]:43329 "EHLO
	mail-qa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162AbaDGQ2k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 12:28:40 -0400
Received: by mail-qa0-f49.google.com with SMTP id j7so6003537qaq.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2014 09:28:39 -0700 (PDT)
In-Reply-To: <5825506.2ErDt1UQ5r@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Fri, Apr 4, 2014 at 9:09 AM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:

[...]
>   I know that this is mainly our problem but the issue is widespread on
>   our targets and I believe that adding some workaround for it in cpuidle
>   core would be beneficial for the whole cpuidle subsystem.

Yes, we need to find a way forward without you guys holding the whole
platform hostage with out-of-tree code (here and in general, since I
think there are more areas in which this applies).

>  Namely there
>   should be some way of telling cpuidle subsystem to either disable
>   particular state(s) or limit the max available state.  I think that this
>   can be also useful for testing and development of other cpuidle drivers.
>
> For now please change this patch to add CONFIG_CPU_IDLE=n instead (since
> the config option is "default y" it will be auto-enabled if there is no
> entry in the defconfig)..

Can the code be refactored such that even if CPU_IDLE is on, it won't
actually do anything useful on the platforms that have problems above?
I.e. determined at runtime, not build time?


(I have not yet looked at the rest of the series).


-Olof
