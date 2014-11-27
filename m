From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/19] pinctrl: exynos: Add support for Exynos5433
Date: Thu, 27 Nov 2014 12:45:45 +0100
Message-ID: <3904347.Bp2gmpYM49@wuerfel>
References: <1417073716-22997-1-git-send-email-cw00.choi@samsung.com> <1417073716-22997-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:50756 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753251AbaK0LqS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Nov 2014 06:46:18 -0500
In-Reply-To: <1417073716-22997-2-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, mark.rutland@arm.com, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, geunsik.lim@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thursday 27 November 2014 16:34:58 Chanwoo Choi wrote:
> +
> +/*
> + * Samsung pinctrl driver data for Exynos5433 SoC. Exynos5433 SoC includes
> + * four gpio/pin-mux/pinconfig controllers.
> + */
> +struct samsung_pin_ctrl exynos5433_pin_ctrl[] = {
> +       {
> +               /* pin-controller instance 0 data */
> +               .pin_banks      = exynos5433_pin_banks0,
> +               .nr_banks       = ARRAY_SIZE(exynos5433_pin_banks0),
> +               .eint_wkup_init = exynos_eint_wkup_init,
> +               .suspend        = exynos_pinctrl_suspend,
> +               .resume         = exynos_pinctrl_resume,
> +               .label          = "exynos5433-gpio-ctrl0",
> +       }, {
> 

I'm counting nine controllers, not four ;-)

These seem to all be fairly regular, my impression is that with the
move to arm64, you should come up with a new binding that can fully
describe each controller so you don't have to add new code and bindings
for each future SoC that uses the same scheme.

	Arnd
