From: Felipe Balbi <balbi@ti.com>
Subject: Re: [RFC][PATCH 1/5] USB: DWC OTG: Modification in DWC OTG driver
 for ARM based SoCs.
Date: Tue, 21 Jun 2011 12:25:07 +0300
Message-ID: <20110621092506.GK28225@legolas.emea.dhcp.ti.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
 <1308639827-2121-2-git-send-email-p.paneri@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhAUiXSLan16V5i8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog108.obsmtp.com ([74.125.149.199]:50478 "EHLO
	na3sys009aog108.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755971Ab1FUJZN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 05:25:13 -0400
Content-Disposition: inline
In-Reply-To: <1308639827-2121-2-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: p.paneri@samsung.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, tmarri@apm.com, naushad@samsung.com, thomas.ab@samsung.com, a.kesavan@samsung.com


--nhAUiXSLan16V5i8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 21, 2011 at 12:33:43PM +0530, p.paneri@samsung.com wrote:
> From: Praveen Paneri <p.paneri@samsung.com>
>=20
> This patch modifies DWC OTG for ARM based SoCs. Currently it has
> been tested for Samsung S5P6440. Can easily be built for others
> as well.
>=20
> Following features are tested for basic functions on SMDK6440
> board after modifications:
> OTG HOST: HID and mass-storage
> OTG DEVICE: mass-storage and adb
>=20
> Signed-off-by: Praveen Paneri <p.paneri@samsung.com>

this is wrong is so many levels... We shouldn't be adding ifdefs to
allow the driver to be compiled for multiple architectures. The correct
way to handle this, is to phase out the core driver from the SoC- or
PCI-specific parts and make that a glue layer that bridges to the core
driver.

I'm writing the driver for a similar core, the DWC USB3, take a look at
my dwc3 branch [1] to see how this should be done.

> diff --git a/drivers/usb/dwc/apmppc.c b/drivers/usb/dwc/apmppc.c
> index ffbe6dd..b0dcae9 100644
> --- a/drivers/usb/dwc/apmppc.c
> +++ b/drivers/usb/dwc/apmppc.c
> @@ -50,9 +50,6 @@
>   * this file system to perform diagnostics on the driver components or t=
he
>   * device.
>   */
> -
> -#include <linux/of_platform.h>
> -
>  #include "driver.h"
> =20
>  #define DWC_DRIVER_VERSION		"1.05"
> @@ -110,6 +107,9 @@ static int __devexit dwc_otg_driver_remove(struct pla=
tform_device *ofdev)
>  {
>  	struct device *dev =3D &ofdev->dev;
>  	struct dwc_otg_device *dwc_dev =3D dev_get_drvdata(dev);
> +#ifdef CONFIG_CPU_S5P6440
> +	struct s5p_otg_platdata *pdata =3D ofdev->dev.platform_data;
> +#endif

NAK

> @@ -152,6 +152,11 @@ static int __devexit dwc_otg_driver_remove(struct pl=
atform_device *ofdev)
> =20
>  	/* Clear the drvdata pointer. */
>  	dev_set_drvdata(dev, NULL);
> +#ifdef CONFIG_CPU_S5P6440
> +	/* OTG Phy off */
> +	if (pdata && pdata->phy_exit)
> +		pdata->phy_exit(ofdev, S5P_USB_PHY_DEVICE);
> +#endif

NAK

> @@ -169,12 +174,14 @@ static int __devinit dwc_otg_driver_probe(struct pl=
atform_device *ofdev)
>  	int retval;
>  	struct dwc_otg_device *dwc_dev;
>  	struct device *dev =3D &ofdev->dev;
> +#ifdef CONFIG_CPU_S5P6440
> +	struct s5p_otg_platdata *pdata =3D ofdev->dev.platform_data;
> +#endif

NAK

> @@ -182,15 +189,24 @@ static int __devinit dwc_otg_driver_probe(struct pl=
atform_device *ofdev)
>  		goto fail_dwc_dev;
>  	}
> =20
> +#ifdef CONFIG_CPU_S5P6440
> +	/* OTG Phy init */
> +	if (pdata && pdata->phy_init)
> +		pdata->phy_init(ofdev, S5P_USB_PHY_DEVICE);
> +#endif
>  	/* Retrieve the memory and IRQ resources. */
> +#ifdef CONFIG_ARM
> +	dwc_dev->irq =3D ofdev->resource[1].start;
> +#else
>  	dwc_dev->irq =3D irq_of_parse_and_map(ofdev->dev.of_node, 0);
> +#endif

NAK

> +#ifndef CONFIG_ARM

NAK

> @@ -200,8 +216,14 @@ static int __devinit dwc_otg_driver_probe(struct pla=
tform_device *ofdev)
>  	dev_dbg(dev, "OTG - ioresource_mem start0x%llx: end:0x%llx\n",
>  		(unsigned long long)res.start, (unsigned long long)res.end);
> =20
> +
>  	dwc_dev->phys_addr =3D res.start;
>  	dwc_dev->base_len =3D res.end - res.start + 1;
> +#else
> +	dwc_dev->phys_addr =3D ofdev->resource[0].start;
> +	dwc_dev->base_len =3D ofdev->resource[0].end -
> +				ofdev->resource[0].start + 1;
> +#endif

NAK

> @@ -296,6 +318,7 @@ static int __devinit dwc_otg_driver_probe(struct plat=
form_device *ofdev)
>  			dwc_dev->hcd =3D NULL;
>  			goto fail_hcd;
>  		}
> +#ifndef CONFIG_ARM

NAK

> @@ -316,6 +339,7 @@ static int __devinit dwc_otg_driver_probe(struct plat=
form_device *ofdev)
>  				dwc_dev->hcd->cp_irq_installed =3D 1;
>  			}
>  		}
> +#endif

NAK

> diff --git a/drivers/usb/dwc/cil.h b/drivers/usb/dwc/cil.h
> index 80b7da5..c1a11f1 100644
> --- a/drivers/usb/dwc/cil.h
> +++ b/drivers/usb/dwc/cil.h
> @@ -37,6 +37,15 @@
>  #if !defined(__DWC_CIL_H__)
>  #define __DWC_CIL_H__
>  #include <linux/io.h>
> +#ifdef CONFIG_ARM
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <plat/otg.h>
> +#include <plat/usb-phy.h>
> +#else
> +#include <linux/of_platform.h>
> +#endif

I can't even say how ugly this is.

> diff --git a/drivers/usb/dwc/param.c b/drivers/usb/dwc/param.c
> index 523f0db..b48c510 100644
> --- a/drivers/usb/dwc/param.c
> +++ b/drivers/usb/dwc/param.c
> @@ -116,8 +116,12 @@ static int set_valid_tx_fifo_sizes(struct core_if *c=
ore_if)
>   * This function is called during module intialization to verify that
>   * the module parameters are in a valid state.
>   */
> -int __devinit check_parameters(struct core_if *core_if)
> +int __devinit check_parameters(struct core_if *core_if,
> +						struct platform_device *ofdev)
>  {
> +#ifdef CONFIG_CPU_S5P6440
> +	struct s5p_otg_platdata *pdata =3D ofdev->dev.platform_data;
> +#endif

NAK.

> @@ -145,6 +149,23 @@ int __devinit check_parameters(struct core_if *core_=
if)
>  	 */
>  	dwc_otg_module_params.enable_dynamic_fifo =3D
>  	    DWC_HWCFG2_DYN_FIFO_RD(core_if->hwcfg2);
> +#ifdef CONFIG_CPU_S5P6440
> +	if (pdata && pdata->dev_rx_fifo_size)
> +		dwc_otg_module_params.dev_rx_fifo_size =3D
> +						pdata->dev_rx_fifo_size;
> +	if (pdata && pdata->dev_nptx_fifo_size)
> +		dwc_otg_module_params.dev_nperio_tx_fifo_size =3D
> +						pdata->dev_nptx_fifo_size;
> +
> +	if (pdata && pdata->host_rx_fifo_size)
> +		dwc_otg_module_params.host_rx_fifo_size =3D
> +						pdata->host_rx_fifo_size;
> +	if (pdata && pdata->host_nptx_fifo_size)
> +		dwc_otg_module_params.host_nperio_tx_fifo_size =3D
> +						pdata->host_nptx_fifo_size;
> +	if (pdata && pdata->host_ch_num)
> +		dwc_otg_module_params.host_channels =3D pdata->host_ch_num;
> +#else

then let's say another company licenses this core from Synopsys. Will
you add another pre-processor directive here ?


[1]
http://git.kernel.org/?p=3Dlinux/kernel/git/balbi/usb.git;a=3Dtree;f=3Ddriv=
ers/usb/dwc3;h=3D6ace38c51cfab18de3be257f86ae2c9afabf8237;hb=3Drefs/heads/d=
wc3

--=20
balbi

--nhAUiXSLan16V5i8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOAGNyAAoJEAv8Txj19kN1DTYH/21UaRkQsz1wSkm+7hBTZr5u
Gqfk/iQw6lHDZUDxSofBI9XiRfZxJxFLjxwqbjki8eKh/zwlyPG0ZQBiVrw3Q+et
OBXXqSR+P7FRdogJQqBogp+dOp8grXFPf8eglfcnOttmmESzOhaXoHuvPPsGFASQ
ankhXuED7thi+FG/873HeSJncm0oFhBBsJMH1z6YvLhsaTmD/qnF6Ef5vkDW1mFf
MLt2fIAuj+HgP6M7WLSZVWXiKCyB/YbBjrbKsNXSkB+Nm0EUlZ7d2iHj9intLI0w
0EUIhmjSowOoDMy5yvRojiUVOQLS1wyoilUPx+zfSLFPZQbrmc2k+9oeZKffnSI=
=XZwW
-----END PGP SIGNATURE-----

--nhAUiXSLan16V5i8--
