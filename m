From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH RESEND v3 3/4] USB: Gadget: Add Samsung S3C24XX USB
 High-Speed controller driver
Date: Wed, 13 Apr 2011 16:28:41 -0700
Message-ID: <20110413232841.GA20142@kroah.com>
References: <201103232235.49318.heiko@sntech.de>
 <201103232239.28879.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:57213 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757110Ab1DMXeS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Apr 2011 19:34:18 -0400
Content-Disposition: inline
In-Reply-To: <201103232239.28879.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Ben Dooks <ben-linux@fluff.org>, Thomas Abraham <thomas.ab@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, dbrownell@users.sourceforge.net, Alexander Neumann <alexander@debian.org>

On Wed, Mar 23, 2011 at 10:39:28PM +0100, Heiko St=FCbner wrote:
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
> ---
> Changes since v1:
> - Addressed comments from Ben Dooks
>=20
> Changes since v2:
> - Update the driver to match the data structure changes introduced by
>   commit b0fca50f5a94a268ed02cfddf44448051ed9343f.
>   Alexander Neumann <alexander@debian.org>
> - Move s3c_hsudc to 0x29 in usb_gadget_controller_number in gadget_ch=
ips.h
>   Heiko Stuebner <heiko@sntech.de>

The Renesas driver got number 0x29, so this patch no longer applies :(

Care to respin this whole series against the next linux-next tree and
resend it to me so I can apply it?

thanks,

greg k-h
