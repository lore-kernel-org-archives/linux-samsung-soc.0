From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] ARM: EXYNOS: Fix EINT wake-up mask configuration when
 pinctrl is used
Date: Tue, 21 May 2013 13:27:12 +0200
Message-ID: <CACRpkdZ51KBZQTSR7CpqknnQZ8LU+P2p=FFAcUOCV3wXP5foMg@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:47131 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861Ab3EUL1N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 07:27:13 -0400
Received: by mail-ie0-f171.google.com with SMTP id e11so1117509iej.30
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 May 2013 04:27:12 -0700 (PDT)
In-Reply-To: <1368807872-2601-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, May 17, 2013 at 6:24 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> On DT-enabled systems pinctrl-exynos driver is responsible for handling
> of wake-up EINT interrupts. This patch adjusts wake-up mask
> configuration code to take wake-up mask value from pinctrl-exynos driver
> on DT-enabled systems.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Patch applied to my fixes branch for v3.10.

Yours,
Linus Walleij
