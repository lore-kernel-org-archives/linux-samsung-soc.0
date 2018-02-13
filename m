From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 2/4] ARM: dts: split trats2 DTS in preparation for
 midas boards
Date: Tue, 13 Feb 2018 19:14:47 +0100
Message-ID: <20180213181447.cvfhzabnvzvov4ib@kozik-lap>
References: <20180208000137.11264-1-simon@lineageos.org>
 <20180208000137.11264-3-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36901 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965217AbeBMSOv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 13:14:51 -0500
Content-Disposition: inline
In-Reply-To: <20180208000137.11264-3-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>

On Thu, Feb 08, 2018 at 11:01:35AM +1100, Simon Shields wrote:
> The midas boards share a lot with trats2. Split the common parts
> out of trats2 into a common midas dtsi and a common "galaxy s3" dts.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |  140 ++
>  ...exynos4412-trats2.dts => exynos4412-midas.dtsi} |  119 +-
>  arch/arm/boot/dts/exynos4412-trats2.dts            | 1441 +-------------------
>  3 files changed, 173 insertions(+), 1527 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>  copy arch/arm/boot/dts/{exynos4412-trats2.dts => exynos4412-midas.dtsi} (91%)
>  rewrite arch/arm/boot/dts/exynos4412-trats2.dts (98%)

Unfortunately this does not apply anymore. Probably because Maciej's
patch touching camera and pmu nodes. I was hoping this was the last
iteration of the series but apparently not... sorry!

Please rebase on my latest next/dt or for-next branches (or linux-next
in few days).

Best regards,
Krzysztof
