From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Wed, 14 Jan 2015 16:25:40 +0100
Message-ID: <54B68A74.8070405@math.uni-bielefeld.de>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57328 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752432AbbANPZm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 10:25:42 -0500
In-Reply-To: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hello,

I've applied v6 of the HDMI patchset (together with the patches the set
depends on) onto torvalds/master, but I'm seeing a lot of warnings
(coming from __clk_{unprepare,disable}) that seem to originate from the
fimc subsystem.

Since the patchset also changes PM domain handling (which shows up in
the log as well), I was wondering if this is related?

Full boot log here:
http://www.math.uni-bielefeld.de/~tjakobi/archive/clk_warnings.txt

That's the tree I'm currently using:
https://github.com/tobiasjakobi/linux-odroid/commits/odroid-3.19.y
(maybe I'm missing something here?)


With best wishes,
Tobias

PS: This is on a ODROID-X2.


Marek Szyprowski wrote:
> Hi all,
> 
> This is yet another approach to submit patches, which enables HDMI
> support for two Exynos based platforms: UniversalC210 and Odroid X2/U3.
> 
> Beside DTS changes, this patchset adds parent domain support for Exynos
> PM domains. This was the most controversial patch in the previous
> attempts, but I hope I fixes all reported issues and made it really
> generic. For more details see individual patches.
> 
> The patchset is based on my previous patch:
> 'ARM: DTS: Exynos: convert to generic power domain bindings'
> (http://www.spinics.net/lists/linux-samsung-soc/msg40584.html)
> and requires 2 patches that have been merged to v3.19-rc4:
> 'clk: samsung: exynos4: set parent of sclk_hdmiphy to hdmi'
> (commit df019a5c0f7083001cb694f44821ca506425bda2) and
> 'PM / Domains: Export of_genpd_get_from_provider function'
> (commit 7496fcbe8a643097efc061160e1c3b65ee2fa350).
> 
> Regards
> Marek Szyprowski
> 
> Change log:
> 
> v2:
> - rewrote subdomains patch according to suggestions from Geert
>   Uytterhoeven and Amit Daniel Kachhap.
> 
> v1 resend: (http://www.spinics.net/lists/linux-samsung-soc/msg39428.html)
> - added handling of generic 'power-domains' binding in subdomains
> 
> v1: (http://www.spinics.net/lists/linux-samsung-soc/msg38914.html)
> - resolved power domain on/off issue with 'clk: samsung: exynos4: set
>   parent of mixer gate clock to hdmi' patch
> 
> v0: (http://www.spinics.net/lists/linux-samsung-soc/msg33498.html)
> - first attempt, used 'always on' power domains hack
> 
> 
> Andrzej Hajda (1):
>   ARM: dts: exynos5250: add display power domain
> 
> Marek Szyprowski (4):
>   ARM: Exynos: add support for sub-power domains
>   ARM: dts: exynos4: add hdmi related nodes
>   ARM: dts: exynos4: add dependency between TV and LCD0 power domains
>   ARM: dts: exynos4412-odroid: enable hdmi support
> 
> Tomasz Stanislawski (1):
>   ARM: dts: exynos4210-universal_c210: enable hdmi support
> 
>  .../bindings/arm/exynos/power_domain.txt           |  2 +
>  arch/arm/boot/dts/exynos4.dtsi                     | 41 ++++++++++++++++
>  arch/arm/boot/dts/exynos4210-universal_c210.dts    | 57 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi                  |  8 +++
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 44 +++++++++++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi                  | 11 +++++
>  arch/arm/boot/dts/exynos5250.dtsi                  | 10 ++++
>  arch/arm/mach-exynos/pm_domains.c                  | 28 +++++++++++
>  8 files changed, 201 insertions(+)
> 
