From: Paolo Pisati <p.pisati@gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Fri, 21 Nov 2014 00:49:53 +0100
Message-ID: <20141120234953.GA4010@luxor.wired.org>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
 <7hh9xwxsev.fsf@deeprootsystems.com>
 <546CCAB8.9050402@collabora.co.uk>
 <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
 <7hppchsu29.fsf@deeprootsystems.com>
 <546E293D.9000300@collabora.co.uk>
 <7hbno1spdt.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:50028 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756624AbaKTXt4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 18:49:56 -0500
Received: by mail-wi0-f182.google.com with SMTP id h11so7072836wiw.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 15:49:55 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <7hbno1spdt.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

On Thu, Nov 20, 2014 at 10:22:54AM -0800, Kevin Hilman wrote:
> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
> 
> > Hello,
> >
> > For completeness I'll comment what we talked with Kevin on IRC
> > since probably this is the same issue that Paolo is facing.
> >
> > On 11/20/2014 05:41 PM, Kevin Hilman wrote:
> >> Peach # setenv preboot "usb start; sleep 1"setenv bootargs
> >> console=tty1 console=ttySAC3,115200 debug earlyprintk rw
> >> root=/dev/mmcblk1p3 rootwait rootfstype=ext3
> >
> > My kernel command line is almost the same with the difference that I'm using
> > clk_ignore_unused and I just checked that not passing that parameter, makes
> > linux-next to hang showing the same output log that Kevin reported.
> 
> Ah!  Good find.  I confirm that adding clk_ignore_unused is getting me
> booting again, but of course that is just masking a problem, so I hope
> someone can shed light on which clock isn't being correctly managed.
> 
> Might I also suggest that folks have their default command-line to *not*
> use clk_ignore_unused, since it's primary job is to workaround clock
> bugs.

i'm testing kgene/for-next (not linux-next), with:

flag@peachpi:~/linux$ cat /proc/cmdline
console=tty1 console=ttySAC3,115200 debug earlyprintk rw rootwait
root=/dev/mmcblk1p3

adding clk_ignore_unused didn't make any difference: it hangs on boot
showing a black screen with backlight on.

vanilla kgene/for-next as of today:

7552917 Revert "ARM: exynos_defconfig: Enable options for display panel support"
ff0391a Merge branch 'v3.19-samsung-defconfig' into for-next
26c6283 Merge branch 'v3.18-samsung-fixes' into for-next
cf864fd Merge branch 'v3.18-samsung-defconfig' into for-next
98b6380 ARM: exynos_defconfig: Enable max77802 rtc and clock drivers
839275c ARM: exynos_defconfig: Use 16 minors per MMC block device
0526f27 ARM: dts: Explicitly set dr_mode on exynos5250-snow
fc14f9c Linux 3.18-rc5
...

plus

5e1e068 arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
36d908e drm/exynos: dp: Remove support for unused dptx-phy
624bff2 POSTED: mfd: syscon: Decouple syscon interface from syscon devices
68944e3 Revert "Revert "ARM: exynos_defconfig: Enable options for display panel
support""

vanilla exynos_defconfig with SND_SOC_SNOW disabled.

I should probably try linux-next at this point, but i wonder if people who
reported kgene/for-next working were testing with a vanilla exynos_defconfig on
a peach pi.
-- 
bye,
p.
