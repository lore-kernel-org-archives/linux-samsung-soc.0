From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add PWM backlight support on Samsung SMDKV310
Date: Thu, 23 Jun 2011 20:44:37 +0900
Message-ID: <017201cc319a$f2571660$d7054320$%kim@samsung.com>
References: <22693111.118621308725759945.JavaMail.weblogic@epv6ml03>
 <BANLkTi=SqB7NHQ7vStegFgQjihoQRmzVCw@mail.gmail.com>
 <BANLkTikb33PCQtiVmcVm38-ptZPMXMk60g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36912 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759289Ab1FWLoq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 07:44:46 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN800BVZRAJHP50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jun 2011 20:44:45 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN8007HERAKO8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jun 2011 20:44:45 +0900 (KST)
In-reply-to: <BANLkTikb33PCQtiVmcVm38-ptZPMXMk60g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Banajit Goswami' <banajit.goswami@gmail.com>, jg1.han@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org

Banajit Goswami wrote:
> 
> > From: JinGoo Han <jg1.han@samsung.com>
> >
> > Hi, Banajit.
> Hi Jingoo,
> 
Hi all,

Hmm...
If the same code is required into each boards, please don't add them on both.

I think, we can avoid duplication...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
