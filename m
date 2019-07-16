From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: devfreq: exynos-bus: remove unused
 property
Date: Tue, 16 Jul 2019 17:54:12 +0900
Message-ID: <dd74212e-a422-13ab-8237-fcaf372ab3eb@samsung.com>
References: <20190715120416.3561-1-k.konieczny@partner.samsung.com>
        <CGME20190715120433eucas1p26681c5c2d87423253b651d88446c538c@eucas1p2.samsung.com>
        <20190715120416.3561-5-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715120416.3561-5-k.konieczny@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 19. 7. 15. 오후 9:04, Kamil Konieczny wrote:
> Remove unused DT property "exynos,voltage-tolerance".
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  Documentation/devicetree/bindings/devfreq/exynos-bus.txt | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/exynos-bus.txt b/Documentation/devicetree/bindings/devfreq/exynos-bus.txt
> index f8e946471a58..e71f752cc18f 100644
> --- a/Documentation/devicetree/bindings/devfreq/exynos-bus.txt
> +++ b/Documentation/devicetree/bindings/devfreq/exynos-bus.txt
> @@ -50,8 +50,6 @@ Required properties only for passive bus device:
>  Optional properties only for parent bus device:
>  - exynos,saturation-ratio: the percentage value which is used to calibrate
>  			the performance count against total cycle count.
> -- exynos,voltage-tolerance: the percentage value for bus voltage tolerance
> -			which is used to calculate the max voltage.
>  
>  Detailed correlation between sub-blocks and power line according to Exynos SoC:
>  - In case of Exynos3250, there are two power line as following:
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
