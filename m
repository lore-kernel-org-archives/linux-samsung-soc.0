From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] mmc: sdhci-s3c: let device core setup the default pin configuration
Date: Thu, 7 Mar 2013 09:09:58 +0100
Message-ID: <CACRpkdY-RVAXxc2TqDcczhCLGDC8d401ucuCCDzRb+Ha9apr8g@mail.gmail.com>
References: <1362569776-13932-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1362569776-13932-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cjb@laptop.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, ben-linux@fluff.org, jh80.chung@samsung.com, tgih.jun@samsung.com, girish.shivananjappa@linaro.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 6, 2013 at 12:36 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> With device core now able to setup the default pin configuration,
> the call to devm_pinctrl_get_select_default can be removed. And
> the pin configuration code based on the deprecated Samsung specific
> gpio bindings is also removed.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
