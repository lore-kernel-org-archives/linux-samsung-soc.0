From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] clk: samsung: exynos5433: mark PM functions as __maybe_unused
Date: Tue, 10 Oct 2017 12:41:20 +0200
Message-ID: <CAPDyKFozf1MfEgj2mCmogyJLzSmszoFXzg0Q=Ae-kv-itz+SGA@mail.gmail.com>
References: <20171010091522.2286344-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:56008 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751826AbdJJKlV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 06:41:21 -0400
Received: by mail-it0-f54.google.com with SMTP id l196so1899542itl.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2017 03:41:21 -0700 (PDT)
In-Reply-To: <20171010091522.2286344-1-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 10 October 2017 at 11:15, Arnd Bergmann <arnd@arndb.de> wrote:
> The suspend/resume functions are referenced conditionally, causing
> a harmless warning when CONFIG_PM is disabled:
>
> drivers/clk/samsung/clk-exynos5433.c:5476:12: error: 'exynos5433_cmu_resume' defined but not used [-Werror=unused-function]
> drivers/clk/samsung/clk-exynos5433.c:5453:12: error: 'exynos5433_cmu_suspend' defined but not used [-Werror=unused-function]
>
> This marks both as __maybe_unused to shut up the warning.
>
> Fixes: 523d3de41f02 ("clk: samsung: exynos5433: Add support for runtime PM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

FWIW:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]
