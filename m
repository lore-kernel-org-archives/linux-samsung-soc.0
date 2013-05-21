From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung fixes-2 for v3.10
Date: Tue, 21 May 2013 19:52:36 +0900
Message-ID: <102901ce5611$4df09bd0$e9d1d370$%kim@samsung.com>
References: <519A5933.3040005@samsung.com>
 <20130521064034.GE20453@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59752 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752316Ab3EUKwh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 06:52:37 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN5007NPA6JARS0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 May 2013 19:52:36 +0900 (KST)
In-reply-to: <20130521064034.GE20453@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Tue, May 21, 2013 at 02:11:15AM +0900, Kukjin Kim wrote:
> > The following changes since commit
> f722406faae2d073cc1d01063d1123c35425939e:
> >
> >   Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)
> >
> > are available in the git repository at:
> >
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-fixes-2
> 
> What happened to the 4210 rev0 regression fixes from Tomasz? I would
> have expected them in this batch?
> 
Hmm... please see below:
https://patchwork.kernel.org/patch/2478431/

Since many conflicts at that time, the 11/13 patch missed in the last merge
window. Then, seems as Tomasz replied, he re-submitted after -rc1.

OK, I will pick that up into upcoming fixes for Samsung stuff.

> Might as well hold off this one until that is reviewed and ready, since
> it's silly to keep pulling one-patch branches. At least if that's
> happening
> this week.
> 
Yeah, agreed. Let me sort out other fixes within a couple of days.

Please kindly ignore this pull request :-)

Thanks.

- Kukjin
