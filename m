From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v2 5/5] input: samsung-keypad - Add samsung keypad driver
Date: Mon, 07 Jun 2010 09:30:36 +0200
Message-ID: <000b01cb0613$5545bc90$ffd135b0$%szyprowski@samsung.com>
References: <1275188784-23395-1-git-send-email-jy0922.shim@samsung.com>
 <1275188784-23395-5-git-send-email-jy0922.shim@samsung.com>
 <20100530034250.GK7248@trinity.fluff.org> <4C01EB2E.4020600@samsung.com>
 <20100603010025.GA14272@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51455 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756355Ab0FGHbg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jun 2010 03:31:36 -0400
In-reply-to: <20100603010025.GA14272@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>, 'Joonyoung Shim' <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello,

On Thursday, June 03, 2010 3:00 AM Ben Dooks wrote:

> > >> +	keypad->clk = clk_get(&pdev->dev, "keypad");
> 
> I'm going to get rid of this practice, it should be clk_get(&pdev->dev,
> NULL),
> see up-comming clock changes.

Good idea, but how do you want to handle some special/additional clocks?
Like for example mmc_bus or fimc_sclk clocks?

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
