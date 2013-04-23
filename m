From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Fix link error with
 CONFIG_PINCTRL_EXYNOS disabled
Date: Tue, 23 Apr 2013 14:03:12 +0200
Message-ID: <CACRpkdbJj9Newk+sCTvJzxA4V2cmJ3hzuQELv7t1wFMhd_Y8+Q@mail.gmail.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
	<20130416163331.GP26958@opensource.wolfsonmicro.com>
	<30362001.FF4K7WsZvh@flatron>
	<1398545.9FqHoC0WZW@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:50100 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755299Ab3DWMDM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 08:03:12 -0400
Received: by mail-ie0-f175.google.com with SMTP id a11so547418iee.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 05:03:12 -0700 (PDT)
In-Reply-To: <1398545.9FqHoC0WZW@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, kwangwoo.lee@gmail.com, Peter Korsgaard <jacmet@sunsite.dk>, augulis.darius@gmail.com, mcuelenaere@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Wed, Apr 17, 2013 at 12:24 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> Commit f67faf487 added driver data for Exynos5250, which is available
> only if CONFIG_PINCTRL_EXYNOS is enabled. However probably due to merge
> error, the reference to this driver data structure was located outside
> of relevant ifdef and compiled unconditionally, leading to link error
> with CONFIG_PINCTRL_EXYNOS.
>
> This patch fixes mentioned link error by moving driver data entry under
> ifdef CONFIG_PINCTRL_EXYNOS.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

This does not apply to my "devel" branch in the pinctrl tree.

Could you rebase it on that branch?

Or is the error not even in my tree?

Yours,
Linus Walleij
