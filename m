From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: exynos: Add ADC clock ID to
 Exynos5410
Date: Wed, 13 Feb 2019 16:07:58 +0900
Message-ID: <a8e1ab3f-83f7-0d35-a943-df6600d6c3cd@samsung.com>
References: <20190212175052.6310-1-krzk@kernel.org>
        <CGME20190212175204epcas1p1bf2eb348293554593eabb561c5dcf6c1@epcas1p1.samsung.com>
        <20190212175052.6310-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212175052.6310-3-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 19. 2. 13. 오전 2:50, Krzysztof Kozlowski wrote:
> Add ID for TSADC clock to Exynos5410.  Choose the same value of ID as in
> Exynos5420 to make it simpler/compatible in future (although clock
> driver code is not shared).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  include/dt-bindings/clock/exynos5410.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
> index 5b911ede0534..86c2ad56c5ef 100644
> --- a/include/dt-bindings/clock/exynos5410.h
> +++ b/include/dt-bindings/clock/exynos5410.h
> @@ -45,6 +45,7 @@
>  #define CLK_USI1		266
>  #define CLK_USI2		267
>  #define CLK_USI3		268
> +#define CLK_TSADC		270
>  #define CLK_PWM			279
>  #define CLK_MCT			315
>  #define CLK_WDT			316
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
