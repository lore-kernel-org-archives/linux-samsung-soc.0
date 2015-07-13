From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/3] mfd: Add DT binding for Maxim MAX77802 IC
Date: Mon, 13 Jul 2015 16:11:44 +0300
Message-ID: <55A3B910.9040009@cogentembedded.com>
References: <1436773348-15316-1-git-send-email-javier@osg.samsung.com>
 <1436773348-15316-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:34715 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751438AbbGMNLq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jul 2015 09:11:46 -0400
Received: by lbbzr7 with SMTP id zr7so1553178lbb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2015 06:11:44 -0700 (PDT)
In-Reply-To: <1436773348-15316-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org

Hello.

On 7/13/2015 10:42 AM, Javier Martinez Canillas wrote:

> The MAX77802 is a chip that contains regulators, 2 32kHz clocks,
> a RTC and an I2C interface to program the individual components.

> The are already DT bindings for the regulators and clocks and
> these reference to a bindings/mfd/max77802.txt file, that didn't
> exist, for the details about the PMIC.

> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>
>   Documentation/devicetree/bindings/mfd/max77802.txt | 26 ++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt

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
> +- reg : Specifies the i2c slave address of PMIC block.
> +- interrupts : This i2c device has an IRQ line connected to the main SoC.
> +- interrupt-parent : The parent interrupt controller.
> +
> +Example:
> +
> +	max77802@09 {

    Sigh, I'm tired of saying this over and over again: please don't name the 
nodes with teh chip names. The ePAPR standard says: "The name of a node should 
be somewhat generic, reflecting the function of the device and not its 3 
precise programming model."

WBR, Sergei
