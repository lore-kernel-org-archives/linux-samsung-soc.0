From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/7] pinctrl: exynos5440: add pinctrl driver for Samsung
 EXYNOS5440 SoC
Date: Tue, 06 Nov 2012 19:59:14 +0900
Message-ID: <0be701cdbc0d$c29565e0$47c031a0$%kim@samsung.com>
References: <1351274153-3120-1-git-send-email-kgene.kim@samsung.com>
 <1351274153-3120-6-git-send-email-kgene.kim@samsung.com>
 <CACRpkdZP_sTKV1Nq3FWVQJocg8C8H7J9vd9hmY4k-qAnMPJcLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25256 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901Ab2KFK7T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 05:59:19 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD200IAIBURXG70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 19:59:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD20092YBUQZ640@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 19:59:14 +0900 (KST)
In-reply-to: <CACRpkdZP_sTKV1Nq3FWVQJocg8C8H7J9vd9hmY4k-qAnMPJcLg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

Linus Walleij wrote:
> 
> On Fri, Oct 26, 2012 at 7:55 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
> > From: Thomas Abraham <thomas.abraham@linaro.org>
> >
> > Add a new pinctrl driver for Samsung EXYNOS5440 SoC. The pin controller
> > module in EXYNOS5440 is different from the pin controller found on other
> > Samsung SoC. Hence, the pin controller driver for EXYNOS5440 SoC is
> > independent of the Samsung pinctrl framework.
> >
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> If I haven't ACK:ed this before here's an
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
Thanks for your ack.

> I expect this to go through the Samsung tree?
> 
Yeah, this would be sent to upstream via Samsung tree.

Let me pick this up in my tree with your ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
