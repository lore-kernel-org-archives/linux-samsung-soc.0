From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH v2] mfd: sec-core: Rename MFD and regulator names
 differently
Date: Mon, 23 Nov 2015 08:20:58 +0000
Message-ID: <20151123082058.GH3098@x1>
References: <1448016506-8980-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448016506-8980-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: broonie@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 20 Nov 2015, Alim Akhtar wrote:

> Currently S2MPSXX multifunction device is named as *-pmic,
> and these MFDs also supports regulator as a one of its MFD cell which
> has the same name, because current name is confusing and we want to
> sort it out.
>=20
> We did discussed different approaches about how the MFD and it
> cells need to be named here [1].
> Based in the discussion this patch rename MFD regulator name as
> *-regulator instead of current *-pmic.
>=20
> This patch also changes the corresponding entries in the regulator dr=
iver
> to keep git-bisect happy.
>=20
> [1]-> https://lkml.org/lkml/2015/10/28/417
>=20
> Suggested-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
> Resending with collected Reviwed-by, Acked-by tags.
>=20
>  drivers/mfd/sec-core.c      |    8 ++++----
>  drivers/regulator/s2mps11.c |    8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 7c4e7be17f1e..c9802ba9be72 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -68,7 +68,7 @@ static const struct mfd_cell s5m8767_devs[] =3D {
> =20
>  static const struct mfd_cell s2mps11_devs[] =3D {
>  	{
> -		.name =3D "s2mps11-pmic",
> +		.name =3D "s2mps11-regulator",
>  	}, {
>  		.name =3D "s2mps14-rtc",
>  	}, {
> @@ -78,7 +78,7 @@ static const struct mfd_cell s2mps11_devs[] =3D {
>  };
> =20
>  static const struct mfd_cell s2mps13_devs[] =3D {
> -	{ .name =3D "s2mps13-pmic", },
> +	{ .name =3D "s2mps13-regulator", },
>  	{ .name =3D "s2mps13-rtc", },
>  	{
>  		.name =3D "s2mps13-clk",
> @@ -88,7 +88,7 @@ static const struct mfd_cell s2mps13_devs[] =3D {
> =20
>  static const struct mfd_cell s2mps14_devs[] =3D {
>  	{
> -		.name =3D "s2mps14-pmic",
> +		.name =3D "s2mps14-regulator",
>  	}, {
>  		.name =3D "s2mps14-rtc",
>  	}, {
> @@ -116,7 +116,7 @@ static const struct mfd_cell s2mpa01_devs[] =3D {
> =20
>  static const struct mfd_cell s2mpu02_devs[] =3D {
>  	{
> -		.name =3D "s2mpu02-pmic",
> +		.name =3D "s2mpu02-regulator",
>  	},
>  };
> =20
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.=
c
> index b2f3a28e720c..3242ffc0cb25 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -1199,11 +1199,11 @@ out:
>  }
> =20
>  static const struct platform_device_id s2mps11_pmic_id[] =3D {
> -	{ "s2mps11-pmic", S2MPS11X},
> -	{ "s2mps13-pmic", S2MPS13X},
> -	{ "s2mps14-pmic", S2MPS14X},
> +	{ "s2mps11-regulator", S2MPS11X},
> +	{ "s2mps13-regulator", S2MPS13X},
> +	{ "s2mps14-regulator", S2MPS14X},
>  	{ "s2mps15-regulator", S2MPS15X},
> -	{ "s2mpu02-pmic", S2MPU02},
> +	{ "s2mpu02-regulator", S2MPU02},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, s2mps11_pmic_id);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
