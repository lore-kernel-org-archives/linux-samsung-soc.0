From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH RFC 3/4] clk: samsung: Add driver to control CLKOUT line
 on Exynos SoCs
Date: Fri, 16 May 2014 16:09:26 +0530
Message-ID: <CAPdUM4P7Z1eLVKuc0N1iPaekM_7kNv7KCve2MgrEziszfnzz7A@mail.gmail.com>
References: <1400175151-27779-1-git-send-email-t.figa@samsung.com>
	<1400175151-27779-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400175151-27779-4-git-send-email-t.figa@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Tushar Behera <tushar.behera@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

[snip]
> +       gate->lock = &clkout_lock;
> +
> +       mux->reg = reg + EXYNOS_PMU_DEBUG_REG;
> +       mux->mask = EXYNOS_CLKOUT_MUX_MASK;
> +       mux->shift = EXYNOS_CLKOUT_MUX_SHIFT;
> +       mux->lock = &clkout_lock;
> +
> +       clk = clk_register_composite(NULL, "clkout", parent_names,
> +                                       parent_count, &mux->hw,
> +                                       &clk_mux_ops, NULL, NULL, &gate->hw,
> +                                       &clk_gate_ops, 0);
> +       if (IS_ERR(clk))
> +               goto err_unmap;
> +

Hi Tomasz,

Do we really need a composite clock here? How about registering
a mux and a gate separately?

Regards,
Rahul Sharma.

> +       of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +       return;
> +
> +err_unmap:
> +       iounmap(reg);
> +clks_put:
> +       for (i = 0; i < EXYNOS_CLKOUT_PARENTS; ++i)
> +               if (!IS_ERR(parents[i]))
> +                       clk_put(parents[i]);
> +free_gate:
> +       kfree(gate);
> +free_mux:
> +       kfree(mux);
> +
> +       pr_err("%s: failed to register clkout clock\n", __func__);
> +}
> +CLK_OF_DECLARE(exynos4210_clkout, "samsung,exynos4210-pmu", exynos_clkout_init);
> +CLK_OF_DECLARE(exynos4412_clkout, "samsung,exynos4x12-pmu", exynos_clkout_init);
> +CLK_OF_DECLARE(exynos5250_clkout, "samsung,exynos5250-pmu", exynos_clkout_init);
> +CLK_OF_DECLARE(exynos5420_clkout, "samsung,exynos5420-pmu", exynos_clkout_init);
> --
> 1.9.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
