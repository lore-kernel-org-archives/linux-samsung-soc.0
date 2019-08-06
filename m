From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] pinctrl: samsung: Fix device node refcount leaks in
 Exynos wakeup controller init
Date: Tue, 6 Aug 2019 16:25:43 +0200
Message-ID: <CAJKOXPfuu1bgLL9oOf=7hrz-QvXBcJjJVMwqN2oRUv7hnB5Jyg@mail.gmail.com>
References: <20190805162710.7789-1-krzk@kernel.org> <CACRpkda8P522pkxctZbf2Ut13V6Rzx=mSYsRuHv0BvPyF6q1gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda8P522pkxctZbf2Ut13V6Rzx=mSYsRuHv0BvPyF6q1gA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 6 Aug 2019 at 16:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Aug 5, 2019 at 6:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > In exynos_eint_wkup_init() the for_each_child_of_node() loop is used
> > with a break to find a matching child node.  Although each iteration of
> > for_each_child_of_node puts the previous node, but early exit from loop
> > misses it.  This leads to leak of device node.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> I assume you're collecting these for a pull request to me
> at some later point, all look good to me.

Yes, I'll take these and one more patch from lists and send them to you.

Best regards,
Krzysztof
