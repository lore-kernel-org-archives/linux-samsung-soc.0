From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/3] dt-bindings: Add support for samsung s6e63j0x03 panel
 binding
Date: Mon, 12 Jun 2017 14:29:26 +0200
Message-ID: <70e32f55-431b-fcf2-0d98-8c12ac01794b@samsung.com>
References: <1496984354-5271-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170609045938epcas5p2025914487ca22a0a2d419824402e89e9@epcas5p2.samsung.com>
 <1496984354-5271-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47351 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751944AbdFLM3c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 08:29:32 -0400
In-reply-to: <1496984354-5271-2-git-send-email-hoegeun.kwon@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, inki.dae@samsung.com

Hi Hoegeun,

On 09.06.2017 06:59, Hoegeun Kwon wrote:
> The Samsung s6e63j0x03 is a 1.63" 320x320 AMOLED panel connected using
> MIPI-DSI interfaces.
>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  .../bindings/display/panel/samsung,s6e63j0x03.txt  | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt
> new file mode 100644
> index 0000000..34b6e2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt
> @@ -0,0 +1,24 @@
> +Samsung S6E63J0X03 1.63" 320x320 AMOLED panel

Maybe it would be good to add info about interface, "MIPI DSI command
mode" I suppose.

> +
> +Required properties:
> +  - compatible: "samsung,s6e63j0x03"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: I/O voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpios: a GPIO spec for the reset pin (active high)

Usually reset gpios is active low, also driver code suggests it, if it
is true please fix example also.

With above comments addressed:
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej

> +  - te-gpios: a GPIO spec for the tearing effect synchronization signal
> +    gpio pin (active high)
> +
> +Example:
> +&dsi {
> +	...
> +
> +	panel@0 {
> +		compatible = "samsung,s6e63j0x03";
> +		reg = <0>;
> +		vdd3-supply = <&ldo16_reg>;
> +		vci-supply = <&ldo20_reg>;
> +		reset-gpios = <&gpe0 1 GPIO_ACTIVE_HIGH>;
> +		te-gpios = <&gpx0 6 GPIO_ACTIVE_HIGH>;
> +	};
> +};
