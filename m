From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] pinctrl: Use of_node_name_eq for node name comparisons
Date: Thu, 6 Dec 2018 08:07:18 +0100
Message-ID: <CAJKOXPfzAFqQX-WHkEmvhp4OGY_tFtouG7d1JOD+_SRjYzd3cA@mail.gmail.com>
References: <20181205195050.4759-20-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205195050.4759-20-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 5 Dec 2018 at 20:51, Rob Herring <robh@kernel.org> wrote:
>
> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Linus,
I do not have anything queued in pinctrl samsung for next release, so
maybe you could apply this directly?

Best regards,
Krzysztof
