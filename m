From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH v4 1/3] ARM: S5P: Add s5p_timer support for HRT
Date: Thu, 10 Mar 2011 09:49:41 +0000
Message-ID: <20110310094941.GA3289@pulham.picochip.com>
References: <1299636813-4869-1-git-send-email-sbkim73@samsung.com>
 <1299636813-4869-2-git-send-email-sbkim73@samsung.com>
 <20110309141016.GB2737@pulham.picochip.com>
 <002d01cbdede$65e19660$31a4c320$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:57211 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752707Ab1CJJtq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 04:49:46 -0500
Received: by wwa36 with SMTP id 36so1734386wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2011 01:49:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <002d01cbdede$65e19660$31a4c320$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: 'Jamie Iles' <jamie@jamieiles.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Hi,

On Thu, Mar 10, 2011 at 01:48:22PM +0900, Sangbeom Kim wrote:
> And Do you mean that Is needed error handling of clk_enable  like 
> below?
> 
> 	clk_enable(timerclk);
> 
> 	if (IS_ERR(timerclk)){
> 		clk_put(timerclk)
> 		panic("failed to enable timers clock");
> 	}

No, clk_enable() returns negative errno on failure, so something like.

	if (clk_enable(timerclk))
		panic("failed to enable timerclk");

> There is no another clk_enable for timerclk.

I didn't mean for just timerclk, there are several other clk_enable()'s 
for other clks.

Jamie
