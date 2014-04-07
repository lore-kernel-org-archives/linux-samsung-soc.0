From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH V2 17/17] ARM: exynos: config: Enable cpuidle
Date: Mon, 07 Apr 2014 19:44:45 +0200
Message-ID: <3344539.A0GIVp3yPt@amdc1032>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
 <5825506.2ErDt1UQ5r@amdc1032>
 <CAOesGMgkbfUX=cJ4rMf+-26Sq_fYUNW8m6unNiCXHKwj83dLbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60690 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752718AbaDGRou (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 13:44:50 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3O004CH9AOHH50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Apr 2014 02:44:48 +0900 (KST)
In-reply-to: <CAOesGMgkbfUX=cJ4rMf+-26Sq_fYUNW8m6unNiCXHKwj83dLbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>


Hi,

On Monday, April 07, 2014 09:28:39 AM Olof Johansson wrote:
> On Fri, Apr 4, 2014 at 9:09 AM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> 
> [...]
> >   I know that this is mainly our problem but the issue is widespread on
> >   our targets and I believe that adding some workaround for it in cpuidle
> >   core would be beneficial for the whole cpuidle subsystem.

On the second look at the cpuidle code there is a "cpuidle.off" kernel
parameter which should be sufficient to workaround this particular issue
for now.

> Yes, we need to find a way forward without you guys holding the whole
> platform hostage with out-of-tree code (here and in general, since I
> think there are more areas in which this applies).

Please explain this more because I really don't know what you're meaning
here (at least in case of SRPOL I feel that there are no such issues).

In this particular case we have a problem with a modified uboot bootloader
versions being broken and incompatible with the advanced AFTR cpuidle mode.
This is not the only / main issue preventing AFTR mode and thus EXYNOS
cpuidle driver from being used by default so I really think that the your
comment was unfair.

> >  Namely there
> >   should be some way of telling cpuidle subsystem to either disable
> >   particular state(s) or limit the max available state.  I think that this
> >   can be also useful for testing and development of other cpuidle drivers.
> >
> > For now please change this patch to add CONFIG_CPU_IDLE=n instead (since
> > the config option is "default y" it will be auto-enabled if there is no
> > entry in the defconfig)..
> 
> Can the code be refactored such that even if CPU_IDLE is on, it won't
> actually do anything useful on the platforms that have problems above?
> I.e. determined at runtime, not build time?

We can disable AFTR mode by default on EXYNOS4x12 SoCs with secure mode
enabled and EXYNOS5420 SoCs (I would like somebody with the hardware to
verify that AFTR mode is not working first so we have 100% certainty
that we don't regress here).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
