From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/6] pinctrl: exynos: Fix wakeup IRQ domain registration check
Date: Mon, 24 Sep 2012 21:57:26 +0200
Message-ID: <CACRpkdYkVicrUk-H2Tx=tCDRxquq2B=n6O5UNZ8QoXLfMEDV=g@mail.gmail.com>
References: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
	<2737662.uE6StcAj33@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:45591 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751017Ab2IXT51 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 15:57:27 -0400
Received: by vbbff1 with SMTP id ff1so6544841vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Sep 2012 12:57:26 -0700 (PDT)
In-Reply-To: <2737662.uE6StcAj33@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com

On Thu, Sep 20, 2012 at 4:53 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> Because of a typo, incorrect field of a structure was being checked.
> This patch fixes the check to use correct field.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I assume you'll take this through the Samsung tree.

Yours,
Linus Walleij
