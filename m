From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFT 01/10] dt-bindings: gpu: mali: Add Samsung compatibles for
 Midgard and Utgard
Date: Wed, 19 Jun 2019 12:01:10 +0200
Message-ID: <9d16d4f7-8353-e0f0-a005-1b04457d70f0@samsung.com>
References: <20190618190534.4951-1-krzk@kernel.org>
        <CGME20190618190551epcas2p38f3c93da2a05117c7741468bb5a7784c@epcas2p3.samsung.com>
        <20190618190534.4951-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618190534.4951-2-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 2019-06-18 21:05, Krzysztof Kozlowski wrote:
> Add vendor compatibles for specific implementation of Mali Utgard
> (Exynos3250, Exynos4-family) and Midgard (Exynos5433, Exynos7).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
>   Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt  | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> index e5ad3b2afe17..9b298edec5b2 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> @@ -17,6 +17,7 @@ Required properties:
>     * which must be preceded by one of the following vendor specifics:
>       + "allwinner,sun50i-h6-mali"
>       + "amlogic,meson-gxm-mali"
> +    + "samsung,exynos5433-mali"
>       + "rockchip,rk3288-mali"
>       + "rockchip,rk3399-mali"
>   
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> index ae63f09fda7d..519018cb860b 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> @@ -17,6 +17,7 @@ Required properties:
>         + amlogic,meson8b-mali
>         + amlogic,meson-gxbb-mali
>         + amlogic,meson-gxl-mali
> +      + samsung,exynos3250-mali
I would prefer 'samsung,exynos4-mali', because historically Exynos4 was 
the first SoC with Mali400 and such prefix is already used for many hw 
blocks.
>         + rockchip,rk3036-mali
>         + rockchip,rk3066-mali
>         + rockchip,rk3188-mali

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
