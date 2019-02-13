From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: exynos: Put CLK_UART3 in order
Date: Wed, 13 Feb 2019 16:04:15 +0900
Message-ID: <5f504ab8-33ca-4033-3d17-e2ba59bfd4ae@samsung.com>
References: <20190212175052.6310-1-krzk@kernel.org>
        <CGME20190212175224epcas5p2f8735fb888b2fae241eb1d6c153a1d88@epcas5p2.samsung.com>
        <20190212175052.6310-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212175052.6310-2-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 19. 2. 13. 오전 2:50, Krzysztof Kozlowski wrote:
> Order the CLK_UART3 by ID.  No change in functionality.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  include/dt-bindings/clock/exynos5410.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
> index f179eabbcdb7..5b911ede0534 100644
> --- a/include/dt-bindings/clock/exynos5410.h
> +++ b/include/dt-bindings/clock/exynos5410.h
> @@ -36,6 +36,7 @@
>  #define CLK_UART0		257
>  #define CLK_UART1		258
>  #define CLK_UART2		259
> +#define CLK_UART3		260
>  #define CLK_I2C0		261
>  #define CLK_I2C1		262
>  #define CLK_I2C2		263
> @@ -44,7 +45,6 @@
>  #define CLK_USI1		266
>  #define CLK_USI2		267
>  #define CLK_USI3		268
> -#define CLK_UART3		260
>  #define CLK_PWM			279
>  #define CLK_MCT			315
>  #define CLK_WDT			316
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
