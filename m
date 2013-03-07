From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Thu, 7 Mar 2013 03:02:46 +0000
Message-ID: <201303070302.46593.arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <201303061050.42451.arnd@arndb.de> <20130306123426.GB17079@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:54067 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751639Ab3CGDC7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 22:02:59 -0500
In-Reply-To: <20130306123426.GB17079@avionic-0098.mockup.avionic-design.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Wednesday 06 March 2013, Thierry Reding wrote:
> > Option 2 would probably come down to having a trivial MFD driver exposing
> > a regmap. You can probably reuse drivers/mfd/syscon.c for this and make
> > the node compatible with "syscon" to designate the clock registers as
> > a system-wide resource, making the other device nodes register-less.
> 
> I think option 2 is the standard method if one hardware block provides
> several logical devices. I find it to be a pretty nice solution to this
> problem. We also have precedent in the PWM subsystem. The TWL chips for
> instance use it to create a platform device which is later driven by a
> PWM driver.

One difference though is that the TWL chip is a heterogenous MFD that has
a lot of different sub-devices, where in case of Exynos the timer device
has a set of identical units, each of which can be used either as a PWM or
as a clocksource or other timer.

	Arnd
