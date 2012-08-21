From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] ARM: EXYNOS: skip wakeup interrupt setup if
 pinctrl driver is used
Date: Tue, 21 Aug 2012 14:04:23 +0200
Message-ID: <CACRpkdaxSZZQwefN3FNvv3ctXFHqaLZoAZ5f8CVu7Tx9n6-v1Q@mail.gmail.com>
References: <1345060656-32201-1-git-send-email-thomas.abraham@linaro.org>
	<1345060656-32201-5-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1345060656-32201-5-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 15, 2012 at 9:57 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Pinctrl driver includes support for configuring the external wakeup
> interrupts. On exynos platforms that use pinctrl driver, the setup
> of wakeup interrupts in the exynos platform code can be skipped.
>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

> +#ifdef CONFIG_OF

Don't you actually want to use:

#fidef CONFIG_PINCTRL_SAMSUNG

here? CONFIG_OF is a bit vague.

Yours,
Linus Walleij
