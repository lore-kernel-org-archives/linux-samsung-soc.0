From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 5/5] arm: exynos: Add MCPM call-back functions
Date: Tue, 27 May 2014 13:07:56 +0200
Message-ID: <201405271307.56729.arnd@arndb.de>
References: <1399307221-8659-1-git-send-email-a.kesavan@samsung.com> <1399307221-8659-6-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:49199 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751612AbaE0LI4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 07:08:56 -0400
In-Reply-To: <1399307221-8659-6-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: nicolas.pitre@linaro.org, Dave.Martin@arm.com, lorenzo.pieralisi@arm.com, daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, abrestic@chromium.org, thomas.ab@samsung.com, inderpal.s@samsung.com, mark.rutland@arm.com, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, will.deacon@arm.com, kesavan.abhilash@gmail.com, linux-samsung-soc@vger.kernel.org

On Monday 05 May 2014, Abhilash Kesavan wrote:
> +static const struct mcpm_platform_ops exynos_power_ops = {
> +       .power_up               = exynos_power_up,
> +       .power_down             = exynos_power_down,
> +       .power_down_finish      = exynos_power_down_finish,
> +};


I'm getting a build error in linux-next because there is no .power_down_finish
member in mcpm_platform_ops here.

	Arnd
