From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/5] ARM: dts: Add dp-controller node to exynos5250-snow
Date: Wed, 2 Oct 2013 14:10:18 -0700
Message-ID: <CAOesGMj3142o1B_33BqtLZMbObn2tjfBaBHvAB-2+O+XOuCjSw@mail.gmail.com>
References: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
	<1380670860-17621-3-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1380670860-17621-3-git-send-email-seanpaul@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, airlied@linux.ie
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 1, 2013 at 4:40 PM, Sean Paul <seanpaul@chromium.org> wrote:
> This patch adds the dp-controller node to the exynos5250-snow board dts
> file.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index e5af3f2..780511a 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -190,6 +190,18 @@
>                 samsung,vbus-gpio = <&gpx1 1 0>;
>         };
>
> +       dp-controller {
> +               samsung,color-space = <0>;
> +               samsung,dynamic-range = <0>;
> +               samsung,ycbcr-coeff = <0>;
> +               samsung,color-depth = <1>;
> +               samsung,link-rate = <0x0a>;
> +               samsung,lane-count = <2>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&dp_hpd>;
> +       };

This won't actually do what I think you want. Since the dtsi has the
node name "dp-controller@145B0000", you will end up duplicating a new
node and not build on top of that one.

There's two ways to do it: Always include the unit address, or create
a label in the dtsi such that:

dp_controller: dp-controller@ {....
}

Then in your dts you can, at the root level:

&dp_controller {
  ... new stuff and overrides ...
};



-Olof
