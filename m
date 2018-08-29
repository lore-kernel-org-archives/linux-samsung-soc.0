From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos: Mark 1GHz CPU OPP as suspend OPP
Date: Wed, 29 Aug 2018 21:32:42 +0200
Message-ID: <20180829193242.ddqaeyv4neeqfnw3@kozik-lap>
References: <20180807104757eucas1p201bd787714f50a798ee7457bdaf2c2f9~IlG8LJVcj1319313193eucas1p2R@eucas1p2.samsung.com>
 <20180807104849.15384-1-m.szyprowski@samsung.com>
 <CGME20180807104908eucas1p13c3a771369e556e884c81f648d80ad44@eucas1p1.samsung.com>
 <20180807104908eucas1p13c3a771369e556e884c81f648d80ad44~IlH93f82B2008420084eucas1p1o@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807104908eucas1p13c3a771369e556e884c81f648d80ad44~IlH93f82B2008420084eucas1p1o@eucas1p1.samsung.com>
Sender: stable-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 07, 2018 at 12:48:49PM +0200, Marek Szyprowski wrote:
> 1GHz CPU OPP is the default boot value for the Exynos5250 SOC, so mark it
> as suspend OPP. This fixes suspend/resume on Samsung Exynos5250 Snow
> Chomebook, which was broken since switching to generic cpufreq-dt driver
> in v4.3.
> 
> CC: <stable@vger.kernel.org> # 4.3.x: cd6f55457eb4  ARM: dts: exynos: Remove "cooling-{min|max}-level" for CPU nodes
> CC: <stable@vger.kernel.org> # 4.3.x: 672f33198bee  arm: dts: exynos: Add missing cooling device properties for CPUs
> CC: <stable@vger.kernel.org> # 4.3.x
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied.

Best regards,
Krzysztof
