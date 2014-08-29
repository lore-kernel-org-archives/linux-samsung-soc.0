From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/14] pinctrl: samsung: use CONFIG_PINCTRL_SAMSUNG symbol
 in makefile
Date: Fri, 29 Aug 2014 14:37:07 +0200
Message-ID: <CACRpkda=LCT_P7czZ6mNX_7eS9nyKwxZrzXO2AAQ8W5RrehCcw@mail.gmail.com>
References: <1409132889-2080-1-git-send-email-ch.naveen@samsung.com>
	<1409132889-2080-6-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:43363 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608AbaH2MhI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Aug 2014 08:37:08 -0400
Received: by mail-ob0-f173.google.com with SMTP id uy5so1734011obc.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2014 05:37:07 -0700 (PDT)
In-Reply-To: <1409132889-2080-6-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: naveenkrishna.ch@gmail.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "cpgs ." <cpgs@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

On Wed, Aug 27, 2014 at 11:48 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:

> Samsung Exynos7 is a ARM64bit processor. Which does not select
> the CONFIG_PLAT_SAMSUNG symbol. CONFIG_PINCTRL_SAMSUNG is being
> selected for both PLAT_SAMSUNG and ARCH_EXYNOS7 symbols.
>
> This patch modifes the pinctrl/Makefile to use
> CONFIG_PINCTRL_SAMSUNG symbol to compile the pinctrl/samsung/*.c
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: linus.walleij@linaro.org
> Cc: Thomas Abraham <thomas.ab@samsung.com>

Excellent catch, thanks, patch applied!

I should use this pattern on more places in the Makefile,
I was confused by logically thinking that Kconfig symbols
used in Makefile cannot be from a Kconfig one level below.

Yours,
Linus Walleij
