From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V4 03-1/13] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Thu, 21 Jul 2011 09:11:38 +0100
Message-ID: <20110721081138.GL26574@n2100.arm.linux.org.uk>
References: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com> <1311158773-30314-3-git-send-email-boojin.kim@samsung.com> <CABb+yY2_XKyCr2mEzqd0bCYJk3U7+sg8Xz4b4ma2KB1BconYOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:54696 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752503Ab1GUIO5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 04:14:57 -0400
Content-Disposition: inline
In-Reply-To: <CABb+yY2_XKyCr2mEzqd0bCYJk3U7+sg8Xz4b4ma2KB1BconYOw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jul 21, 2011 at 12:47:49AM +0530, Jassi Brar wrote:
> On Wed, Jul 20, 2011 at 4:16 PM, Boojin Kim <boojin.kim@samsung.com> =
wrote:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->direction =3D=3D DM=
A_TO_DEVICE) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->dst=
_addr)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri-=
>fifo_addr =3D slave_config->dst_addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->dst=
_addr_width)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri-=
>burst_sz =3D __ffs(slave_config->dst_addr_width);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (slave_config->direction =3D=
=3D DMA_FROM_DEVICE) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->src=
_addr)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri-=
>fifo_addr =3D slave_config->src_addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (slave_config->src=
_addr_width)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 peri-=
>burst_sz =3D __ffs(slave_config->src_addr_width);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> PL330 has fixed channels to peripherals.
> So FIFO addresses(burst_sz too?) should already be set via platform d=
ata.
> Client drivers shouldn't bother.

That's utter crap, and isn't what the DMA engine API is about.

The above looks correctly implemented.  Slave DMA engine users are
supposed to supply the device DMA register address via this
DMA_SLAVE_CONFIG call.  Doing this via platform data for the DMA
device is braindead.
