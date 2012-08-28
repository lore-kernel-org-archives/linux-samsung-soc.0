From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] Removal of obsolete s3c2410_* GPIO API
Date: Mon, 27 Aug 2012 17:13:39 -0700
Message-ID: <CACRpkdaspHBDUjwf_bPtZoFeYK7q97oX4Jat=pmX810RtGJOpA@mail.gmail.com>
References: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:39146 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755087Ab2H1ANl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 20:13:41 -0400
Received: by wibhq12 with SMTP id hq12so5952497wib.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 17:13:40 -0700 (PDT)
In-Reply-To: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: kgene.kim@samsung.com, linus.walleij@stericsson.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sat, Aug 25, 2012 at 5:20 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:

> This short patch series converts remaining users of the s3c24xx SoC
> specific gpiolib functions to the gpiolib API and finally removes
> all s3c2410_* functions from drivers/gpio/gpio-samsung.c.

I'm fine with this as long as the Samsung maintainer is, so
Acked-by: Linus Walleij <linus.walleij@linaro.org>

But I suspect this will be merged through the Samsung SoC tree?

Yours,
Linus Walleij
