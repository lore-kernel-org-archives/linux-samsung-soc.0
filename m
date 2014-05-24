From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: exynos4412: powerdomain issues with HDMI PHY and VP
Date: Sat, 24 May 2014 23:24:29 +0200
Message-ID: <53810E0D.5010802@gmail.com>
References: <538104FF.7070601@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:61913 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751238AbaEXVYf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 May 2014 17:24:35 -0400
Received: by mail-we0-f169.google.com with SMTP id u56so6451557wes.14
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2014 14:24:33 -0700 (PDT)
In-Reply-To: <538104FF.7070601@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, arun.kk@samsung.com, Tomasz Stanislawski <t.stanislaws@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Tobias,

First of all, big thanks for investigating this issue. Hopefully we can
have it fixed in upstream soon.

I've added Tomasz Stanislawski to CC list, as he's been doing some work
to enable HDMI support on Exynos4 using Exynos DRM.

On 24.05.2014 22:45, Tobias Jakobi wrote:
> Hello,
> 
> I'm still working on getting HDMI output on my ODROID-X2 board (based on
> Exynos4412 Prime) working. My tree is a 3.15-rc6 with some patches on
> top to get it boot on the board.
> 
> You can find the tree here:
> https://github.com/tobiasjakobi/linux-odroid/commits/odroid-3.15.y
> 
> Here is the DTS:
> https://github.com/tobiasjakobi/linux-odroid/blob/odroid-3.15.y/arch/arm/boot/dts/exynos4412-odroidx2.dts
> 
> I encountered two issues with powerdomains. On related to HDMI PHY and
> the other one related to the VP (video processor).
> 
> The pd the mixer is in, is currently set to pd_tv. I can't seem to
> specify multiple powerdomains for one device. However the PHY seems to
> need both TV and LCD0 pd to function properly.

We've discovered this issue too. Unfortunately the Linux implementation
of generic power domain core (genpd) doesn't support multiple power
domains per device, so we ended up with a hack in our internal tree.

Generic power domain bindings aren't going to help too much, because
even though they account for this, the implementation will use only the
first domain.

I have CC'ed Rafael, Kevin and Ulf, as they might have some ideas how to
solve this.

> 
> If TV is on, but LCD0 is not, then all that is shown on the display are
> vertical colored lines. I have applied a hack that forces LCD0 on all
> the time. This way I get correct output on the display connected via HDMI.
> 
> I use the simple modetest test from the libdrm repository
> (http://cgit.freedesktop.org/mesa/drm/tree/tests/modetest):
> modetest -M exynos -v -s 15@6:640x480
> (this issues a continuous vblank test)
> 
> So, this is the first issue. The second one, related to the VP, popped
> up when I tried to issue modetest more than once. I've included the
> kernel warning output in the commit
> (https://github.com/tobiasjakobi/linux-odroid/commit/cba8b0fd687e0e60107cf19fc5305e71e524e969).
> 
> For some reason disabling the TV pd times out, which in turn then lets
> the reset of the VP fail. After that happens, the modetest test becomes
> non-functional. If have to reboot the system to get it into useable
> state again.
> 
> Applying the same hack for the TV pd fixes this issue. The VP reset
> works again. That is the second issue.

Seems like incorrect power down sequence in VP driver. The power domain
won't shut down if certain conditions are not met. I remember Marek
(also on Cc) and Tomasz S. having some issues similar to this with the
old V4L2 driver for VP.

Best regards,
Tomasz
