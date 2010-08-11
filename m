From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH/RFC] Samsung device-table approach
Date: Wed, 11 Aug 2010 17:02:37 +0200
Message-ID: <003101cb3966$3f999bb0$beccd310$%szyprowski@samsung.com>
References: <1281528238-7298-1-git-send-email-m.szyprowski@samsung.com>
 <1281530427.1918.124.camel@chotu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13950 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753445Ab0HKPE2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Aug 2010 11:04:28 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6Z00A9UTVEV960@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Aug 2010 00:04:26 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6Z00J26TV9WO@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Aug 2010 00:04:26 +0900 (KST)
In-reply-to: <1281530427.1918.124.camel@chotu>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ameya Palande' <ameya.palande@nokia.com>
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Hello,

On Wednesday, August 11, 2010 2:40 PM Ameya Palande wrote:

> On Wed, 2010-08-11 at 14:03 +0200, ext Marek Szyprowski wrote:
> > Hello,
> >
> > I would like to start the discussion on the redesign of the way the
> > Samsung platform devices are defined. The current solution has some
> > important disadvantages that blocks the further kernel development.
> 
> Forgive me about my ignorance about device tables, but I was wondering
> if there is any similarity between device tables and Simple Firmware
> Interface tables which are already in mainline?

Well, this will be a funny discussion of two ignoramuses, as I know
almost nothing about Simple Firmware Interface. 

However I've read briefly about it and I see that SFI device tables are
something that is being defined at a boot loader level.

Current mainline kernel for Samsung SoC already contains definitions
for many devices (well, they should be called 'integrated peripherals'
in fact). The boot loader provides only a very basic information to
kernel (just the machine id, cpu type, amount of memory and kernel
command line). No other information (especially about any device
detected in the system) is provided.

The proposed device-table approach for Samsung SoC is just the other
(imho more convenient and more powerful) way of defining the platform
devices and their resources for the Samsung integrated peripherals.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
