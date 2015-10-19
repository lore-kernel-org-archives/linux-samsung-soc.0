From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3 6/8] drivers: soc: add support for exynos SROM driver
Date: Mon, 19 Oct 2015 19:58:55 +0530
Message-ID: <CAGcde9E+DELn_-ibE5+NtsrtBFNqG=AKF8wk=Yh8YYxZbk+v3w@mail.gmail.com>
References: <20151013150002.GA27569@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38627 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbbJSO3Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 10:29:16 -0400
In-Reply-To: <20151013150002.GA27569@Red>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, p.fedin@samsung.com, "thomas.ab@samsung.com" <thomas.ab@samsung.com>

Hi,

Thanks for review.

On 13 October 2015 at 20:30, LABBE Corentin <clabbe.montjoie@gmail.com> wrote:
> +static struct exynos_srom_reg_dump *exynos_srom_alloc_reg_dump(
> +               const unsigned long *rdump,
> +               unsigned long nr_rdump)
> +{
> +       struct exynos_srom_reg_dump *rd;
> +       unsigned int i;
> +
> +       rd = kcalloc(nr_rdump, sizeof(*rd), GFP_KERNEL);
> +       if (!rd)
> +               return NULL;
> +
> +       for (i = 0; i < nr_rdump; ++i)
> +               rd[i].offset = rdump[i];
> +
> +       return rd;
> +}
>
> You do not free rd anywhere in your code.
>

OK, I missed that, corrected in v4.

> +static int exynos_srom_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np;
> +       struct device *dev = &pdev->dev;
> +
> +       np = dev->of_node;
>
> Are you sure that dev->of_node will be always set ?
> I see lots of driver who if (dev->of_node) {}
>

Taken care in v4.

> +       exynos_srom_base = of_iomap(np, 0);
> +
> +       if (!exynos_srom_base) {
> +               pr_err("iomap of exynos srom controller failed\n");
> +               return -ENOMEM;
> +       }
>
> You can use dev_err(dev, "") insted of pr_err
>

Taken care in v4.

> +
> +       exynos_srom_regs = exynos_srom_alloc_reg_dump(exynos_srom_offsets,
> +                       sizeof(exynos_srom_offsets));
> +
> +       if (!exynos_srom_regs) {
> +               iounmap(exynos_srom_regs);
> +               return -ENOMEM;
> +       }
> +
> +       return 0;
> +}
>
> Instead of using a global static exynos_srom_base/exynos_srom_regs, why you do not use platform_set_drvdata() ?
>

OK. Taken care in v4.

Posted v4 here

https://lkml.org/lkml/2015/10/19/278

Thanks,
Pankaj Dubey

> Regards
> LABBE Corentin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
