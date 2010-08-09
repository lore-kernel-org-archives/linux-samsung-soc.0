From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung S5P updates for 2.6.36 merge window
Date: Mon, 09 Aug 2010 19:43:10 +0900
Message-ID: <017501cb37af$abf7f670$03e7e350$%kim@samsung.com>
References: <017201cb37ac$9979a5a0$cc6cf0e0$%kim@samsung.com>
 <20100809103337.GA12833@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36046 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756076Ab0HIKnE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Aug 2010 06:43:04 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6V003AMSFPRU70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 19:43:01 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6V00KJHSFP7I@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 19:43:01 +0900 (KST)
In-reply-to: <20100809103337.GA12833@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Mon, Aug 09, 2010 at 07:21:11PM +0900, Kukjin Kim wrote:
> >  arch/arm/configs/s5pc110_defconfig               |   66 -
> >  arch/arm/configs/s5pv210_defconfig               |    5 +
> 
> What are these changes?

Hi,

Removed s5pc110_defconfig...because updated s5pv210_defconfig can cover it.

I think this is reasonable even though there is some issue about ARM
defconfig ;-)
Because this can remove redundant defconfig...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
