From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 2/8] clk: samsung: exynos3250: Add UART2 clock
Date: Fri, 25 Mar 2016 08:39:31 +0900
Message-ID: <56F47AB3.2070007@samsung.com>
References: <1458027490-13787-1-git-send-email-cw00.choi@samsung.com>
 <1458027490-13787-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1458027490-13787-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Ping.

Hi Sylwester,

Could you review this patch?

Regards,
Chanwoo Choi

On 2016=EB=85=84 03=EC=9B=94 15=EC=9D=BC 16:38, Chanwoo Choi wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>=20
> This patch add the UART2 clocks (mux, divider, gate) of Exynos3250 So=
C.
>=20
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos3250.c   | 6 ++++++
>  include/dt-bindings/clock/exynos3250.h | 6 +++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsu=
ng/clk-exynos3250.c
> index fdd41b17a24f..bc60e399d1bc 100644
> --- a/drivers/clk/samsung/clk-exynos3250.c
> +++ b/drivers/clk/samsung/clk-exynos3250.c
> @@ -306,6 +306,7 @@ static struct samsung_mux_clock mux_clks[] __init=
data =3D {
>  	MUX(CLK_MOUT_MMC0, "mout_mmc0", group_sclk_p, SRC_FSYS, 0, 4),
> =20
>  	/* SRC_PERIL0 */
> +	MUX(CLK_MOUT_UART2, "mout_uart2", group_sclk_p, SRC_PERIL0, 8, 4),
>  	MUX(CLK_MOUT_UART1, "mout_uart1", group_sclk_p, SRC_PERIL0, 4, 4),
>  	MUX(CLK_MOUT_UART0, "mout_uart0", group_sclk_p, SRC_PERIL0, 0, 4),
> =20
> @@ -390,6 +391,7 @@ static struct samsung_div_clock div_clks[] __init=
data =3D {
>  	DIV(CLK_DIV_MMC0, "div_mmc0", "mout_mmc0", DIV_FSYS1, 0, 4),
> =20
>  	/* DIV_PERIL0 */
> +	DIV(CLK_DIV_UART2, "div_uart2", "mout_uart2", DIV_PERIL0, 8, 4),
>  	DIV(CLK_DIV_UART1, "div_uart1", "mout_uart1", DIV_PERIL0, 4, 4),
>  	DIV(CLK_DIV_UART0, "div_uart0", "mout_uart0", DIV_PERIL0, 0, 4),
> =20
> @@ -552,6 +554,9 @@ static struct samsung_gate_clock gate_clks[] __in=
itdata =3D {
>  		GATE_SCLK_PERIL, 7, CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_SCLK_SPI0, "sclk_spi0", "div_spi0_pre",
>  		GATE_SCLK_PERIL, 6, CLK_SET_RATE_PARENT, 0),
> +
> +	GATE(CLK_SCLK_UART2, "sclk_uart2", "div_uart2",
> +		GATE_SCLK_PERIL, 2, CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_SCLK_UART1, "sclk_uart1", "div_uart1",
>  		GATE_SCLK_PERIL, 1, CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_SCLK_UART0, "sclk_uart0", "div_uart0",
> @@ -649,6 +654,7 @@ static struct samsung_gate_clock gate_clks[] __in=
itdata =3D {
>  	GATE(CLK_I2C2, "i2c2", "div_aclk_100", GATE_IP_PERIL, 8, 0, 0),
>  	GATE(CLK_I2C1, "i2c1", "div_aclk_100", GATE_IP_PERIL, 7, 0, 0),
>  	GATE(CLK_I2C0, "i2c0", "div_aclk_100", GATE_IP_PERIL, 6, 0, 0),
> +	GATE(CLK_UART2, "uart2", "div_aclk_100", GATE_IP_PERIL, 2, 0, 0),
>  	GATE(CLK_UART1, "uart1", "div_aclk_100", GATE_IP_PERIL, 1, 0, 0),
>  	GATE(CLK_UART0, "uart0", "div_aclk_100", GATE_IP_PERIL, 0, 0, 0),
>  };
> diff --git a/include/dt-bindings/clock/exynos3250.h b/include/dt-bind=
ings/clock/exynos3250.h
> index 63d01c15d2b3..ddb874130d86 100644
> --- a/include/dt-bindings/clock/exynos3250.h
> +++ b/include/dt-bindings/clock/exynos3250.h
> @@ -79,6 +79,7 @@
>  #define CLK_MOUT_CORE			58
>  #define CLK_MOUT_APLL			59
>  #define CLK_MOUT_ACLK_266_SUB		60
> +#define CLK_MOUT_UART2			61
> =20
>  /* Dividers */
>  #define CLK_DIV_GPL			64
> @@ -127,6 +128,7 @@
>  #define CLK_DIV_CORE			107
>  #define CLK_DIV_HPM			108
>  #define CLK_DIV_COPY			109
> +#define CLK_DIV_UART2			110
> =20
>  /* Gates */
>  #define CLK_ASYNC_G3D			128
> @@ -223,6 +225,7 @@
>  #define CLK_BLOCK_MFC			219
>  #define CLK_BLOCK_CAM			220
>  #define CLK_SMIES			221
> +#define CLK_UART2			222
> =20
>  /* Special clocks */
>  #define CLK_SCLK_JPEG			224
> @@ -249,12 +252,13 @@
>  #define CLK_SCLK_SPI0			245
>  #define CLK_SCLK_UART1			246
>  #define CLK_SCLK_UART0			247
> +#define CLK_SCLK_UART2			248
> =20
>  /*
>   * Total number of clocks of main CMU.
>   * NOTE: Must be equal to last clock ID increased by one.
>   */
> -#define CLK_NR_CLKS			248
> +#define CLK_NR_CLKS			249
> =20
>  /*
>   * CMU DMC
>=20
