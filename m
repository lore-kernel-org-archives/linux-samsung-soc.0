From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: add GPIO interrupt registration for exynos5
Date: Thu, 17 Jan 2013 09:14:53 +0100
Message-ID: <CACRpkdZtiqk6WKjORFrFacd_wG7KMeCd4QedbSG3eROJ2om6FA@mail.gmail.com>
References: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
	<1355481842-17952-2-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1355481842-17952-2-git-send-email-jy0922.shim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, kyungmin.park@samsung.com, Thomas Abraham <thomas.abraham@linaro.com>, kgene.kim@samsung.com
Cc: grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 14, 2012 at 11:44 AM, Joonyoung Shim
<jy0922.shim@samsung.com> wrote:

> This adds GPIO interrupt registration and modification needs to register
> GPIO interrupt rightly for exynos5 SoCs. EXYNOS5_GPYx gpios shouldn't be
> counted to GPIO interrupt group register number because they doesn't
> support GPIO interrupt, so their struct samsung_gpio_cfg should be
> initialized to &samsung_gpio_cfgs[8] in declaration ahead.
>
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>

This patch has been floating for a while, Kyungmin, Kukjin, Thomas:
shall it be applied?

Yours,
Linus Walleij
