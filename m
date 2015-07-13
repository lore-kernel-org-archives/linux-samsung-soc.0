From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] mfd: Add DT binding for Maxim MAX77802 IC
Date: Mon, 13 Jul 2015 16:53:57 +0900
Message-ID: <55A36E95.8030509@samsung.com>
References: <1436773348-15316-1-git-send-email-javier@osg.samsung.com>
 <1436773348-15316-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28734 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900AbbGMHyD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jul 2015 03:54:03 -0400
In-reply-to: <1436773348-15316-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 13.07.2015 16:42, Javier Martinez Canillas wrote:
> The MAX77802 is a chip that contains regulators, 2 32kHz clocks,
> a RTC and an I2C interface to program the individual components.
> 
> The are already DT bindings for the regulators and clocks and
> these reference to a bindings/mfd/max77802.txt file, that didn't
> exist, for the details about the PMIC.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  Documentation/devicetree/bindings/mfd/max77802.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt

I wonder what happened with previous email...
http://www.spinics.net/lists/kernel/msg1784726.html

> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77802.txt b/Documentation/devicetree/bindings/mfd/max77802.txt
> new file mode 100644
> index 000000000000..875ebebbc5b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max77802.txt
> @@ -0,0 +1,26 @@
> +Maxim MAX77802 multi-function device
> +
> +The Maxim MAX77802 is a power management chip (PMIC) that contains 10 high
> +efficiency Buck regulators, 32 Low-dropout (LDO) regulators used to power
> +up application processors and peripherals, a 2-channel 32kHz clock outputs,
> +a Real-Time-Clock (RTC) and a I2C interface to program the individual
> +regulators, clocks outputs and the RTC.
> +
> +Binding for the built-in 32k clock generator block is defined separately
> +in the bindings/clk/maxim,max77802.txt file and binding for the regulators
> +is defined in the bindings/regulator/max77802.txt file.
> +
> +Required properties:
> +- compatible : Must be "maxim,max77686";

Shouldn't this be 77802?

Best regards,
Krzysztof

> +- reg : Specifies the i2c slave address of PMIC block.
> +- interrupts : This i2c device has an IRQ line connected to the main SoC.
> +- interrupt-parent : The parent interrupt controller.
> +
> +Example:
> +
> +	max77802@09 {
> +		compatible = "maxim,max77802";
> +		interrupt-parent = <&intc>;
> +		interrupts = <26 0>;
> +		reg = <0x09>;
> +	};
> 
