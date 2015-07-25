From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v6 0/3] cpufreq: Use cpufreq-dt driver for Exynos3250
Date: Sat, 25 Jul 2015 11:11:32 +0900
Message-ID: <060201d0c67f$3a0cfba0$ae26f2e0$@kernel.org>
References: <1435797761-3339-1-git-send-email-cw00.choi@samsung.com>
 <4464631.oZyVO4Z0Ov@amdc1976> <093101d0b8c3$4b5d3ec0$e217bc40$@kernel.org>
 <20150724003005.642.21781@quantum> <55B1B3B0.8090106@kernel.org>
 <55B1D9A3.8060301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <55B1D9A3.8060301@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>
Cc: 'Michael Turquette' <mturquette@baylibre.com>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, s.nawrocki@samsung.com, tomasz.figa@gmail.com, sboyd@codeaurora.org, thomas.ab@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Krzysztof Kozlowski wrote:
> 
> On 24.07.2015 12:40, Kukjin Kim wrote:
> > On 07/24/15 09:30, Michael Turquette wrote:
> >> Quoting Kukjin Kim (2015-07-07 07:43:31)
> >>> Bartlomiej Zolnierkiewicz wrote:
> >
> > [...]
> >
> >>>>> Chanwoo Choi (3):
> >>>>>   clk: samsung: exynos3250: Add cpu clock configuration data and instaniate cpu clock
> >>>>>   ARM: dts: Add CPU OPP and regulator supply property for Exynos3250
> >>>>>   ARM: exynos: Add exynos3250 compatible to use generic cpufreq driver
> >>>>>
> >>>>>  arch/arm/boot/dts/exynos3250-monk.dts   |  4 ++++
> >>>>>  arch/arm/boot/dts/exynos3250-rinato.dts |  4 ++++
> >>>>>  arch/arm/boot/dts/exynos3250.dtsi       | 15 +++++++++++++++
> >>>>>  arch/arm/mach-exynos/exynos.c           |  1 +
> >>>>>  drivers/clk/samsung/clk-exynos3250.c    | 32 ++++++++++++++++++++++++++++++--
> >>>>>  include/dt-bindings/clock/exynos3250.h  |  1 +
> >>>>>  6 files changed, 55 insertions(+), 2 deletions(-)
> >>>>
> >>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >>>>
> >>>> Thank you for working on this.
> >>>>
> >>> +1 Thanks.
> >>>
> >>> Mike and Sylwester, if you're OK on this series, I'd like to pick up in Samsung
> >>> tree together. And if you want, I could provide topic branch for clk tree.
> >>
> >> Kukjin,
> >>
> >> A topic branch would be great.
> >>
> > Sure, BTW it means you did 'ack' on this clk change? If not, please let
> > em know ;-) I'll let you know once the topic branch is ready.
> 
> Dear Kukjin,
> 
> Will you handle this patchset and dependants (ARM: dts: Add CPU cooling
> binding for Exynos3250-based Rinato/Monk board) for v4.3?
> 
You mean Chanwoo's patch. Yes, I'll. Thanks for your gentle reminder.

- Kukjin
