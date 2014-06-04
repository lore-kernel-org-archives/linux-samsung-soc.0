From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH v2 2/2] s5p-mfc: Adding MFC v7 and v8 firmwares
Date: Wed, 04 Jun 2014 13:08:45 +0200
Message-ID: <01f601cf7fe5$5b325fa0$11971ee0$%debski@samsung.com>
References: <1400676064-17819-1-git-send-email-arun.kk@samsung.com>
 <1400676064-17819-2-git-send-email-arun.kk@samsung.com>
 <1401824047.2412.7.camel@deadeye.wl.decadent.org.uk>
 <1401837995.2412.45.camel@deadeye.wl.decadent.org.uk>
 <CALt3h7-D1VA5WfyaZDpuOe0L6V2ZhiOsb-wDFx48Nk3-mxBAPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33040 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752129AbaFDLIk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jun 2014 07:08:40 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6N00GJG5MAM6A0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Jun 2014 12:08:34 +0100 (BST)
In-reply-to: <CALt3h7-D1VA5WfyaZDpuOe0L6V2ZhiOsb-wDFx48Nk3-mxBAPA@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arun Kumar K' <arun.kk@samsung.com>, 'Ben Hutchings' <ben@decadent.org.uk>
Cc: 'David Woodhouse' <dwmw2@infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, linux-firmware@kernel.org

Hi Arun, Ben, 


> From: arunkk.samsung@gmail.com [mailto:arunkk.samsung@gmail.com] On
> Behalf Of Arun Kumar K
> Sent: Wednesday, June 04, 2014 7:32 AM
> 
> Hi Ben,
> 
> On Wed, Jun 4, 2014 at 4:56 AM, Ben Hutchings <ben@decadent.org.uk>
> wrote:
> > On Tue, 2014-06-03 at 20:34 +0100, Ben Hutchings wrote:
> >> On Wed, 2014-05-21 at 18:11 +0530, Arun Kumar K wrote:
> >> > Adding the following firmware files for MFC
> >> > s5p-mfc-v7.fw: Used in exynos 5420
> >> > s5p-mfc-v8.fw: Used in exynos 5800
> >> >
> >> > Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> >> > ---
> >> > Changes from v1
> >> > - None
> >> > ---
> >> >  WHENCE                |    2 ++
> >> >  s5p-mfc/s5p-mfc-v7.fw |  Bin 0 -> 382724 bytes
> >> > s5p-mfc/s5p-mfc-v8.fw |  Bin 0 -> 360576 bytes
> >> >  3 files changed, 2 insertions(+)
> >> >  create mode 100644 s5p-mfc/s5p-mfc-v7.fw  create mode 100644
> >> > s5p-mfc/s5p-mfc-v8.fw
> >> [...]
> >>
> >> Applied, thanks.
> >
> > Just noticed a problem with all the s5p-mfc firmware: you are putting
> > it in the s5p-mfc subdirectory, so distribution packages will install
> > them in /lib/firmware/s5p-mfc.  However, unless I'm mistaken your
> > driver requests it with a bare filename (e.g. "s5p-mfc-v7.fw") so it
> > won't be found.
> >
> 
> Yes this issue is there.
> Kamil, are you ok with changing the fw load path to s5p-mfc/s5p-mfc*.fw
> in the driver?

We have two options here:
1) Change the driver to request s5p-mfc/sp5-mfc-fw*
2) Move the files in the firmware repository

I would opt for the second option. The driver was uploaded before the
firmware. I see that there are many firmware files in the root folder
of the repository

Ben, what is your opinion? Which is preferred: creating subdirectories
or storing firmware in the root folder?

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland

> 
> Regards
> Arun
> 
> > Ben.
> >
> > --
> > Ben Hutchings
> > Experience is what causes a person to make new mistakes instead of
> old ones.
