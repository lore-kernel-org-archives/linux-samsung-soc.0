From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFT 0/3] usb: usb3503: Fix probing on Arndale board (missing phy)
Date: Thu, 08 Oct 2015 15:02:38 +0900
Message-ID: <561606FE.2090007@samsung.com>
References: <1444177807-15524-1-git-send-email-k.kozlowski@samsung.com>
 <56152BB2.4020202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <56152BB2.4020202@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@freescale.com>, Ben Gamari <ben@smart-cactus.org>, Wolfram Sang <wsa@the-dreams.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Arnd Bergmann <arnd@arndb.de>, riku.voipio@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07.10.2015 23:26, Marek Szyprowski wrote:
> Hello,
> 
> On 2015-10-07 02:30, Krzysztof Kozlowski wrote:
>> Introduction
>> ============
>> This patchset tries to fix probing of usb3503 on Arndale board
>> if the Samsung PHY driver is probed later (or built as a module).
>>
>> *The patchset was not tested on Arndale board.*
>> I don't have that board. Please test it and say if the usb3503
>> deferred probe
>> works fine and the issue is solved.
>>
>> The patchset was tested on Odroid U3 board (which is different!)
>> in a simulated environment. It is not sufficient testing.
>>
>>
>> Difference
>> ==========
>> The usb3503 device driver can be used as a I2C device (on Odroid U3)
>> or as a platform device connected through phy (on Arndale). In the second
>> case the necessary phy reference has to be obtained and enabled.
>>
>> For some details please look also at thread [0][1].
>>
>> [0]
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/348524.html
>>
>> [1]
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/348875.html
>>
>>

> 
> I'm not sure that this is the correct approach. usb3503 chip is simply
> connected
> to Exynos USB2 phy, so it visible on the USB bus. The real driver that
> controls USB2
> PHY is Exynos EHCI driver and USB3503 should not mess around it.

The ehci node (usb@12110000) has one port configured and it takes one
PHY reference (phy of id 1 - USB host). I can't see driver taking
reference to HSIC0 or HSIC1 phys... Since I cannot diagnose the error I
don't know what is really expected here.

> 
> In my opinion all that is needed in case of Arndale board is forcing
> reset of
> usb3503 chip after successful EHCI and USB2 PHY initialization (for some
> reason
> initialization of usb3503 chip must be done after usb host initialization).
> However I have no idea which driver should trigger this reset. Right now
> I didn't
> find any good solution for additional control for devices which are on
> autoprobed
> bus like usb.

The reset is done at the end of usb3503's probe. The question "why
usb3503 has to be initialized after EHCI and USB PHY" is still valid...

Anyway thanks for feedback! I really appreciate it.

Best regards,
Krzysztof
