From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-1 for v3.12
Date: Sun, 13 Oct 2013 16:02:41 -0700
Message-ID: <CAOesGMirL+uR0xL9o0oqhfVa4KKsDeaCjkJyarAJr5vmZPg4Eg@mail.gmail.com>
References: <525B1722.5060001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:55517 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755277Ab3JMXCm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 19:02:42 -0400
Received: by mail-qa0-f46.google.com with SMTP id j15so2069815qaq.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Oct 2013 16:02:41 -0700 (PDT)
In-Reply-To: <525B1722.5060001@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Alexander Shiyan <shc_work@mail.ru>

Hi,

On Sun, Oct 13, 2013 at 2:56 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Alexander Shiyan (1):
>       ARM: SAMSUNG: Fix switching FIFO in arch_enable_uart_fifo function

What's the regression that this is fixing? As far as I can tell, the
code has been the same since 2008. Or did something surrounding it
change?

>
> Bartlomiej Zolnierkiewicz (1):
>       ARM: dts: fix PL330 MDMA1 address in DT for Universal C210 board
>
> Jingoo Han (1):
>       ARM: dts: Remove DP PHY node from exynos5250.dtsi

You are sending this in pretty late. Please be careful about conflicts
due to this late revert, in particular if you plan on re-introducing
something in 3.13.

> Tomasz Figa (1):
>       ARM: dts: Work around lack of cpufreq regulator lookup for
> exynos4210-origen and trats boards
>
> Youngmin Nam (1):
>       ARM: dts: Fix a typo on Exynos5440 DTS files

This is a bad patch subject, it can be way more specific. Also, this
is a good reason not to have these elaborate bootargs in the DTS, in
particular for modern platforms -- the bootargs should come from
firmware for your platform.


-Olof
