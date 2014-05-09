From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: Initialise Samsung High Speed I2C
 controller early
Date: Fri, 9 May 2014 20:12:47 +0530
Message-ID: <CAHfPSqDSTyQXPT-NCZ2hE01qpdmaR54tbWCUYC_zSDGFp58+7g@mail.gmail.com>
References: <1398350916-885-1-git-send-email-ch.naveen@samsung.com>
 <20140424162558.GB12304@sirena.org.uk> <CAHfPSqB5+mLiC07jbEpeUgW63pZVk700SkYGxToO7GRAsFm_nQ@mail.gmail.com>
 <20140509135153.GM12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140509135153.GM12304-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Mark,

On 9 May 2014 19:21, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, May 09, 2014 at 05:50:00PM +0530, Naveen Krishna Ch wrote:
>> On 24 April 2014 21:55, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> >> Such solution has been proposed by Mark Brown to fix the problem of
>> >> the regulators not beeing available on the peripheral device probe():
>> >> http://lists.infradead.org/pipermail/linux-arm-kernel/2010-March/011971.html
>
>> > What specifically is this needed for?  We *should* be able to use
>> > deferred probe for most things, but I know that not all subsystems are
>> > able to yet.
>
>> DRM related drivers like DP, FIMD, HDMI, Mixer wants to be probed ASAP
>> during the boot.
>> The real problem comes when, one of these drivers do a regulator_get().
>
>> If the physical supply  is not enabled/hookedup the regulator_get() call
>> assumes that physical supply is present and returns a
>> "dummy_regulator" (But, not an error).
>
>> Because of which, Display and several other devices fails to work.
>
> These drivers are buggy, if they geniunely expect and handle a missing
> supply then they should be using regulator_get_optional() to request the
> regulator and even if they don't the use of subsys_initcall() is not
> going to fix anything here - if a dummy regulator is going to be
> returned the time things are probed won't make a difference.
We have a situation where.a PMIC is sitting under I2C_TUNNEL
with I2C, SPI and SPI uses DMA.

PMIC --- I2C_TUNNEL ---- I2C/SPI ---- DMA

This PMIC is setting some FETS required for Backlight, LCD and G3D modules.

If all the I2C, SPI, DMA, I2C_TUNNEL, DRM based LCD are all mod_probes()
DRM drivers are probing a head of the PMIC probe. Which is causing the
display drivers to get "dummy_regulators" instead of the real supplies.

We couldn't implement -PROBE_DEFER because, the probes are not failing.

Should we should check if the return value of regulator_get() is a
"dummy_regulator"
and then defer the probe /.

>
>> I2C, I2C_TUNNEL, SPI and DMA drivers are required as subsys_initcall()
>> for similar reason.
>
> What makes you say this?  Typically those drivers don't use regulators
> at all.
I mean I2C, I2C_TUNNEL, SPI and DMA drivers have be to subsys_initcall()
to get the PMIC up intime. so, that the system would use the real supplies.

This looks like a board specific solution. I guess, this is quite
frequent with the
buses like I2C, SPI.

Kindly, suggest a nicer way. Thanks



-- 
Shine bright,
(: Nav :)
