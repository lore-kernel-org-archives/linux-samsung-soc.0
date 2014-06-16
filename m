From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/5] clk: Add driver for Maxim 77802 PMIC clocks
Date: Mon, 16 Jun 2014 09:44:27 +0100
Message-ID: <20140616084427.GG14323@lee--X1>
References: <1402306670-17041-1-git-send-email-javier.martinez@collabora.co.uk>
 <1402306670-17041-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402306670-17041-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

> The MAX77802 PMIC has two 32.768kHz Buffered Clock Outputs with
> Low Jitter Mode. This patch adds support for these two clocks.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>  .../devicetree/bindings/clock/maxim,max77802.txt   |  40 ++++
>  drivers/clk/Kconfig                                |   6 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-max77802.c                         | 253 +++++++++++=
++++++++++
>  drivers/mfd/max77802.c                             |   3 +
>  include/dt-bindings/clock/maxim,max77802.h         |  22 ++
>  6 files changed, 325 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/maxim,max=
77802.txt
>  create mode 100644 drivers/clk/clk-max77802.c
>  create mode 100644 include/dt-bindings/clock/maxim,max77802.h

[...]

> diff --git a/drivers/mfd/max77802.c b/drivers/mfd/max77802.c
> index 59696dd..33e8023 100644
> --- a/drivers/mfd/max77802.c
> +++ b/drivers/mfd/max77802.c
> @@ -35,6 +35,9 @@
> =20
>  static const struct mfd_cell max77802_devs[] =3D {
>  	{ .name =3D "max77802-pmic", },
> +#if defined(CONFIG_COMMON_CLK_MAX77802)

No, don't do that.  If COMMON_CLK_MAX77802 is not defined it just
won't be matched, which is enough to ensure it won't be probed.

> +	{ .name =3D "max77802-clk", },
> +#endif
>  };

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
