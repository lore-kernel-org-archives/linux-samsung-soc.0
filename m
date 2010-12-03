From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
Date: Fri, 03 Dec 2010 10:59:07 +0100
Message-ID: <000301cb92d0$bd2a7400$377f5c00$%szyprowski@samsung.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
 <1291307862-8125-4-git-send-email-s.nawrocki@samsung.com>
 <20101202171538.GB30933@pulham.picochip.com> <4CF7D9E6.5000409@samsung.com>
 <AANLkTikjQkmD-bvtTV=fh-xqMkhsxt67LhAUWuCv5mU3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47562 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752716Ab0LCKEA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 05:04:00 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCU0025DJQPQA50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 18:59:13 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCU0013VJQKW2@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 18:59:13 +0900 (KST)
In-reply-to: <AANLkTikjQkmD-bvtTV=fh-xqMkhsxt67LhAUWuCv5mU3@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: 'Jamie Iles' <jamie@jamieiles.com>, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Friday, December 03, 2010 2:37 AM Jassi Brar wrote:

> On Fri, Dec 3, 2010 at 2:39 AM, Sylwester Nawrocki

<snip>

> > I agree explicit indices are not really needed. I just followed the style of
> > all other resource definitions already there.
> > I am not quite sure what is the preference of the maintainer, I guess they want
> > all devices to follow same style for consistence.
> 
> And that style has its origin because explicit indices are as because
> they stress the fact that
> drivers expect  a particular resource at a particular index (when we
> have more than 1
> resource of a type).
> IMO we should use some macro shared between platform devices and their drivers.
> Something like -
> static struct resource s5p_csis_resource[] = {
>        [PA_CSIS] = {
>                .start = S5P_PA_CSIS0,
>                .end   = S5P_PA_CSIS0 + SZ_4K - 1,
>                .flags = IORESOURCE_MEM,
>        },
>        [IRQ_CSIS] = {
>                .start = IRQ_MIPICSI0,
>                .end   = IRQ_MIPICSI0,
>                .flags = IORESOURCE_IRQ,
>        }
> };

This looks like a huge over-engineering for me, especially for the simple device
that has only one register area and interrupt.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
