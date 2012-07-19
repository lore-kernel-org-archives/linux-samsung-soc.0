From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung cleanup-2 for v3.6
Date: Fri, 20 Jul 2012 07:21:12 +0900
Message-ID: <194e01cd65fc$ce163be0$6a42b3a0$%kim@samsung.com>
References: <142c01cd639c$2f081800$8d184800$%kim@samsung.com>
 <201207172058.28993.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43316 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036Ab2GSWVN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 18:21:13 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7F00LGJI39J220@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:21:12 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7F00HUCI3BERB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:21:11 +0900 (KST)
In-reply-to: <201207172058.28993.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Arnd Bergmann wrote:
> 
> On Monday 16 July 2012, Kukjin Kim wrote:
> > Here is second Samsung cleanup pull request for v3.6.
> > Please pull from:
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > next/cleanup-samsung-2
> >
> > It is related in using common GPIO API and removing unused GPIOs.
> >
> > If any problems, please let me know.
> >
> 
> Very nice series, I've merged it into next/cleanup now.
> 
Thanks.

> Two general comments on your submissions:
> 
> 1. Please put the branch name into the same line as the git url, that
> makes it slightly faster for me to copy-and-paste the pull location.
> 
Yeah, I know. If the line exceeds 80 columns (actually, 76 columns),
automatically, my e-mail client adds new line when I send git-pull or
anything else to mailing-list. And the git address which is including branch
name is included in the case :-(
So I will change the options of e-mail client when I send pull-request.

> 2. If you can, please use signed tags for your pull requests rather
> than branch names. A signed tag means that you can write the text
> for the merge changeset yourself so I don't have to do the description.
> Ideally the signing key should have signatures from other people in the
> keyring so everybody can check the authenticity of the request, but
> just having the changelog there also helps.
> 
OK, I see. I will try to use it as per your suggestion. But I'm not familiar
with that now. So if you don't mind I'd like to send signed tag from next
merge window :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
