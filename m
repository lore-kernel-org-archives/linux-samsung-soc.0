From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung S5P for 2.6.38 merge window
Date: Mon, 17 Jan 2011 09:54:03 +0900
Message-ID: <038201cbb5e1$0bd664a0$23832de0$%kim@samsung.com>
References: <021901cbb2e2$ef4a0630$cdde1290$%kim@samsung.com>
 <20110115132955.GA15996@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20968 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709Ab1AQAyJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Jan 2011 19:54:09 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LF500IIR6I8BC80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jan 2011 09:54:08 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LF500LI86I7J2@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jan 2011 09:54:08 +0900 (KST)
In-reply-to: <20110115132955.GA15996@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Thu, Jan 13, 2011 at 02:30:01PM +0900, Kukjin Kim wrote:
> > Hi Russell,
> >
> > Please pull Samsung S5P updates from:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > for-rmk
> >
> > These things are for 2.6.38.
> 
Hi,

> This looks very large.  I really considered not merging this due to:
> 
> 1. possibly conflicts with Lennert's irq_data conversion patches.
> 
Yeah, you're right, but its changes have been merged in my for-next and
already merged in linux-next also long ago.

> 2. It's not right to push large quantities of code into mainline towards
>    the end of the merge window.  You should have everything prepared
>    that you want to send before the merge window opens.
> 
I'm afraid that it's late and large stuff 'pull request'. But I asked about
that...maybe you missed it. Anyway it's my mistake...sorry for it.

> In future, please have your tree ready for merging *before* the merge
> window opens and aim to get the bulk in preferably before, at the latest
> during the first week.

Ok...I will always remember it.

Thanks a lot.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
