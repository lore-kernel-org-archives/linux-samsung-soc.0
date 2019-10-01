From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Exynos5433: swap clock order of
 sysmmu
Date: Tue, 1 Oct 2019 21:14:50 +0200
Message-ID: <20191001191450.GA30860@kozik-lap>
References: <20190919131944.11007-1-m.szyprowski@samsung.com>
 <CGME20190919135115eucas1p2e1c9c090c5a75211e5a137c598721287@eucas1p2.samsung.com>
 <20190919135053.11849-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190919135053.11849-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>, mark.rutland@arm.com, robh@kernel.org, a.hajda@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 03:50:53PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> dt-schema supports only order of names "aclk", "pclk".
> Swap some sysmmu definitions to make them compatible with schema.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 54 +++++++++++-----------

Thanks, applied.

Best regards,
Krzysztof
