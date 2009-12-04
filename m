From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 01/20] ARM: S5PC100: use 0x30008000 as memory base
Date: Fri, 04 Dec 2009 08:46:28 +0100
Message-ID: <004601ca74b5$e5d84920$b188db60$%szyprowski@samsung.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
 <1258724572-19176-2-git-send-email-m.szyprowski@samsung.com>
 <1b68c6790911200642j792834e9q47d605b80c2e36d2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25704 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753692AbZLDHqo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Dec 2009 02:46:44 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KU400JWGAY1IU@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Dec 2009 16:46:49 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KU400IEBAXX4B@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Dec 2009 16:46:49 +0900 (KST)
In-reply-to: <1b68c6790911200642j792834e9q47d605b80c2e36d2@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'jassi brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Friday, November 20, 2009 3:43 PM jassi brar wrote:

> On Fri, Nov 20, 2009 at 10:42 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > From: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > We decided to use 0x3000'0000 as base memory address on S5PC1XX SoCs
> > (s5pc100 and s5pc110).
> you might as well want to explain the reason behind it, if any?

We decided to change the base memory address to 0x30000000 to be able to
support systems with 512MB in the second bank (DRAM1) without using HIMEM.
In first bank (DRAM0), which is integrated with SOC (POP) we would always
have no more than 256MB of memory. If we would leave the first bank at
0x2000'0000, we would lose 256MB of kernel virtual address space for
useless memory hole. With this patch (and proper u-boot) we can run kernel
on systems with max 256MB + 512MB of memory in 1GB kernel/3GB userspace
address space configuration.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
