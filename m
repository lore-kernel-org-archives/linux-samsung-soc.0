From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: exynos: Move G2D node to exynos5.dtsi
Date: Wed, 29 Nov 2017 19:06:29 +0100
Message-ID: <20171129180629.uo34k2kmprdu3kid@kozik-lap>
References: <CGME20171129114250eucas1p17b5a0213e7a486c85f72ef7a5d39f0d5@eucas1p1.samsung.com>
 <20171129114234.16132-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:42126 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752588AbdK2SNS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 13:13:18 -0500
Received: by mail-wm0-f50.google.com with SMTP id l141so8187595wmg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Nov 2017 10:13:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171129114234.16132-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On Wed, Nov 29, 2017 at 12:42:34PM +0100, Marek Szyprowski wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> Current the node is only defined in the exynos5250 DT, while
> the corresponding SYSMMUs are also to be found in the exynos5420
> DT. Move the node to exynos5 and only setup the SYSMMUs in the
> corresponding DT.
> 
> Disable the node by default, since exynos5410 also includes
> the dtsi, but currently does not define the G2D clock.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> [mszyprow: rephrased commit message]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> resend on Krzysztof's request
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |  7 +++++++
>  arch/arm/boot/dts/exynos5250.dtsi | 16 +++++++---------
>  arch/arm/boot/dts/exynos5420.dtsi |  7 +++++++
>  3 files changed, 21 insertions(+), 9 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
