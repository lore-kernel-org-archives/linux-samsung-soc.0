From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V6 1/5] ARM: exynos: Add support AFTR mode on EXYNOS4210
Date: Tue, 21 Feb 2012 20:12:02 +0900
Message-ID: <00b201ccf089$a2f039e0$e8d0ada0$%kim@samsung.com>
References: <1329805190-8874-1-git-send-email-amit.kachhap@linaro.org>
 <1329805190-8874-2-git-send-email-amit.kachhap@linaro.org>
 <4F433E79.2090309@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27677 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753971Ab2BULMO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 06:12:14 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZQ00K56PRWYXQ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 20:12:02 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZQ001YRPS2E930@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 20:12:02 +0900 (KST)
In-reply-to: <4F433E79.2090309@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Amit Daniel Kachhap' <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Tushar Behera wrote:
> 
> Hi Amit,
> 
> On 02/21/2012 11:49 AM, Amit Daniel Kachhap wrote:
> > This patch adds support AFTR(ARM OFF TOP RUNNING) mode in
> > cpuidle driver. L2 cache keeps their data in this mode.
> > This patch ports the code to the latest interfaces to
> > save/restore CPU state inclusive of CPU PM notifiers, l2
> > resume and cpu_suspend/resume.
> >
> > Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
> > ---
> >  arch/arm/mach-exynos/cpuidle.c          |  147
> ++++++++++++++++++++++++++++++-
> >  arch/arm/mach-exynos/include/mach/pmu.h |    2 +
> >  2 files changed, 146 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-
> exynos/cpuidle.c
> 
> [ snip ]
> 
> > +static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
> > +				struct cpuidle_driver *drv,
> > +				int index)
> > +{
> 
> [ snip ]
> 
> > +	scu_enable(S5P_VA_SCU);
> 
> #ifdef CONFIG_SMP
> 	scu_enable(S5P_VA_SCU);
> #endif
> 
> Without this, if SMP is not enabled, I am getting following build error.
> 
> arch/arm/mach-exynos/built-in.o: In function `exynos4_enter_core0_aftr':
> arch/arm/mach-exynos/cpuidle.c:131: undefined reference to `scu_enable'
> 
Thanks for your pointing out.

Let me fix it as per your comment when I apply this patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
