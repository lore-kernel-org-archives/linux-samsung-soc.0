From: Jinsung Yang <jsgood.yang@samsung.com>
Subject: RE: 2.6.28 and newest linux kernel for samsung
Date: Wed, 16 Dec 2009 16:08:11 +0900
Message-ID: <002c01ca7e1e$8719bcd0$954d3670$%yang@samsung.com>
References: <3c17e3570912102244w21418964y8fb3f0e01ef0e39a@mail.gmail.com>
 <005201ca7a31$ea3ef0a0$bebcd1e0$%yang@samsung.com>
 <3c17e3570912151839g605880e3y8d543d4b9f0e3b68@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41368 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933599AbZLPHIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2009 02:08:30 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUQ00KATH6498@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2009 16:08:28 +0900 (KST)
Received: from JSGOODMAIN ([12.23.109.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUQ008W3H644P@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2009 16:08:28 +0900 (KST)
In-reply-to: <3c17e3570912151839g605880e3y8d543d4b9f0e3b68@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Barry Song' <21cnbao@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi, Barry

We are preparing to release multimedia drivers for 2.6.28 with s3c6410 to the our kernel.org git tree.
Regarding this work, we also keep going on fixing our reference codes.
You may have to wait more time to get the references.
If we get any changes or detail status, I will keep you posted.

Best Regards,
--
Jinsung Yang <jsgood.yang@samsung.com>
SAMSUNG Electronics

> -----Original Message-----
> From: Barry Song [mailto:21cnbao@gmail.com]
> Sent: Wednesday, December 16, 2009 11:39 AM
> To: Jinsung Yang
> Cc: linux-samsung-soc@vger.kernel.org
> Subject: Re: 2.6.28 and newest linux kernel for samsung
> 
> Hi Jinsung,
> Thanks for your reply. Another question is whether there is a release
> for multimedia applications in 2.6.28. I noticed there were releases
> for 2.6.21 and 2.6.24, but 2.6.28 has changed much in MFC, post
> processor etc.,  old codes are not usable. I'd like to play multimedia
> in 2.6.28, and hope to get some reference codes for applications. Hope
> to hear from you soon. Thanks a lot again.
> Barry
> 
> On Fri, Dec 11, 2009 at 3:16 PM, Jinsung Yang <jsgood.yang@samsung.com>
> wrote:
> >> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> >> owner@vger.kernel.org] On Behalf Of Barry Song
> >> Sent: Friday, December 11, 2009 3:45 PM
> >> To: linux-samsung-soc@vger.kernel.org
> >> Subject: 2.6.28 and newest linux kernel for samsung
> >>
> >> Hi,
> >> I found there are many drivers which have existed in samsung 2.6.28
> >> tree. For example, s3c6410 jpeg/multi functions codecs/2D/3D, audio
> >> board drivers, framebuffer and so on. But they are not in 2.6.31 or
> >> newest tree.
> >> Is there any plan about that? And is there any way to use those
> >> drivers in new kernel since some are using old kernel or subsystem
> >> API?
> >
> > We have plan to submit some drivers of s3c6410 to 2.6.33 stable target.
> > Regarding this, we are picking the devices which are possible to be submitted
> or not.
> > We hope that this work is getting started from next week, but it depends on the
> release of 2.6.33-rc1.
> >
> > Best Regards
> > --
> > Jinsung, Yang <jsgood.yang@samsung.com>
> > AP Development Team
> > System LSI, Semiconductor Business
> > SAMSUNG Electronics Co., LTD
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
