From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/7] ARM: EXYNOS4: Support early wakeup while entering
	sleep mode
Date: Fri, 24 Jun 2011 16:42:26 +0900
Message-ID: <007401cc3242$48947160$d9bd5420$%kim@samsung.com>
References: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com>
 <1308732405-16664-5-git-send-email-kgene.kim@samsung.com>
 <20110622145715.GS23234@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21593 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752357Ab1FXHmh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jun 2011 03:42:37 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNA00CSLAQIK250@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 Jun 2011 16:42:35 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNA000ENAQZY3@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 Jun 2011 16:42:35 +0900 (KST)
In-reply-to: <20110622145715.GS23234@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>, ben-linux@fluff.org

Russell King - ARM Linux wrote:

> Stop bodging stuff (like you have for the SCU stuff.) and start _talking_
> to people if the code doesn't do what you need it to do.

Hi Russell and all,

I'd like to share requirement of EXYNOS4210 PM.

Now if there is wakeup source which is pending before entering suspend mode,
PMU(Power Management Unit) handles WFI instruction as NOP on EXYNOS4210. But
it seems that current cpu_suspend() cannot support this. So how can/should
we handle this case?

And this is another case. For example, assume that ARM is power down mode
and outer cache(L2 cache) data is retention state to use L2 cache data after
wakeup. In this case, according to wakeup sequence, firstly L1 cache is
enabled in cpu_resume() then L2 cache will be enabled which is implemented
in Samsung SoC specific code. So how can be handled the coherency problem
between L1 cache and L2 cache?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
