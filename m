From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/5] usb: phy: samsung: remove old USB 2.0 PHY driver
Date: Mon, 18 Aug 2014 13:22:18 +0200
Message-ID: <53F1E1EA.8060708@gmail.com>
References: <1408026327-31437-1-git-send-email-b.zolnierkie@samsung.com> <1408026327-31437-4-git-send-email-b.zolnierkie@samsung.com> <34FCC3B2EE8F481198CEF3037F168FB3@sisodomain.com> <3463371.y41zGdSnsX@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:65211 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529AbaHRLWY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 07:22:24 -0400
In-Reply-To: <3463371.y41zGdSnsX@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Mark Brown <broonie@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On 18.08.2014 13:02, Bartlomiej Zolnierkiewicz wrote:
> On Thursday, August 14, 2014 08:07:40 PM Vivek Gautam wrote:
>> On Thursday, August 14, 2014 7:55 PM, Bartlomiej Zolnierkiewicz 
>> <b.zolnierkie@samsung.com> wrote
> 
>> There's one thing that I would want to comment here, since we don't have any 
>> new usb-phy driver for S3C64XX,
>> so we can't simply remove this entire driver.
>> I have posted my patch-series [1], which does cleanup while keeping the 
>> support for S3C64XX.
> 
> AFAIK S3C64XX code from drivers/usb/phy/phy-samsung-usb2.c has
> never been used as this platform still uses its own code from
> arch/arm/mach-s3c64xx/setup-usb-phy.c (there are no users in
> the kernel tree of either s3c64xx-usb2phy platform device or
> "samsung,s3c64xx-usb2phy" DT compatible) .  Therefore I think
> that the entire drivers/usb/phy/phy-samsung-usb2.c driver
> should be removed (somebody with the hardware can as well add
> S3C64XX support to the new drivers/phy/phy-samsung-usb2.c
> driver and port the platform to use it).
> 

I agree with removal of this driver. As Bart said, it is not used for
S3C64xx at all. The platform was supposed to be moved to this driver,
but that never happened. In fact, I already have a patch adding support
for S3C64xx to the new driver.

Best regards,
Tomasz
