From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: s2mps11: add documentation for
 s2mps15 PMIC
Date: Fri, 30 Oct 2015 17:24:14 +0000
Message-ID: <20151030172414.GC4058@x1>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
 <1446186334-16510-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:36206 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752495AbbJ3RYV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 13:24:21 -0400
Received: by wicfx6 with SMTP id fx6so15063852wic.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2015 10:24:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1446186334-16510-2-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: broonie@kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, devicetree@vger.kernel.org

On Fri, 30 Oct 2015, Alim Akhtar wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
>=20
> Add dt-binding documentation for s2mps15 PMIC device. The s2mps15 dev=
ice
> is similar to s2mps11/14 PMIC device and has 27 LDO and 10 buck regul=
ators.
> This also supports RTC and three 32.768KHz clock outputs.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt |   21 +++++++++++=
+++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index 890f0b0e1643..4c0543ceec25 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -1,5 +1,5 @@
> =20
> -* Samsung S2MPS11, S2MPS13, S2MPS14 and S2MPU02 Voltage and Current =
Regulator
> +* Samsung S2MPS11/13/14/15 and S2MPU02 Voltage and Current Regulator
> =20
>  The Samsung S2MPS11 is a multi-function device which includes voltag=
e and
>  current regulators, RTC, charger controller and other sub-blocks. It=
 is
> @@ -7,8 +7,12 @@ interfaced to the host controller using an I2C inter=
face. Each sub-block is
>  addressed by the host system using different I2C slave addresses.
> =20
>  Required properties:
> -- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps13-p=
mic"
> -	      or "samsung,s2mps14-pmic" or "samsung,s2mpu02-pmic".
> +- compatible: Should be one of the following
> +	- "samsung,s2mps11-pmic"
> +	- "samsung,s2mps13-pmic"
> +	- "samsung,s2mps14-pmic"
> +	- "samsung,s2mps15-pmic"
> +	- "samsung,s2mpu02-pmic".
>  - reg: Specifies the I2C slave address of the pmic block. It should =
be 0x66.
> =20
>  Optional properties:
> @@ -24,7 +28,7 @@ Optional properties:
>    unwanted buck warm reset (setting buck voltages to default values)=
=2E
> =20
>  Optional nodes:
> -- clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffe=
red 32.768
> +- clocks: s2mps11, s2mps13, s2mps15 and s5m8767 provide three(AP/CP/=
BT) buffered 32.768
>    KHz outputs, so to register these as clocks with common clock fram=
ework
>    instantiate a sub-node named "clocks". It uses the common clock bi=
nding
>    documented in :
> @@ -37,12 +41,13 @@ Optional nodes:
>      the clock which they consume.
>      Clock               ID           Devices
>      ----------------------------------------------------------
> -    32KhzAP		0            S2MPS11, S2MPS13, S2MPS14, S5M8767
> -    32KhzCP		1            S2MPS11, S2MPS13, S5M8767
> -    32KhzBT		2            S2MPS11, S2MPS13, S2MPS14, S5M8767
> +    32KhzAP		0            S2MPS11, S2MPS13, S2MPS14, S2MPS15, S5M876=
7
> +    32KhzCP		1            S2MPS11, S2MPS13, S2MPS15, S5M8767
> +    32KhzBT		2            S2MPS11, S2MPS13, S2MPS14, S2MPS15, S5M876=
7
> =20
>    - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2=
mps13-clk",
>  		"samsung,s2mps14-clk", "samsung,s5m8767-clk"
> +    The s2msp15 uses the same compatible as s2mps13, as both provide=
s similar clocks.
> =20
>  - regulators: The regulators of s2mps11 that have to be instantiated=
 should be
>  included in a sub-node named 'regulators'. Regulator nodes included =
in this
> @@ -90,6 +95,7 @@ as per the datasheet of s2mps11.
>  			- S2MPS11: 1 to 38
>  			- S2MPS13: 1 to 40
>  			- S2MPS14: 1 to 25
> +			- S2MPS15: 1 to 27
>  			- S2MPU02: 1 to 28
>  		  - Example: LDO1, LDO2, LDO28
>  	- BUCKn
> @@ -97,6 +103,7 @@ as per the datasheet of s2mps11.
>  			- S2MPS11: 1 to 10
>  			- S2MPS13: 1 to 10
>  			- S2MPS14: 1 to 5
> +			- S2MPS15: 1 to 10
>  			- S2MPU02: 1 to 7
>  		  - Example: BUCK1, BUCK2, BUCK9
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
