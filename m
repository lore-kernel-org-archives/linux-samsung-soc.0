From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 4/4] S3C64XX DSP: Added the CPU driver for PCM
 controllers
Date: Tue, 3 Nov 2009 09:54:30 +0000
Message-ID: <20091103095430.GC1520@rakim.wolfsonmicro.main>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com>
 <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com>
 <20091102111753.GB29351@sirena.org.uk>
 <20091102113932.GB23772@trinity.fluff.org>
 <1b68c6790911022259v2e4448eav9459384f164a7236@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42916 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756038AbZKCJy0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2009 04:54:26 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911022259v2e4448eav9459384f164a7236@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: Ben Dooks <ben@trinity.fluff.org>, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Nov 03, 2009 at 03:59:46PM +0900, jassi brar wrote:
> On Mon, Nov 2, 2009 at 8:39 PM, Ben Dooks <ben@trinity.fluff.org> wro=
te:

> >> > + =A0 if (!base) {
> >> > + =A0 =A0 =A0 =A0 =A0 struct resource *res =3D platform_get_reso=
urce(pdev,
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IORESOURCE_MEM,
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00);

> > I would like to see platform_devices with their proper resources be=
ing
> > mandatory for new drivers. We could do with this lot proplerly foll=
owing
> > the device driver model.

> sorry, i didn't get it. could u please clarify more?

You should just be unconditionally using the resources obtained with
platform_get_resource() - the only reason the I2S driver permits the
base address to be passed in is to deal with the fact that the old
s3c24xx drivers didn't use the device model. =20

Since you don't have the core code shared between multiple drivers like
I2S you could just roll this code into the main probe function too.
