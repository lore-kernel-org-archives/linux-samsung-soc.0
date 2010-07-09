From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Requested features for next merge on s5pc110
Date: Fri, 09 Jul 2010 10:43:50 +0900
Message-ID: <022e01cb1f08$319726e0$94c574a0$%kim@samsung.com>
References: <AANLkTim58_kJFO0vjTXufYc0DkLhT-nVv25trxgjmsFk@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56056 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751281Ab0GIBnt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Jul 2010 21:43:49 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L59008BEOSZEBC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Jul 2010 10:43:47 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L590059BOSYZ3@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Jul 2010 10:43:47 +0900 (KST)
In-reply-to: <AANLkTim58_kJFO0vjTXufYc0DkLhT-nVv25trxgjmsFk@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, =?ks_c_5601-1987?B?J8fUuO

Kyungmin Park wrote:
> 
> Hi Kukjin,
> 
Hi,

> Before next merge window, I hope these features will be included.
> If your team is done already, please reply it. If not, our team will do
it.
> 
> 1. High-resolution timer using timer 4 and systimer.
>     other timer 1, 2, 3, is used

HR-Timer patch for S5P SoCs will be submitted in a few days. And maybe used
2 PWM Timers because S5P6440 does not have System Timer.

Also, will be submitted specific SoC support HR-Timer together..but I'm not
sure whether used timer4 and systimer.

> 
> 2. Basic suspend & resume feature.
>     No clock gating, and cpufreq. Of course I hope it's included.
> 
Now preparing re-submit..so maybe can be submitted soon.

> 3. Aquila & goni board support.
>     If possible all feature are included at current maineline kernel
> implemented.
> 
> If I'm missing one features, please let me know,
> 
> Give your opinions.
> 
Need to sort out items for merge window..and will inform soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
