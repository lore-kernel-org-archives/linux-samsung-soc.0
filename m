From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2] clocksource: exynos-mct: Register the timer for stable
 udelay
Date: Thu, 19 Jun 2014 18:17:12 +0200
Message-ID: <53A30D08.6070107@gmail.com>
References: <1403167145-5267-1-git-send-email-amit.daniel@samsung.com>	<53A2B9C3.1050906@gmail.com> <CAD=FV=VmC-p4_R1GV3U3bg1JojTzNYKyFTa8o8QMJ=3m=WuRYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:53098 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757567AbaFSQRe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 12:17:34 -0400
In-Reply-To: <CAD=FV=VmC-p4_R1GV3U3bg1JojTzNYKyFTa8o8QMJ=3m=WuRYA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Riley <davidriley@chromium.org>

On 19.06.2014 18:01, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jun 19, 2014 at 3:21 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>> +static struct delay_timer exynos4_delay_timer;
>>> +
>>> +static unsigned long exynos4_read_current_timer(void)
> 
> Note: I think this should return a cycles_t, not an unsigned long.
> They're the same (right now), but probably shouldn't be (see below).
> 
> 
>>> +{
>>> +#ifdef ARM
>>> +     return __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_L);
>>> +#else /* ARM64, etc */
>>> +     return exynos4_frc_read(&mct_frc);
>>> +#endif
>>> +}
>>> +
>>
>> No need for anything like this. Even if running on ARM64, the delay
>> timer code should be able to cope with different timer widths. For
>> delays, 32 bits are enough, so just always read the lower part.
> 
> I agree that the timer code should cope but it doesn't appear to.  I see:
> 
>   cycles_t start = get_cycles();
>   while ((get_cycles() - start) < cycles)
>     cpu_relax();
> 
> Right now cycles_t is defined as "unsigned long".  If that's 64-bits
> on ARM64 then this function will have problems with wraparound.

Well, first of all, I'm not sure why we're discussing ARM64 here, if it
doesn't have support for register_current_timer_delay() at all.
Moreover, the only user if it is ARM32 and, if I remember correctly, the
assumption was that you need a >= 32 bit timer to use it for delays and
so with 32 bit unsigned long everything should work. Now if ARM64 also
wants to use this infrastructure, instead of hacking drivers now and
encouraging ARM64 people to continue using this kind of hackery, I
believe we should indicate that ARM64 delay timer code needs to be
implemented correctly and cope for different timer widths.

Of course the best way would be to redesign this interface right now to
consider time width (it is not just about 32 or 64 bits, there are
various timers, possibly 48- or 52-bit) and change ARM32 implementation
of it as well, if there are any volunteers. Changing the code to always
use 32-bit type regardless of arch is also an option.

> 
> My personal vote would be to submit a patch to change "cycles_t" to
> always be 32-bits.  Given that 32-bits was fine for udelay() for ARM
> that seems sane and simple.  If someone later comes up with a super
> compelling reason why we need 64-bit timers for udelay (really??) then
> they can later add all the complexity needed.

Yes, this could work. I'm not sure what else cycles_t is used for, though.

> 
> Amit: can you code up such a patch and add it to the series?  I know
> it changes code that touches all ARM devices but I still think it's
> the right thing to do and actually only really changes behavior on
> ARM64.
> 
> 
>> Also use of raw accessors in drivers is discouraged - please use
>> readl_relaxed().
> 
> It doesn't seem like that should happen in the same patch.  Perhaps
> Amit can do a cleanup patch first that changes all instances of
> __raw_readl / __raw_writel in this file, then submit his patch atop
> that.

Why not? The patch adding exynos4_read_current_timer() (and so the call
to __raw_readl() was Amit's patch. I'm not asking to fix this in the
whole driver, just to do things correctly in new code.

> 
> 
>> Btw. I don't even see support for this on ARM64 in mainline, where arch
>> timer is always used for delays and AFAIK this is a platform requirement.
> 
> Yeah, I'd vote for not using MCT on ARM64, but it I suppose it doesn't
> hurt to keep it working.
> 

Right now there is no need for this, so let's just keep things simple.

Best regards,
Tomasz
