From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: exynos: Add MSCL power domain to
 Exynos 5433 SoC
Date: Thu, 30 Nov 2017 11:20:35 +0900
Message-ID: <5A1F6AF3.5050809@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112650eucas1p13a3cc167bc64d133cf24e4f621865203@eucas1p1.samsung.com>
        <20171129112638.15813-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52493 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752340AbdK3CUg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 21:20:36 -0500
In-reply-to: <20171129112638.15813-4-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>

On 2017년 11월 29일 20:26, Marek Szyprowski wrote:
> This patch adds support for MSCL power domain to Exynos 5433 SoCs, which
> contains following devices: a clock controller, JPEG codec device and its
> SYSMMU.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
