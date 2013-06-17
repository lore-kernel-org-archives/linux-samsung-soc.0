From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: samsung: add PINCTRL_S3C24XX to exclude options
Date: Mon, 17 Jun 2013 18:49:04 +0200
Message-ID: <CACRpkdZ2RfB4rc7xrDkyxiOzS1NvpX3mFHM+xfQB_GVf+bMRiA@mail.gmail.com>
References: <201306140044.15568.heiko@sntech.de>
	<201306140045.27744.heiko@sntech.de>
	<1a1701ce6b5c$651c4d80$2f54e880$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:54233 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751174Ab3FQQtF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:49:05 -0400
Received: by mail-ob0-f172.google.com with SMTP id wo10so3431368obc.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 09:49:04 -0700 (PDT)
In-Reply-To: <1a1701ce6b5c$651c4d80$2f54e880$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>

On Mon, Jun 17, 2013 at 3:13 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> Linus, shall I take this into samsung tree? Or since the pinctrl-s3c24xx already merged into arm-soc, this could be picked into your tree...

I'm not rebasing pinctrl agains the ARM SoC tree,
I only rebase to Torvalds tree.

So please take it through the Samsung tree...

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
