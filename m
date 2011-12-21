From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/8] s3c-hsudc: move platform_data struct to global header
Date: Wed, 21 Dec 2011 13:06:14 +0900
Message-ID: <061801ccbf95$e1df4580$a59dd080$%kim@samsung.com>
References: <201112191938.22254.heiko@sntech.de>
 <201112191939.16542.heiko@sntech.de>
 <20111220112458.GG31842@legolas.emea.dhcp.ti.com>
 <201112201236.37581.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:8807 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097Ab1LUEGT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 23:06:19 -0500
In-reply-to: <201112201236.37581.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, balbi@ti.com
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>

Heiko St=FCbner wrote:
>=20
> Am Dienstag, 20. Dezember 2011, 12:25:00 schrieb Felipe Balbi:
> > Hi,
> >
> > On Mon, Dec 19, 2011 at 07:39:15PM +0100, Heiko St=FCbner wrote:
> > > Gadget drivers should be compilable on all architectures.
> > > This patch removes one dependency on architecture-specific code.
> > >
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >
> > >  arch/arm/mach-s3c2416/mach-smdk2416.c    |    1 +
> > >  arch/arm/plat-samsung/devs.c             |    1 +
> > >  arch/arm/plat-samsung/include/plat/udc.h |   15 +------------
> >
> > I would like to have ack from Ben and/or Kukjin before applying thi=
s
> > one. Ben are you ok with this patch ?
> I think Kukjin does more acking if this stuff currently, so hopefully=
 he will
> see this mail.
>=20

Hi Felipe,

Looks ok to me, you can go ahead with my ack.
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
