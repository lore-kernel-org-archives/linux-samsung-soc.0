From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: DT on s3c24xx
Date: Wed, 17 Dec 2014 22:04:24 +0300
Message-ID: <CA+E=qVf4nT5x-fRFBu=Wv_VKUnEMAEP4GgJG8em8NyUFkwtbPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:43925 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbaLQTEq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Dec 2014 14:04:46 -0500
Received: by mail-ob0-f181.google.com with SMTP id gq1so5300318obb.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2014 11:04:46 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm-linux <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>

Hi,

I'd like to port several s3c24xx to DT, and I'm stuck with s3c24xx LCD
controller and power drivers for H1940 and RX1950.

Please see [1]. I want to move this function into another LCD power
driver, but I'm not sure what to do with s3c_gpio_cfgpin(). I need to
change pin function in runtime, and as far as I understand it should
be handled via pinctrl driver somehow. But how?

Also please see [2] and [3]. s3c2410fb driver modifies gpio registers
(and pinmux, they're same block on s3c24xx) directly. What would be
best way to get rid of that?

Regards
Vasily

[1] https://github.com/anarsoul/linux-2.6/blob/v3.18-anarsoul-wip/arch/arm/mach-s3c24xx/mach-h1940.c#L599
[2] https://github.com/anarsoul/linux-2.6/blob/v3.18-anarsoul-wip/arch/arm/mach-s3c24xx/mach-h1940.c#L221
[3] https://github.com/anarsoul/linux-2.6/blob/v3.18-anarsoul-wip/drivers/video/fbdev/s3c2410fb.c#L709
