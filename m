From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Calibrate LOS levels for exynos5420/5800
Date: Mon, 18 Sep 2017 13:38:21 +0300
Message-ID: <87y3pcmgv6.fsf@linux.intel.com>
References: <1505728934-6200-1-git-send-email-andrzej.p@samsung.com> <CGME20170918100944eucas1p2735d3d6a6ee562b927fb9dfaeb0d4090@eucas1p2.samsung.com> <1505729371-6509-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:35368 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751365AbdIRKih (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 06:38:37 -0400
In-Reply-To: <1505729371-6509-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Andrzej Pietrasiewicz <andrzej.p@samsung.com> writes:
> From: Vivek Gautam <gautam.vivek@samsung.com>
>
> Adding phy calibration sequence for USB 3.0 DRD PHY present on
> Exynos5420/5800 systems.
> This calibration facilitates setting certain PHY parameters viz.
> the Loss-of-Signal (LOS) Detector Threshold Level, as well as
> Tx-Vboost-Level for Super-Speed operations.
> Additionally we also set proper time to wait for RxDetect measurement,
> for desired PHY reference clock, so as to solve issue with enumeration
> of few USB 3.0 devices, like Samsung SUM-TSB16S 3.0 USB drive
> on the controller.
>
> We are using CR_port for this purpose to send required data
> to override the LOS values.
>
> On testing with USB 3.0 devices on USB 3.0 port present on
> SMDK5420, and peach-pit boards should see following message:
> usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
>
> and without this patch, should see below shown message:
> usb 1-1: new high-speed USB device number 2 using xhci-hcd
>
> [Also removed unnecessary extra lines in the register macro definitions]
>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> [adapted to use phy_reset as entry point]
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 183 +++++++++++++++++++++++++=
++++++
>  drivers/usb/dwc3/core.c                  |   8 +-
>  2 files changed, 189 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index 7c41daa..f7de067 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -89,7 +89,17 @@
>  #define PHYCLKRST_COMMONONN			BIT(0)
>=20=20
>  #define EXYNOS5_DRD_PHYREG0			0x14
> +#define PHYREG0_SSC_REF_CLK_SEL			BIT(21)
> +#define PHYREG0_SSC_RANGE			BIT(20)
> +#define PHYREG0_CR_WRITE			BIT(19)
> +#define PHYREG0_CR_READ				BIT(18)
> +#define PHYREG0_CR_DATA_IN(_x)			((_x) << 2)
> +#define PHYREG0_CR_CAP_DATA			BIT(1)
> +#define PHYREG0_CR_CAP_ADDR			BIT(0)
> +
>  #define EXYNOS5_DRD_PHYREG1			0x18
> +#define PHYREG1_CR_DATA_OUT(_x)			((_x) << 1)
> +#define PHYREG1_CR_ACK				BIT(0)
>=20=20
>  #define EXYNOS5_DRD_PHYPARAM0			0x1c
>=20=20
> @@ -118,6 +128,25 @@
>  #define EXYNOS5_DRD_PHYRESUME			0x34
>  #define EXYNOS5_DRD_LINKPORT			0x44
>=20=20
> +/* USB 3.0 DRD PHY SS Function Control Reg; accessed by CR_PORT */
> +#define EXYNOS5_DRD_PHYSS_LOSLEVEL_OVRD_IN		(0x15)
> +#define LOSLEVEL_OVRD_IN_LOS_BIAS_5420			(0x5 << 13)
> +#define LOSLEVEL_OVRD_IN_LOS_BIAS_DEFAULT		(0x0 << 13)
> +#define LOSLEVEL_OVRD_IN_EN				(0x1 << 10)
> +#define LOSLEVEL_OVRD_IN_LOS_LEVEL_DEFAULT		(0x9 << 0)
> +
> +#define EXYNOS5_DRD_PHYSS_TX_VBOOSTLEVEL_OVRD_IN	(0x12)
> +#define TX_VBOOSTLEVEL_OVRD_IN_VBOOST_5420		(0x5 << 13)
> +#define TX_VBOOSTLEVEL_OVRD_IN_VBOOST_DEFAULT		(0x4 << 13)
> +
> +#define EXYNOS5_DRD_PHYSS_LANE0_TX_DEBUG		(0x1010)
> +#define LANE0_TX_DEBUG_RXDET_MEAS_TIME_19M2_20M		(0x4 << 4)
> +#define LANE0_TX_DEBUG_RXDET_MEAS_TIME_24M		(0x8 << 4)
> +#define LANE0_TX_DEBUG_RXDET_MEAS_TIME_25M_26M		(0x8 << 4)
> +#define LANE0_TX_DEBUG_RXDET_MEAS_TIME_48M_50M_52M	(0x20 << 4)
> +#define LANE0_TX_DEBUG_RXDET_MEAS_TIME_62M5		(0x20 << 4)
> +#define LANE0_TX_DEBUG_RXDET_MEAS_TIME_96M_100M		(0x40 << 4)
> +
>  #define KHZ	1000
>  #define MHZ	(KHZ * KHZ)
>=20=20
> @@ -526,6 +555,151 @@ static int exynos5_usbdrd_phy_power_off(struct phy =
*phy)
>  	return 0;
>  }
>=20=20
> +static int crport_handshake(struct exynos5_usbdrd_phy *phy_drd,
> +						u32 val, u32 cmd)
> +{
> +	u32 usec =3D 100;
> +	unsigned int result;
> +
> +	writel(val | cmd, phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
> +
> +	do {
> +		result =3D readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYREG1);
> +		if (result & PHYREG1_CR_ACK)
> +			break;
> +
> +		udelay(1);
> +	} while (usec-- > 0);
> +
> +	if (!usec) {
> +		dev_err(phy_drd->dev,
> +			"CRPORT handshake timeout1 (0x%08x)\n", val);
> +		return -ETIME;
> +	}
> +
> +	usec =3D 100;
> +
> +	writel(val, phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
> +
> +	do {
> +		result =3D readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYREG1);
> +		if (!(result & PHYREG1_CR_ACK))
> +			break;
> +
> +		udelay(1);
> +	} while (usec-- > 0);
> +
> +	if (!usec) {
> +		dev_err(phy_drd->dev,
> +			"CRPORT handshake timeout2 (0x%08x)\n", val);
> +		return -ETIME;
> +	}
> +
> +	return 0;
> +}
> +
> +static int crport_ctrl_write(struct exynos5_usbdrd_phy *phy_drd,
> +						u32 addr, u32 data)
> +{
> +	int ret;
> +
> +	/* Write Address */
> +	writel(PHYREG0_CR_DATA_IN(addr),
> +		phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
> +	ret =3D crport_handshake(phy_drd, PHYREG0_CR_DATA_IN(addr),
> +				PHYREG0_CR_CAP_ADDR);
> +	if (ret)
> +		return ret;
> +
> +	/* Write Data */
> +	writel(PHYREG0_CR_DATA_IN(data),
> +		phy_drd->reg_phy + EXYNOS5_DRD_PHYREG0);
> +	ret =3D crport_handshake(phy_drd, PHYREG0_CR_DATA_IN(data),
> +				PHYREG0_CR_CAP_DATA);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D crport_handshake(phy_drd, PHYREG0_CR_DATA_IN(data),
> +				PHYREG0_CR_WRITE);
> +
> +	return ret;
> +}
> +
> +/*
> + * Calibrate few PHY parameters using CR_PORT register to meet
> + * SuperSpeed requirements on Exynos5420 and Exynos5800 systems,
> + * which have 28nm USB 3.0 DRD PHY.
> + */
> +static int exynos5420_usbdrd_phy_calibrate(struct exynos5_usbdrd_phy *ph=
y_drd)
> +{
> +	unsigned int temp;
> +	int ret =3D 0;
> +
> +	/*
> +	 * Change los_bias to (0x5) for 28nm PHY from a
> +	 * default value (0x0); los_level is set as default
> +	 * (0x9) as also reflected in los_level[30:26] bits
> +	 * of PHYPARAM0 register.
> +	 */
> +	temp =3D LOSLEVEL_OVRD_IN_LOS_BIAS_5420 |
> +		LOSLEVEL_OVRD_IN_EN |
> +		LOSLEVEL_OVRD_IN_LOS_LEVEL_DEFAULT;
> +	ret =3D crport_ctrl_write(phy_drd,
> +				EXYNOS5_DRD_PHYSS_LOSLEVEL_OVRD_IN,
> +				temp);
> +	if (ret) {
> +		dev_err(phy_drd->dev,
> +		 "Failed setting Loss-of-Signal level for SuperSpeed\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Set tx_vboost_lvl to (0x5) for 28nm PHY Tuning,
> +	 * to raise Tx signal level from its default value of (0x4)
> +	 */
> +	temp =3D TX_VBOOSTLEVEL_OVRD_IN_VBOOST_5420;
> +	ret =3D crport_ctrl_write(phy_drd,
> +				EXYNOS5_DRD_PHYSS_TX_VBOOSTLEVEL_OVRD_IN,
> +				temp);
> +	if (ret) {
> +		dev_err(phy_drd->dev,
> +		 "Failed setting Tx-Vboost-Level for SuperSpeed\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Set proper time to wait for RxDetect measurement, for
> +	 * desired reference clock of PHY, by tuning the CR_PORT
> +	 * register LANE0.TX_DEBUG which is internal to PHY.
> +	 * This fixes issue with few USB 3.0 devices, which are
> +	 * not detected (not even generate interrupts on the bus
> +	 * on insertion) without this change.
> +	 * e.g. Samsung SUM-TSB16S 3.0 USB drive.
> +	 */
> +	switch (phy_drd->extrefclk) {
> +	case EXYNOS5_FSEL_50MHZ:
> +		temp =3D LANE0_TX_DEBUG_RXDET_MEAS_TIME_48M_50M_52M;
> +		break;
> +	case EXYNOS5_FSEL_20MHZ:
> +	case EXYNOS5_FSEL_19MHZ2:
> +		temp =3D LANE0_TX_DEBUG_RXDET_MEAS_TIME_19M2_20M;
> +		break;
> +	case EXYNOS5_FSEL_24MHZ:
> +	default:
> +		temp =3D LANE0_TX_DEBUG_RXDET_MEAS_TIME_24M;
> +		break;
> +	}
> +
> +	ret =3D crport_ctrl_write(phy_drd,
> +				EXYNOS5_DRD_PHYSS_LANE0_TX_DEBUG,
> +				temp);
> +	if (ret)
> +		dev_err(phy_drd->dev,
> +		 "Failed setting RxDetect measurement time for SuperSpeed\n");
> +
> +	return ret;
> +}
> +
>  static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
>  					struct of_phandle_args *args)
>  {
> @@ -537,11 +711,20 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct =
device *dev,
>  	return phy_drd->phys[args->args[0]].phy;
>  }
>=20=20
> +static int exynos5_usbdrd_phy_reset(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +
> +	return exynos5420_usbdrd_phy_calibrate(phy_drd);
> +}
> +
>  static const struct phy_ops exynos5_usbdrd_phy_ops =3D {
>  	.init		=3D exynos5_usbdrd_phy_init,
>  	.exit		=3D exynos5_usbdrd_phy_exit,
>  	.power_on	=3D exynos5_usbdrd_phy_power_on,
>  	.power_off	=3D exynos5_usbdrd_phy_power_off,
> +	.reset		=3D exynos5_usbdrd_phy_reset,
>  	.owner		=3D THIS_MODULE,
>  };
>=20=20
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 03474d3..1d5836e 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -156,9 +156,10 @@ static void __dwc3_set_mode(struct work_struct *work)
>  		} else {
>  			if (dwc->usb2_phy)
>  				otg_set_vbus(dwc->usb2_phy->otg, true);
> -			if (dwc->usb2_generic_phy)
> +			if (dwc->usb2_generic_phy) {
>  				phy_set_mode(dwc->usb2_generic_phy, PHY_MODE_USB_HOST);
> -
> +				phy_reset(dwc->usb2_generic_phy);

it doesn't look like this is the best place to reset the phy. Also,
=2D>reset() doesn't seem to match correctly with a calibration. That seems
to be more fitting to a ->power_on() or ->init() implementation.

Kishon, any comments?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlm/oh0ACgkQzL64meEa
mQY58hAAoKNHXpLz/tIpSOuAPVoYfR6wMBaZfnMSoSUs2nAamX42ZgQIVtbTkowk
CdtD6JZGsb16ZEr2QK4yBkhILyCLrn5lN+p3lG1pSLOhSdHGKej3ukQZH5cDJYH0
9Wm2QAlUPD5nol6/56ktNm8qSN4qCL1exoO33H5a2N6gxgc/ZnHrbkFhtPSstI4I
b3a9IJBANCJDVNNpbx9Luahpy1d0albPbtTSXt6mAyX6LmynYT7zT8940mshINwe
q6uy77vlZk+qTLau6SgZ18RXDoQgY1Kll6AZai1lCwlOW1/q7ftFovTvAIDpOxo+
isYyMqT4mz8szE9l0bzaLWVHQQaM0oUSOYxdoj75h9WrQzX99TyczgbbUVUouLW0
a4ND0r4qgQXqAXbbCV2Fe4JgmcGoP2cz+3qWTfhz9plFPP/QpM/6J5MJtChe8B8o
mx5Wb0Rezn3es/bvTvevnRAO8dac19orZB1A7bm0sup6MFYL42W7q3Qg2CDl2e/0
OUA/SjrAzAaboSnrvzVDsAEfym4guDxIV1NEJK5bHoE2A9vcNzGbjp7UJX476eTp
fyxfv5ndC9/yDgJ3VRTNKtXslRQeiZYUqIAWhDPJNNUyQPHrljNxuvOq0HbvVng7
I+bn0RrFS7LIzVW7rn10kkYS8KNfEizId2q1Eb5z6yRQCru+SrQ=
=I3vX
-----END PGP SIGNATURE-----
--=-=-=--
