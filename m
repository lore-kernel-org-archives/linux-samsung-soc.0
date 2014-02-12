From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 08/14] mfd: sec: Add support for S2MPS14
Date: Wed, 12 Feb 2014 09:17:24 +0000
Message-ID: <20140212091724.GS15081@lee--X1>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-9-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392123837-5517-9-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

> Add support for S2MPS14 PMIC device to the MFD sec-core driver.
> The S2MPS14 is similar to S2MPS11 but it has fewer regulators, two
> clocks instead of three and a little different registers layout.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/sec-core.c              |   48 +++++++++--
>  drivers/mfd/sec-irq.c               |   89 +++++++++++++++++++-
>  include/linux/mfd/samsung/core.h    |    1 +
>  include/linux/mfd/samsung/irq.h     |   27 +++++++
>  include/linux/mfd/samsung/rtc.h     |   56 +++++++++++--
>  include/linux/mfd/samsung/s2mps14.h |  152 +++++++++++++++++++++++++=
++++++++++
>  6 files changed, 361 insertions(+), 12 deletions(-)
>  create mode 100644 include/linux/mfd/samsung/s2mps14.h
>=20
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c

<snip>

> +static const struct mfd_cell s2mps14_devs[] =3D {
> +	{
> +		.name =3D "s2mps14-pmic",
> +	}, {
> +		.name =3D "s2mps14-rtc",
> +	}, {
> +		.name =3D "s2mps14-clk",
> +	}
> +};

No device tree support for the children?

<Snip>

> +#define S2MPS14_LDO_VSEL_MASK	0x3F
> +#define S2MPS14_BUCK_VSEL_MASK	0xFF
> +#define S2MPS14_ENABLE_MASK	(0x03 << S2MPS14_ENABLE_SHIFT)
> +#define S2MPS14_ENABLE_SHIFT	6
> +#define S2MPS14_LDO_N_VOLTAGES	(S2MPS14_LDO_VSEL_MASK + 1)
> +#define S2MPS14_BUCK_N_VOLTAGES (S2MPS14_BUCK_VSEL_MASK + 1)

Nit: Can you line these up using tabs please?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
