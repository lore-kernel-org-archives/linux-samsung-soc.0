From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: register driver early in subsys initcall to
 avoid probe defer
Date: Thu, 19 Nov 2015 14:20:41 +0100
Message-ID: <564DCCA9.3050604@samsung.com>
References: <1446215008-30506-1-git-send-email-m.szyprowski@samsung.com>
 <20151101160203.GB2295@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47451 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757752AbbKSNUp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2015 08:20:45 -0500
In-reply-to: <20151101160203.GB2295@katana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, "balbi@ti.com" <balbi@ti.com>

Hello,

On 2015-11-01 17:02, Wolfram Sang wrote:
> On Fri, Oct 30, 2015 at 03:23:28PM +0100, Marek Szyprowski wrote:
>> i2c bus drivers should be registered earlier than typical drivers to let
>> important i2c devices (like PMICs/regulators) get registered early
>> enough to avoid probe defer of all devices in typical embedded system.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> I don't accept such patches anymore. Some more background:
>
> http://www.spinics.net/lists/linux-i2c/msg13102.html
> http://www.spinics.net/lists/linux-i2c/msg16644.html

Well, then how can we get Exynos5xxx-based boards working with USB gadget
driver compiled-in? USB Device controller driver (UDC) needs regulator to
probe successfully. On the other hand USB gadget subsystem doesn't wait
until all UDC drivers gets probed and fails to bind compiled-in gadget
drivers if no UDC is available on probe time.

This problem is known for ages, there were number of attempts to add
support for deferred probe or solve the problem of deferred UDC driver
probe, but none got accepted so far:

http://www.spinics.net/lists/linux-usb/msg102795.html (20 Feb 2014)
http://www.spinics.net/lists/linux-usb/msg105279.html (2 Apr 2014)
http://thread.gmane.org/gmane.linux.usb.general/109745 (10 Jun 2014)
https://lkml.org/lkml/2015/6/22/554 (23 Jun 2015)

Till now it worked somehow for boards with older i2c bus drivers, which
were registered in subsys initcall. Boards, which use newer i2c bus drivers
cannot be used with usb gadgets compiled-in.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
