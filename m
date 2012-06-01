From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: add samsung pinctrl and gpiolib driver
Date: Fri, 1 Jun 2012 09:58:49 +0800
Message-ID: <CAJuYYwQ_ec+dWVd49ZKqO1zk-8x93966gvrWddbx9kS8NBdMvg@mail.gmail.com>
References: <1337816857-14694-1-git-send-email-thomas.abraham@linaro.org>
	<1337816857-14694-2-git-send-email-thomas.abraham@linaro.org>
	<CACRpkdZDnFW4-bDsHN5BOr2e5NLGzouSBY7ngf-VsoPn-SyxAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:65327 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757790Ab2FAB6u convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 May 2012 21:58:50 -0400
Received: by weyu7 with SMTP id u7so1042481wey.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 May 2012 18:58:49 -0700 (PDT)
In-Reply-To: <CACRpkdZDnFW4-bDsHN5BOr2e5NLGzouSBY7ngf-VsoPn-SyxAA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org, ext Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>

On 1 June 2012 09:36, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, May 24, 2012 at 7:47 AM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>
> It would be nice if some DT person could review the bindings, but if
> nothing happens
> I will accept them as-is.
>
> This driver is special since it seems to keep all pin, group and
> function information
> in the device tree, but not like Tony is doing it in pinctrl-simple,
> if I understand
> correctly?
>
>> diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pin=
ctrl-samsung.c
>> new file mode 100644
>> index 0000000..480e2f0
> (...)
>> +/* reading pin pull up/down and driver strength settings not implem=
ented */
>> +static int samsung_pinconf_get(struct pinctrl_dev *pctldev, unsigne=
d int pin,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 unsigned long *config)
>> +{
>> + =A0 =A0 =A0 return -ENOTSUPP;
>> +}
>> +
>> +/* reading pin pull up/down and driver strength settings not implem=
ented */
>> +static int samsung_pinconf_group_get(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsign=
ed int group, unsigned long *config)
>> +{
>> + =A0 =A0 =A0 return -ENOTSUPP;
>> +}
>
> I think we made these optional now, so you can just leave them undefi=
ned
> in the pinconf_ops.

Ok. I will leave them undefined.

>
>> +static inline struct samsung_pinctrl_drv_data *samsung_pinctrl_get_=
driver_data(
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct=
 platform_device *pdev)
>> +{
>> +#ifdef CONFIG_OF
>> + =A0 =A0 =A0 if (pdev->dev.of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int id;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_id *match;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct device_node *node =3D pde=
v->dev.of_node;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 id =3D of_alias_get_id(pdev->dev.of_no=
de, "pinctrl");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (id < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "f=
ailed to get alias id\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(samsung_pinctr=
l_dt_match, node);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return (struct samsung_pinctrl_drv_dat=
a *)match->data + id;
>> + =A0 =A0 =A0 }
>> +#endif
>
> You don't need this #ifdef because in Kconfig the driver already depe=
nds on
> OF so this is always available.

Yes, I missed that.

>
>> +/* driver data for various samsung soc's */
>> +#ifdef CONFIG_CPU_EXYNOS4210
>> +#define EXYNOS4210_PCTRL_DRVDATA (&exynos4210_pinctrl_drv_data)
>> +#else
>> +#define EXYNOS4210_PCTRL_DRVDATA (NULL)
>> +#endif /* CONFIG_CPU_EXYNOS4210 */
>
> Can you do this in some .h file instead?

Ok. I will check on this.

>
>> +#ifdef CONFIG_OF
>
> You don't need this because in Kconfig the driver depends on OF
> already.
>
>> +static const struct of_device_id samsung_pinctrl_dt_match[] =3D {
>> +#ifdef CONFIG_CPU_EXYNOS4210
>> + =A0 =A0 =A0 { .compatible =3D "samsung,pinctrl-exynos4210",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =3D (void *)exynos4210_pinctrl_d=
rv_data },
>> +#endif /* CONFIG_CPU_EXYNOS4210 */
>> + =A0 =A0 =A0 {},
>> +};
>> +MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
>> +#endif /* CONFIG_OF */
>
> So delete the closing #endif too.

Initially, it started with dt and non-dt support. Then switched over
to dt-only support and in the process, I left these artifacts. I will
clean this up.

Thank you Linus for your review and comments.

Regards,
Thomas.

>
> Yours,
> Linus Walleij
