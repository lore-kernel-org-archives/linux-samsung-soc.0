From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: samsung: clean up modular vs. non-modular distinctions
Date: Mon, 29 May 2017 10:24:07 +0200
Message-ID: <CACRpkdb_4_9884AWCxv6OYFPzcRdS9YHAe8YrJ7hPxHvzDuf=g@mail.gmail.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com> <20170522205648.23545-2-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170522205648.23545-2-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

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

Krzysztof is sub-submainter for the Samsung stuff in pinctrl so I
leave it to him to figure out how to bend, twist and merge this, then
I will get the result back from him with a pull request.

It looks good to me though.

Yours,
Linus Walleij
