From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND RFT PATCH 2/2] mfd: max14577: Allow driver to be built
 as a module
Date: Thu, 16 Jun 2016 11:40:48 +0100
Message-ID: <20160616104048.GU4948@dell>
References: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
 <1464280340-13228-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464280340-13228-3-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 26 May 2016, Javier Martinez Canillas wrote:

> The driver's Kconfig symbol is a boolean but nothing prevents the dri=
ver
> to be built as a module instead of built-in. It is true that most sys=
tem
> integrators will choose the latter but the config should not restrict=
 it.

Does the driver have all of the module related code?

> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> ---
>=20
>  drivers/mfd/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index a49565cc1a6b..33d112f390fe 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -514,8 +514,8 @@ config MFD_88PM860X
>  	  battery-charger under the corresponding menus.
> =20
>  config MFD_MAX14577
> -	bool "Maxim Semiconductor MAX14577/77836 MUIC + Charger Support"
> -	depends on I2C=3Dy
> +	tristate "Maxim Semiconductor MAX14577/77836 MUIC + Charger Support=
"
> +	depends on I2C
>  	select MFD_CORE
>  	select REGMAP_I2C
>  	select REGMAP_IRQ

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
