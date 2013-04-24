From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Fix link error with
 CONFIG_PINCTRL_EXYNOS disabled
Date: Wed, 24 Apr 2013 16:47:08 +0200
Message-ID: <2113989.KXXvDDhnMa@amdc1227>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
 <6940961.67Lk2axxPL@amdc1227>
 <CACRpkdZmSj-AqUA9kd7NMN6cL2Nxa0EaKoSVkwQSrxhcWEeQtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35315 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752450Ab3DXOrV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Apr 2013 10:47:21 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLR008Q4L2VRV10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Apr 2013 23:47:20 +0900 (KST)
In-reply-to: <CACRpkdZmSj-AqUA9kd7NMN6cL2Nxa0EaKoSVkwQSrxhcWEeQtg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, Kwangwoo LEE <kwangwoo.lee@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>, Darius Augulis <augulis.darius@gmail.com>, Maurus Cuelenaere <mcuelenaere@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Wednesday 24 of April 2013 16:27:09 Linus Walleij wrote:
> On Tue, Apr 23, 2013 at 2:09 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> > On Tuesday 23 of April 2013 14:03:12 Linus Walleij wrote:
> >> This does not apply to my "devel" branch in the pinctrl tree.
> >> 
> >> Could you rebase it on that branch?
> >> 
> >> Or is the error not even in my tree?
> > 
> > This one got sent incorrectly due to my mistake. Please try the correct
> > version:
> > 
> > [PATCH RESEND 2/2] pinctrl: samsung: Fix link error with
> > CONFIG_PINCTRL_EXYNOS disabled
> 
> This does not apply either.
> 
> Can you please test against the "devel" branch in the pinctrl tree?

Right, it does not apply.

Well, actually it does with git am -3, but it is incorrect, since the problem 
it intends to fix is not present in your tree, but rather is a merge error in 
linux-next in a merge of Kgene's and your tree...

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
