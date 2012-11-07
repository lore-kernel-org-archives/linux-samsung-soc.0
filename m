From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] gpio: samsung: Skip registration if pinctrl driver is
 present on Exynos4x12
Date: Wed, 07 Nov 2012 13:41:44 +0900
Message-ID: <0c5301cdbca2$30320240$909606c0$%kim@samsung.com>
References: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
 <1351089457-8205-3-git-send-email-t.figa@samsung.com>
 <CACRpkdYNDSp0K3wpvUem9ecsW-JQ9L6aKqaOmHNUR65DQTMNHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30120 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753527Ab2KGElq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 23:41:46 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD300EWXP1A5E20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 13:41:44 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD300CM8P1K0WB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 13:41:44 +0900 (KST)
In-reply-to: <CACRpkdYNDSp0K3wpvUem9ecsW-JQ9L6aKqaOmHNUR65DQTMNHA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org

Linus Walleij wrote:
> 
> On Wed, Oct 24, 2012 at 4:37 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> 
> > This patch modifies the Samsung GPIO driver to check for pinctrl driver
> > presence earlier and use generic matching instead of a single compatible
> > value.
> >
> > This allows us to fix warning about unrecognized SoC in case of
> > Exynos4x12, which is not supported by this driver.
> >
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Tell me if there is something you want merged through
> the GPIO or pinctrl tree. I have this Samsung branch on the
> pinctrl tree...
> 
Hi Linus, 

A commit 1b6056d6 ("pinctrl: samsung: Include bank-specific eint offset in
bank struct") which is in your pinctrl tree (samsung branch) changed
macro(EXYNOS_PIN_BANK_EINTG) to add offset. Eventually, this series(due to
3rd patch, pinctrl: samsung: Add support for Exynos4x12) breaks compilation
without the commit. So if you don't have a plan to rebase samsung branch of
your pinctrl tree, I'd like to merge it in my tree. Is it ok to you?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
