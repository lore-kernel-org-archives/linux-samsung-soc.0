From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 3/4] USB: Gadget: Add Samsung S3C24XX USB High-Speed
 controller driver
Date: Thu, 14 Apr 2011 11:35:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1104141134260.2487-100000@iolanthe.rowland.org>
References: <201104141111.33781.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:60940 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755436Ab1DNPfn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2011 11:35:43 -0400
In-Reply-To: <201104141111.33781.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: Greg KH <greg@kroah.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Thomas Abraham <thomas.ab@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Alexander Neumann <alexander@debian.org>

On Thu, 14 Apr 2011, Heiko [iso-8859-1] St=FCbner wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
>=20
> The Samsung's S3C2416, S3C2443 and S3C2450 includes a USB High-Speed
> device controller module. This driver enables support for USB high-sp=
eed
> gadget functionality for the Samsung S3C24xx SoC's that include this
> controller.
>=20
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Alexander Neumann <alexander@bumpern.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

=2E..

> +static struct usb_ep_ops s3c_hsudc_ep_ops =3D {
> +	.enable =3D s3c_hsudc_ep_enable,
> +	.disable =3D s3c_hsudc_ep_disable,
> +	.alloc_request =3D s3c_hsudc_alloc_request,
> +	.free_request =3D s3c_hsudc_free_request,
> +	.queue =3D s3c_hsudc_queue,
> +	.dequeue =3D s3c_hsudc_dequeue,
> +	.set_halt =3D s3c_hsudc_set_halt,
> +};

There's no .set_wedge method.  Why do people always leave this out?

Alan Stern
