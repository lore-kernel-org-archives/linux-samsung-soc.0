From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Tue, 20 Jan 2015 00:03:45 +0100
Message-ID: <54BD8D51.3050202@gmx.net>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com> <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com> <54B8533C.3070000@math.uni-bielefeld.de> <54B99178.1060006@gmx.net> <54BD3129.5090305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:61437 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751374AbbASXEA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 18:04:00 -0500
In-Reply-To: <54BD3129.5090305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello!

Marek Szyprowski wrote:
> Thanks for you tests and pointing this issue. I turned out that the
> initial fix proposed
> by Andrzej Hajda
> (http://www.spinics.net/lists/linux-samsung-soc/msg38915.html) worked
> fine, while the final version merged to clock fixes ('clk: samsung:
> exynos4: set parent
> of sclk_hdmiphy to hdmi' - commit
> df019a5c0f7083001cb694f44821ca506425bda2) doesn't work
> properly.
I should thank you for pushing all this code to mainline. It's really
nice to see how all the pieces now come together.


> Please check the following kernel tree - instead of hacking around hdmi
> clock I've added
> handling of it directly to drm mixer driver:
> https://git.linaro.org/people/marek.szyprowski/linux-srpol.git/shortlog/refs/heads/v3.19-odroid-hdmi
> 
> I hope that this will finally solve all mixer initialization related
> issues (also for
> Odroid XU3, discussed recently in the other thread). If it works fine, I
> will resend
> exynos4 hdmi patches to include this change.
I have picked the additional patches to my tree, which currently has a
bunch of other stuff in it, in particular v4 of the IOMMU series.

Anyway, now the 'modetest' application immediately crashes the system,
but I get a least something on the serial console:
http://www.math.uni-bielefeld.de/~tjakobi/archive/odroid_modetest_crash_sysmmu.txt

So this is probably due to the IOMMU. Please note that DRM IOMMU support
(CONFIG_DRM_EXYNOS_IOMMU) was disabled (!) in my config.
CONFIG_EXYNOS_IOMMU however was on.

I'm going to retest with the IOMMU series removed and
CONFIG_EXYNOS_IOMMU disabled as well.

Just posting this already since you're probably interested in these
'side-issues' as well.


With best wishes,
Tobias
