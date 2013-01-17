From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: fix pinctrl condition for exynos and exynos5440
Date: Thu, 17 Jan 2013 09:16:53 +0100
Message-ID: <CACRpkdbB4nOcuprc-a5Fb8idmq-4tRfS28xJKVpAF1YqEM0wbQ@mail.gmail.com>
References: <1356631870-1499-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:37370 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754466Ab3AQIQy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 03:16:54 -0500
Received: by mail-ie0-f171.google.com with SMTP id 9so453952iec.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jan 2013 00:16:54 -0800 (PST)
In-Reply-To: <1356631870-1499-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Thomas Abraham <thomas.ab@samsung.com>

On Thu, Dec 27, 2012 at 7:11 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> Since EXYNOS5440 can select PINCTRL_EXYNOS5440 without PINCTRL_SAMSUNG,
> it should be fixed. In detail, PINCTRL_SAMSUNG is a kind of frame work
> for supporting pinctrl on most Samsung SoCs including S3C, S5P as well
> except EXYNOS5440 so PINCTRL_EXYNOS5440 has been implemented separated.
>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Patch applied, thanks.

Sorry for taking an eternity for getting to these patches :-(

Yours,
Linus Walleij
