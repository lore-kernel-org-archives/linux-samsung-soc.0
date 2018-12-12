From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/3] iio: adc: Allow selection of Exynos ADC on S5PV210
Date: Wed, 12 Dec 2018 17:22:31 +0000
Message-ID: <20181212172231.0adaf43b@archlinux>
References: <20181207191136.5464-1-pawel.mikolaj.chmiel@gmail.com>
        <20181207191136.5464-3-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207191136.5464-3-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, kgene@kernel.org, krzk@kernel.org, xc-racer2@live.ca, broonie@kernel.org, arnaud.pouliquen@st.com, baolin.wang@linaro.org, smohanad@codeaurora.org, eugen.hristev@microchip.com, rdunlap@infradead.org, vilhelm.gray@gmail.com, freeman.liu@spreadtrum.com, marcus.folkesson@gmail.com, geert@linux-m68k.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri,  7 Dec 2018 20:11:35 +0100
Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com> wrote:

> From: Jonathan Bakker <xc-racer2@live.ca>
>=20
> Make it possible to use Exynos ADC driver on S5PV210 based devices.
>=20
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index a52fea8749a9..20e126ff030e 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -274,7 +274,7 @@ config EP93XX_ADC
> =20
>  config EXYNOS_ADC
>  	tristate "Exynos ADC driver support"
> -	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || (OF && COMPIL=
E_TEST)
> +	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 =
|| (OF && COMPILE_TEST)
>  	depends on HAS_IOMEM
>  	help
>  	  Core support for the ADC block found in the Samsung EXYNOS series
