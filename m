From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v5 0/9] Enable HDMI support on Exynos platforms
Date: Tue, 03 Feb 2015 12:58:24 +0900
Message-ID: <066101d03f65$a870dcc0$f9529640$@kernel.org>
References: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31716 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754797AbbBCD61 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 22:58:27 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ600MBTGDC53B0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Feb 2015 12:58:24 +0900 (KST)
In-reply-to: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, 'Kukjin Kim' <kgene@kernel.org>, 'Tobias Jakobi' <Liquid.Acid@gmx.net>, 'Daniel Drake' <drake@endlessm.com>, 'Andrzej Hajda' <a.hajda@samsung.com>, 'Inki Dae' <inki.dae@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

Marek Szyprowski wrote:
> 
> Hi all,
> 
> This is yet another update on patchset, which enables HDMI support for
> Exynos based platforms.
> 
> Beside DTS changes, this patchset adds parent domain support for Exynos
> PM domains and add support for 'hdmi' clock directly to Exynos DRM mixer
> driver.
> 
> The patchset is based on samsung/for-next branch and 'PM / Domains:
> Export of_genpd_get_from_provider function' patch merged as commit
> 7496fcbe8a643097efc061160e1c3b65ee2fa350 to v3.19-rc4.
> 
> Regards
> Marek Szyprowski
> 
> 
> Changelog:
> 
> v5:
> - fixed error value for clk_get() in mixer patch
> - rebased onto samsung/for-next branch
> 
> v4: (http://www.spinics.net/lists/linux-samsung-soc/msg41375.html)
> - added patches, which add 'hdmi' clock handling to mixed block, this
>   finally solves the initialization related issues, thanks for Tobias
>   Jakobi for testing
> - added acks/reviewed/tested by tags
> 
> v3: (http://www.spinics.net/lists/linux-samsung-soc/msg41020.html)
> - added a note on defining subdomains to generic PM domain binding
>   documentation (requested by Ulf Hansson)
> 
> v2: (http://www.spinics.net/lists/linux-samsung-soc/msg40980.html)
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
> Patch summary:
> 
> 
> *** BLURB HERE ***
> 
> Andrzej Hajda (1):
>   ARM: dts: exynos5250: add display power domain
> 
> Marek Szyprowski (7):
>   PM / Domains: Add a note about power domain subdomains
>   ARM: Exynos: add support for sub-power domains
>   ARM: dts: exynos4: add hdmi related nodes
>   ARM: dts: exynos4: add dependency between TV and LCD0 power domains
>   ARM: dts: exynos4412-odroid: enable hdmi support
>   ARM: dts: Exynos: add 'hdmi' clock to mixer nodes
>   drm/exynos: add support for 'hdmi' clock
> 
> Tomasz Stanislawski (1):
>   ARM: dts: exynos4210-universal_c210: enable hdmi support
> 
>  .../bindings/arm/exynos/power_domain.txt           |  2 +
>  .../devicetree/bindings/power/power_domain.txt     | 29 +++++++++++
>  .../devicetree/bindings/video/exynos_mixer.txt     |  1 +
>  arch/arm/boot/dts/exynos4.dtsi                     | 41 ++++++++++++++++
>  arch/arm/boot/dts/exynos4210-universal_c210.dts    | 57 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi                  |  8 +++
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 44 +++++++++++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi                  | 11 +++++
>  arch/arm/boot/dts/exynos5250.dtsi                  | 15 +++++-
>  arch/arm/boot/dts/exynos5420.dtsi                  |  5 +-
>  arch/arm/mach-exynos/pm_domains.c                  | 28 +++++++++++
>  drivers/gpu/drm/exynos/exynos_mixer.c              |  9 ++++
>  12 files changed, 246 insertions(+), 4 deletions(-)
> 
> --
I have no objection on this series, but just wondering my tree should be fine
without 9/9 drm patch and it will be handled for 3.20?

I'll take 1 to 8 patches once drm patch is landed for 3.20.

- Kukjin
