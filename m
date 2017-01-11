From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: Add support for samsung s6e3ha2 panel binding
Date: Wed, 11 Jan 2017 21:02:22 +0900
Message-ID: <CAGTfZH0A7zunzPrWz0HtEuKOd-Cdo543XmV=zQH2m3MzZOO8-g@mail.gmail.com>
References: <CGME20170111063407epcas1p46379fc5062afe1268b186514969e225e@epcas1p4.samsung.com>
 <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com> <1484116439-7275-2-git-send-email-hoegeun.kwon@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484116439-7275-2-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, thierry.reding@gmail.com, airlied@linux.ie, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Hoegeun,

2017-01-11 15:33 GMT+09:00 Hoegeun Kwon <hoegeun.kwon@samsung.com>:
> The Samsung s6e3ha2 is a 5.7" 1440x2560 AMOLED panel connected
> using MIPI-DSI interfaces.
>
> Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>

I think my tested-by tag is improper against binding documentation.
Maybe you added the my tested-by tag when you split the panel
driver because I replied my tested-by tag to panel driver.

You better to drop the my tested-by tag from only this patch
(binding documentation).

> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  .../bindings/display/panel/samsung,s6e3ha2.txt     | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
> new file mode 100644
> index 0000000..3e7892c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
> @@ -0,0 +1,26 @@
> +Samsung S6E3HA2 5.7" 1440x2560 AMOLED panel
> +
> +Required properties:
> +  - compatible: "samsung,s6e3ha2"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: I/O voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpios: a GPIO spec for the reset pin (active low)
> +  - enable-gpios: a GPIO spec for the panel enable pin (active high)
> +  - te-gpios: a GPIO spec for the tearing effect synchronization signal
> +    gpio pin (active high)
> +
> +Example:
> +&dsi {
> +       ...
> +
> +       panel@0 {
> +               compatible = "samsung,s6e3ha2";
> +               reg = <0>;
> +               vdd3-supply = <&ldo27_reg>;
> +               vci-supply = <&ldo28_reg>;
> +               reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
> +               enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +               te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
> +       };
> +};
> --
> 1.9.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
