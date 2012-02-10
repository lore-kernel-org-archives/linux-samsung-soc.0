From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 8/9] ARM: EXYNOS: temporary add map definitions for uart
Date: Fri, 10 Feb 2012 17:35:15 +0900
Message-ID: <00fb01cce7ce$e9674440$bc35ccc0$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-9-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2VU-rLQ=fQT5Jx5kPcHSLOiEcTVdFaQjsWnxA=Yr6i0Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36803 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758463Ab2BJIfT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 03:35:19 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ600FS056RZ6P0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 17:35:17 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600JHU56RQZ71@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 17:35:17 +0900 (KST)
In-reply-to: <CAH9JG2VU-rLQ=fQT5Jx5kPcHSLOiEcTVdFaQjsWnxA=Yr6i0Gg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kyungmin Park wrote:
> 
> On 2/1/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---

[...]

> > +#ifdef CONFIG_ARCH_EXYNOS4
> > +#define S3C_PA_UART			EXYNOS4_PA_UART
> > +#endif
> > +
> > +#ifdef CONFIG_ARCH_EXYNOS5
> > +#define S3C_PA_UART			EXYNOS5_PA_UART
> > +#endif
> If it selects the both ARCH_EXYNOS4 and ARCH_EXYNOS5, how to handle
> this one? I think it's time to clean up these macro magic.

They will be updated for selection of EXYNOS4 and EXYNOS5 together in next
version.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
