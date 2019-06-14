From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 08/13] drivers: memory: add DMC driver for Exynos5422
Date: Fri, 14 Jun 2019 14:09:47 +0200
Message-ID: <CAJKOXPf=N28g850Q67z2sA5-KtkmqTuYLDcR0E_q1gSa17wWWw@mail.gmail.com>
References: <CGME20190614095327eucas1p19b6e522efa15c8fd21c51f3900e376e9@eucas1p1.samsung.com>
 <20190614095309.24100-1-l.luba@partner.samsung.com> <20190614095309.24100-9-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614095309.24100-9-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 14 Jun 2019 at 11:53, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> This patch adds driver for Exynos5422 Dynamic Memory Controller.
> The driver provides support for dynamic frequency and voltage scaling for
> DMC and DRAM. It supports changing timings of DRAM running with different
> frequency. There is also an algorithm to calculate timigns based on
> memory description provided in DT.
> The patch also contains needed MAINTAINERS file update.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  MAINTAINERS                             |    8 +
>  drivers/memory/samsung/Kconfig          |   17 +
>  drivers/memory/samsung/Makefile         |    1 +
>  drivers/memory/samsung/exynos5422-dmc.c | 1262 +++++++++++++++++++++++
>  4 files changed, 1288 insertions(+)
>  create mode 100644 drivers/memory/samsung/exynos5422-dmc.c

Looks good to me. I think there is no dedicated maintainer for
drivers/memory subsystem so I can take it through samsung-soc tree
(just like in case of drivers/memory/samsung/exynos-srom.c). Are
everyone OK with it?

Best regards,
Krzysztof
