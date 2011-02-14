From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Use REGULATOR_SUPPLY macro for regulator
 consumers
Date: Mon, 14 Feb 2011 10:35:54 +0100
Message-ID: <000001cbcc2a$9637e790$c2a7b6b0$%szyprowski@samsung.com>
References: <1296206960-28148-1-git-send-email-kgene.kim@samsung.com>
 <000501cbc9ce$6d281360$47783a20$%szyprowski@samsung.com>
 <20110211183104.GA8149@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15596 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752268Ab1BNJg2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Feb 2011 04:36:28 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGL00K03PC878D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Feb 2011 18:36:08 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGL00JM7PBVWR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Feb 2011 18:36:08 +0900 (KST)
In-reply-to: <20110211183104.GA8149@sirena.org.uk>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hello,

On Friday, February 11, 2011 7:31 PM Mark Brown wrote:

> On Fri, Feb 11, 2011 at 10:31:08AM +0100, Marek Szyprowski wrote:
> 
> > I'm sorry for the late reply, just noticed this commit on your kernel tree...
> 
> Please don't make up e-mail addresses for people if you want them to see
> your e-mail - my e-mail address is broonie@opensource.wolfsonmicro.com

I'm really sorry for the using wrong email. I've relied on email cache, but
it looks it was simply wrong here...

> > > -	.num_consumer_supplies	= ARRAY_SIZE(buck1_consumer),
> > > -	.consumer_supplies	= buck1_consumer,
> > > +	.num_consumer_supplies	= 1,
> > > +	.consumer_supplies	= &buck1_consumer,
> > >  };
> 
> > I'm really not sure that this type of change is necessary. IMHO it makes the code harder
> > to read, update or reuse. What is the reason for it?
> 
> FWIW I don't think it makes much difference either way.

Ok, then I'm fine with the change.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
