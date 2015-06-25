From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mfd: Remove MFD_CROS_EC_SPI depends on OF
Date: Thu, 25 Jun 2015 09:38:30 +0100
Message-ID: <20150625083830.GU15013@x1>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
 <1435191645-6022-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435191645-6022-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 25 Jun 2015, Javier Martinez Canillas wrote:

> The ChromeOS EC SPI transport driver has a dependency on OF because i=
t
> uses some OF helpers from the <linux/of.h> header. But there isn't a
> need for an explicit dependency since the header has stub functions i=
f
> CONFIG_OF is not defined.
>=20
> Also, MFD_CROS_EC_SPI already depends on MFD_CROS_EC which in turn ha=
s
> a dependency on OF so in practice can't be selected without CONFIG_OF=
=2E
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
>=20
> ---
>=20
>  drivers/mfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for v4.3, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 653815950aa2..3f68dd251ce8 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -115,7 +115,7 @@ config MFD_CROS_EC_I2C
> =20
>  config MFD_CROS_EC_SPI
>  	tristate "ChromeOS Embedded Controller (SPI)"
> -	depends on MFD_CROS_EC && CROS_EC_PROTO && SPI && OF
> +	depends on MFD_CROS_EC && CROS_EC_PROTO && SPI
> =20
>  	---help---
>  	  If you say Y here, you get support for talking to the ChromeOS EC

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
