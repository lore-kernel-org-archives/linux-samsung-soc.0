From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/4] pinctrl: samsung: Add support for Exynos4x12
Date: Mon, 29 Oct 2012 11:28:23 +0100
Message-ID: <2350814.8tYbDqrzVz@amdc1227>
References: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
 <CACRpkdaoQP2jat_mr2wr30M39eogKAq77Gw2VoNPWbgHjgW+zw@mail.gmail.com>
 <CAH9JG2V2UjuvjK2_sjLQsEt21duCqyoQuAi0KsMfB+CjRrh8KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57621 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796Ab2J2K2b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Oct 2012 06:28:31 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCN000I1H3FF1N0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Oct 2012 19:28:30 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCN00HO0H3G3J10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Oct 2012 19:28:30 +0900 (KST)
In-reply-to: <CAH9JG2V2UjuvjK2_sjLQsEt21duCqyoQuAi0KsMfB+CjRrh8KQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, kgene.kim@samsung.com, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

Hi Linus, Kyungmin,

On Monday 29 of October 2012 09:30:26 Kyungmin Park wrote:
> On 10/29/12, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Oct 24, 2012 at 4:37 PM, Tomasz Figa <t.figa@samsung.com> 
wrote:
> >> This patch extends the driver with any necessary SoC-specific
> >> definitions to support Exynos4x12 SoCs.
> >> 
> >> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > 
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > I guess you need all of this to go into my Samsung branch?
> > I need and ACK from the Samsung maintainer and preferably
> > Thomas A as well.
> 
> Hi,
> 
> Now we're trying to send the standalone patches to avoid the conflict.
> and hope to merge patches via proper subsystem. In this case, pinctl.

Since this depends on the patch adding Exynos4x12 dts files
([PATCH] ARM: dts: exynos4: Add support for Exynos4x12 SoCs),
which will be going through Kgene's tree and this patch series contains 
mostly SoC-specific code, maybe this should rather go through Kgene's 
tree? Or this is not a problem?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
