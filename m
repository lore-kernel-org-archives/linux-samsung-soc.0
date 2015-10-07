From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFT 0/3] usb: usb3503: Fix probing on Arndale board (missing phy)
Date: Wed, 07 Oct 2015 16:26:58 +0200
Message-ID: <56152BB2.4020202@samsung.com>
References: <1444177807-15524-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:8716 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753982AbbJGO1E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Oct 2015 10:27:04 -0400
In-reply-to: <1444177807-15524-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@freescale.com>, Ben Gamari <ben@smart-cactus.org>, Wolfram Sang <wsa@the-dreams.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Arnd Bergmann <arnd@arndb.de>, riku.voipio@linaro.org

Hello,

On 2015-10-07 02:30, Krzysztof Kozlowski wrote:
> Introduction
> ============
> This patchset tries to fix probing of usb3503 on Arndale board
> if the Samsung PHY driver is probed later (or built as a module).
>
> *The patchset was not tested on Arndale board.*
> I don't have that board. Please test it and say if the usb3503 deferred probe
> works fine and the issue is solved.
>
> The patchset was tested on Odroid U3 board (which is different!)
> in a simulated environment. It is not sufficient testing.
>
>
> Difference
> ==========
> The usb3503 device driver can be used as a I2C device (on Odroid U3)
> or as a platform device connected through phy (on Arndale). In the second
> case the necessary phy reference has to be obtained and enabled.
>
> For some details please look also at thread [0][1].
>
> [0] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/348524.html
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/348875.html
>

I'm not sure that this is the correct approach. usb3503 chip is simply 
connected
to Exynos USB2 phy, so it visible on the USB bus. The real driver that 
controls USB2
PHY is Exynos EHCI driver and USB3503 should not mess around it.

In my opinion all that is needed in case of Arndale board is forcing 
reset of
usb3503 chip after successful EHCI and USB2 PHY initialization (for some 
reason
initialization of usb3503 chip must be done after usb host initialization).
However I have no idea which driver should trigger this reset. Right now 
I didn't
find any good solution for additional control for devices which are on 
autoprobed
bus like usb.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
