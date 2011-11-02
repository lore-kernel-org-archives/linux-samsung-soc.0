From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] SPI: S3C64XX: Use bus clocks created using clkdev
Date: Wed, 02 Nov 2011 20:15:10 +0900
Message-ID: <004901cc9950$af6b73f0$0e425bd0$%kim@samsung.com>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
 <1316778827-24694-2-git-send-email-padma.v@samsung.com>
 <20110923231233.GE24631@ponder.secretlab.ca>
 <003301cc7ca3$3314dae0$993e90a0$%kim@samsung.com>
 <CAAgF-Bf74OJu_OhkJ5vnMoak45ie3VfMxFRjJBO+Swx5o8edXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13498 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754177Ab1KBLPL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 07:15:11 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU1006WR5XAK620@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2011 20:15:10 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU100GKJ5XAN150@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 02 Nov 2011 20:15:10 +0900 (KST)
In-reply-to: <CAAgF-Bf74OJu_OhkJ5vnMoak45ie3VfMxFRjJBO+Swx5o8edXA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'padma venkat' <padma.kvr@gmail.com>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, ben-linux@fluff.org, s.nawrocki@samsung.com

padma venkat wrote:
> 
> Hi All,
> 
> On Tue, Sep 27, 2011 at 4:52 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> >
> > Grant Likely wrote:
> > >
> > > On Fri, Sep 23, 2011 at 05:23:41PM +0530, Padmavathi Venna wrote:
> > > > This patch modifies the driver to stop depending on the
> > > > clock names being passed from platform and switch over
> > > > to lookup clocks generic names using clkdev
> > > >
> > > > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> > >
> > > Looks okay to me.
> > >
> > > Acked-by: Grant Likely <grant.likely@secretlab.ca>
> > >
> > > This series I imagine should go in via the arm-soc tree.
> > >
> > OK, if others ok to me, I will pick up this series so that it will be
sent
> > to upstream via arm-soc.
> 
> Ping.
> Any update on this.
> 

As I said, you need to re-submit others now. Then I will pick this up with
others.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
