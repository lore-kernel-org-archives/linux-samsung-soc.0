From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL] Samsung-fixes-2 for v3.11
Date: Wed, 14 Aug 2013 16:32:11 +0900
Message-ID: <10a801ce98c0$64064b80$2c12e280$@org>
References: <51FFE30A.5040800@samsung.com> <87ob92pv1x.fsf@kernel.org>
 <10a101ce98bd$c004bd20$400e3760$@org>
 <CAOesGMini9xy5AjVzQinvGS3c2eA9dcPYRJxKf0R0z84FUSHGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63376 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758279Ab3HNHcM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 03:32:12 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRI00EEQFL9GNU0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 16:32:11 +0900 (KST)
In-reply-to: <CAOesGMini9xy5AjVzQinvGS3c2eA9dcPYRJxKf0R0z84FUSHGg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Kevin Hilman' <khilman@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Olof Johansson wrote:
> 
> On Wed, Aug 14, 2013 at 12:13 AM, Kukjin Kim <kgene@kernel.org> wrote:
> > Kevin Hilman wrote:
> >>
> >> Kukjin Kim <kgene.kim@samsung.com> writes:
> >>
> >> > The following changes since commit
> >> 5ae90d8e467e625e447000cb4335c4db973b1095:
> >> >
> >> >   Linux 3.11-rc3 (2013-07-28 20:53:33 -0700)
> >> >
> >> > are available in the git repository at:
> >> >
> >> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-
> samsung.git
> >> > tags/samsung-fixes-2
> >> >
> >> > for you to fetch changes up to
> 35f8550c8f27968af94ba5235cc611e3b6d86981:
> >> >
> >> >   ARM: SAMSUNG: fix to support for missing cpu specific map_io
> >> > (2013-07-30 13:30:57 +0900)
> >>
> >> In the future, please send arm-soc pull request to arm@kernel.org also,
> >> this makes filtering easier when non-Arnd/Olof folks (like me) are
> > helping.
> >>
> > OK, it's not difficult, BTW I'm not sure what the difference of
> > linux-arm-kernel ml and arm(at)kernel.org.
> 
> arm@kernel.org goes to Arnd, Kevin, Russel and myself. I think there
> might be one or two more people on there, but in general it's
> arm-soc+arm maintainers.
> 
> We haven't wanted to add it to MAINTAINERS since we want to keep the
> traffic mostly to the pull requests of platform maintainers, and not
> as a cc of patch postings, to keep the traffic volume manageable. :)
> 
OK, I see.

Thanks,
Kukjin
