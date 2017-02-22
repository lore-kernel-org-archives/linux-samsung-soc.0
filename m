From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] pinctrl: samsung: Remove unused local variable
Date: Wed, 22 Feb 2017 15:38:49 +0100
Message-ID: <CACRpkdZRGDda1LEt2iS=qB3Lvxd-398Ut8M4a4uK0b6Ce2u=aw@mail.gmail.com>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1487251636-2480-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Feb 16, 2017 at 2:27 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> The local variable drvdata is not used in samsung_gpio_set_direction.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>
> Changes since v1:
>  - Update commit message


Patch applied. for v4.12.

Yours,
Linus Walleij
