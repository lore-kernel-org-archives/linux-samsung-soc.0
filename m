From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2] clocksource: exynos_mct: fix for sleeping in atomic
 ctx handling cpu hotplug notif.
Date: Wed, 27 May 2015 14:43:46 +0200
Message-ID: <5565BC02.7010101@linaro.org>
References: <1426151496-5509-1-git-send-email-d.eppel@samsung.com> <55509013.3040901@linaro.org> <1432567470.13951.2.camel@AMDC1552.digital.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1432567470.13951.2.camel@AMDC1552.digital.local>
Sender: stable-owner@vger.kernel.org
To: d.eppel@samsung.com
Cc: tglx@linutronix.de, kgene@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, k.kozlowski@samsung.com, m.jabrzyk@samsung.com, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/25/2015 05:24 PM, Damian Eppel wrote:
> On Mon, 2015-05-11 at 13:18 +0200, Daniel Lezcano wrote:

[ ... ]

>> The code sounds very complex for what it is supposed to do.
>>
>> Perhaps I am missing something but you have more or less the same
>> functionality than the smp_twd timers and these ones don't look so c=
omplex.
>>
>> Could you please look at the smp_twd.c implementation ?
>
> Hi Daniel,
>
> exynos_mct.c driver looks more complex as it supports two types of ti=
mer
> interrupts - private and shared peripheral interrupts (for exynos4412
> and exynos4210 accordingly). In smp_twd.c driver I can see only PPI t=
ype
> of irqs supported. SPI and PPI irqs differs slightly in setup - thus =
two
> different code paths appears in the driver in initialization and
> handling of CPU notifications. The fix is addressing issue that appea=
rs
> only for hardware using SPI irqs so it is hard to compare it to
> smp_twd.c.
> BTW, If we remove support for SPI irqs in exynos_mct.c it would look
> almost the same as smp_twd.c.

Ok, thanks.

I will have a deeper look this afternoon.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
