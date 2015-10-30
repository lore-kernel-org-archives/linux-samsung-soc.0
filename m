From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: sec-core: Rename MFD and regulator names
 differently
Date: Fri, 30 Oct 2015 12:24:37 +0000
Message-ID: <20151030122437.GT4058@x1>
References: <1446202913-20467-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446202913-20467-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: broonie@kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 30 Oct 2015, Alim Akhtar wrote:

> Currently S2MPSXX multifunction device is named as *-pmic,
> and this MFD also supports regulator as a one of its MFD cell which
> has the same name, which is a bit confusing.
>=20
> We did discussed different approaches about how the MFD and it
> cells need to be named here [1].
> Based in the discussion this patch rename MFD regulator name as
> *-regulator instead of current *-pmic.
>=20
> [1]-> https://lkml.org/lkml/2015/10/28/417
>=20
> Suggested-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/mfd/sec-core.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

You need to squash these patches together, or you will hurt
bisectability for your platform.
 =20
But the code looks good:
  Acked-by: Lee Jones <lee.jones@linaro.org>

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

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
