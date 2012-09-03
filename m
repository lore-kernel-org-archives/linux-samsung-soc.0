From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 4/4] ARM: EXYNOS: skip wakeup interrupt setup if
 pinctrl driver is used
Date: Mon, 3 Sep 2012 13:17:00 +0200
Message-ID: <CACRpkda5MkXbePf8B8rY8w3rjowzE8MqtWH_cehOqUoKTTY=9Q@mail.gmail.com>
References: <1345720529-32315-1-git-send-email-thomas.abraham@linaro.org>
	<1345720529-32315-5-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1345720529-32315-5-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, dong.aisheng@linaro.org, swarren@wwwdotorg.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 23, 2012 at 1:15 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Pinctrl driver includes support for configuring the external wakeup
> interrupts. On exynos platforms that use pinctrl driver, the setup
> of wakeup interrupts in the exynos platform code can be skipped.
>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
