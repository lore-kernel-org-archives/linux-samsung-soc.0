From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] Enable config options to enable S2R wakeup
Date: Tue, 18 Jun 2013 19:58:27 +0900
Message-ID: <1c3201ce6c12$c2c9f6b0$485de410$%kim@samsung.com>
References: <1371442686-24999-1-git-send-email-tushar.behera@linaro.org>
 <20130617172506.GD28497@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42037 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436Ab3FRK6e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 06:58:34 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOL007N555F13P0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 19:58:27 +0900 (KST)
In-reply-to: <20130617172506.GD28497@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

Olof Johansson wrote:
> 
> On Mon, Jun 17, 2013 at 09:48:04AM +0530, Tushar Behera wrote:
> > RTC source is very useful in testing S2R wakeup. Also enable
> > gpio-keys driver in case someone wants wakeup the board using
> > the buttons.
> >
> > S2R wakeup feature on Arndale depends on following two additional
> > patches.
> >
> > 1. [PATCH 1/8] ARM: EXYNOS: use generic cpu idle function for wfi
> >  http://permalink.gmane.org/gmane.linux.linaro.devel/15871
> >
> > 2. [PATCH V2] ARM: dts: Enable RTC node for Arndale
> > (Posted a couple of minutes back, link not available yet)
> >
> > S2R wakeup tested on Arndale board with an initramfs through
> > both RTC wakeup alarm and GPIO button interrupt.
> >
> > Tushar Behera (2):
> >   ARM: exynos_defconfig: Enable GPIO buttons driver
> >   ARM: exynos_defconfig: Enable RTC driver
> >
> >  arch/arm/configs/exynos_defconfig |    3 +++
> >  1 file changed, 3 insertions(+)
> 
> Acked-by: Olof Johansson <olof@lixom.net>
> 
> ..  but I don't see a need to keep them as two separate commit, just
> squash
> them when applying, Kukjin.
> 
Sure, I will. Thanks.
- Kukjin
