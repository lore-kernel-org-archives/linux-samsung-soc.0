From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH] ARM: exynos_defconfig: disable CONFIG_EXYNOS5420_MCPM;
 not stable
Date: Wed, 26 Nov 2014 13:41:20 -0500 (EST)
Message-ID: <alpine.LFD.2.11.1411261314310.11690@knanqh.ubzr>
References: <1414796382-5447-1-git-send-email-khilman@kernel.org> <000e01cffb39$5ef0a2d0$1cd1e870$@kernel.org> <7hegtaq26c.fsf@deeprootsystems.com> <CAMAWPa-mLAFL7v8hHA5R-eBzpMFK-E-xcvjoV8Bn6tTwgP53Uw@mail.gmail.com> <CAOesGMhvTDN4J6AdUDHKV0Sp4NT6a4QEMUDWOayQqhhD+C4acw@mail.gmail.com>
 <CAMAWPa-sz5jT9izEONVZR2Z4mzuivKaNHSgyR+eP13tWZ84hYw@mail.gmail.com> <CAOesGMgSkJ8xkBgN7OpuDzT=ehaAd6kvbx5_tC50x78pvpkTwg@mail.gmail.com> <CAOesGMh-7md4PdQX1Wvk0jO+87j+fxSvBnVD_osjNd2zQ4L43w@mail.gmail.com> <044101d00852$3f421420$bdc63c60$@kernel.org>
 <CAMAWPa-qk0DEmPNz5LZgJq9AuGhRxuY00XwxtEikt_vh-iozVg@mail.gmail.com> <CAM4voa==Ram0xXTL=SnKktyRt7VFphQxBJgcf9Yi9Zio0QctHw@mail.gmail.com> <7hvbm2ixmo.fsf@deeprootsystems.com> <CAM4voa=budowQ+vnCAQhWj95Hx+yBnRAaDrFrjkQa2ubjrRwUQ@mail.gmail.com>
 <7hmw7dg81l.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:57991 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbaKZSlY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 13:41:24 -0500
Received: by mail-qg0-f46.google.com with SMTP id z107so2443619qgd.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2014 10:41:23 -0800 (PST)
In-Reply-To: <7hmw7dg81l.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Doug Anderson <dianders@chromium.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, 26 Nov 2014, Kevin Hilman wrote:

> Abhilash Kesavan <kesavan.abhilash@gmail.com> writes:
> 
> > Hi Kevin,
> >
> > On Wed, Nov 26, 2014 at 6:30 AM, Kevin Hilman <khilman@kernel.org> wrote:
> >> [...]
> >>
> >> More specifically, with only the loopback call to turn off CCI commented
> >> out, the imprecise aborts go away.
> >
> > I can't see how enabling snoops for the boot cluster is causing these
> > aborts. Perhaps as Krzysztof commented it has something to do with the
> > secure firmware/tz software on these boards ? Other than there does
> > not appear to be any difference between the working/non-working
> > setups.
> 
> Perhaps the secure firmware is preventing the CCI to be enabled by the
> kernel, and that is causing the imprecise abort?

That is well possible.

Now...... if the bootloader/firmware does not let Linux deal with both 
the CCI and caches then MCPM simply has no more purpose for this board.  
The whole point of MCPM is actually to handle the CCI properly and the 
most efficient way despite all the possible races and opportunities for 
memory corruptions. And yes, this is a complex task.

So there is actually two choices: the firmware let Linux take care of it 
via the MCPM layer (easy), or the firmware has to implement it all 
_properly_ (hard) behind an interface such as PSCI, at which point MCPM 
should be configured out.

If the firmware does not let Linux interact with the CCI _and_ does not 
implement full MCPM-like services then the platform is broken and only a 
firmware upgrade could fix that.  It might still be possible to boot all 
CPUs through other means, but power management would then be severely 
limited.


Nicolas
