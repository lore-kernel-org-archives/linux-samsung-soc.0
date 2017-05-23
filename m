From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] pinctrl: samsung: clean up modular vs. non-modular distinctions
Date: Tue, 23 May 2017 16:51:13 +0200
Message-ID: <CAJKOXPcJDFw2-EW+dGvL1AtVwXWkxAQ6cnF0o6GGgaaxeqBqug@mail.gmail.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com> <20170522205648.23545-2-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S967126AbdEWOvR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 May 2017 10:51:17 -0400
In-Reply-To: <20170522205648.23545-2-paul.gortmaker@windriver.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org

On Mon, May 22, 2017 at 10:56 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Fixups here tend to be more all over the map vs. some of the other
> repeated/systematic ones we've seen elsewhere.
>
> We remove module.h from code that isn't doing anything modular at
> all;  if they have __init sections, then replace it with init.h
>
> A couple drivers have module_exit() code that is essentially orphaned,
> and so we remove that.
>
> There are no module_init replacements, so we have no concerns wrt.
> initcall ordering changes as per some of the other cleanups.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

These are quite old entries of maintainers. I guess you add Cc-entries
once per git commit but no problem - I have it from the lists.

Thanks, applied.

Best regards,
Krzysztof
