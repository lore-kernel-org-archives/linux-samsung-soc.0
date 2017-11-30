From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: exynos: Add MFC power domain to
 Exynos 5433 SoC
Date: Thu, 30 Nov 2017 11:21:35 +0900
Message-ID: <5A1F6B2F.9060201@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112650eucas1p14c99978fbf664f9246d57360ca91353e@eucas1p1.samsung.com>
        <20171129112638.15813-5-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53127 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752303AbdK3CVg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 21:21:36 -0500
In-reply-to: <20171129112638.15813-5-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>

Dear Marek,

On 2017년 11월 29일 20:26, Marek Szyprowski wrote:
> This patch adds support for MFC power domain to Exynos 5433 SoCs, which
> contains following devices: a clock controller, MFC codec device and its
> SYSMMUs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 0a06be283a31..cfa2a0d4dc2f 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -486,6 +486,7 @@

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
