From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/7] pinctrl: exynos5440: add pinctrl driver for Samsung
 EXYNOS5440 SoC
Date: Mon, 5 Nov 2012 12:37:32 +0100
Message-ID: <CACRpkdZP_sTKV1Nq3FWVQJocg8C8H7J9vd9hmY4k-qAnMPJcLg@mail.gmail.com>
References: <1351274153-3120-1-git-send-email-kgene.kim@samsung.com>
	<1351274153-3120-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:49248 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752642Ab2KELhe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 06:37:34 -0500
Received: by mail-ea0-f174.google.com with SMTP id c13so2218998eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Nov 2012 03:37:33 -0800 (PST)
In-Reply-To: <1351274153-3120-6-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>

On Fri, Oct 26, 2012 at 7:55 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> From: Thomas Abraham <thomas.abraham@linaro.org>
>
> Add a new pinctrl driver for Samsung EXYNOS5440 SoC. The pin controller
> module in EXYNOS5440 is different from the pin controller found on other
> Samsung SoC. Hence, the pin controller driver for EXYNOS5440 SoC is
> independent of the Samsung pinctrl framework.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

If I haven't ACK:ed this before here's an
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect this to go through the Samsung tree?

Yours,
Linus Walleij
