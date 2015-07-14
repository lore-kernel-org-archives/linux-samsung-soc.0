From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL] ARM: EXYNOS: dts: Fixes for 4.2
Date: Tue, 14 Jul 2015 17:26:22 +0900
Message-ID: <076601d0be0e$c4998780$4dcc9680$@kernel.org>
References: <1436790601-9598-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51975 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751793AbbGNI0Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jul 2015 04:26:25 -0400
In-reply-to: <1436790601-9598-1-git-send-email-k.kozlowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Beata Michalska' <b.michalska@samsung.com>

Krzysztof Kozlowski wrote:
> 
> Dear Kukjin,
> 
Hi,

Thanks for your pull-request and I'll sort them out for 4.2-rc soon.

BTW, the Thomas' patch is enough to support exynos4210 cpufreq without other
patches in the series? I didn't think so...

- Kukjin

> These are candidates for fixes during this RC cycle.
> Description below (under signed tag).
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> 
>   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/krzk/linux.git tags/samsung-dt-fixes-4.2
> 
> for you to fetch changes up to a419d78a6f97f8c977fe55d5d590cd0654ecd1ee:
> 
>   ARM: dts: Exynos4210: add CPU OPP and regulator supply property (2015-07-13 21:16:05 +0900)
> 
> ----------------------------------------------------------------
> Samsung DTS fixes:
> 1. Fix Exynos3250 MIPI DSI display and MIPI CSIS-2 camera sensor after
>    adding support for PMU regmap in exynos-video-mipi driver
>    (issue introduced in v4.0).
> 2. Bring back cpufreq for Exynos4210 after incomplete switch to
>    cpufreq-dt driver in 4.2 merge window. The necessary DTS change
>    for Exynos4210 cpufreq was not applied to the same tree as
>    rest of patchset because of multiple conflicts between
>    clk and arm-soc DTS trees. It was also too late to send it
>    to arm-soc for 4.2. Unfortunately without the change the Exynos4210
>    boards loose cpufreq feature.
> 
> ----------------------------------------------------------------
> Beata Michalska (1):
>       ARM: dts: Update video-phy node with syscon phandle for Exynos3250
> 
> Thomas Abraham (1):
>       ARM: dts: Exynos4210: add CPU OPP and regulator supply property
> 
>  arch/arm/boot/dts/exynos3250.dtsi               |  2 +-
>  arch/arm/boot/dts/exynos4210-origen.dts         |  4 ++++
>  arch/arm/boot/dts/exynos4210-trats.dts          |  4 ++++
>  arch/arm/boot/dts/exynos4210-universal_c210.dts |  4 ++++
>  arch/arm/boot/dts/exynos4210.dtsi               | 12 ++++++++++++
>  5 files changed, 25 insertions(+), 1 deletion(-)
