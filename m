From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: s3c-hsotg patches
Date: Wed, 14 Jul 2010 11:39:50 +0200
Message-ID: <00c401cb2338$84a3f730$8debe590$%szyprowski@samsung.com>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
 <20100707151246.GA2121@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63285 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752895Ab0GNJlL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 05:41:11 -0400
In-reply-to: <20100707151246.GA2121@kroah.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg KH' <greg@kroah.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

Hello,

On Wednesday, July 07, 2010 5:13 PM Greg KH wrote:

> On Wed, Jul 07, 2010 at 01:02:12AM +0100, Ben Dooks wrote:
> > Re-send of previous set, with corrected patches.
> 
> Hm, what tree are these going through?  Do you need me to take them
> through the linux-usb tree?  Or are they going through a
> platform-specific one somewhere?
> 
> confused,

Looks that Ben is busy and has no time to answer...

I'm interested in merging these patches too. These patches were
intended to be merged to 2.6.35-rc5. They are available on 
git://git.fluff.org/bjdooks/linux for-2635-rc5/hsotg branch.

IMHO these patches should go though the linux-usb tree - they
don't touch any platform specific code, and register definitions 
(arch/arm/plat-samsung/include/plat/regs-usb-hsotg.h) in fact belongs
to the driver rather than the platform. s3c-hsotg driver belongs to
the linux-usb tree.

Here is original message for that patch series - see
http://kerneltrap.org/mailarchive/linux-usb/2010/6/11/6261985

-->8---
Some further fixes for the s3c-hsotg block, as well as a repost of
the missed USB phy clock setting patch which either got missed or
passed over from last time.

As a note, this series has a patch adding support for dedicated FIFO
mode, this is in my view a fix, as when the hsotg block is compiled
with dedicated fifos then each USB IN non-periodic pipe needs to be
alloacted a unique TX FIFO. We have no actual data on how well the
block performs when all IN TX NP FIFOs are all set to the same one,
but it really should be fixed.

I am not sure if I have been subscribed to linux-usb, please CC: me
just in case.

--
Ben
--->8---

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
