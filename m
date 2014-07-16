From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 18/19] ARM: SAMSUNG: Remove remaining legacy code
Date: Wed, 16 Jul 2014 14:58:03 +0200
Message-ID: <53C676DB.6070002@samsung.com>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
 <1404496099-26708-19-git-send-email-t.figa@samsung.com>
 <1405505756.4408.24.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59785 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932777AbaGPM6n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 08:58:43 -0400
In-reply-to: <1405505756.4408.24.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

On 16.07.2014 12:15, Paul Bolle wrote:
> On Fri, 2014-07-04 at 19:48 +0200, Tomasz Figa wrote:

[snip]

>> -config PLAT_S5P
>> -	bool
>> -	depends on ARCH_S5PV210
>> -	default y
>> -	select ARCH_REQUIRE_GPIOLIB
>> -	select ARM_VIC
>> -	select NO_IOPORT_MAP
>> -	select PLAT_SAMSUNG
>> -	select S3C_GPIO_TRACK
>> -	select S5P_GPIO_DRVSTR
>> -	help
>> -	  Base platform code for Samsung's S5P series SoC.
>> -
> 
> After this patch that symbol is still referenced in:
> drivers/media/platform/Kconfig:159:     depends on VIDEO_DEV && VIDEO_V4L2 && (PLAT_S5P || ARCH_EXYNOS)
> drivers/media/platform/Kconfig:169:     depends on VIDEO_DEV && VIDEO_V4L2 && (PLAT_S5P || ARCH_EXYNOS)
> drivers/media/platform/Kconfig:177:     depends on VIDEO_DEV && VIDEO_V4L2 && (PLAT_S5P || ARCH_EXYNOS)
> drivers/media/platform/exynos4-is/Kconfig:5:    depends on (PLAT_S5P || ARCH_EXYNOS)
> drivers/media/platform/s5p-tv/Kconfig:11:       depends on (PLAT_S5P || ARCH_EXYNOS) && PM_RUNTIME
> drivers/usb/host/Kconfig:223:       depends on PLAT_S5P || ARCH_EXYNOS
> drivers/usb/host/Kconfig:530:   depends on PLAT_S5P || ARCH_EXYNOS
> 
> Again, I assume patches to remove these references are pending. But is
> that correct?

I had two patches fixing those, but apparently this was lost in action.
The correct solution is s/PLAT_S5P/ARCH_S5PV210/. I will include this in
a follow-up series if nobody objects.

Best regards,
Tomasz
