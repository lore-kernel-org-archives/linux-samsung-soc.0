From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [rtc-linux] RE: [PATCH 5/5] rtc: rtc-s3c: Fix debug message format
 on RTC
Date: Fri, 08 Oct 2010 08:46:47 +0900
Message-ID: <00c301cb6679$ea0679c0$be136d40$%kim@samsung.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
 <1283837381-9575-6-git-send-email-kgene.kim@samsung.com>
 <4C86CAC1.2050205@fluff.org> <000601cb4fbb$f9fbab90$edf302b0$%kim@samsung.com>
 <AANLkTi=Jb04ySn1WaGktY-hJQQoGvRpr6kz9DcSHrBZA@mail.gmail.com>
 <000f01cb50dc$ba4a74a0$2edf5de0$%kim@samsung.com>
 <20100910162354.9b96f1df.akpm@linux-foundation.org>
 <00c101cb6675$bb8e67f0$32ab37d0$%kim@samsung.com>
 <20101007162856.38b184ea.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43309 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750992Ab0JGXqg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 19:46:36 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y00F5S21I5M10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 08:46:30 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y006UF21IRI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 08:46:30 +0900 (KST)
In-reply-to: <20101007162856.38b184ea.akpm@linux-foundation.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Andrew Morton' <akpm@linux-foundation.org>
Cc: 'Wan ZongShun' <mcuos.com@gmail.com>, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>, a.zummo@towertech.it

Andrew Morton wrote:
> 
> On Fri, 08 Oct 2010 08:16:44 +0900
> Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
> > Updated patch 1/5 has been tested on S3C24XX and its working fine.
> > Its remained issue is that Ben was wondering its working on S3C24XX.
> >
> > And about the patch 4/5, I did address comments from Ben Dooks and Wan
> > ZongShun.
> 
> ok...
> 
> > So could you please handle this series?
> > If any problems, please kindly let me know.
> >
> > They are since commit cb655d0f3d57c23db51b981648e452988c0223f9:
> >   Linux 2.6.36-rc7 (2010-10-06 13:39:52 -0700)
> >
> > are available in the git repository at:
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > next-rtc-s3c
> 
> Can you please email them all out in the old-fashioned way?  Because a)
> I don't manage patches with git and b) that way people will actually
> look at the code.
> 
Sure...it's no problem.
You mean...old-fashioned way is re-sending patches to mailinglist including
Cc'ed you?

> Thanks.

Thanks :-)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
