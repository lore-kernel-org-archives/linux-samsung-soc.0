From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: Initialise Samsung High Speed I2C
 controller early
Date: Fri, 9 May 2014 17:50:00 +0530
Message-ID: <CAHfPSqB5+mLiC07jbEpeUgW63pZVk700SkYGxToO7GRAsFm_nQ@mail.gmail.com>
References: <1398350916-885-1-git-send-email-ch.naveen@samsung.com> <20140424162558.GB12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140424162558.GB12304-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Mark,

On 24 April 2014 21:55, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Apr 24, 2014 at 08:18:36PM +0530, Naveen Krishna Chatradhi wrote:
>> This patch moves initialization code to subsys_initcall() to ensure
>> that the i2c bus is available early so the regulators can be quickly
>> probed and available for other devices on their probe() call.
>
>> Such solution has been proposed by Mark Brown to fix the problem of
>> the regulators not beeing available on the peripheral device probe():
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2010-March/011971.html
>
> What specifically is this needed for?  We *should* be able to use
> deferred probe for most things, but I know that not all subsystems are
> able to yet.
DRM related drivers like DP, FIMD, HDMI, Mixer wants to be probed ASAP
during the boot.
The real problem comes when, one of these drivers do a regulator_get().

If the physical supply  is not enabled/hookedup the regulator_get() call
assumes that physical supply is present and returns a
"dummy_regulator" (But, not an error).

Because of which, Display and several other devices fails to work.

I2C, I2C_TUNNEL, SPI and DMA drivers are required as subsys_initcall()
for similar reason.

-- 
Shine bright,
(: Nav :)
