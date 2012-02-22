From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3] DMA: PL330: Merge PL330 driver into drivers/dma/
Date: Wed, 22 Feb 2012 19:35:27 +0000
Message-ID: <20120222193526.GC7041@n2100.arm.linux.org.uk>
References: <1329341243-14314-1-git-send-email-kgene.kim@samsung.com> <CABb+yY1E0_ZhTv8QvRAfgUvc=2Vz+ioYbsEczknP5dKcL2ZCbw@mail.gmail.com> <00f401ccf0f8$0db84ec0$2928ec40$%kim@samsung.com> <CABb+yY0j0j7Qw4MCwP_F+DKzmpdmZ3x0QC2Ktj2qmGnL=Ocx0Q@mail.gmail.com> <011c01ccf107$5624d020$026e7060$%kim@samsung.com> <CABb+yY1aeZ9=2GiHni3bZuRjW66Mxz7K0M753Lc-6UdxaVpBzA@mail.gmail.com> <1329906421.24656.93.camel@vkoul-udesk3> <4F451D24.1040009@samsung.com> <CABb+yY0Zy3Xx4OZTobo2y-J4NXokGCV47PdPyKs+aOnqtng7pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:51523 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477Ab2BVTfk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 14:35:40 -0500
Content-Disposition: inline
In-Reply-To: <CABb+yY0Zy3Xx4OZTobo2y-J4NXokGCV47PdPyKs+aOnqtng7pQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org

On Wed, Feb 22, 2012 at 10:50:29PM +0530, Jassi Brar wrote:
> > * Based on:
> > * =A0 =A0 =A0 arch/arm/common/pl330.c, arch/arm/include/asm/hardwar=
e/pl330.h
> > * =A0 =A0 =A0 Copyright (C) 2010 Samsung Electronics Co Ltd.
> >
> Doesn't make any sense because arch/arm/common/pl330.c
> and arch/arm/include/asm/hardware/pl330.h wouldn't exist anymore,

Rubbish.  It does make sense, because it's saying where the changes
came from.  That's done quite often when moving code around.

You could say that moving code from file A to file B and commenting
that it came from file A makes no sense because the code is no longer
in file A.  Well, that's definitely the case, but that doesn't mean
you don't credit where it came from in the first place.

I think you're making a mountain out of this mole hill.  There isn't
a problem here.  The above comments saying what happened are fine.
