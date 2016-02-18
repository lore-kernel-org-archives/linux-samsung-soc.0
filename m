From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] rtc: s3c: Document in binding that only s3c6410 needs
 a src clk
Date: Thu, 18 Feb 2016 08:38:53 -0600
Message-ID: <20160218143853.GF9654@rob-hp-laptop>
References: <1455545466-25709-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54259 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1946473AbcBROi5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Feb 2016 09:38:57 -0500
Content-Disposition: inline
In-Reply-To: <1455545466-25709-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 11:11:06AM -0300, Javier Martinez Canillas wrote:
> The S3C binding doc says that the RTC and RTC source clocks are required
> but the S3C driver supports different HW IP and only the s3c6410 needs a
> source clock.
> 
> Fix the binding explaining that the source clock is only needed for the
> s3c6410-rtc compatible controller.
> 
> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> 
> ---
> Hello,
> 
> This patch depends on a previous one that was picked by Rob Herring so
> this one has to go through his tree again and not through the RTC tree
> to avoid conflicts.

Ugg, sent pull request today. It should be in Linus' tree now.

This can go thru rtc tree if you prefer. Otherwise, I'll queue it up for 
4.6.

> 
