From: Doug Anderson <dianders@google.com>
Subject: Re: [PATCH 3/3] ARM: dts: Enable audio support for Peach-pi board
Date: Fri, 13 Jun 2014 10:03:50 -0700
Message-ID: <CAD=FV=XqqP7+xDOAKCixivzgaO0xvJX7L+CCN+unAEuf-6aUbQ@mail.gmail.com>
References: <1402464739-19044-1-git-send-email-tushar.b@samsung.com>
	<1402464739-19044-4-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:41880 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753647AbaFMRDv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jun 2014 13:03:51 -0400
Received: by mail-vc0-f177.google.com with SMTP id ij19so2532829vcb.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2014 10:03:51 -0700 (PDT)
In-Reply-To: <1402464739-19044-4-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tushar Behera <trblinux@gmail.com>, Mark Brown <broonie@linaro.org>

Tushar,

On Tue, Jun 10, 2014 at 10:32 PM, Tushar Behera <tushar.b@samsung.com> wrote:
> Peach-pi board has MAX98090 audio codec connected on HSI2C-7 bus.

If you want to be a stickler about it, peach-pi actually has a
max98091.  That requires code changes to the i2c driver, though.
...and unfortunately listing two compatible strings for i2c devices is
broken.  :(


> Signed-off-by: Tushar Behera <tushar.b@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   31 +++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index f3af207..76f5966 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -78,9 +78,27 @@
>                 pinctrl-0 = <&usb301_vbus_en>;
>                 enable-active-high;
>         };
> +
> +       sound {
> +               compatible = "google,snow-audio-max98090";
> +
> +               samsung,i2s-controller = <&i2s0>;
> +               samsung,audio-codec = <&max98090>;
> +       };
> +};
> +
> +&i2s0 {
> +       status = "okay";

It would be awfully nice to keep diffs between exynos5420-peach-pit
and exynos5800-peach-pi clean.  They're 99% the same.  I know this has
already gotten messed up with DP/HDMI were added, but there's no need
to make it worse.

Could you add these nodes in the same place within the dts they were
added in exynos5420-peach-pit?
