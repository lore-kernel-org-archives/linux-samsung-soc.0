From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Suspend: Fix build error on ARCH_S5PC100
Date: Mon, 04 Apr 2011 20:47:17 +0900
Message-ID: <02c701cbf2be$0ebebb80$2c3c3280$%kim@samsung.com>
References: <1301710155-16373-1-git-send-email-kgene.kim@samsung.com>
 <20110402091904.GH8482@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25809 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484Ab1DDLrX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2011 07:47:23 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJ400A6KM2XXS50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Apr 2011 20:47:21 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJ400M3EM2XCQ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Apr 2011 20:47:21 +0900 (KST)
In-reply-to: <20110402091904.GH8482@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Sat, Apr 02, 2011 at 11:09:15AM +0900, Kukjin Kim wrote:
> > The current mainline codes of ARCH_S5PC100 can not support
> > suspend to ram. So needs this for preventing build error.
> >
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > Oops, I missed this in my previous patch.
> >
> > As I know, firstly ARCH_S5P64X0 will support suspend to ram
> > then ARCH_S5PC100 will do it. But right now, we need this.
> 
> I'd much rather do this a different way - let me know if this means
> the SoC based dependencies can be dropped.  Patches to follow.

Yeah, I checked your patches. It's ok to me but this is also needed right
now for preventing build errors with s5pc100_defconfig...because there is no
regarding headers for supporting suspend to ram.

However as I mentioned, the suspend to ram will be supported soon on them
then we can drop its dependencies.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
