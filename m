From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/7] ARM: EXYNOS4: Support early wakeup while entering
	sleep mode
Date: Mon, 04 Jul 2011 18:42:08 +0900
Message-ID: <005001cc3a2e$a6689480$f339bd80$%kim@samsung.com>
References: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com>
 <1308732405-16664-5-git-send-email-kgene.kim@samsung.com>
 <20110622145715.GS23234@n2100.arm.linux.org.uk>
 <007401cc3242$48947160$d9bd5420$%kim@samsung.com>
 <20110624093750.GD23234@n2100.arm.linux.org.uk>
 <20110624102246.GF23234@n2100.arm.linux.org.uk>
 <017d01cc378a$c017edf0$4047c9d0$%kim@samsung.com>
 <20110701074414.GD21898@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15740 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753901Ab1GDJmN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 05:42:13 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNS006Z6YYCNUP0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 18:42:12 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNS00K90YYCBW@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 18:42:12 +0900 (KST)
In-reply-to: <20110701074414.GD21898@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Jaecheol Lee' <jc.lee@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Russell King - ARM Linux wrote:
> 
> On Fri, Jul 01, 2011 at 10:03:48AM +0900, Kukjin Kim wrote:
> > Russell thanks.
> >
> > How do you think to add following for handling failure of cpu_suspend?
> >
> > +	mov	r0, #-1
> 
> No.  -1 is not an error code, and I refuse to create functions which
> use an explicit -1 as a return code to indicate failure.
> 
I used wrong words, 'handling failure' :(

Actually, it means handling other case, like early wakeup but we will
address comments from you :)

> The code is designed so that the called finisher function can return
> a valid errno value.

OK, I see.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
