From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: iio: adc: exynos-adc: Add S5PV210
 variant
Date: Wed, 12 Dec 2018 17:26:04 +0000
Message-ID: <20181212172604.6336779e@archlinux>
References: <20181207191136.5464-1-pawel.mikolaj.chmiel@gmail.com>
        <20181207191136.5464-4-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207191136.5464-4-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, kgene@kernel.org, krzk@kernel.org, xc-racer2@live.ca, broonie@kernel.org, arnaud.pouliquen@st.com, baolin.wang@linaro.org, smohanad@codeaurora.org, eugen.hristev@microchip.com, rdunlap@infradead.org, vilhelm.gray@gmail.com, freeman.liu@spreadtrum.com, marcus.folkesson@gmail.com, geert@linux-m68k.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri,  7 Dec 2018 20:11:36 +0100
Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com> wrote:

> From: Jonathan Bakker <xc-racer2@live.ca>
>=20
> Add information about new compatible for S5PV210
>=20
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>

Applied to the togreg branch of iio.git and pushed out as
testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.txt        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc=
.txt b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
> index 6c49db7f8ad2..a10c1f89037d 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
> @@ -11,7 +11,7 @@ New driver handles the following
> =20
>  Required properties:
>  - compatible:		Must be "samsung,exynos-adc-v1"
> -				for exynos4412/5250 and s5pv210 controllers.
> +				for exynos4412/5250 controllers.
>  			Must be "samsung,exynos-adc-v2" for
>  				future controllers.
>  			Must be "samsung,exynos3250-adc" for
> @@ -28,6 +28,8 @@ Required properties:
>  				the ADC in s3c2443 and compatibles
>  			Must be "samsung,s3c6410-adc" for
>  				the ADC in s3c6410 and compatibles
> +			Must be "samsung,s5pv210-adc" for
> +				the ADC in s5pv210 and compatibles
>  - reg:			List of ADC register address range
>  			- The base address and range of ADC register
>  			- The base address and range of ADC_PHY register (every
