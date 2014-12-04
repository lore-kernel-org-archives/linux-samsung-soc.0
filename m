From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 0/3] Fix Arndale Octa/Peach Pi boot on Audio subsystem
 clocks
Date: Thu, 04 Dec 2014 11:52:43 +0100
Message-ID: <1417690363.3314.7.camel@AMDC1943>
References: <1417690075-13483-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64458 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753176AbaLDKwq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Dec 2014 05:52:46 -0500
In-reply-to: <1417690075-13483-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Vivek Gautam <gautam.vivek@samsung.com>, Kevin Hilman <khilman@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On czw, 2014-12-04 at 11:47 +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> 
> Changes since v2
> ================
> 1. Patch 1 applied ("clk: samsung: Fix double add of syscore ops after
>    driver rebind"), remove it.
> 2. Squash patch 5 with "clk: samsung: Fix clock disable
>    failure because domain being gated". Suggested by Sylwester.
> 3. Patch 1/3: Fix issues pointed by Sylwester.
> 4. Patch 2/3: Fix redundant clk_disable when removing driver (clk is
>    already disabled). Add missing check !=null when removing driver.
> 5. Patch 3/3: Extend commit message.


Aaa, I forgot to add tested-by Javier Martinez Canillas
<javier.martinez@collabora.co.uk>
https://lkml.org/lkml/2014/11/26/420

These are minor changes so I think the "tested-by" still applies.
If patches are OK and someone applies the, please don't forget about
that tag.

Best regards,
Krzysztof

> 
> Changes since v1
> ================
> 1. clocks-audss: Reimplement own clock register functions instead
>    changing clk API. Minor fixes. (after idea from Tomasz Figa)
> 2. Add new patches: fix for pinctrl and minor fixes in clk-audss.
> 
> Description
> ===========
> This patchset tries to solve dependency between AudioSS components
> (clocks and GPIO) and main clock controller on Exynos 5420 platform.
> 
> This solves boot failure of Peach Pi/Pit and Arndale Octa [1].
> 
> Any access to memory of audss block (like checking if clock is enabled
> or configuring GPIO) will hang if main audss clock is gated.
> 
> Tested on Arndale Octa board.
> 
> [1] http://www.spinics.net/lists/linux-samsung-soc/msg39331.html
> 
> Best regards,
> Krzysztof Kozlowski
> 
> 
> Krzysztof Kozlowski (3):
>   clk: samsung: Fix clock disable failure because domain being gated
>   pinctrl: exynos: Fix GPIO setup failure because domain clock being
>     gated
>   ARM: dts: exynos5420: Add clock for audss pinctrl (fixing GPIO setup
>     failure)
> 
>  .../bindings/pinctrl/samsung-pinctrl.txt           |   6 +
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |   3 +
>  drivers/clk/samsung/clk-exynos-audss.c             | 357 ++++++++++++++++++---
>  drivers/pinctrl/samsung/pinctrl-samsung.c          | 111 ++++++-
>  drivers/pinctrl/samsung/pinctrl-samsung.h          |   2 +
>  5 files changed, 436 insertions(+), 43 deletions(-)
> 
