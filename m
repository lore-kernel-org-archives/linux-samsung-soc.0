From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/3] USB: EXYNOS USB3.0 device controller driver
Date: Mon, 6 Feb 2012 10:32:13 +0200
Message-ID: <20120206083211.GI15652@legolas.emea.dhcp.ti.com>
References: <001101cce4a7$35500610$9ff01230$%tikhomirov@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xGGVyNQdqA79rdfn"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog126.obsmtp.com ([74.125.149.155]:35260 "EHLO
	na3sys009aog126.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750928Ab2BFIcS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Feb 2012 03:32:18 -0500
Content-Disposition: inline
In-Reply-To: <001101cce4a7$35500610$9ff01230$%tikhomirov@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anton Tikhomirov <av.tikhomirov@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Greg Kroah-Hartman' <gregkh@suse.de>, 'Felipe Balbi' <balbi@ti.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>


--xGGVyNQdqA79rdfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 06, 2012 at 05:13:28PM +0900, Anton Tikhomirov wrote:
> Cc: Kukjin Kim <kgene.kim <at> samsung.com>
> Cc: Greg Kroah-Hartman <gregkh <at> suse.de>
> Cc: Felipe Balbi <balbi <at> ti.com>

you can add the correct email, actually, but they should follow your
Signed-off-by line.

>=20
> Adds Exynos USB3.0 device controller driver to support USB peripherals
> on Exynos5 chips.
>=20
> Signed-off-by: Anton Tikhomirov <av.tikhomirov@samsung.com>
> ---
>  drivers/usb/gadget/Kconfig         |   13 +
>  drivers/usb/gadget/Makefile        |    1 +
>  drivers/usb/gadget/exynos_ss_udc.c | 2511 ++++++++++++++++++++++++++++++=
++++++
>  drivers/usb/gadget/exynos_ss_udc.h |  342 +++++
>  4 files changed, 2867 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/usb/gadget/exynos_ss_udc.c
>  create mode 100644 drivers/usb/gadget/exynos_ss_udc.h
>=20
> diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
> index 7ecb68a..8d3bc6e 100644
> --- a/drivers/usb/gadget/Kconfig
> +++ b/drivers/usb/gadget/Kconfig
> @@ -268,6 +268,19 @@ config USB_S3C_HSOTG
>  	  The Samsung S3C64XX USB2.0 high-speed gadget controller
>  	  integrated into the S3C64XX series SoC.
> =20
> +config USB_EXYNOS_SS_UDC
> +	tristate "EXYNOS SuperSpeed USB 3.0 Device controller"
> +	depends on EXYNOS_DEV_SS_UDC
> +	select USB_GADGET_DUALSPEED
> +	select USB_GADGET_SUPERSPEED
> +	help
> +	  The Samsung Exynos SuperSpeed USB 3.0 device controller
> +	  integrated into the Exynos5 series SoC.
> +
> +	  Say "y" to link the driver statically, or "m" to build a
> +	  dynamically linked module called "exynos_ss_udc" and force all
> +	  gadget drivers to also be dynamically linked.
> +
>  config USB_IMX
>  	tristate "Freescale i.MX1 USB Peripheral Controller"
>  	depends on ARCH_MXC
> diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
> index b7f6eef..092bc76 100644
> --- a/drivers/usb/gadget/Makefile
> +++ b/drivers/usb/gadget/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_USB_FSL_QE)	+=3D fsl_qe_udc.o
>  obj-$(CONFIG_USB_CI13XXX_PCI)	+=3D ci13xxx_pci.o
>  obj-$(CONFIG_USB_S3C_HSOTG)	+=3D s3c-hsotg.o
>  obj-$(CONFIG_USB_S3C_HSUDC)	+=3D s3c-hsudc.o
> +obj-$(CONFIG_USB_EXYNOS_SS_UDC) +=3D exynos_ss_udc.o
>  obj-$(CONFIG_USB_LANGWELL)	+=3D langwell_udc.o
>  obj-$(CONFIG_USB_EG20T)		+=3D pch_udc.o
>  obj-$(CONFIG_USB_MV_UDC)	+=3D mv_udc.o
> diff --git a/drivers/usb/gadget/exynos_ss_udc.c b/drivers/usb/gadget/exyn=
os_ss_udc.c
> new file mode 100644
> index 0000000..aaad33c
> --- /dev/null
> +++ b/drivers/usb/gadget/exynos_ss_udc.c
> @@ -0,0 +1,2511 @@
> +/* linux/drivers/usb/gadget/exynos_ss_udc.c
> + *
> + * Copyright 2011 Samsung Electronics Co., Ltd.
> + *	http://www.samsung.com/
> + *
> + * EXYNOS SuperSpeed USB 3.0 Device Controlle driver
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/clk.h>
> +
> +#include <linux/usb/ch9.h>
> +#include <linux/usb/gadget.h>
> +
> +#include <asm/byteorder.h>
> +
> +#include <mach/map.h>
> +
> +#include <plat/regs-usb3-exynos-drd.h>
> +#include <plat/udc-ss.h>
> +#include <plat/usb-phy.h>

do _NOT_ depend on any arch-specific crap please. Registers can be
defined on the C source code and other stuff could sit on <linux/usb/>
or <linux/platform_data/> depending on what it is. I want to be able to
compile this with whatever (cross) compiler I have available.

> +#include "exynos_ss_udc.h"
> +
> +static void exynos_ss_udc_kill_all_requests(struct exynos_ss_udc *udc,
> +					    struct exynos_ss_udc_ep *udc_ep,
> +					    int result);
> +static void exynos_ss_udc_complete_setup(struct usb_ep *ep,
> +					 struct usb_request *req);
> +static void exynos_ss_udc_complete_request(struct exynos_ss_udc *udc,
> +					   struct exynos_ss_udc_ep *udc_ep,
> +					   struct exynos_ss_udc_req *udc_req,
> +					   int result);
> +static void exynos_ss_udc_start_req(struct exynos_ss_udc *udc,
> +				    struct exynos_ss_udc_ep *udc_ep,
> +				    struct exynos_ss_udc_req *udc_req,
> +				    bool continuing);
> +static void exynos_ss_udc_ep_activate(struct exynos_ss_udc *udc,
> +				      struct exynos_ss_udc_ep *udc_ep);
> +static void exynos_ss_udc_ep_deactivate(struct exynos_ss_udc *udc,
> +					struct exynos_ss_udc_ep *udc_ep);
> +static int exynos_ss_udc_start(struct usb_gadget *gadget,
> +			       struct usb_gadget_driver *driver);
> +static int exynos_ss_udc_stop(struct usb_gadget *gadget,
> +			      struct usb_gadget_driver *driver);

if you reorder the driver, you will not need to prototype everything
here.

> +
> +

one blank line is enough.

> +/**
> + * on_list - check request is on the given endpoint
> + * @ep: The endpoint to check.
> + * @test: The request to test if it is on the endpoint.
> + */
> +static bool on_list(struct exynos_ss_udc_ep *udc_ep,
> +		    struct exynos_ss_udc_req *test)
> +{
> +	struct exynos_ss_udc_req *udc_req, *treq;
> +
> +	list_for_each_entry_safe(udc_req, treq, &udc_ep->queue, queue) {
> +		if (udc_req =3D=3D test)
> +			return true;
> +	}
> +
> +	return false;
> +}

why don't you just hold a pointer to the endpoint on your
exynos_ss_udc_req structure ? Set that pointer on usb_ep_alloc() time
and all you have to do is compare a pointer, rather than traversing the
entire ep list.

> +/**
> + * exynos_ss_udc_map_dma - map the DMA memory being used for the request
> + * @udc: The device state.
> + * @udc_ep: The endpoint the request is on.
> + * @req: The request being processed.
> + *
> + * We've been asked to queue a request, so ensure that the memory buffer
> + * is correctly setup for DMA. If we've been passed an extant DMA address
> + * then ensure the buffer has been synced to memory. If our buffer has no
> + * DMA memory, then we map the memory and mark our request to allow us to
> + * cleanup on completion.
> + */
> +static int exynos_ss_udc_map_dma(struct exynos_ss_udc *udc,
> +				 struct exynos_ss_udc_ep *udc_ep,
> +				 struct usb_request *req)
> +{
> +	enum dma_data_direction dir;
> +	struct exynos_ss_udc_req *udc_req =3D our_req(req);
> +
> +	dir =3D udc_ep->dir_in ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
> +
> +	/* if the length is zero, ignore the DMA data */
> +	if (udc_req->req.length =3D=3D 0)
> +		return 0;
> +
> +	if (req->dma =3D=3D DMA_ADDR_INVALID) {

NAK, we want to remove this. Gadget drivers should _never_ map buffer by
themselves. Just go ahead and map it.

> +		dma_addr_t dma;
> +
> +		dma =3D dma_map_single(udc->dev,
> +				     req->buf, req->length, dir);
> +
> +		if (unlikely(dma_mapping_error(udc->dev, dma)))
> +			goto dma_error;
> +
> +		udc_req->mapped =3D 1;
> +		req->dma =3D dma;
> +	} else
> +		dma_sync_single_for_device(udc->dev,
> +					   req->dma, req->length, dir);

if one branch has {}, both should have, but this will be dropped because
of reason above.

> +
> +	return 0;

beware that we will be providing generic map/unmap routines soonish.

> +dma_error:
> +	dev_err(udc->dev, "%s: failed to map buffer %p, %d bytes\n",
> +			  __func__, req->buf, req->length);
> +
> +	return -EIO;
> +}
> +
> +/**
> + * exynos_ss_udc_unmap_dma - unmap the DMA memory being used for the req=
uest
> + * @udc: The device state.
> + * @udc_ep: The endpoint for the request.
> + * @udc_req: The request being processed.
> + *
> + * This is the reverse of exynos_ss_udc_map_dma(), called for the comple=
tion
> + * of a request to ensure the buffer is ready for access by the caller.
> + */
> +static void exynos_ss_udc_unmap_dma(struct exynos_ss_udc *udc,
> +				    struct exynos_ss_udc_ep *udc_ep,
> +				    struct exynos_ss_udc_req *udc_req)
> +{
> +	struct usb_request *req =3D &udc_req->req;
> +	enum dma_data_direction dir;
> +
> +	dir =3D udc_ep->dir_in ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
> +
> +	/* ignore this if we're not moving any data */
> +	if (udc_req->req.length =3D=3D 0)
> +		return;
> +
> +	if (udc_req->mapped) {
> +		/* we mapped this, so unmap and remove the dma */
> +
> +		dma_unmap_single(udc->dev, req->dma, req->length, dir);
> +
> +		req->dma =3D DMA_ADDR_INVALID;
> +		udc_req->mapped =3D 0;
> +	}
> +}
> +
> +/**
> + * exynos_ss_udc_issue_epcmd - issue physical endpoint-specific command
> + * @udc: The device state.
> + * @epcmd: The command to issue.
> + */
> +static int exynos_ss_udc_issue_epcmd(struct exynos_ss_udc *udc,
> +				     struct exynos_ss_udc_ep_command *epcmd)
> +{
> +	int res;
> +	u32 depcmd;
> +
> +	/* If some of parameters are not in use, we will write it anyway
> +	   for simplification */
> +	writel(epcmd->param0, udc->regs + EXYNOS_USB3_DEPCMDPAR0(epcmd->ep));
> +	writel(epcmd->param1, udc->regs + EXYNOS_USB3_DEPCMDPAR1(epcmd->ep));
> +	writel(epcmd->param2, udc->regs + EXYNOS_USB3_DEPCMDPAR2(epcmd->ep));
> +
> +	depcmd =3D epcmd->cmdtyp | epcmd->cmdflags;
> +	writel(depcmd, udc->regs + EXYNOS_USB3_DEPCMD(epcmd->ep));
> +
> +	res =3D poll_bit_clear(udc->regs + EXYNOS_USB3_DEPCMD(epcmd->ep),
> +			     EXYNOS_USB3_DEPCMDx_CmdAct,
> +			     1000);
> +	return res;
> +}
> +
> +/**
> + * exynos_ss_udc_run_stop - start/stop the device controller operation
> + * @udc: The device state.
> + * @is_on: The action to take (1 - start, 0 - stop).
> + */
> +static void exynos_ss_udc_run_stop(struct exynos_ss_udc *udc, int is_on)
> +{
> +	int res;
> +
> +	if (is_on) {
> +		__orr32(udc->regs + EXYNOS_USB3_DCTL,
> +			EXYNOS_USB3_DCTL_Run_Stop);
> +		res =3D poll_bit_clear(udc->regs + EXYNOS_USB3_DSTS,
> +				     EXYNOS_USB3_DSTS_DevCtrlHlt,
> +				     1000);
> +	} else {
> +		__bic32(udc->regs + EXYNOS_USB3_DCTL,
> +			EXYNOS_USB3_DCTL_Run_Stop);
> +		res =3D poll_bit_set(udc->regs + EXYNOS_USB3_DSTS,
> +				   EXYNOS_USB3_DSTS_DevCtrlHlt,
> +				   1000);
> +	}
> +
> +	if (res < 0)
> +		dev_dbg(udc->dev, "Failed to %sconnect by software\n",
> +				  is_on ? "" : "dis");
> +}
> +
> +/**
> + * exynos_ss_udc_pullup - software-controlled connect/disconnect to USB =
host
> + * @gadget: The peripheral being connected/disconnected.
> + * @is_on: The action to take (1 - connect, 0 - disconnect).
> + */
> +static int exynos_ss_udc_pullup(struct usb_gadget *gadget, int is_on)
> +{
> +	struct exynos_ss_udc *udc =3D our_udc(gadget);
> +
> +	exynos_ss_udc_run_stop(udc, is_on);
> +
> +	return 0;
> +}

Ok, I will stop reviewing here. This looks VERY similar to Synopsys DWC3
controller. Why are you trying to add yet another driver ? Before
reviewing anything else, I want confirmation that you're _NOT_ using
Synopsys' controller.

Anton, please confirm the information. All commands are the same as
Synopsys' controller, I cannot let you add another driver for the same
controller. Just re-use the dwc3 controller.

--=20
balbi

--xGGVyNQdqA79rdfn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPL5ALAAoJEIaOsuA1yqREjbwQAKVyUB0BCV2NMUEPsGaF7QHP
BZPYbxFbZYFXCZcgNDFZ89jSJ6PSPsuTBYKZ848jaZKDvXNKophXAnxtYsUx6kuI
ad61RTXfdAkyxfQ9/LuPiAt/zgApQu3Q0/fOSgzxXcUdNud2I2xR4BC7aKH3Xp8v
8sDJiaPT3/rrpUh2MsTyCwV2gWJaJxczzjkCksItJPchol99Y8llz2A+XLMDIMSo
vG1RmfPz2PEFxe7yD+F7pcYytIanUEvdpRx558o3d/JfeNCi2mlVwqXwfg5PklVG
SFKeFDFEtRU2PSSoQsBi0/C6AHFPx4onfXxQCCAqJj6o+C5GE/g2QI/USGT/IFdi
2STdXg2d1Yq1eSCvxdk1PRd/SKwt4ePXfldMQcdyAEoUKIgThEWilZ/Au+oywNbC
XD9aGeG2MvZbPcXv4WIWr+Cn9FwOwlf06gHHn8DVoTZxI3C4zBSk+pJZ8uVuFyzk
xUxsrUPiMPbZ2bYSU93gOBQ+0blCudMbILkcRWuf3zWxYc46E2yajXATvfil634k
HiWZkQ+FDS9OyGttk1wBGE5lvV4GxXTPpDXNyYdGz+Xe1QWHaXF48du5dU80/Jbp
9Hrdcy/V7Ddpvo/6m5zNi6LQtBqC2ACGC/+6ruitFkEpzBvXUHJQGjhaBAt57gvm
6zY05ri4R97xr8hKmutQ
=7Xet
-----END PGP SIGNATURE-----

--xGGVyNQdqA79rdfn--
