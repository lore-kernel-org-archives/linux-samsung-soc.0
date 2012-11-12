From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC PATCH 1/4] ARM: S3C24XX: move s3c24xx-irq to drivers/irqchip
Date: Mon, 12 Nov 2012 10:05:39 -0700
Message-ID: <50A12C63.2000609@wwwdotorg.org>
References: <201211121446.30167.heiko@sntech.de> <201211121447.49977.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:55539 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292Ab2KLRFm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 12:05:42 -0500
In-Reply-To: <201211121447.49977.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 11/12/2012 06:47 AM, Heiko St=FCbner wrote:
> Removes another part from plat-s3c24xx and also enables further
> improvements happening in the correct location.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/Kconfig                                   |    1 +
>  arch/arm/plat-s3c24xx/Makefile                     |    1 -
>  drivers/irqchip/Kconfig                            |    3 +++
>  drivers/irqchip/Makefile                           |    1 +
>  .../irq.c =3D> drivers/irqchip/irq-s3c24xx.c         |    0
>  5 files changed, 5 insertions(+), 1 deletions(-)
>  rename arch/arm/plat-s3c24xx/irq.c =3D> drivers/irqchip/irq-s3c24xx.=
c (100%)

Presumably there's a header file somewhere that defines the interface t=
o
irq-s3c24xx.c that other code in arch/arm/plat-s3c24xx is using to
initialize it. That header should be moved somewhere public (i.e.
outside {mach,plat}-*/include/{mach,plat}). However, you then end up
with a header file per IRQ driver in that public location. So, Thomas
Petazzoni started working on a solution for that:

> http://lists.arm.linux.org.uk/lurker/message/20121027.164514.11eb86db=
=2Een.html
