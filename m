From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFT 0/3] usb: usb3503: Fix probing on Arndale board (missing
 phy)
Date: Sat, 10 Oct 2015 12:08:45 +0900
Message-ID: <5618813D.20502@samsung.com>
References: <1444177807-15524-1-git-send-email-k.kozlowski@samsung.com>
 <7hoag797gk.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36803 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbbJJDIy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Oct 2015 23:08:54 -0400
In-Reply-To: <7hoag797gk.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: k.kozlowski.k@gmail.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa@the-dreams.de>, Ben Gamari <ben@smart-cactus.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, riku.voipio@linaro.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Peter Chen <peter.chen@freescale.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, Tyler Baker <tyler.baker@linaro.org>

W dniu 10.10.2015 o 04:18, Kevin Hilman pisze:
> Hi Krzystof,
> 
> Krzysztof Kozlowski <k.kozlowski@samsung.com> writes:
> 
>> Introduction
>> ============
>> This patchset tries to fix probing of usb3503 on Arndale board
>> if the Samsung PHY driver is probed later (or built as a module).
>>
>> *The patchset was not tested on Arndale board.*
>> I don't have that board. Please test it and say if the usb3503 deferred probe
>> works fine and the issue is solved.
> 
> FYI... I built this series on top of  next-20151009 and using
> exynos_defconfig.  I booted it on my arndale, and I still don't see the
> networking come up.  Full boot log attached.

+cc Tyler

Kevin,
Thanks for testing but I am not sure if this boot failure is related to
the patch. I mean if the patch should fix this particular boot failure.
The board stopped to boot after enabling DWC2 and network USB gadget:
http://www.spinics.net/lists/linux-samsung-soc/msg47009.html

The boot log shows that usb3503 was probed but asix network adapter was
not. I wonder how these things are related to each other...

Nevertheless it would be difficult to debug the issue without the
Arndale board. :)

Best regards,
Krzysztof
