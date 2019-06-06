From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 08/13] drivers: memory: add DMC driver for Exynos5422
Date: Thu, 6 Jun 2019 13:45:15 +0200
Message-ID: <CAJKOXPfiFCp52rYtOBk5mfHfLLA=VtBpakAdUB__UcVCqbma-g@mail.gmail.com>
References: <CGME20190605165435eucas1p2fa32f4583f396fdce443b6943ac180d3@eucas1p2.samsung.com>
 <20190605165410.14606-1-l.luba@partner.samsung.com> <20190605165410.14606-9-l.luba@partner.samsung.com>
 <CAJKOXPfKbWpx9AapOudDyEZjDpgtMX-aHPQHRivuVNKaap8EQg@mail.gmail.com> <d5758d38-c0e5-1732-1407-91d602ae5500@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d5758d38-c0e5-1732-1407-91d602ae5500@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 6 Jun 2019 at 12:38, Lukasz Luba <l.luba@partner.samsung.com> wrote:
> Hi Krzysztof,
> >> +/**
> >> + * exynos5_dmc_init_clks() - Initialize clocks needed for DMC operation.
> >> + * @dmc:       DMC structure containing needed fields
> >> + *
> >> + * Get the needed clocks defined in DT device, enable and set the right parents.
> >> + * Read current frequency and initialize the initial rate for governor.
> >> + */
> >> +static int exynos5_dmc_init_clks(struct exynos5_dmc *dmc)
> >> +{
> >> +       int ret;
> >> +       unsigned long target_volt = 0;
> >> +       unsigned long target_rate = 0;
> >> +
> >> +       dmc->fout_spll = devm_clk_get(dmc->dev, "fout_spll");
> >> +       if (IS_ERR(dmc->fout_spll))
> >> +               return PTR_ERR(dmc->fout_spll);
> >> +
> >> +       dmc->fout_bpll = devm_clk_get(dmc->dev, "fout_bpll");
> >> +       if (IS_ERR(dmc->fout_bpll))
> >> +               return PTR_ERR(dmc->fout_bpll);
> >> +
> >> +       dmc->mout_mclk_cdrex = devm_clk_get(dmc->dev, "mout_mclk_cdrex");
> >> +       if (IS_ERR(dmc->mout_mclk_cdrex))
> >> +               return PTR_ERR(dmc->mout_mclk_cdrex);
> >
> > You are not enabling this clock. It is divider so it is fine for him
> > but what about its parents? How can you guarantee that parents are
> > enabled?
> It uses two parents in this configuration:
> 1. 'mout_bpll' which is set by the bootloader and is a default mode
> 2. 'mout_mx_mspll_ccore' which is used temporary as a 'bypass clock
> source' only for the time when BPLL is changing it's settings
>
> Do you suggest to put a call:
>
> to make sure the parent is up and running?
> OR just move the lines from the end of this function:
>         clk_prepare_enable(dmc->fout_bpll);
>         clk_prepare_enable(dmc->mout_bpll);
> and add:
>         ret = clk_set_parent(dmc->mout_mclk_cdrex, dmc->mout_bpll);
> then call the clk_get_rate on 'mout_mclk_cdrex'
>

Ah, It's my mistake. I missed that later you enable its new parent. It's fine.

Best regards,
Krzysztof
