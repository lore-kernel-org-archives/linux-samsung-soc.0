From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung fixes-4 for v3.16
Date: Sat, 19 Jul 2014 14:11:36 +0900
Message-ID: <022101cfa30f$e9fa0fb0$bdee2f10$@samsung.com>
References: <53C9AF23.6030007@samsung.com>
 <CAOesGMgt50Ut8qv+ifDHoSQCBV4NNu-tx6B_t=T7D5SHVx0XMg@mail.gmail.com>
 <53C9B952.6010000@samsung.com> <53C9BF34.2030903@samsung.com>
 <CAOesGMgX2m4UbO756JbtQLZVJv3SY+dXDE+My-OeY0oCFA-aew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49191 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273AbaGSFLh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jul 2014 01:11:37 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8Y009T813BEO70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jul 2014 14:11:35 +0900 (KST)
In-reply-to: <CAOesGMgX2m4UbO756JbtQLZVJv3SY+dXDE+My-OeY0oCFA-aew@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>

Olof Johansson wrote:
> 
> On Fri, Jul 18, 2014 at 5:43 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > On 07/19/14 09:18, Kukjin Kim wrote:
> >>
> >> On 07/19/14 09:12, Olof Johansson wrote:
> >>>
> >>> On Fri, Jul 18, 2014 at 4:34 PM, Kukjin Kim<kgene.kim@samsung.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> This is a regression for v3.16 so please take this in -rc.
> >>>>
> >>>> Thanks,
> >>>> Kukjin
> >>>>
> >>>> The following changes since commit
> >>>> 1795cd9b3a91d4b5473c97f491d63892442212ab:
> >>>>
> >>>> Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)
> >>>>
> >>>> are available in the git repository at:
> >>>>
> >>>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> >>>> tags/samsung-fixes-4
> >>>>
> >>>> for you to fetch changes up to 4e3a498d6fc438d8c203c51aadc6ca8fb47b0577:
> >>>>
> >>>> ARM: EXYNOS: Fix core ID used by platsmp and hotplug code (2014-07-16
> >>>> 02:59:18 +0900)
> >>>
> >>>
> >>> This is based on a newer branch than our current fixes. So I've cherry
> >>> picked the patch instead of merged the branch -- if you have the
> >>> branch in linux-next you should remove it.
> >>>
> >> OK, I will.
> >>
> > BTW, other pm related branches in my tree have dependencies with the change
> > so I just reverted that in my -next.
> >
> > If any problems, please let me know.
> 
> Are they part of the branches you sent now? Is that patch a base in
> those branches?
> 
No, I didn't send out any branch including the fix to arm-soc because I also
don't want to make any conflict or inconvenience for you :) Just thought, I
need to sort it out once it has been merged into mainline.

Thanks,
Kukjin
