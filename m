From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] mfd: sec-core: Add of_compatible strings for MFD
 cells
Date: Mon, 10 Mar 2014 12:46:23 +0000
Message-ID: <20140310124623.GA18561@lee--X1>
References: <1394454858-3139-1-git-send-email-k.kozlowski@samsung.com>
 <1394454858-3139-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394454858-3139-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

> Add of_compatible strings for S5M8767 RTC, S5M8767 clock and S2MPS14
> clock MFD cells.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/sec-core.c |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index d163c66edebb..e8ac2e3c1f58 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -57,8 +57,10 @@ static const struct mfd_cell s5m8767_devs[] =3D {
>  		.name =3D "s5m8767-pmic",
>  	}, {
>  		.name =3D "s5m-rtc",
> +		.of_compatible =3D "samsung,s5m8767-rtc",
>  	}, {
>  		.name =3D "s5m8767-clk",
> +		.of_compatible =3D "samsung,s5m8767-clk",
>  	}
>  };
> =20
> @@ -77,6 +79,7 @@ static const struct mfd_cell s2mps14_devs[] =3D {
>  		.name =3D "s2mps14-rtc",
>  	}, {
>  		.name =3D "s2mps14-clk",
> +		.of_compatible =3D "samsung,s2mps14-clk",
>  	}
>  };

Any reason for not applying compatible strings for the other devices?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
