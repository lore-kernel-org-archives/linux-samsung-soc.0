From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Fri, 8 Mar 2013 12:52:28 +0000
Message-ID: <201303081252.28321.arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <20130307072203.GC3451@avionic-0098.mockup.avionic-design.de> <3271021.WsP8f9ZEBl@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:60316 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757097Ab3CHMwr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Mar 2013 07:52:47 -0500
In-Reply-To: <3271021.WsP8f9ZEBl@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Friday 08 March 2013, Tomasz Figa wrote:
> I have a question regarding making this an MFD driver.
> 
> As you know, the main clocksource driver must be initialized early, from 
> init_time callback of machine_desc. How does using the MFD subsystem fit 
> into this scheme?
> 
> P.S. I'm still not convinced about any benefits of options 2 and 3 over 
> option 1, which has the obvious advantage of requiring least amount of 
> changes to existing code and not binding the PWM and clocksource drivers 
> together (on Exynos SoCs only the PWM driver is used, clocksource is 
> handled by different hardware block - MCT).

I think the main motivation for the MFD here is that you have a shared
register set, which would be described as a single device node in DT
as its natural representation, but it's not easy to have two drivers
be responsible for the same platform device. Similarly, the Linux
resource handling tries hard to ensure that multiple device drivers
do not share a single register set.

If you have an MFD driver, that could bind do the platform_device created
from the DT device node, and provide a simple interface for both the
timer and the pwm driver to talk to, without exposing those registers
directly. Or you could use the syscon regmap approach to expose
those registers in a more controlled way. With syscon, you don't actually
have to write an MFD driver but could just use the one that is already
there.

Since you want the timer driver to be available really early, you could
also make that timer driver the master and expose an interface for
the PWM driver to use.

	Arnd
