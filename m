From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen
 board
Date: Wed, 29 May 2013 17:33:03 +0530
Message-ID: <51A5EE77.6040503@linaro.org>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org> <87sj1qzaov.fsf@linaro.org> <5191AA89.6010901@linaro.org> <20130528231740.GA28879@quad.lixom.net> <51A57D39.8030506@linaro.org> <CAOesGMh50Dzr_jczHZC5_txfW=6a+7EgFKvgZgj9MhUcVUTJ1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:40966 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965913Ab3E2MDM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 08:03:12 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb11so7803583pad.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 May 2013 05:03:11 -0700 (PDT)
In-Reply-To: <CAOesGMh50Dzr_jczHZC5_txfW=6a+7EgFKvgZgj9MhUcVUTJ1Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Patch Tracking <patches@linaro.org>

On 05/29/2013 11:01 AM, Olof Johansson wrote:
>> There are a total of 6 patches on top of
>> v3.10-rc3. 3 of them (a, b, d) are queued for 3.10-rc4 and another patch
>> (c) is just a defconfig hack to get Arndale booting. Remaining 2 patches
>> (e, f) are required to reset the hub during EHCI initialization.
> 
> Huh, I thought you said that (c) wasn't needed when I posted the
> defconfig update. It'd be nice to see the code fixed to handle this
> case instead of Linaro carrying a patch like this though. I.e. make it
> able to deselect the uart, or make it tied to DEBUG_LL like on other
> platforms instead of having a separate config for this.
> 

I am working on this approach so that we can consolidate both the UART
port macros together and tie them to DEBUG_LL. I would post the patch
tomorrow.

>> a. ARM: exynos: defconfig update
>> b. ARM: EXYNOS: Update defconfig for Arndale and Origen board
>> c. [TEMP] ARM: EXYNOS: Set low-level UART port to 2
>> d. ARM: dts: Enabling samsung-usb2phy driver for exynos5250
>> e. usb: ehci-s5p: add the HSIC port initialization
>> f. ARM: dts: Add USB gpio entries for Arndale board


-- 
Tushar Behera
