From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: About LPAE supporting on EXYNOS5440
Date: Tue, 11 Jun 2013 19:05:22 +0900
Message-ID: <10b001ce668b$2fdddec0$8f999c40$%kim@samsung.com>
References: <109e01ce667e$5becc880$13c65980$%kim@samsung.com>
 <6690814.Wx0lSuVAQ5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11439 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751700Ab3FKKFY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 06:05:24 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO800B1I40ZXV70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 19:05:23 +0900 (KST)
In-reply-to: <6690814.Wx0lSuVAQ5@wuerfel>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>

Arnd Bergmann wrote:
> 
> On Tuesday 11 June 2013 17:33:33 Kukjin Kim wrote:
> > Hi all,
> >
> > The exynos5440 can support LPAE and referece boards, SSDK5440 and SD5v1
> have
> > over 8GiB memory.
> >
> > Current exynos_defconfig selects every EXYNOS SoCs including exynos5440
> it
> > means supporting LPAE will be selected for other EXYNOS SoCs.
> >
> > I'm wondering if seleting LPAE causes some problem for multiplatform.
> Can we
> > support LPAE enabled and disabled platform together with single zImage?
> 
> No, that isn't possible.

Yeah, I know that.

> I think we should enable all exynos support in
> the
> regular multi_v7_defconfig and leave LPAE turned off for that,

But if so, problem will happen in the memory parsing without LPAE
enabling...so I'm wondering I should deselect exynos5440 in the defconfig
for other exynos SoCs...

> but create
> another multi_lpae_defconfig that has all LPAE capable machines turned on.
> This is also what I expect the distros to do.
> 
Yeah, it could be a solution for multiplatform at this moment. And if so,
probably I should deselect exynos5440 in the exynos_defconfig and need to
add another defconfig for exynos lpae stuff.

BTW, do you know what SoCs can support LPAE now?

Thanks,
Kukjin
