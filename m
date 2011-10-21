From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: gpio-interrupts: fix offset calculation
Date: Fri, 21 Oct 2011 18:35:39 +0900
Message-ID: <016e01cc8fd4$cbce37b0$636aa710$%kim@samsung.com>
References: <1318932982-15745-1-git-send-email-m.szyprowski@samsung.com>
 <CAH9JG2WtKi7PA3VHAx+4LEZio56c_PO-1-yAMw6DPm58fv-dUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46000 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753596Ab1JUJfl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Oct 2011 05:35:41 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LTE00J6OTBAHX40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Oct 2011 18:35:40 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LTE005ISTBFEA40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 21 Oct 2011 18:35:40 +0900 (KST)
In-reply-to: <CAH9JG2WtKi7PA3VHAx+4LEZio56c_PO-1-yAMw6DPm58fv-dUg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, 'Marek Szyprowski' <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>

Kyungmin Park wrote:
> 
> Hi Kukjin and Arnd,
> 
> If there's chance to merge for 3.1 bugfix. It's required to run 2nd
> GPIO banks for exynos4210.
> and it should be applied for stable tree also.
> 
OK, it should be fixed. I will try.

Arnd, we don't have enough time so I will send this to Linus directly for
v3.1 before leaving for KS.
If any problems, please let me know :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
