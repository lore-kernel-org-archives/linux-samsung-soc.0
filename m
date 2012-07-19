From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] ARM: SAMSUNG: Add API to set platform data for s5p-tv
 driver
Date: Fri, 20 Jul 2012 07:56:02 +0900
Message-ID: <195901cd6601$ab971c60$02c55520$%kim@samsung.com>
References: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
 <1341218932-15846-2-git-send-email-sachin.kamat@linaro.org>
 <147701cd63c5$a6c8ff70$f45afe50$%kim@samsung.com> <5004DCF4.1090409@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51446 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751763Ab2GSW4E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 18:56:04 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7F003SIJPDNG20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:56:02 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7F00I7GJPETYB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 07:56:02 +0900 (KST)
In-reply-to: <5004DCF4.1090409@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, patches@linaro.org, a.sim@samsung.com, jiun.yu@samsung.com, june.bae@samsung.com


> -----Original Message-----
> From: Tushar Behera [mailto:tushar.behera@linaro.org]
> Sent: Tuesday, July 17, 2012 12:33 PM
> To: Kukjin Kim
> Cc: 'Sachin Kamat'; linux-samsung-soc@vger.kernel.org; patches@linaro.org;
> a.sim@samsung.com; jiun.yu@samsung.com
> Subject: Re: [PATCH 2/4] ARM: SAMSUNG: Add API to set platform data for
> s5p-tv driver
> 
> On 07/17/2012 08:11 AM, Kukjin Kim wrote:
> > Sachin Kamat wrote:
> >>
> >> From: Tushar Behera <tushar.behera@linaro.org>
> >>
> >> Commit 350f2f4dad64 ("[media] v4l: s5p-tv: hdmi: add support for
> >> platform data") makes the presence of platform data mandatory for s5p-
> tv
> >> driver. Adding an API to plat-samsung for this purpose.
> >>
> >> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> ---
> >>  arch/arm/plat-samsung/devs.c              |   26
> > ++++++++++++++++++++++++++
> >>  arch/arm/plat-samsung/include/plat/hdmi.h |   16 ++++++++++++++++
> >>  2 files changed, 42 insertions(+), 0 deletions(-)
> >>  create mode 100644 arch/arm/plat-samsung/include/plat/hdmi.h
> >>
> >> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-
> samsung/devs.c
> >> index 07b5ac6..921ed88 100644
> >> --- a/arch/arm/plat-samsung/devs.c
> >> +++ b/arch/arm/plat-samsung/devs.c
> >> @@ -32,6 +32,8 @@
> >>  #include <linux/platform_data/s3c-hsudc.h>
> >>  #include <linux/platform_data/s3c-hsotg.h>
> >>
> >> +#include <media/s5p_hdmi.h>
> >> +
> >>  #include <asm/irq.h>
> >>  #include <asm/pmu.h>
> >>  #include <asm/mach/arch.h>
> >> @@ -759,6 +761,30 @@ void __init s5p_i2c_hdmiphy_set_platdata(struct
> >> s3c2410_platform_i2c *pd)
> >>  	npd = s3c_set_platdata(pd, sizeof(struct s3c2410_platform_i2c),
> >>  			       &s5p_device_i2c_hdmiphy);
> >>  }
> >> +
> >> +struct s5p_hdmi_platform_data s5p_hdmi_def_platdata;
> >> +
> >> +void __init s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
> >> +				struct i2c_board_info *mhl_info, int
> > mhl_bus)
> >> +{
> >> +	struct s5p_hdmi_platform_data *pd = &s5p_hdmi_def_platdata;
> >> +
> >> +	if (soc_is_exynos4210() || soc_is_exynos4212() ||
> >> +						soc_is_exynos4412())
> >> +		pd->hdmiphy_bus = 8;
> >> +	else if (soc_is_s5pv210())
> >> +		pd->hdmiphy_bus = 3;
> >> +	else
> >> +		pd->hdmiphy_bus = 0;
> >> +
> >> +	pd->hdmiphy_info = hdmiphy_info;
> >> +	pd->mhl_info = mhl_info;
> >> +	pd->mhl_bus = mhl_bus;
> >> +
> >> +	s3c_set_platdata(pd, sizeof(struct s5p_hdmi_platform_data),
> >> +				&s5p_device_hdmi);
> >> +}
> >
> > (Cc'ed Ayoung Sim and Jiun Yu in my team)
> >
> > Totally I wonder, do we really need s5p_i2c_hdmiphy_set_platdata and
> this
> > adding together? You updated s5p_i2c_hdmiphy_set_platdata in your 1/4
> patch
> > so I don't see why we should keep the bus number in duplicated...
> >
> 
> s5p_i2c_hdmiphy_set_platdata sets platform data for
> s5p_device_i2c_hdmiphy. 'bus_num' assigned in that structure is not
> accessible in s5p-tv driver. But s5p-tv driver needs the bus number to
> get appropriate i2c adapter. Hence we need to update the bus number in
> both the places.
> 
Yeah, I know the situation, but I don't know why we should having the same
i2c channel is included in different platform_data. I need to talk about
this approach to hdmi guys in my team, I'll let you know as soon as
possible.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
