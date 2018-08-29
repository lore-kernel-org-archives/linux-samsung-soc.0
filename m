From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: Convert exynos5250.dtsi to
 opp-v2 bindings
Date: Wed, 29 Aug 2018 21:30:53 +0200
Message-ID: <20180829193053.2jxrg7ipwgy6ujjx@kozik-lap>
References: <20180807104757eucas1p201bd787714f50a798ee7457bdaf2c2f9~IlG8LJVcj1319313193eucas1p2R@eucas1p2.samsung.com>
 <CGME20180807104905eucas1p262885b5e1ee707bce83da40c50feb402@eucas1p2.samsung.com>
 <20180807104905eucas1p262885b5e1ee707bce83da40c50feb402~IlH7UbpE_1482814828eucas1p2p@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807104905eucas1p262885b5e1ee707bce83da40c50feb402~IlH7UbpE_1482814828eucas1p2p@eucas1p2.samsung.com>
Sender: stable-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 07, 2018 at 12:48:48PM +0200, Marek Szyprowski wrote:
> Convert Exynos5250 to OPP-v2 bindings. This is a preparation to add proper
> support for suspend operation point, which cannot be marked in opp-v1.
> 
> CC: <stable@vger.kernel.org> # 4.3.x: cd6f55457eb4  ARM: dts: exynos: Remove "cooling-{min|max}-level" for CPU nodes
> CC: <stable@vger.kernel.org> # 4.3.x: 672f33198bee  arm: dts: exynos: Add missing cooling device properties for CPUs
> CC: <stable@vger.kernel.org> # 4.3.x
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 130 ++++++++++++++++++++----------
>  1 file changed, 88 insertions(+), 42 deletions(-)

Thanks, applied.

Best regards,
Krzysztof
