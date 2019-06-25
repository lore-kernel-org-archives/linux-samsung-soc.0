From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] gpio: Fix return value mismatch of function gpiod_get_from_of_node()
Date: Tue, 25 Jun 2019 15:47:44 +0200
Message-ID: <CACRpkdbPxHgyTAnE12PrMRu9XQqdoXmS+SWXYrSKXgL_SWOzcw@mail.gmail.com>
References: <1560938081892.33415@sensor-technik.de> <CAJKOXPej57MJKe6ShinG+VJdG+XM4qhpeD3rQ2ZHzRTmO43+GA@mail.gmail.com>
 <1561066629320.13520@sensor-technik.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561066629320.13520@sensor-technik.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Waibel Georg <Georg.Waibel@sensor-technik.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Georg,

first: good catch! Sorry for breaking this, and kudos for fixing it!

On Thu, Jun 20, 2019 at 11:37 PM Waibel Georg
<Georg.Waibel@sensor-technik.de> wrote:

> In case the requested gpio property is not found in the device tree, some
> callers of gpiod_get_from_of_node() expect a return value of NULL, others
> expect -ENOENT.
> In particular devm_fwnode_get_index_gpiod_from_child() expects -ENOENT.
> Currently it gets a NULL, which breaks the loop that tries all
> gpio_suffixes. The result is that a gpio property is not found, even
> though it is there.
>
> This patch changes gpiod_get_from_of_node() to return -ENOENT instead
> of NULL when the requested gpio property is not found in the device
> tree. Additionally it modifies all calling functions to properly
> evaluate the return value.
>
> Another approach would be to leave the return value of
> gpiod_get_from_of_node() as is and fix the bug in
> devm_fwnode_get_index_gpiod_from_child(). Other callers would still need
> to be reworked. The effort would be the same as with the chosen solution.
>
> Signed-off-by: Georg Waibel <georg.waibel@sensor-technik.de>
> ---
>
> V2: Rebased on top of [PATCH] regulator: s2mps11: Fix ERR_PTR dereference on GPIO lookup failure

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Mark: as most of the changed lines are in the regulator tree,
would you please pick this patch up?

(Else tell me and I will take care of it.)

Yours,
Linus Walleij
