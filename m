From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Add watchdog in exynos5440-ssdk5440 device list
Date: Tue, 22 Jan 2013 18:36:55 -0800
Message-ID: <069201cdf912$84096c30$8c1c4490$@samsung.com>
References: <1358571651-22020-1-git-send-email-kgene.kim@samsung.com>
 <1793091.ko9ZbaznTT@flatron> <50FCE57D.9030200@linaro.org>
 <9639911.zE6ZmhnMfv@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11027 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751819Ab3AWChP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jan 2013 21:37:15 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH2008AQ4LK06M0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jan 2013 11:37:13 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH2000J84LZ17G0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jan 2013 11:37:13 +0900 (KST)
In-reply-to: <9639911.zE6ZmhnMfv@amdc1227>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, 'Giridhar Maruthy' <giridhar.m@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

Tomasz Figa wrote:
> 
> On Monday 21 of January 2013 12:21:41 Tushar Behera wrote:
> > On 01/19/2013 04:10 PM, Tomasz Figa wrote:
> > > Hi Kukjin,
> > >
> > > The commit message is a bit confusing, because it says that something
> > > is being added, while in fact the whole node is being removed.
> > >
> > > Shouldn't it rather say something like:
> > > ARM: dts: exynos5440-ssdk5440: Remove disabled status from watchdog
> > > node
> > Rather, should we not be following a consistent approach for both
> > EXYNSO4 and EXYNOS5.
> >
> > In EXYNOS4, the default state of the nodes is 'disabled' and they are
> > enabled in the board-specific files whereas it is exactly the opposite
> > in case of EXYNOS5.
> 
> Yes, I think we should eventually modify Exynos 5 to use the same approach
> as Exynos 4.
> 
Well, I know what you suggested and the way is used on exynos4 DT. But in
the case of EXYNOS5440, all the peripherals are used on boards based on
EXYNOS5440 SoC, so we can keep the peripherals available.

Thanks.

- Kukjin
