From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 00/27] ARM: dts: exynos: Add initial support for Odroid
 XU
Date: Fri, 13 May 2016 14:11:54 +0200
Message-ID: <5735C48A.6030508@kernel.org>
References: <1462910970-1812-1-git-send-email-krzk@kernel.org>
 <5735C274.50504@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <5735C274.50504@arm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/13/2016 02:03 PM, Robin Murphy wrote:
> Hi Krzysztof,
> 
> On 10/05/16 21:09, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Patchset adds necessary clocks, reorganizes existing stuff and finally
>> adds Odroid XU support.
>>
>>
>> Changes since v2
>> ================
>> 1. Got global-ack from Stephen for the clock changes. I think merging
>>     everything through arm-soc might be the easiest but:
>>     a. In such case I will prepare a tag with clock changes,
>>     b. Anyway I will wait for response from Sylwester and Tomasz.
>> 2. Applied comments from Javier and added his Reviewed-by.
>> 3. Patch 22: added ack from Rob.
>> 4. Minor improvements in existing patches.
>> 5. Five new patches at the end: 23-27 (not reviewed yet).
>>     Some of them could be squashed with existing ones but existing
>>     changes got reviews. Although the final Odroid XU DTS works fine but
>>     in general this is still work-in-progress so I suspect it will grow.
>>     I am releasing it early following Linux concept. :)
>>
>> Patchset is available at my private repo @github:
>> https://github.com/krzk/linux.git for-next/odroid-xu-v3
> 
> Since I have one of these gathering dust on my desk, it's really cool to
> see this series, thanks!
> 
> I've successfully booted that branch to a filesystem on SD card, but USB
> clearly isn't quite right - the USB 2.0 hub is powered up, but only the
> bottom right port will actually enumerate devices; the ethernet is
> nowhere to be seen. However, if I drop into the bootloader and do a "usb
> start" beforehand, it all keeps working into the kernel.

Thanks for letting me know. I am testing the board from TFTP boot which
means "usb start" in Uboot. I'll add it to my todo-list.

> As for the USB
> 3.0, though, the ports report over-current conditions shortly after the
> XHCI probe despite having nothing plugged in :(

Yes, I am seeing this as well. Maybe the cause is lack regulator supplies?

Best regards,
Krzysztof
