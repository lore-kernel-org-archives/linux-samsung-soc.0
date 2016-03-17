From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2] rtc: s3c: Document in binding that only s3c6410 needs
 a src clk
Date: Thu, 17 Mar 2016 23:31:53 +0100
Message-ID: <20160317223153.GI2831@piout.net>
References: <1455545466-25709-1-git-send-email-javier@osg.samsung.com>
 <20160218143853.GF9654@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:60402 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S935230AbcCQWcG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Mar 2016 18:32:06 -0400
Content-Disposition: inline
In-Reply-To: <20160218143853.GF9654@rob-hp-laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org

Hi Rob,

On 18/02/2016 at 08:38:53 -0600, Rob Herring wrote :
> On Mon, Feb 15, 2016 at 11:11:06AM -0300, Javier Martinez Canillas wrote:
> > The S3C binding doc says that the RTC and RTC source clocks are required
> > but the S3C driver supports different HW IP and only the s3c6410 needs a
> > source clock.
> > 
> > Fix the binding explaining that the source clock is only needed for the
> > s3c6410-rtc compatible controller.
> > 
> > Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> > Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > 
> > ---
> > Hello,
> > 
> > This patch depends on a previous one that was picked by Rob Herring so
> > this one has to go through his tree again and not through the RTC tree
> > to avoid conflicts.
> 
> Ugg, sent pull request today. It should be in Linus' tree now.
> 
> This can go thru rtc tree if you prefer. Otherwise, I'll queue it up for 
> 4.6.
> 

Do you plan to send that one to Linus for 4.6? Else, I still have a few
patches to send before the end of the merge window.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
