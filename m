From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 6/6] ARM: dts: Add sound support to exynos5250-spring
Date: Thu, 19 Feb 2015 15:05:14 +0100
Message-ID: <54E5ED9A.90802@collabora.co.uk>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de> <1424283959-16289-7-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424283959-16289-7-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andreas,

On 02/18/2015 07:25 PM, Andreas F=C3=A4rber wrote:
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  arch/arm/boot/dts/exynos5250-spring.dts | 25 +++++++++++++++++++++++=
++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/=
dts/exynos5250-spring.dts
> index 866beb4e0597..142e0550e223 100644
> --- a/arch/arm/boot/dts/exynos5250-spring.dts
> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> @@ -49,6 +49,17 @@
>  		};
>  	};
> =20
> +	sound {
> +		compatible =3D "google,snow-audio-max98089";
> +		samsung,model =3D "Spring-I2S-MAX98089";
> +		samsung,i2s-controller =3D <&i2s0>;
> +		samsung,audio-codec =3D <&max98089>;
> +		clocks =3D <&pmu_system_controller 0>;
> +		clock-names =3D "mclk";

Related to my comment in patch 1/6, "mclk" should be defined in the cod=
ec
device node. I know that you probably used as a reference Tushar's patc=
h
[0] I posted recently but I just figured out that his dependency patch =
[1]
mentioned in [2] handled the master clock in the ASoC machine driver bu=
t
the final version merged handled it in the codec drivers.

I asked Kukjin to drop the patch to Snow and Peach Pit/Pi and will post
a correct version as a part of a series once I've sound working.

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&mic_det_gpio>, <&hp_det_gpio>;
> +	};
> +

The mic and headphone jack detection are still not supported in the Sno=
w
ASoC machine driver so this pinctrl are not needed but I guess it doesn=
't
hurt to have them mux'ed too.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/2/6/495
[1]: https://lkml.org/lkml/2014/5/20/4
[2]: https://patches.linaro.org/30406/
