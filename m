From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung cleanup-2 for v3.2
Date: Mon, 10 Oct 2011 13:27:09 +0900
Message-ID: <034601cc8704$e0602cc0$a1208640$%kim@samsung.com>
References: <019a01cc8298$823f7b20$86be7160$%kim@samsung.com>
 <201110072005.49967.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26905 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756Ab1JJE1L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 00:27:11 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU004761P81VG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:27:10 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSU004CV1P9HG10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:27:09 +0900 (KST)
In-reply-to: <201110072005.49967.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Arnd Bergmann wrote:
> 
> On Tuesday 04 October 2011, Kukjin Kim wrote:
> > This is second cleanup for Samsung stuff for v3.2 and includes cleanup
> > header files in plat-s3c24xx and plat-s5p to merge into one plat-samsung
> > directory.
> >
> > Please pull from:
> >   git://github.com/kgene/linux-samsung.git next-samsung-cleanup-2
> >
> > And this is based on previous Samsung cleanup branch,
next-samsung-cleanup
> > which has been merged in arm-soc because of dependency.
> >
> > If any problems, please let me know.
> >
> 
> Looks good to me. I think this should go into 3.2 very late during the
merge
> window since it moves around a lot of files that might be touched by other
> patches, and I don't want to break a lot of that stuff, so I'm putting
> it into a separate next/cleanup2 branch, ok?
> 
It's ok to me :)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
