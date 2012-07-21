From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung cleanup-2 for v3.6
Date: Sat, 21 Jul 2012 20:33:57 +0900
Message-ID: <1b7801cd6734$b7625e90$26271bb0$%kim@samsung.com>
References: <142c01cd639c$2f081800$8d184800$%kim@samsung.com>
 <201207172058.28993.arnd@arndb.de>
 <194e01cd65fc$ce163be0$6a42b3a0$%kim@samsung.com>
 <201207200905.50396.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39353 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751807Ab2GULd7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jul 2012 07:33:59 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7I00F80DGLV020@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 21 Jul 2012 20:33:57 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7I004WADGL5E50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 21 Jul 2012 20:33:57 +0900 (KST)
In-reply-to: <201207200905.50396.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Arnd Bergmann wrote:
> 
> On Thursday 19 July 2012, Kukjin Kim wrote:
> > > 2. If you can, please use signed tags for your pull requests rather
> > > than branch names. A signed tag means that you can write the text
> > > for the merge changeset yourself so I don't have to do the
description.
> > > Ideally the signing key should have signatures from other people in
> the
> > > keyring so everybody can check the authenticity of the request, but
> > > just having the changelog there also helps.
> > >
> > OK, I see. I will try to use it as per your suggestion. But I'm not
> familiar
> > with that now. So if you don't mind I'd like to send signed tag from
> next
> > merge window :-)
> 
> No problem. It's not a big difference to me anyway. I suppose by then we
> will
> also have had the chance for keysigning at the ARM mini summit.
> 
Great, thanks.

BTW, maybe you missed following pull-request from me?

Samsung devel-2:
http://lists.infradead.org/pipermail/linux-arm-kernel/2012-July/110336.html

Samsung devel-spi:
http://lists.infradead.org/pipermail/linux-arm-kernel/2012-July/110337.html

Samsung board-3:
http://lists.infradead.org/pipermail/linux-arm-kernel/2012-July/110338.html

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
