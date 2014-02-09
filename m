From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: document s3c24xx controller for external
 clock output
Date: Sun, 09 Feb 2014 02:54:40 +0100
Message-ID: <52F6DFE0.7030508@gmail.com>
References: <201312131356.40755.heiko@sntech.de> <201312131359.00450.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:44829 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287AbaBIByv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Feb 2014 20:54:51 -0500
In-Reply-To: <201312131359.00450.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org

Hi Heiko,

On 13.12.2013 13:59, Heiko St=C3=BCbner wrote:
> The clock settings are distributed over a regular register and parts
> of the misccr register.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   .../bindings/clock/samsung,s3c2410-dclk.txt        |   53 +++++++++=
+++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/samsung,=
s3c2410-dclk.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,s3c2410-=
dclk.txt b/Documentation/devicetree/bindings/clock/samsung,s3c2410-dclk=
=2Etxt
> new file mode 100644
> index 0000000..0a1f7b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,s3c2410-dclk.tx=
t
> @@ -0,0 +1,53 @@
> +* Samsung S3C24XX External Clock Output Controller
> +
> +The S3C24XX series can generate clock signals on two clock output pa=
ds.
> +The clock binding described here is applicable to all SoCs in
> +the s3c24x family.
> +
> +Required Properties:
> +
> +- compatible: should be one of the following.
> +  - "samsung,s3c2410-dclk" - controller in S3C2410 SoCs.
> +  - "samsung,s3c2412-dclk" - controller in S3C2412 SoCs.
> +  - "samsung,s3c2440-dclk" - controller in S3C2440 and S3C2442 SoCs.
> +  - "samsung,s3c2443-dclk" - controller in S3C2443 and later SoCs.
> +- reg: physical base address of the controller and length of memory =
mapped
> +  region.
> +- #clock-cells: should be 1.
> +- samsung,misccr: phandle to the syscon managing the misccr register=
, which
> +  holds configuration settings for different soc-components (clocks,=
 usb, ...).

Hmm, looking at the datasheet, DCLK and CLKOUT registers seem to be par=
t=20
of the pin controller. I wonder if there is really a need for different=
=20
driver and device node to handle them.

Could this be simply made a part of the s3c24xx pinctrl driver,=20
extending it to register also a clock provider under the same DT node?

Best regards,
Tomasz
