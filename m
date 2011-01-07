From: Jonghun Han <jonghun.han@samsung.com>
Subject: RE: [PATCH 7/9] media: MFC: Add MFC v5.1 V4L2 driver
Date: Fri, 07 Jan 2011 09:51:13 +0900
Message-ID: <002601cbae05$010deb30$0329c190$%han@samsung.com>
References: <1293018885-15239-1-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-2-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-3-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-4-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-5-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-6-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-7-git-send-email-jtp.park@samsung.com>
 <1293018885-15239-8-git-send-email-jtp.park@samsung.com>
 <002601cba59d$e4852290$ad8f67b0$%han@samsung.com>
 <000c01cbacef$97e5c490$c7b14db0$%debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20043 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753914Ab1AGAvY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jan 2011 19:51:24 -0500
In-reply-to: <000c01cbacef$97e5c490$c7b14db0$%debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>, 'Jeongtae Park' <jtp.park@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: jaeryul.oh@samsung.com


Hi Kamil,

Kamil Debski wrote:

> Hi,
> 
> Thanks for the comment. Some of them include my code, which will I comment
> below.
> 
> > My review also imply Kamil's original patch.
> 

<snip>

> >
> > > +#define MFC_NUM_CONTEXTS	4
> >
> > How about use MFC_NUM_INSTANT instead MFC_NUM_CONTEXTS ?
> > Because too many terms can make confusion.
> 
> An instance means an MFC HW instance. Context is used for each open file
handle.

I know that. But as I know each handle can have only single MFC H/W
instance.
So I wish to reduce the terms. Is there anything I missed ?

<snip>

> >
> > What's the difference btw num and inst_no ?
> > It looks very similar.
> 
> The inst_no is the number of hardware instance in MFC. Num on the other
hand is
> the number of context used by an open file handle.

The inst_no made by MFC H/W has the same rule with num made by your code.
So in my opinion it is always the same. How do you think about that ?

<snip>

> 
> Best wishes,
> --
> Kamil Debski
> Linux Platform Group
> Samsung Poland R&D Center
