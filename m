From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [rtc-linux] [PATCH v2] rtc: s3c: Document in binding that only
 s3c6410 needs a src clk
Date: Tue, 29 Mar 2016 00:19:15 +0200
Message-ID: <20160328221915.GC2346@piout.net>
References: <1455545466-25709-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:36120 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752523AbcC1WTR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 18:19:17 -0400
Content-Disposition: inline
In-Reply-To: <1455545466-25709-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org

On 15/02/2016 at 11:11:06 -0300, Javier Martinez Canillas wrote :
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
> 

Well, I'm queuing that one in rtc-fixes for 4.6


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
