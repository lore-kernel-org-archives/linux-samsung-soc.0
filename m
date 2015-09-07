From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: add suspend opp to exynos4412
Date: Mon, 7 Sep 2015 11:29:03 +0530
Message-ID: <20150907055903.GD26760@linux>
References: <1441303892-32004-1-git-send-email-b.zolnierkie@samsung.com>
 <1441303892-32004-4-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:33167 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753957AbbIGF7L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Sep 2015 01:59:11 -0400
Received: by pacex6 with SMTP id ex6so86510114pac.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Sep 2015 22:59:10 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1441303892-32004-4-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Tomasz Figa <tomasz.figa@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Anand Moon <linux.amoon@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 03-09-15, 20:11, Bartlomiej Zolnierkiewicz wrote:
> Mark 800MHz OPP as a suspend opp for Exynos4412 based
> boards so effectively cpufreq-dt driver behavior w.r.t.
> suspend frequency matches what the old exynos-cpufreq
> driver has been doing.
> 
> This patch fixes suspend/resume support on Exynos4412 based
> Trats2 board and reboot hang on Exynos4412 based Odroid U3
> board.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index ca0e3c1..294cfe4 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -98,6 +98,7 @@
>  			opp-hz = /bits/ 64 <800000000>;
>  			opp-microvolt = <1000000>;
>  			clock-latency-ns = <200000>;
> +			opp-suspend;
>  		};
>  		opp07 {
>  			opp-hz = /bits/ 64 <900000000>;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
