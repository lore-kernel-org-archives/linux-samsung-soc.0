From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] pinctrl: exynos: Add support for set_irq_wake of
 wake-up EINTs
Date: Tue, 21 May 2013 13:25:16 +0200
Message-ID: <CACRpkdZReXCt_pcMPvuyGBc09UPWN0MjMmJBOokJRjBaf-m4YA@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:63569 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752134Ab3EULZR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 07:25:17 -0400
Received: by mail-ie0-f175.google.com with SMTP id s9so1094156iec.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 May 2013 04:25:16 -0700 (PDT)
In-Reply-To: <1368807872-2601-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, May 17, 2013 at 6:24 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch adds support of IRQ wake-up ability configuration for
> wake-up EINTs on Exynos SoCs.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Patch applied on my fixes branch for v3.10

Yours,
Linus Walleij
