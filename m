From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Fix link error with
 CONFIG_PINCTRL_EXYNOS disabled
Date: Tue, 23 Apr 2013 14:09:46 +0200
Message-ID: <6940961.67Lk2axxPL@amdc1227>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
 <1398545.9FqHoC0WZW@flatron>
 <CACRpkdbJj9Newk+sCTvJzxA4V2cmJ3hzuQELv7t1wFMhd_Y8+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35710 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755467Ab3DWMJx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 08:09:53 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLP00NIQJ444P41@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Apr 2013 21:09:52 +0900 (KST)
In-reply-to: <CACRpkdbJj9Newk+sCTvJzxA4V2cmJ3hzuQELv7t1wFMhd_Y8+Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, kwangwoo.lee@gmail.com, Peter Korsgaard <jacmet@sunsite.dk>, augulis.darius@gmail.com, mcuelenaere@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Abraham <thomas.abraham@linaro.org>

Hi Linus,

On Tuesday 23 of April 2013 14:03:12 Linus Walleij wrote:
> On Wed, Apr 17, 2013 at 12:24 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> > Commit f67faf487 added driver data for Exynos5250, which is available
> > only if CONFIG_PINCTRL_EXYNOS is enabled. However probably due to merge
> > error, the reference to this driver data structure was located outside
> > of relevant ifdef and compiled unconditionally, leading to link error
> > with CONFIG_PINCTRL_EXYNOS.
> > 
> > This patch fixes mentioned link error by moving driver data entry under
> > ifdef CONFIG_PINCTRL_EXYNOS.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> This does not apply to my "devel" branch in the pinctrl tree.
> 
> Could you rebase it on that branch?
> 
> Or is the error not even in my tree?

This one got sent incorrectly due to my mistake. Please try the correct 
version:

[PATCH RESEND 2/2] pinctrl: samsung: Fix link error with CONFIG_PINCTRL_EXYNOS 
disabled

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
