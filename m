From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 11 Jan 2017 08:46:34 +0100
Message-ID: <f292435b-8faa-d2e9-17f6-99a4d00173c5@samsung.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas1p4b29b1308a0b8088afd46a475770d4b00@epcas1p4.samsung.com>
 <1484116439-7275-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1484116439-7275-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, krzk@kernel.org, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 11.01.2017 07:33, Hoegeun Kwon wrote:
> From: Hyungwon Hwang <human.hwang@samsung.com>
>
> This patch add the panel device tree node for S6E3HA2 display
> controller to TM2 dts.
>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index ddba2f8..6d362f9 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -18,6 +18,18 @@
>  	compatible = "samsung,tm2", "samsung,exynos5433";
>  };
>  
> +&dsi {
> +	panel@0 {
> +		compatible = "samsung,s6e3ha2";
> +		reg = <0>;
> +		vdd3-supply = <&ldo27_reg>;
> +		vci-supply = <&ldo28_reg>;
> +		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
> +		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
The same here (as in 1st comment) , te-gpios should be dropper - decon
uses hw-trigger.

Regards
Andrzej
> +	};
> +};
> +
>  &hsi2c_9 {
>  	status = "okay";
>  
