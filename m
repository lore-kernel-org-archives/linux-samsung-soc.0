From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: mainline/master boot bisection: v4.15-rc3 on peach-pi
 #3228-staging
Date: Mon, 11 Dec 2017 22:58:29 +0000
Message-ID: <20171211225829.GA1959@n2100.armlinux.org.uk>
References: <680389204.71.1512980755810.JavaMail.jenkins@ip-172-30-0-246>
 <51e6d7fb-ac9e-a59f-ea63-ad06219b429d@collabora.com>
 <CAKMK7uFcGftSeQjkKu9SZmkQd8-irbUTMcOnUwi7HZtb5TePag@mail.gmail.com>
 <CABxcv=mUHgTxvYpOYstE7rQn8fKS3QGiTT=FzBUc8DREvVuTeQ@mail.gmail.com>
 <CABxcv=m-fYZvYN4gLwBf8NwHvJb7PtNdVKR+SXgVKExZGtW4Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56092 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750759AbdLKW6u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 17:58:50 -0500
Content-Disposition: inline
In-Reply-To: <CABxcv=m-fYZvYN4gLwBf8NwHvJb7PtNdVKR+SXgVKExZGtW4Qw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, kernel-build-reports@lists.linaro.org, Thierry Escande <thierry.escande@collabora.co.uk>, Kevin Hilman <khilman@baylibre.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Dec 11, 2017 at 11:54:48PM +0100, Javier Martinez Canillas wrote:
> So I gave a quick look to this, and at the very least there's a bug in
> the Exynos5800 Peach Pi DTS caused by commit 1cb686c08d12 ("ARM: dts:
> exynos: Add status property to Exynos 542x Mixer nodes").
> 
> I've posted a fix for that:
> 
> https://patchwork.kernel.org/patch/10105921/
> 
> I believe this could be also be the cause for the boot failure, since
> I see in the boot log that things start to go wrong after exynos-drm
> fails to bind the HDMI component:
> 
> [ 2.916347] exynos-drm exynos-drm: failed to bind 14530000.hdmi (ops
> 0xc1398690): -1

Umm, -1 ?  Looking that error code up in
include/uapi/asm-generic/errno-base.h says it's -EPERM.

I suspect that's someone just returning -1 because they're lazy...
which is real bad form and needs fixing.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
