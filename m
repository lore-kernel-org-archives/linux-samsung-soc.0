From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Move at91.h to dt-bindigs/clock
Date: Mon, 10 Mar 2014 12:05:33 +0100
Message-ID: <531D9C7D.6020401@atmel.com>
References: <1394085884-13081-1-git-send-email-tushar.behera@linaro.org> <1394085884-13081-2-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:1533 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752161AbaCJLFZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 07:05:25 -0400
In-Reply-To: <1394085884-13081-2-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@maxim.org.za, plagnioj@jcrosoft.com, kgene.kim@samsung.com, t.figa@samsung.com

On 06/03/2014 07:04, Tushar Behera :
> Most of the clock related dt-binding header files are located in
> dt-bindings/clock folder. It would be good to keep all the similar
> header files at a single location.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> CC: Rob Landley <rob@landley.net>
> CC: Andrew Victor <linux@maxim.org.za>
> CC: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>  .../devicetree/bindings/clock/at91-clock.txt       |    2 +-
>  arch/arm/boot/dts/sama5d3.dtsi                     |    2 +-
>  arch/arm/boot/dts/sama5d3_mci2.dtsi                |    2 +-
>  arch/arm/boot/dts/sama5d3_tcb1.dtsi                |    2 +-
>  arch/arm/boot/dts/sama5d3_uart.dtsi                |    2 +-
>  include/dt-bindings/{clk => clock}/at91.h          |    0
>  6 files changed, 5 insertions(+), 5 deletions(-)
>  rename include/dt-bindings/{clk => clock}/at91.h (100%)
> 
> diff --git a/Documentation/devicetree/bindings/clock/at91-clock.txt b/Documentation/devicetree/bindings/clock/at91-clock.txt
> index cd5e239..6794cdc 100644
> --- a/Documentation/devicetree/bindings/clock/at91-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/at91-clock.txt
> @@ -62,7 +62,7 @@ Required properties for PMC node:
>  - interrupt-controller : tell that the PMC is an interrupt controller.
>  - #interrupt-cells : must be set to 1. The first cell encodes the interrupt id,
>  	and reflect the bit position in the PMC_ER/DR/SR registers.
> -	You can use the dt macros defined in dt-bindings/clk/at91.h.
> +	You can use the dt macros defined in dt-bindings/clock/at91.h.
>  	0 (AT91_PMC_MOSCS) -> main oscillator ready
>  	1 (AT91_PMC_LOCKA) -> PLL A ready
>  	2 (AT91_PMC_LOCKB) -> PLL B ready
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
> index 3d5faf8..8c977b5 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -13,7 +13,7 @@
>  #include <dt-bindings/pinctrl/at91.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/clk/at91.h>
> +#include <dt-bindings/clock/at91.h>
>  
>  / {
>  	model = "Atmel SAMA5D3 family SoC";
> diff --git a/arch/arm/boot/dts/sama5d3_mci2.dtsi b/arch/arm/boot/dts/sama5d3_mci2.dtsi
> index b029fe7..1b02208 100644
> --- a/arch/arm/boot/dts/sama5d3_mci2.dtsi
> +++ b/arch/arm/boot/dts/sama5d3_mci2.dtsi
> @@ -9,7 +9,7 @@
>  
>  #include <dt-bindings/pinctrl/at91.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> -#include <dt-bindings/clk/at91.h>
> +#include <dt-bindings/clock/at91.h>
>  
>  / {
>  	ahb {
> diff --git a/arch/arm/boot/dts/sama5d3_tcb1.dtsi b/arch/arm/boot/dts/sama5d3_tcb1.dtsi
> index 382b044..0284845 100644
> --- a/arch/arm/boot/dts/sama5d3_tcb1.dtsi
> +++ b/arch/arm/boot/dts/sama5d3_tcb1.dtsi
> @@ -9,7 +9,7 @@
>  
>  #include <dt-bindings/pinctrl/at91.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> -#include <dt-bindings/clk/at91.h>
> +#include <dt-bindings/clock/at91.h>
>  
>  / {
>  	aliases {
> diff --git a/arch/arm/boot/dts/sama5d3_uart.dtsi b/arch/arm/boot/dts/sama5d3_uart.dtsi
> index a9fa75e..7a8d4c6 100644
> --- a/arch/arm/boot/dts/sama5d3_uart.dtsi
> +++ b/arch/arm/boot/dts/sama5d3_uart.dtsi
> @@ -9,7 +9,7 @@
>  
>  #include <dt-bindings/pinctrl/at91.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> -#include <dt-bindings/clk/at91.h>
> +#include <dt-bindings/clock/at91.h>
>  
>  / {
>  	aliases {
> diff --git a/include/dt-bindings/clk/at91.h b/include/dt-bindings/clock/at91.h
> similarity index 100%
> rename from include/dt-bindings/clk/at91.h
> rename to include/dt-bindings/clock/at91.h
> 


-- 
Nicolas Ferre
