From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/7] regulator: switch to using [devm_]fwnode_gpiod_get_index
Date: Sat, 5 Oct 2019 21:01:37 +0200
Message-ID: <CACRpkdZ_+YKKmNrho5edu7hn8UsOCPySSn2YMWz+qjYwMxgvpw@mail.gmail.com>
References: <20191004231017.130290-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004231017.130290-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Support Opensource <support.opensource@diasemi.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Oct 5, 2019 at 1:10 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This series swiches regulator drivers form using
> [devm_]gpiod_get_from_of_node() that is scheduled to be removed in favor
> of [devm_]fwnode_gpiod_get_index() that behaves more like standard
> [devm_]gpiod_get_index() and will potentially handle secondary software
> nodes in cases we need to augment platform firmware.

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Too bad with the build robots being unable to parse the
pull deps. Now they hammer out complaints.

Yours,
Linus Walleij
