From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 3/3] gpio: samsung: skip gpiolib registration if
 pinctrl support is enabled for exynos5420
Date: Sat, 15 Jun 2013 21:51:04 +0200
Message-ID: <CACRpkdYOjcCGD3qqCzMS4TRv8GTBub0Z9niyCAwzRBZd+5w27Q@mail.gmail.com>
References: <1371214954-29358-1-git-send-email-l.krishna@samsung.com>
	<1371214954-29358-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:40318 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754351Ab3FOTvF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Jun 2013 15:51:05 -0400
Received: by mail-ob0-f179.google.com with SMTP id xk17so1855515obc.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jun 2013 12:51:04 -0700 (PDT)
In-Reply-To: <1371214954-29358-4-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On Fri, Jun 14, 2013 at 3:02 PM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:

How does this topic:

> Skip exynos5420 gpiolib registration if pinctrl support is enabled.
(...)

Correlate with that:

>                 { .compatible = "samsung,exynos5250-pinctrl", },
> +               { .compatible = "samsung,exynos5420-pinctrl", },

Sorry I don't get it.

Should the subject not be "add compatible string for 5420" or
something?

Yours,
Linus Walleij
