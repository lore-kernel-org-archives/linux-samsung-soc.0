From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen board
Date: Mon, 13 May 2013 17:06:56 -0700
Message-ID: <87sj1qzaov.fsf@linaro.org>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:46459 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754667Ab3ENAHA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 May 2013 20:07:00 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so4757768pde.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 May 2013 17:06:59 -0700 (PDT)
In-Reply-To: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
	(Tushar Behera's message of "Fri, 10 May 2013 12:19:59 +0530")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, olof@lixom.net, dianders@chromium.org, patches@linaro.org

Tushar Behera <tushar.behera@linaro.org> writes:

> It updates following drivers for EXYNOS based DT platform.
>
> * S5M8767 driver
> * MAX8997 driver
> * MMC SDHCI driver
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

I tested this using v3.10-rc1 on Arndale, but still don't get any
support for the wired network.  Do you know if this is a Kconfig issue,
or a missing driver?

I suspect it may be related to the various "unable to find transceiver
of type USB2 PHY" messages I'm seeing?

Thanks,

Kevin
