From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: Fix a typo on Exynos5440 DTS files
Date: Thu, 12 Sep 2013 19:17:44 +0900
Message-ID: <06f201ceafa1$527751f0$f765f5d0$@org>
References: <005501ceaf8f$2483bac0$6d8b3040$%nam@samsung.com>
 <CAK9yfHx+Cg=kiqqFgpxE5e8LLnNR8Wu4L=rXNvV6Xf=SqSJ4gg@mail.gmail.com>
 <009201ceaf95$c871eb60$5955c220$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12992 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752489Ab3ILKRr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 06:17:47 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MT000206CLLY6Y0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Sep 2013 19:17:45 +0900 (KST)
In-reply-to: <009201ceaf95$c871eb60$5955c220$%lee@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jungseok Lee' <jays.lee@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Youngmin Nam' <youngmin.nam@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Jungseok Lee wrote:
> 
> On Thursday, September 12, 2013 5:15 PM, Sachin Kamat
> <sachin.kamat@linaro.org> wrote:
> > On 12 September 2013 13:37, Youngmin Nam <youngmin.nam@samsung.com>
> wrote:
> > > This patch removes '_' from "early_prink" on Exynos5440 DTS files
> > > in according to kernel-parameters document.
> > >
> > > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> >
> > Good catch.
> > Reviewed-by: Sachin Kamat <sachin.kamat@linaro.org>
> >
> 
> I've tested it on Exynos5440. It works fine.
> Tested-by: Jungseok Lee <jays.lee@samsung.com>

Thanks, you guys.

Will apply.
- Kukjin
