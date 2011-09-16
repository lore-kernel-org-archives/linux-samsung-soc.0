From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung Fixes for v3.1-rc7
Date: Fri, 16 Sep 2011 20:50:51 +0900
Message-ID: <00cf01cc7466$e2cd66e0$a86834a0$%kim@samsung.com>
References: <00b101cc738d$bcf46ce0$36dd46a0$%kim@samsung.com>
 <201109151732.59886.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:21029 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968Ab1IPLuy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Sep 2011 07:50:54 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRM00I3C68SEP60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 20:50:53 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRM002B568RPS30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 20:50:52 +0900 (KST)
In-reply-to: <201109151732.59886.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Greg KH' <gregkh@suse.de>

Arnd Bergmann wrote:
> 
> On Thursday 15 September 2011, Kukjin Kim wrote:
> > This is Samsung fixes for v3.1
> >
> > Please pull from:
> >   git://github.com/kgene/linux-samsung.git samsung-fixes-2
> > As you know, git.kernel.org/master.kernel.org has been down so I use
> > temporary git repo. at github now.
> >
> > These things are needed for v3.1 and if any problems, please let me
know.
> >
> > As a note, others for v3.2 will be sent in the next week...
> 
> Thanks, pulled.
> 
> Is it correct that you want none of these patches to be backported
> into the stable or longterm releases? Some of these look like they
> should be marked 'Cc: stable@kernel.org'.
> 
(Cc'ed Greg K-H)

Yes, you're right. Some patches are needed to sent to stable@kernel.org.
But unfortunately, when they have been submitted, there was no 'Cc:
stable@kernel.org'...

In this case, I'm not sure which following method is proper...
- to send 'pull request' to Greg / stable@kernel.org like bug fix during -rc
- to submit each patches with adding 'Cc: stable@kernel.org' again
- or ?

Please kindly let me know.
Thanks, have a nice weekend.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
