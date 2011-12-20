From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/8] s3c-hsudc: move platform_data struct to global header
Date: Tue, 20 Dec 2011 12:36:37 +0100
Message-ID: <201112201236.37581.heiko@sntech.de>
References: <201112191938.22254.heiko@sntech.de> <201112191939.16542.heiko@sntech.de> <20111220112458.GG31842@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:50085 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab1LTLg6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 06:36:58 -0500
In-Reply-To: <20111220112458.GG31842@legolas.emea.dhcp.ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>

Am Dienstag, 20. Dezember 2011, 12:25:00 schrieb Felipe Balbi:
> Hi,
>=20
> On Mon, Dec 19, 2011 at 07:39:15PM +0100, Heiko St=FCbner wrote:
> > Gadget drivers should be compilable on all architectures.
> > This patch removes one dependency on architecture-specific code.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  arch/arm/mach-s3c2416/mach-smdk2416.c    |    1 +
> >  arch/arm/plat-samsung/devs.c             |    1 +
> >  arch/arm/plat-samsung/include/plat/udc.h |   15 +------------
>=20
> I would like to have ack from Ben and/or Kukjin before applying this
> one. Ben are you ok with this patch ?
I think Kukjin does more acking if this stuff currently, so hopefully h=
e will=20
see this mail.

Heiko
