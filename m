From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen board
Date: Wed, 29 May 2013 11:23:52 -0700
Message-ID: <87sj1563wn.fsf@linaro.org>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
	<87sj1qzaov.fsf@linaro.org> <5191AA89.6010901@linaro.org>
	<20130528231740.GA28879@quad.lixom.net> <51A57D39.8030506@linaro.org>
	<CAOesGMh50Dzr_jczHZC5_txfW=6a+7EgFKvgZgj9MhUcVUTJ1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:55992 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965160Ab3E2SX5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 14:23:57 -0400
Received: by mail-pb0-f43.google.com with SMTP id ma3so9588784pbc.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 May 2013 11:23:56 -0700 (PDT)
In-Reply-To: <CAOesGMh50Dzr_jczHZC5_txfW=6a+7EgFKvgZgj9MhUcVUTJ1Q@mail.gmail.com>
	(Olof Johansson's message of "Tue, 28 May 2013 22:31:41 -0700")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Tushar Behera <tushar.behera@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Patch Tracking <patches@linaro.org>

Olof Johansson <olof@lixom.net> writes:

> On Tue, May 28, 2013 at 8:59 PM, Tushar Behera <tushar.behera@linaro.org> wrote:
>
>> The patches are at [1].
>
> FWIW, a cgit/gitweb link is easier to follow when you're reading an
> email. Anyway, found the patches.
>
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

I agree, that defconfig hack is awful to have to carry.

I also noticed that correct setting of CONFIG_S3C_LOWLEVEL_UART_PORT is
needed even without DEBUG_LL which seems broken.

Kevin
