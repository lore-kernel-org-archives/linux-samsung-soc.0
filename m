From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] mfd: max77686: Remove unused struct
 max77686_opmode_data
Date: Thu, 7 May 2015 07:58:03 +0100
Message-ID: <20150507065803.GA3400@x1>
References: <1430932036-23971-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430932036-23971-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 06 May 2015, Javier Martinez Canillas wrote:

> The defined struct max77686_opmode_data isn't used neither by
> the max77686 mfd driver nor the drivers for its sub-devices.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>  include/linux/mfd/max77686.h | 5 -----
>  1 file changed, 5 deletions(-)

Applied, thanks.

> diff --git a/include/linux/mfd/max77686.h b/include/linux/mfd/max7768=
6.h
> index bb995ab9a575..d4b72d519115 100644
> --- a/include/linux/mfd/max77686.h
> +++ b/include/linux/mfd/max77686.h
> @@ -125,9 +125,4 @@ enum max77686_opmode {
>  	MAX77686_OPMODE_STANDBY,
>  };
> =20
> -struct max77686_opmode_data {
> -	int id;
> -	int mode;
> -};
> -
>  #endif /* __LINUX_MFD_MAX77686_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
