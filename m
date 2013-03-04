From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: S5PV210: Fix PL330 DMA controller clkdev entries
Date: Mon, 04 Mar 2013 14:54:18 +0100
Message-ID: <5134A78A.9050709@samsung.com>
References: <1362227906-13921-1-git-send-email-s.nawrocki@samsung.com>
 <51321326.6050800@gmail.com> <008001ce18d8$451527e0$cf3f77a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:27412 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756537Ab3CDNya (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 08:54:30 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJ5007CA2J6DD80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 13:54:27 +0000 (GMT)
Received: from [106.116.147.32] by eusync1.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MJ5003IZ2MJQK20@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 13:54:27 +0000 (GMT)
In-reply-to: <008001ce18d8$451527e0$cf3f77a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Lonsn' <lonsn2005@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Inderpal Singh' <inderpal.singh@linaro.org>, 'Boojin Kim' <boojin.kim@samsung.com>

On 03/04/2013 02:00 PM, Kukjin Kim wrote:
> Looks good to me, applied into -fixes.
> 
> Sylwester, why did you want to re-send this patch?

Only to add

Tested-by: Lonsn <lonsn2005@gmail.com>
Cc: stable@vger.kernel.org # 3.7

tags, and any other in case someone else tests the patch.

I think we would need this fix for stable 3.7 as well.

Thanks for applying it.

Regards,
Sylwester
