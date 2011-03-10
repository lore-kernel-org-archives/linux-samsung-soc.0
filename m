From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 1/3] ARM: S5P: Add s5p_timer support for HRT
Date: Thu, 10 Mar 2011 19:19:12 +0900
Message-ID: <008b01cbdf0c$9c8ed8c0$d5ac8a40$%kim@samsung.com>
References: <1299636813-4869-1-git-send-email-sbkim73@samsung.com>
 <1299636813-4869-2-git-send-email-sbkim73@samsung.com>
 <20110309141016.GB2737@pulham.picochip.com>
 <002d01cbdede$65e19660$31a4c320$@com>
 <20110310094941.GA3289@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40645 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285Ab1CJKTS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 05:19:18 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHU00LO87C5VMC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 19:19:17 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHU001ZN7C5EB@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 19:19:17 +0900 (KST)
In-reply-to: <20110310094941.GA3289@pulham.picochip.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jamie Iles' <jamie@jamieiles.com>, 'Sangbeom Kim' <sbkim73@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Jamie Iles wrote:
> 
> Hi,
> 
Hi Jamie,

> On Thu, Mar 10, 2011 at 01:48:22PM +0900, Sangbeom Kim wrote:
> > And Do you mean that Is needed error handling of clk_enable  like
> > below?
> >
> > 	clk_enable(timerclk);
> >
> > 	if (IS_ERR(timerclk)){
> > 		clk_put(timerclk)
> > 		panic("failed to enable timers clock");
> > 	}
> 
> No, clk_enable() returns negative errno on failure, so something like.
> 
> 	if (clk_enable(timerclk))
> 		panic("failed to enable timerclk");
> 
Thanks for your suggestion.

Yeah, would be better...but I'm thinking we _really_ need that.
Because it is used timer clock, so if fails, maybe happened hang :(

> > There is no another clk_enable for timerclk.
> 
> I didn't mean for just timerclk, there are several other clk_enable()'s
> for other clks.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
