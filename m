From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 4/7] pinctrl: samsung: Add GPF support for Exynos5433
Date: Thu, 25 Aug 2016 23:34:44 +0900
Message-ID: <CA+Ln22EpkNUVKj1a1OdOkYuDQbrOOqQjGpz295s_d31U9bs__w@mail.gmail.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472046551-703-5-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, chanwoo@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Beomho Seo <beomho.seo@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ingi2.kim@samsung.comlinux-arm-kernel <li>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo, Joonyoung,

2016-08-24 22:49 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> index 37bc692445d4..499fb3484915 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -19,6 +19,7 @@ Required Properties:
>    - "samsung,exynos5260-pinctrl": for Exynos5260 compatible pin-controller.
>    - "samsung,exynos5410-pinctrl": for Exynos5410 compatible pin-controller.
>    - "samsung,exynos5420-pinctrl": for Exynos5420 compatible pin-controller.
> +  - "samsung,exynos5433-pinctrl": for Exynos5433 compatible pin-controller.
>    - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.

I suppose this patch is adding the compatible string because it was
forgotten in earlier patch? I believe it should be split into separate
patch and mentioned in description.

>
>  - reg: Base address of the pin controller hardware module and length of
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index 12fa9d3f1113..b9605b8282be 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -1360,6 +1360,11 @@ static const struct samsung_pin_bank_data exynos5433_pin_banks0[] = {
>         EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
>         EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
>         EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
> +       EXYNOS_PIN_BANK_EINTW_EXT(8, 0x020, "gpf1", 0x1004, 1, 0),
> +       EXYNOS_PIN_BANK_EINTW_EXT(4, 0x040, "gpf2", 0x1008, 1, 0),
> +       EXYNOS_PIN_BANK_EINTW_EXT(4, 0x060, "gpf3", 0x100c, 1, 0),
> +       EXYNOS_PIN_BANK_EINTW_EXT(8, 0x080, "gpf4", 0x1010, 1, 0),
> +       EXYNOS_PIN_BANK_EINTW_EXT(8, 0x0a0, "gpf5", 0x1014, 1, 0),
>  };
>
>  /* pin banks of exynos5433 pin-controller - AUD */
> @@ -1441,6 +1446,7 @@ const struct samsung_pin_ctrl exynos5433_pin_ctrl[] = {
>                 .eint_wkup_init = exynos_eint_wkup_init,
>                 .suspend        = exynos_pinctrl_suspend,
>                 .resume         = exynos_pinctrl_resume,
> +               .nr_ext_resources = 1,

Note that it makes it incompatible with previous DT bindings, because
the extra resource becomes mandatory now. But if there was no DTS for
any Exynos5433 in the tree before then I guess it's okay.

Best regards,
Tomasz
