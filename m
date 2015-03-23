From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: sec-core: Enable RTC on S2MPS11 PMIC
Date: Mon, 23 Mar 2015 13:21:47 +0000
Message-ID: <20150323132147.GG24804@x1>
References: <1426595777-10223-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426595777-10223-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 17 Mar 2015, Krzysztof Kozlowski wrote:

> The S2MPS11 PMIC (present on Arndale Octa board) has the same RTC mod=
ule
> as S2MPS14 device. Add respective mfd cell to enable it.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/sec-core.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 59bf322feacd..e08623807a62 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -69,6 +69,8 @@ static const struct mfd_cell s2mps11_devs[] =3D {
>  	{
>  		.name =3D "s2mps11-pmic",
>  	}, {
> +		.name =3D "s2mps14-rtc",
> +	}, {
>  		.name =3D "s2mps11-clk",
>  		.of_compatible =3D "samsung,s2mps11-clk",
>  	}

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
