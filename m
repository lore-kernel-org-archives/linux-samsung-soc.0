From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: Update documentation
Date: Tue, 4 Sep 2012 09:27:55 +0200
Message-ID: <CACRpkdbudOv9AvS1XuyPB+BZ63+Ymu5dhkBBWFCo2qYDV+jAmw@mail.gmail.com>
References: <503D267A.2090406@gmail.com>
	<1346603089-14122-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:45280 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753816Ab2IDH14 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 03:27:56 -0400
Received: by wgbdr13 with SMTP id dr13so5320754wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Sep 2012 00:27:55 -0700 (PDT)
In-Reply-To: <1346603089-14122-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sun, Sep 2, 2012 at 6:24 PM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:

> Update Samsung GPIO API documentation to reflect removal of
> the s3c24xx specific gpio API. While at it, fix some typos.
>
> The notes on conversion from s3c2410_* functions to the gpiolib
> API are left here just in case there is any out of tree code that
> still needs to be converted.
>
> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Get the Samsung maintainers to apply this patch since they carry
the API changes.

Yours,
Linus Walleij
