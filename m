From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] mfd: sec-core: Add cells for S5M8767-clocks
Date: Thu, 31 Oct 2013 09:16:03 -0700
Message-ID: <20131031161603.GB9587@lee--X1>
References: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
 <1383202124-1775-4-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383202124-1775-4-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 31 Oct 2013, Tushar Behera wrote:

> S5M8767 chip has 3 crystal oscillators running at 32KHz. These are
> supported by s2mps11-clk driver.
>=20
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> CC: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/sec-core.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 34c18fb..020b86b 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -56,7 +56,9 @@ static struct mfd_cell s5m8767_devs[] =3D {
>  		.name =3D "s5m8767-pmic",
>  	}, {
>  		.name =3D "s5m-rtc",
> -	},
> +	}, {
> +		.name =3D "s5m8767-clk",
> +	}
>  };
> =20
>  static struct mfd_cell s2mps11_devs[] =3D {

Acked-by: Lee Jones <lee.jones@linaro.org>

I'd prefer to take this patch in via the MFD tree once you have
support from the other maintainers for the set.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
