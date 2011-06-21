From: Praveen Paneri <p.paneri@samsung.com>
Subject: Re: [RFC][PATCH 1/5] USB: DWC OTG: Modification in DWC OTG driver for
 ARM based SoCs.
Date: Tue, 21 Jun 2011 17:30:24 +0530
Message-ID: <BANLkTi=Z37=rMtG3DubGBKX4zYx=SUha8A@mail.gmail.com>
References: <0LN400GETZDE88M0@mailout1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:64978 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477Ab1FUMA0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 08:00:26 -0400
In-Reply-To: <0LN400GETZDE88M0@mailout1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tmarri@apm.com, thomas.ab@samsung.com, a.kesavan@samsung.com

Hi,

On Tue, Jun 21, 2011 at 4:18 PM, PRAVEEN PANERI <p.paneri@samsung.com> =
wrote:
>
> Hi,
>
> On Tue, Jun 21, 2011 at 12:33:43PM +0530, p.paneri@samsung.com wrote:
> > From: Praveen Paneri
> >
> > This patch modifies DWC OTG for ARM based SoCs. Currently it has
> > been tested for Samsung S5P6440. Can easily be built for others
> > as well.
> >
> > Following features are tested for basic functions on SMDK6440
> > board after modifications:
> > OTG HOST: HID and mass-storage
> > OTG DEVICE: mass-storage and adb
> >
> > Signed-off-by: Praveen Paneri
>
> this is wrong is so many levels... We shouldn't be adding ifdefs to
> allow the driver to be compiled for multiple architectures. The corre=
ct
> way to handle this, is to phase out the core driver from the SoC- or
> PCI-specific parts and make that a glue layer that bridges to the cor=
e
> driver.
As I said this is just to show the changes required in this driver
to port it for ARM. Interest is in having single driver for both host a=
nd
gadget and make use of the OTG feature as it has been provided by
the IP.
 Will implement it in a better possible way.
Thanks

Paneri
>
> I'm writing the driver for a similar core, the DWC USB3, take a look =
at
> my dwc3 branch [1] to see how this should be done.
>
> > diff --git a/drivers/usb/dwc/apmppc.c b/drivers/usb/dwc/apmppc.c
> > index ffbe6dd..b0dcae9 100644
> > --- a/drivers/usb/dwc/apmppc.c
> > +++ b/drivers/usb/dwc/apmppc.c
> > @@ -50,9 +50,6 @@
> >=A0=A0 * this file system to perform diagnostics on the driver compo=
nents or the
> >=A0=A0 * device.
> >=A0=A0 */
> > -
> > -#include
> > -
> >=A0=A0#include "driver.h"
> >
> >=A0=A0#define DWC_DRIVER_VERSION "1.05"
> > @@ -110,6 +107,9 @@ static int __devexit dwc_otg_driver_remove(stru=
ct platform_device *ofdev)
> >=A0=A0{
> >=A0=A0 struct device *dev =3D &ofdev->dev;
> >=A0=A0 struct dwc_otg_device *dwc_dev =3D dev_get_drvdata(dev);
> > +#ifdef CONFIG_CPU_S5P6440
> > + struct s5p_otg_platdata *pdata =3D ofdev->dev.platform_data;
> > +#endif
>
> NAK
>
> > @@ -152,6 +152,11 @@ static int __devexit dwc_otg_driver_remove(str=
uct platform_device *ofdev)
> >
> >=A0=A0 /* Clear the drvdata pointer. */
> >=A0=A0 dev_set_drvdata(dev, NULL);
> > +#ifdef CONFIG_CPU_S5P6440
> > + /* OTG Phy off */
> > + if (pdata && pdata->phy_exit)
> > + pdata->phy_exit(ofdev, S5P_USB_PHY_DEVICE);
> > +#endif
>
> NAK
>
> > @@ -169,12 +174,14 @@ static int __devinit dwc_otg_driver_probe(str=
uct platform_device *ofdev)
> >=A0=A0 int retval;
> >=A0=A0 struct dwc_otg_device *dwc_dev;
> >=A0=A0 struct device *dev =3D &ofdev->dev;
> > +#ifdef CONFIG_CPU_S5P6440
> > + struct s5p_otg_platdata *pdata =3D ofdev->dev.platform_data;
> > +#endif
>
> NAK
>
> > @@ -182,15 +189,24 @@ static int __devinit dwc_otg_driver_probe(str=
uct platform_device *ofdev)
> >=A0=A0 goto fail_dwc_dev;
> >=A0=A0 }
> >
> > +#ifdef CONFIG_CPU_S5P6440
> > + /* OTG Phy init */
> > + if (pdata && pdata->phy_init)
> > + pdata->phy_init(ofdev, S5P_USB_PHY_DEVICE);
> > +#endif
> >=A0=A0 /* Retrieve the memory and IRQ resources. */
> > +#ifdef CONFIG_ARM
> > + dwc_dev->irq =3D ofdev->resource[1].start;
> > +#else
> >=A0=A0 dwc_dev->irq =3D irq_of_parse_and_map(ofdev->dev.of_node, 0);
> > +#endif
>
> NAK
>
> > +#ifndef CONFIG_ARM
>
> NAK
>
> > @@ -200,8 +216,14 @@ static int __devinit dwc_otg_driver_probe(stru=
ct platform_device *ofdev)
> >=A0=A0 dev_dbg(dev, "OTG - ioresource_mem start0x%llx: end:0x%llx\n"=
,
> >=A0=A0 (unsigned long long)res.start, (unsigned long long)res.end);
> >
> > +
> >=A0=A0 dwc_dev->phys_addr =3D res.start;
> >=A0=A0 dwc_dev->base_len =3D res.end - res.start + 1;
> > +#else
> > + dwc_dev->phys_addr =3D ofdev->resource[0].start;
> > + dwc_dev->base_len =3D ofdev->resource[0].end -
> > + ofdev->resource[0].start + 1;
> > +#endif
>
> NAK
>
> > @@ -296,6 +318,7 @@ static int __devinit dwc_otg_driver_probe(struc=
t platform_device *ofdev)
> >=A0=A0 dwc_dev->hcd =3D NULL;
> >=A0=A0 goto fail_hcd;
> >=A0=A0 }
> > +#ifndef CONFIG_ARM
>
> NAK
>
> > @@ -316,6 +339,7 @@ static int __devinit dwc_otg_driver_probe(struc=
t platform_device *ofdev)
> >=A0=A0 dwc_dev->hcd->cp_irq_installed =3D 1;
> >=A0=A0 }
> >=A0=A0 }
> > +#endif
>
> NAK
>
> > diff --git a/drivers/usb/dwc/cil.h b/drivers/usb/dwc/cil.h
> > index 80b7da5..c1a11f1 100644
> > --- a/drivers/usb/dwc/cil.h
> > +++ b/drivers/usb/dwc/cil.h
> > @@ -37,6 +37,15 @@
> >=A0=A0#if !defined(__DWC_CIL_H__)
> >=A0=A0#define __DWC_CIL_H__
> >=A0=A0#include
> > +#ifdef CONFIG_ARM
> > +#include
> > +#include
> > +#include
> > +#include
> > +#include
> > +#else
> > +#include
> > +#endif
>
> I can't even say how ugly this is.
>
> > diff --git a/drivers/usb/dwc/param.c b/drivers/usb/dwc/param.c
> > index 523f0db..b48c510 100644
> > --- a/drivers/usb/dwc/param.c
> > +++ b/drivers/usb/dwc/param.c
> > @@ -116,8 +116,12 @@ static int set_valid_tx_fifo_sizes(struct core=
_if *core_if)
> >=A0=A0 * This function is called during module intialization to veri=
fy that
> >=A0=A0 * the module parameters are in a valid state.
> >=A0=A0 */
> > -int __devinit check_parameters(struct core_if *core_if)
> > +int __devinit check_parameters(struct core_if *core_if,
> > + struct platform_device *ofdev)
> >=A0=A0{
> > +#ifdef CONFIG_CPU_S5P6440
> > + struct s5p_otg_platdata *pdata =3D ofdev->dev.platform_data;
> > +#endif
>
> NAK.
>
> > @@ -145,6 +149,23 @@ int __devinit check_parameters(struct core_if =
*core_if)
> >=A0=A0 */
> >=A0=A0 dwc_otg_module_params.enable_dynamic_fifo =3D
> >=A0=A0 =A0=A0=A0=A0DWC_HWCFG2_DYN_FIFO_RD(core_if->hwcfg2);
> > +#ifdef CONFIG_CPU_S5P6440
> > + if (pdata && pdata->dev_rx_fifo_size)
> > + dwc_otg_module_params.dev_rx_fifo_size =3D
> > + pdata->dev_rx_fifo_size;
> > + if (pdata && pdata->dev_nptx_fifo_size)
> > + dwc_otg_module_params.dev_nperio_tx_fifo_size =3D
> > + pdata->dev_nptx_fifo_size;
> > +
> > + if (pdata && pdata->host_rx_fifo_size)
> > + dwc_otg_module_params.host_rx_fifo_size =3D
> > + pdata->host_rx_fifo_size;
> > + if (pdata && pdata->host_nptx_fifo_size)
> > + dwc_otg_module_params.host_nperio_tx_fifo_size =3D
> > + pdata->host_nptx_fifo_size;
> > + if (pdata && pdata->host_ch_num)
> > + dwc_otg_module_params.host_channels =3D pdata->host_ch_num;
> > +#else
>
> then let's say another company licenses this core from Synopsys. Will
> you add another pre-processor directive here ?
>
>
> [1]
> http://git.kernel.org/?p=3Dlinux/kernel/git/balbi/usb.git;a=3Dtree;f=3D=
drivers/usb/dwc3;h=3D6ace38c51cfab18de3be257f86ae2c9afabf8237;hb=3Drefs=
/heads/dwc3
>
> --
> balbi
>
>
>
>
>
>
