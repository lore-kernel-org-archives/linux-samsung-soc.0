From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen board
Date: Tue, 28 May 2013 16:24:15 -0700
Message-ID: <CAOesGMjirb0h4kZ1hB9=1JnDV+azTEG=_6RR9v000xbMsvuv2Q@mail.gmail.com>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:52510 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759248Ab3E1XYR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 19:24:17 -0400
Received: by mail-we0-f174.google.com with SMTP id x50so4076037wes.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 May 2013 16:24:16 -0700 (PDT)
In-Reply-To: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Patch Tracking <patches@linaro.org>

Hi,

On Thu, May 9, 2013 at 11:49 PM, Tushar Behera <tushar.behera@linaro.org> wrote:
> It updates following drivers for EXYNOS based DT platform.
>
> * S5M8767 driver
> * MAX8997 driver
> * MMC SDHCI driver
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

I didn't see any movement from Kukjin on this, so I have (tentatively)
applied this together with my base defconfig update to the fixes
branch of arm-soc. I'll take it out in case he protests, but it's very
useful since the simplefb driver has landed in 3.10-rc3.


-Olof
