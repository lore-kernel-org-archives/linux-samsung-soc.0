From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ASoC: Samsung: Update Kconfig for Exynos5250 and
 Exynos4412
Date: Tue, 23 Oct 2012 20:22:10 +0900
Message-ID: <01ca01cdb110$a48783b0$ed968b10$%kim@samsung.com>
References: <1348741777-29569-1-git-send-email-padma.v@samsung.com>
 <003401cd9d5f$179495c0$46bdc140$@samsung.com> <50658325.8050704@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42761 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753060Ab2JWLWM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 07:22:12 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC004H8FKMDYF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 20:22:10 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC000AEFKY4270@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 20:22:10 +0900 (KST)
In-reply-to: <50658325.8050704@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Sangsu Park' <sangsu4u.park@samsung.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, ben-linux@fluff.org, olofj@google.com

Tushar Behera wrote:
> 
> On 09/28/2012 03:23 PM, Sangsu Park wrote:
> >
> > On Thu, Sep 27, 2012 at 07:30 PM, Padmavathi Venna wrote:
> >

[...]

> >> @@ -63,7 +63,7 @@ config SND_SOC_SAMSUNG_SMDK_WM8580
> >>
> >>  config SND_SOC_SAMSUNG_SMDK_WM8994
> >>  	tristate "SoC I2S Audio support for WM8994 on SMDK"
> >> -	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
> >> MACH_SMDK4212)
> >> +	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
> >> MACH_SMDK4212 || MACH_SMDK4412 || MACH_EXYNOS5_DT)
> >>  	depends on I2C=y && GENERIC_HARDIRQS
> >>  	select MFD_WM8994
> >>  	select SND_SOC_WM8994
> >
> > I'm not sure about this since MACH_EXYNOS5_DT can have others instead of
> SMDK.
> >
> 
> But there is no other way we can differentiate between two EXYNOS5_DT
> based boards in the kernel. So, support for all possible codecs and
> sound-cards should be enabled in the kernel. The instantiation of the
> drivers should depend on the device-tree entries.
> 
Hmm...any idea on this?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
