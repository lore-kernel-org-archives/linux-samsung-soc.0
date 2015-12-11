From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 1/7] ARM: dts: Exynos542x/5800: add cluster regulator
 supply properties
Date: Fri, 11 Dec 2015 10:16:00 +0900
Message-ID: <566A23D0.9060402@samsung.com>
References: <1449766729-435-1-git-send-email-b.zolnierkie@samsung.com>
 <1449766729-435-2-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18470 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876AbbLKBQM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Dec 2015 20:16:12 -0500
In-reply-to: <1449766729-435-2-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mike Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Ben Gamari <ben@smart-cactus.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Anand Moon <linux.amoon@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Andreas Faerber <afaerber@suse.de>

On 11.12.2015 01:58, Bartlomiej Zolnierkiewicz wrote:
> Add cluster regulator supply properties as a preparation to
> adding generic cpufreq-dt driver support for Exynos542x and
> Exynos5800 based boards.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Andreas Faerber <afaerber@suse.de>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 8 ++++++++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts         | 8 ++++++++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          | 8 ++++++++
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 8 ++++++++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts          | 8 ++++++++
>  5 files changed, 40 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
