From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v10 09/13] drivers: devfreq: events: add Exynos PPMU new events
Date: Sat, 22 Jun 2019 22:10:08 +0900
Message-ID: <CAGTfZH35X0zE2LhGWJJp2xZNNk1ew7zNMoMqL+eZ5rcBFcPvew@mail.gmail.com>
References: <CGME20190614095328eucas1p24009b3a07322fd12e49eabb7a08baf50@eucas1p2.samsung.com>
 <20190614095309.24100-1-l.luba@partner.samsung.com> <20190614095309.24100-10-l.luba@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614095309.24100-10-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, keescook@chromium.org, Tony Lindgren <tony@atomide.com>, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, Greg KH <gregkh@linuxfou>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

2019=EB=85=84 6=EC=9B=94 14=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 6:54, L=
ukasz Luba <l.luba@partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> Define new performance events supported by Exynos5422 SoC counters.
> The counters are built-in in Dynamic Memory Controller and provide
> information regarding memory utilization.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/devfreq/event/exynos-ppmu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/=
exynos-ppmu.c
> index c2ea94957501..ce658c262c27 100644
> --- a/drivers/devfreq/event/exynos-ppmu.c
> +++ b/drivers/devfreq/event/exynos-ppmu.c
> @@ -89,6 +89,12 @@ static struct __exynos_ppmu_events {
>         PPMU_EVENT(d1-cpu),
>         PPMU_EVENT(d1-general),
>         PPMU_EVENT(d1-rt),
> +
> +       /* For Exynos5422 SoC */
> +       PPMU_EVENT(dmc0_0),
> +       PPMU_EVENT(dmc0_1),
> +       PPMU_EVENT(dmc1_0),
> +       PPMU_EVENT(dmc1_1),
>  };
>
>  static int exynos_ppmu_find_ppmu_id(struct devfreq_event_dev *edev)
> --
> 2.17.1
>

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

--=20
Best Regards,
Chanwoo Choi
