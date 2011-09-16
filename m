From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V4] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Fri, 16 Sep 2011 21:02:18 +0900
Message-ID: <00d101cc7468$7bbfcd10$733f6730$%kim@samsung.com>
References: <1316076867-2138-1-git-send-email-tushar.behera@linaro.org>
 <20110915091423.80E7C11F9E77@gemini.denx.de> <4E71E18E.2020205@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23361 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968Ab1IPMCU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Sep 2011 08:02:20 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRM00DD46RUXN80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 21:02:19 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRM003176RUH3@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 21:02:19 +0900 (KST)
In-reply-to: <4E71E18E.2020205@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Wolfgang Denk' <wd@denx.de>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

Tushar Behera wrote:
> 
> Dear Wolfgang Denk,
> 
> On Thursday 15 September 2011 02:44 PM, Wolfgang Denk wrote:
> > Dear Tushar Behera,
> >
> > In message<1316076867-2138-1-git-send-email-tushar.behera@linaro.org>
you
> wrote:
> >> ORIGEN board is fitted with 7" LCD panel HV070WSA. The pixel
> >> resolution of the LCD panel is 1024x600.
> > ...
> >> +static struct s3c_fb_pd_win origen_fb_win0 = {
> >> +	.win_mode = {
> >> +		.left_margin	= 64,
> >> +		.right_margin	= 16,
> >> +		.upper_margin	= 64,
> >> +		.lower_margin	= 16,
> >> +		.hsync_len	= 48,
> >> +		.vsync_len	= 3,
> >> +		.xres		= 1024,
> >> +		.yres		= 600,
> >> +	},
> >> +	.max_bpp		= 32,
> >> +	.default_bpp		= 24,
> >> +};
> >
> > Does it still make sense to hard-code such parameters?
> >
> > In PowerPC-land we pass display mode information in the device tree
> > using a verbatim EDID block.
> >
> > Would it be not better (and way more flexible) to do the same here,
> > now that ARM has device tree support?
> >
> Thanks for your suggestions.
> 
> Currently work for enabling device tree support for EXYNOS4 based
> machine is going on. Once it is done, we should be able to pass this
> information through device tree blob.
> 
> For non-DT machines, IMHO, we have to follow the current approach.

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
