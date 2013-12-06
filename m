From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Fri, 6 Dec 2013 12:58:21 +0100
Message-ID: <CACRpkdZuk3zzhDnj3wJg1cmuqX0Cj-qQ--sBzEEV_XWyeDje3w@mail.gmail.com>
References: <1386322280-23756-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:33763 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757863Ab3LFL6W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 06:58:22 -0500
Received: by mail-oa0-f53.google.com with SMTP id m1so641063oag.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2013 03:58:21 -0800 (PST)
In-Reply-To: <1386322280-23756-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

On Fri, Dec 6, 2013 at 10:31 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> This isolates the custom S3C24xx GPIO definition table to
> <linux/platform_data/gpio-samsung-s3x24xx.h>

Maybe I'm too trigger happy. I'll send a combined series with
S3C24xx, S3C64xx and maybe also S5P variants all fixed
so you can see the overall idea here. Hold on.

Yours,
Linus Walleij
