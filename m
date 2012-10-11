From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/15] pinctrl: samsung: Usability and extensibiltiy improvements
Date: Thu, 11 Oct 2012 16:20:40 +0200
Message-ID: <CACRpkdZEi85QjM9OH2zVet=E7whdc_cfCyOtdmumUio-ccrZ-g@mail.gmail.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:47400 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932177Ab2JKOUm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 10:20:42 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so1522722wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Oct 2012 07:20:40 -0700 (PDT)
In-Reply-To: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Thu, Oct 11, 2012 at 10:11 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch series is a work on improving usability and extensibiltiy of
> the pinctrl-samsung driver. It consists of three main parts:
>  - improving flexibility of SoC-specific data specification
>  - converting the driver to one GPIO chip and IRQ domain per pin bank
>  - improving wake-up IRQ setup and handling

OK I managed to apply this series (I have a separate "samsung"
branch in the pinctrl tree now) and merged into for-next for some
testing in linux-next.

Applied Kyungmin's reviewed-by and Thomas' acked-by on all.

Thanks!
Linus Walleij
