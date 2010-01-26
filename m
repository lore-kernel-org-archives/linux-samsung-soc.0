From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: S5PC100 squashing
Date: Tue, 26 Jan 2010 10:25:32 +0100
Message-ID: <000001ca9e69$85087880$8f196980$%szyprowski@samsung.com>
References: <20100126083201.GZ10014@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59827 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752200Ab0AZJ0r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 04:26:47 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KWU00MRJKWL37@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jan 2010 18:26:45 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KWU008GIKWGXR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jan 2010 18:26:45 +0900 (KST)
In-reply-to: <20100126083201.GZ10014@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, 'Linux Samsung SoC' <linux-samsung-soc@vger.kernel.org>
Cc: 'Kyungmin Park' <kmpark@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Tuesday, January 26, 2010 9:32 AM Ben Dooks wrote:

> Does anyone have any opinion on whether plat-s5pc1xx should stay? At the
> moment it is only servicing mach-s5pc100 and thenew support for v210 and
> s5pc110 seem to be using plat-s5p and not plat-s5pc1xx.

I vote for moving s5pc100 support to plat-s5p directory and removing
plat-s5pc1xx dir completely. I want to prepare patches for this, but
waited until S5PV210 support gets merged.

> From the looks of it, s5pc100-init.c could probably be pushed into
> the arch/arm/mach-s5pc100/cpu.c file. The s5pc100-clock.c should be
> moved into arch/arm/mach-s5pc100/ as well.

Right.

> Not sure yet what to do with the rest.

Most of c100-specific code should be moved to mach-s5pc100 directory.
The rest can be probably shared with all S5P platforms. 

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
