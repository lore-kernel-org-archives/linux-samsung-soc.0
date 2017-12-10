From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATHC v2] ARM: dts: exynos: add DT nodes for PRNG in Exynos5
 SoCs
Date: Sun, 10 Dec 2017 15:30:41 +0100
Message-ID: <20171210143041.r7m5p22gxngzml23@kozik-lap>
References: <20171128125009.30195-1-l.stelmach@samsung.com>
 <CGME20171204120436eucas1p26b2e7da27667fef62eb84c5c4cd8b065@eucas1p2.samsung.com>
 <20171204120429.22892-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35888 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751554AbdLJOap (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Dec 2017 09:30:45 -0500
Received: by mail-wm0-f67.google.com with SMTP id b76so9961106wmg.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2017 06:30:44 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171204120429.22892-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com

On Mon, Dec 04, 2017 at 01:04:29PM +0100, Łukasz Stelmach wrote:
> Add nodes for PRNG in dts files decribing Exynos5 chips.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
> Changes since v1:
> 
> - Use "rng" as the node-name for all RNG regardles of their type.
> - Introduce "samsung,exynos5250-prng" compatible (binding documentation
>   will follow).
> 
>  arch/arm/boot/dts/exynos5.dtsi    | 5 +++++
>  arch/arm/boot/dts/exynos5250.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5410.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5420.dtsi | 5 +++++
>  4 files changed, 20 insertions(+)


Does not apply on top of my next/dt nor on v4.15-rc1. Please rebase it
on my next/dt
(https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=next/dt).

Currently it looks like rebased on some different tree (non-existent
node in exynos5.dtsi) so please be sure that you also test it after
rebasing on top of my tree.

Best regards,
Krzysztof
