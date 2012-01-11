From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel for v3.3
Date: Wed, 11 Jan 2012 15:20:17 +0900
Message-ID: <021901ccd029$167f4da0$437de8e0$%kim@samsung.com>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com>
 <CAOesGMjn5uQEWbxrJryC+jOf=3SYbAnPY4A71NUZKFBi=a0QjA@mail.gmail.com>
 <01a301ccce6f$9bb51790$d31f46b0$%kim@samsung.com>
 <201201091556.34817.arnd@arndb.de>
 <20120109161152.GA2974@opensource.wolfsonmicro.com>
 <20120110090635.GT21765@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63019 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145Ab2AKGUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jan 2012 01:20:22 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXM0064MEXU6D90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jan 2012 15:20:20 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXM00EL4EXTXGE0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 11 Jan 2012 15:20:20 +0900 (KST)
In-reply-to: <20120110090635.GT21765@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Russell King - ARM Linux wrote:
> 
> On Mon, Jan 09, 2012 at 08:11:54AM -0800, Mark Brown wrote:

[...]

> > This really is very disappointing.
> 
> No it isn't.
> 
> What is really disappointing is the lack of responsive maintainers for the
> Samsung stuff.  It took _two_ bloody months to get the Samsung platforms
> sorted for the restart changes in spite of reminding, and a last minute
> rush over the course of a couple of days (one _in_ the merge window) to
> get it properly merged into my tree.
> 
Yeah, I had to do earlier and it's true that many conflicts caused from my
late ARM restart working for Samsung stuff.

[...]

> So, I support Arnd's view: the Samsung stuff is just too late.  Even the
> restart updates (which is what has caused this) were too late.  Anything
> which causes new merge conflicts in the Samsung code is not acceptable at
> this point, even if it's a 'fix' patch.  We've wasted far too much time
> trying to get Samsung stuff sorted far too late in the cycle.
> 
> Let this be an object lesson in what happens if you leave stuff until the
> last minute.

I will do more carefully next time and of course not too late.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
