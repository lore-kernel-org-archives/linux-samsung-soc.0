From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: add pinctrl_force_sleep() for "sleep"
 pinctrl state
Date: Fri, 22 Sep 2017 15:09:51 +0200
Message-ID: <CACRpkdZSCyEWWptfSHr+EOW-RVh4sgVT5yNkiVqZs=nXwHxZGA@mail.gmail.com>
References: <CGME20170921123230epcas1p4d3c1de108af7d34053d2c4f40dd42119@epcas1p4.samsung.com>
 <006801d332d5$b0ca09d0$125e1d70$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:49359 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752043AbdIVNJx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Sep 2017 09:09:53 -0400
Received: by mail-io0-f177.google.com with SMTP id 21so2903187iof.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Sep 2017 06:09:52 -0700 (PDT)
In-Reply-To: <006801d332d5$b0ca09d0$125e1d70$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?64Ko7JiB66+8?= <youngmin.nam@samsung.com>, Florian Fainelli <f.fainelli@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Baolin Wang <baolin.wang@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 21, 2017 at 2:32 PM, =EB=82=A8=EC=98=81=EB=AF=BC <youngmin.nam@=
samsung.com> wrote:

I'm copying the whole patch so that everyone added to To: can see it.

> This patch adds pinctrl_for_sleep() in samsung_pinctrl_suspend()
> to support configuration of "sleep" pinctrl state.
>
> For example, we can configure "sleep" pinctrl state of "gpf1-6"
> as "INPUT, PULL DOWN" by configuring power down mode register.
>
> &pinctrl_5 {
>         pinctrl-names =3D "default","sleep";
>         pinctrl-0 =3D <&initial5>;
>         pinctrl-1 =3D <&sleep5>;
>
>         initial5: initial-state {
>                 samsung,pins =3D gpf1-6;
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
>         };
>         sleep5: sleep-state {
>                 samsung,pins =3D gpf1-6;
>                 samsung,pin-con-pdn =3D <EXYNOS_PIN_PDN_INPUT>;
>                 samsung,pin-pud-pdn =3D <EXYNOS_PIN_PULL_DOWN>;
>         };
> };
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index e04f7fe0a65d..b4d12f8db475 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1099,6 +1099,11 @@ static int __maybe_unused samsung_pinctrl_suspend(=
struct device *dev)
>  {
>         struct samsung_pinctrl_drv_data *drvdata =3D dev_get_drvdata(dev)=
;
>         int i;
> +       int ret;
> +
> +       ret =3D pinctrl_force_sleep(drvdata->pctl_dev);
> +       if (ret)
> +               dev_err(dev, "could not set sleep pinstate %d\n", ret);
>
>         for (i =3D 0; i < drvdata->nr_banks; i++) {
>                 struct samsung_pin_bank *bank =3D &drvdata->pin_banks[i];
> @@ -1187,6 +1192,11 @@ static int __maybe_unused samsung_pinctrl_resume(s=
truct device *dev)
>         if (drvdata->retention_ctrl && drvdata->retention_ctrl->disable)
>                 drvdata->retention_ctrl->disable(drvdata);
>
> +       /* For changing state without writing register. */
> +       if (!IS_ERR(drvdata->pctl_dev->p) &&
> +           !IS_ERR(drvdata->pctl_dev->hog_default))
> +               drvdata->pctl_dev->p->state =3D drvdata->pctl_dev->hog_de=
fault;
> +
>         return 0;
>  }

Oddly this business of forcing the hardware into different "sleep" states
is coming up from the left and right at the moment.

Please check a bit at:
commit 6606bc9dee63 ("pinctrl: Add sleep related state to indicate
sleep related configs")
and how the Spreadtrum driver handles this.

That is for the case where the hardware autonomously defines
a sleep state that need to be programmed from somewhere.

This seems to be what this hardware needs to use?

Yours,
Linus Walleij
