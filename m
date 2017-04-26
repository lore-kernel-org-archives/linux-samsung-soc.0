From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] pinctrl: samsung: remove unneeded (void *) casts in of_match_table
Date: Wed, 26 Apr 2017 09:21:45 +0200
Message-ID: <CAJKOXPdfYjBw=LSfLOJ_CY2+bhY5QA--GbUHfqz3yBuydsO8Uw@mail.gmail.com>
References: <1493156063-8446-1-git-send-email-yamada.masahiro@socionext.com> <1493156063-8446-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1493156063-8446-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Apr 25, 2017 at 11:34 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> of_device_id::data is an opaque pointer.  No explicit cast is needed.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Looks correct. It is too late for me for v4.12 so I will pick it up
for v4.13. For my reference:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
