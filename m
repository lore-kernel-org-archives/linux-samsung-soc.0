From: Vasily <anarsoul@gmail.com>
Subject: Re: [PATCH v4] s3c/s3c24xx: arm: leds: Make s3c24xx LEDS driver use
 gpiolib. Fix error disabling pull during probe.
Date: Thu, 29 Dec 2011 12:06:00 +0300
Message-ID: <CA+E=qVdfwXMdcN6ENeermvdoq42W3=-WvLGqRSBSxRCt=zafwQ@mail.gmail.com>
References: <4EE7E0E7.1020802@solonet.org.ua>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:51532 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829Ab1L2JGW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 04:06:22 -0500
In-Reply-To: <4EE7E0E7.1020802@solonet.org.ua>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Denis Kuzmenko <linux@solonet.org.ua>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Joe Perches <joe@perches.com>

2011/12/14 Denis Kuzmenko <linux@solonet.org.ua>:
> Make s3c24xx LEDS driver use gpiolib. Fix error disabling pull during probe.

So, what's the difference between s3c24xx_led and leds-gpio drivers now?
Maybe it worth to convert s3c24xx_led users to leds-gpio and drop
s3c24xx-led completely?
I see no reason to keep two almost identical drivers in tree.

Regards,
Vasily
