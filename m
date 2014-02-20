From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Thu, 20 Feb 2014 13:07:31 +0100
Message-ID: <116078520.5VTDQYu7BE@wuerfel>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <CAOesGMjSjzZ4iX3NVA6eS4LHJF2MQQ=KJpNgKWikJb6YkQxNpQ@mail.gmail.com> <20140220112248.GC32456@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:60076 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751854AbaBTMIO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Feb 2014 07:08:14 -0500
In-Reply-To: <20140220112248.GC32456@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Olof Johansson <olof@lixom.net>, John Stultz <john.stultz@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

On Thursday 20 February 2014 11:22:48 Catalin Marinas wrote:
> 
> I'm fine with this. Do we still need something for ARMv8 server
> platforms like ARCH_ARM_SBSA? The only advantage would be to make it
> easier for mobile targeted kernel builds to disable server features but
> I'm not sure there are so many such features, people can trim the
> .config manually.

I think in particular for SBSA compliant platforms we should not
have per-platform options at all the way we do for embedded,
as they will be much more homogenous.

> Two additional points:
> 
> 1. Single arm64 defconfig file covering everything
> 2. Modules rather than built-in by default where possible (especially
>    for server platforms)

+1

	Arnd
