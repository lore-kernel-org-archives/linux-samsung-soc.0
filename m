From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: Drop support for Exynos SoCs
Date: Thu, 29 Aug 2013 14:42:25 +0200
Message-ID: <CACRpkdbUo2t1gT8=6UpjiXs4Sd-1xLpEqOqdA220L0wgVC-4uw@mail.gmail.com>
References: <1377538555-14901-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1377538555-14901-1-git-send-email-t.figa@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Aug 26, 2013 at 7:35 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> GPIO support on Exynos SoCs is provided by pinctrl-samsung driver,
> leaving all the support code in gpio-samsung driver unused.

Just double checking: you mean it is unused in v3.11-rc7 OK?
Not in Linux-next?

In the former case I can merge it into the GPIO tree and in the
latter case I need to merge it into the pinctrl tree.

> This dead
> code can be safely removed and so it is done by this patch.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Tentatively applied to the gpio tree.

Yours,
Linus Walleij
