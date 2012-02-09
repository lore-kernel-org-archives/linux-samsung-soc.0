From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/9] ARM: EXYNOS: add initial setup-i2c0 for EXYNOS5
Date: Thu, 09 Feb 2012 19:56:56 +0900
Message-ID: <068c01cce719$8a69a600$9f3cf200$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-4-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2UAPO6wfEaoTfOvu53x3whkLBjcM45SV4m7Pf4su7Gn2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23088 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961Ab2BIK44 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 05:56:56 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ4000IHH2U74T0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 19:56:54 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400CQOH2UCR10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 19:56:54 +0900 (KST)
In-reply-to: <CAH9JG2UAPO6wfEaoTfOvu53x3whkLBjcM45SV4m7Pf4su7Gn2A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kyungmin Park wrote:
> 
> On 2/1/12, Kukjin Kim <kgene.kim@samsung.com> wrote:

[snip]

> > +	if (soc_is_exynos5250())
> > +		;
> > +		/* will be implemented with gpio function */
> Do you want to include both exynos4-gpio and exynos5-gpio?

Now, yes. But I think, I need to sort out the regarding gpio later.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
