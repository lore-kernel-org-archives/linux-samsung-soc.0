From: Kukjin Kim <kgene.kim@gmail.com>
Subject: Re: [GIT PULL 1/3] ARM: soc: exynos: Drivers for v4.9
Date: Tue, 11 Oct 2016 09:46:49 +0900
Message-ID: <50A42280-0A39-44E3-8E35-C24031EB4DF0@gmail.com>
References: <1474216788-17282-1-git-send-email-krzk@kernel.org> <1474216788-17282-2-git-send-email-krzk@kernel.org> <2663426.T8oUku18qe@wuerfel> <20160919155302.GA4447@kozik-book> <CAOesGMgSu=bfVwWYkEG0+eDKBxh_zqSM0uxFAq3Y3X-O0vLGKQ@mail.gmail.com> <20161003074825.GA2724@kozik-lap> <53745281-AF17-4A3A-8BB5-63EED3563298@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53745281-AF17-4A3A-8BB5-63EED3563298@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

2016. 10. 3. 21:19 Kukjin Kim <kgene.kim@gmail.com> wrote:

+ my samsung email

> 2016. 10. 3. 15:48 Krzysztof Kozlowski <krzk@kernel.org> wrote:
>=20
>>>> On Sun, Oct 02, 2016 at 05:25:07PM -0700, Olof Johansson wrote:
>>>>> On Mon, Sep 19, 2016 at 8:53 AM, Krzysztof Kozlowski <krzk@kernel.org>=
 wrote:
>>>>>> On Mon, Sep 19, 2016 at 05:02:40PM +0200, Arnd Bergmann wrote:
>>>>>> On Sunday, September 18, 2016 6:39:46 PM CEST Krzysztof Kozlowski wro=
te:
>>>>>> Samsung drivers/soc update for v4.9:
>>>>>> 1. Allow compile testing of exynos-mct clocksource driver on ARM64.
>>>>>> 2. Document Exynos5433 PMU compatible (already used by clkout driver a=
nd more
>>>>>>  will be coming soon).
>>>>>=20
>>>>> Pulled into next/drivers, thanks
>>>>>=20
>>>>> Just for my understanding: why do we need the exynos-mct driver on ARM=
64
>>>>> but not the delay-timer portion of it?
>>>>=20
>>>> I think we want all of it but Doug's optimization 3252a646aa2c
>>>> ("clocksource: exynos_mct: Only use 32-bits where possible") is not
>>>> ARM64 friendly. One way of dealing with it would be to prepare two
>>>> versions of exynos4_read_current_timer(). One reading only lower 32-bit=

>>>> value for ARMv7 and second (slow) reading lower and upper for ARMv8.
>>>>=20
>>>>>=20
>>>>> Is there an advantage in using MCT over the architected timer on these=

>>>>> chips? If so, should we also have a way to use it as the delay timer?
>>>>=20
>>>> No, there is no real advantage... except that the SoC has some
>>>> interesting "characteristics"... The timers are tightly coupled. Very
>>>> tightly. I spent a lot of time and failed to boot my ARMv8 board withou=
t
>>>> some MCT magic.
>>>=20
>>> What kind of magic is that?
>>=20
>> Most notably: the arch timer starts when MCT forward running counter
>> starts. Without kicking MCT, the arch timer seems to be frozen.
>>=20
>>> I can understand that needing the MCT for
>>> some system-level timer functionality might be true (wakeups, etc),
>>> but for system timesource avoiding the MMIO timer and using the arch
>>> ones is a substantial performance improvement for gettimeofday() and
>>> friends.
>>>=20
>>> There was extensive discussion last year over using arch timers on
>>> 5420/5422, and it fizzled out with vague comments about something not
>>> working right between A15/A7 on b.L. hardware. I'm presuming whatever
>>> implementation details of that SoC has since been fixed on later chips
>>> (including v8). Any chance you can confirm? It'd be very nice to leave
>>> MCT behind on v8 as a system time source.
>>=20
>> Unfortunately, I cannot confirm this, at least on Exynos5433 (ARMv8). I
>> played with arch and MCT timers on it and failed to get the
>> arch-timer-only setup working. I did not have access to newer Exynos
>> designs (Exynos 7) so I do not know how it works there.
>=20
> Hi guys,
>=20
> I know what Olof want to know and actually several days ago someone asked m=
e about that. As you guys talked, a couple of years ago there were some disc=
ussions...BTW I need to contact to hardware designer before let you guys kno=
w because something needs to be confirmed by them even I know roughly.
>=20
> Note I'm in vacation with my family. Will be back on this in several days w=
ith exact information.
>=20
> BRs,
> Kukjin
