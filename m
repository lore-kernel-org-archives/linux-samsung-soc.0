From: kgene@kernel.org
Subject: RE: [PATCH 0/3] ARM: EXYNOS: Add generic PWM lookup support
Date: Fri, 14 Sep 2012 13:02:34 +0900
Message-ID: <01a101cd922d$c59592b0$50c0b810$@org>
References: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
 <20120912121741.GA3491@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60145 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab2INECg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 00:02:36 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAB00MCCN8BOPI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 13:02:35 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAB007DYN8AZM30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Sep 2012 13:02:35 +0900 (KST)
In-reply-to: <20120912121741.GA3491@avionic-0098.mockup.avionic-design.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thierry Reding' <thierry.reding@avionic-design.de>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, tushar.behera@linaro.org, patches@linaro.org

> On Wed, Sep 12, 2012 at 05:03:29PM +0530, Sachin Kamat wrote:
> > This series adds support for generic PWM framework which requires
> > that the board setup code register a static mapping that can be
> > used to match PWM consumers to providers.
> >
> > This series is based on for-next branch of Kukjin's tree.
> >
> > Sachin Kamat (2):
> >   ARM: EXYNOS: Add generic PWM lookup support for SMDK4X12
> >   ARM: EXYNOS: Add generic PWM lookup support for SMDKV310
> >
> > Tushar Behera (1):
> >   ARM: EXYNOS: Use generic pwm driver in Origen board
> >
> >  arch/arm/mach-exynos/Kconfig         |    3 +++
> >  arch/arm/mach-exynos/mach-origen.c   |    6 ++++++
> >  arch/arm/mach-exynos/mach-smdk4x12.c |    6 ++++++
> >  arch/arm/mach-exynos/mach-smdkv310.c |    7 +++++++
> >  4 files changed, 22 insertions(+), 0 deletions(-)
> 
> These look great. I'm glad somebody's starting to convert boards to use
> the lookup tables. Eventually when every board has been converted we can
> transition to the new API by getting rid of pwm_request() and pwm_free()
> in the user drivers and using only the counterparts from the new API.
> 
Yeah, agree :-)

> All three patches: Reviewed-by: <thierry.reding@avionic-design.de>

Thanks, applied this series.

K-Gene <kgene@kernel.org>
