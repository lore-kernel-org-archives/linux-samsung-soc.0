From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 14/28] ARM: SAMSUNG: Introduce GPIO_SAMSUNG Kconfig entry
Date: Mon, 17 Jun 2013 11:22:16 +0200
Message-ID: <CACRpkdaJ9joD7rC_Rc_Jz5eocgtZFqYLRwGHwQp9FmNhVuBYtQ@mail.gmail.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
	<1371238384-1504-15-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:64194 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755718Ab3FQJWR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 05:22:17 -0400
Received: by mail-ob0-f179.google.com with SMTP id xk17so2865138obc.24
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 02:22:16 -0700 (PDT)
In-Reply-To: <1371238384-1504-15-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, Jun 14, 2013 at 9:32 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch adds Kconfig entry that selects whether legacy Samsung GPIO
> driver should be built or not. For platforms that support only DT based
> boot, the new pinctrl driver is used and so the old one is not needed.
>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Looks good to me.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
