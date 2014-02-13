From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 10/14] Documentation: mfd: s2mps11: Document support for
 S2MPS14
Date: Thu, 13 Feb 2014 15:55:07 +0100
Message-ID: <52FCDCCB.70908@samsung.com>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-11-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:16379 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751385AbaBMOzN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 09:55:13 -0500
In-reply-to: <1392282847-25444-11-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

Hi,

On 13.02.2014 10:14, Krzysztof Kozlowski wrote:
> Add bindings documentation for S2MPS14 device to the s2mps11 driver.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/mfd/s2mps11.txt |   12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> index 15ee89c3cc7b..f69bec294f02 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -1,5 +1,5 @@
>
> -* Samsung S2MPS11 Voltage and Current Regulator
> +* Samsung S2MPS11 and S2MPS14 Voltage and Current Regulator
>
>   The Samsung S2MPS11 is a multi-function device which includes voltage and
>   current regulators, RTC, charger controller and other sub-blocks. It is
> @@ -7,7 +7,7 @@ interfaced to the host controller using an I2C interface. Each sub-block is
>   addressed by the host system using different I2C slave addresses.
>
>   Required properties:
> -- compatible: Should be "samsung,s2mps11-pmic".
> +- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-pmic".
>   - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
>
>   Optional properties:
> @@ -59,10 +59,14 @@ supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
>   as per the datasheet of s2mps11.
>
>   	- LDOn
> -		  - valid values for n are 1 to 38
> +		  - valid values for n are:
> +			- S2MPS11: 1 to 38
> +			- S2MPS14: 1 to 25
>   		  - Example: LDO1, LD02, LDO28
>   	- BUCKn
> -		  - valid values for n are 1 to 10.
> +		  - valid values for n are:
> +			- S2MPS11: 1 to 10
> +			- S2MPS14: 1 to 5
>   		  - Example: BUCK1, BUCK2, BUCK9
>
>   Example:
>

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
