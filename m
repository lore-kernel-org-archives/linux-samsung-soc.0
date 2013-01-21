From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add watchdog in exynos5440-ssdk5440 device list
Date: Mon, 21 Jan 2013 14:09:01 +0100
Message-ID: <9639911.zE6ZmhnMfv@amdc1227>
References: <1358571651-22020-1-git-send-email-kgene.kim@samsung.com>
 <1793091.ko9ZbaznTT@flatron> <50FCE57D.9030200@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28118 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335Ab3AUNJx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 08:09:53 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGZ004VI8J5E1K0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 21 Jan 2013 22:09:10 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGZ00D438J7MY60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 21 Jan 2013 22:09:10 +0900 (KST)
In-reply-to: <50FCE57D.9030200@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.m@samsung.com>

On Monday 21 of January 2013 12:21:41 Tushar Behera wrote:
> On 01/19/2013 04:10 PM, Tomasz Figa wrote:
> > Hi Kukjin,
> > 
> > The commit message is a bit confusing, because it says that something
> > is being added, while in fact the whole node is being removed.
> > 
> > Shouldn't it rather say something like:
> > ARM: dts: exynos5440-ssdk5440: Remove disabled status from watchdog
> > node
> Rather, should we not be following a consistent approach for both
> EXYNSO4 and EXYNOS5.
> 
> In EXYNOS4, the default state of the nodes is 'disabled' and they are
> enabled in the board-specific files whereas it is exactly the opposite
> in case of EXYNOS5.

Yes, I think we should eventually modify Exynos 5 to use the same approach 
as Exynos 4.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
