From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 11/19] clk: samsung: exynos5433: Add clocks for CMU_BUS{0|1|2} domains
Date: Thu, 27 Nov 2014 12:41:51 +0100
Message-ID: <6217579.xNXtO7YiDs@wuerfel>
References: <1417073716-22997-1-git-send-email-cw00.choi@samsung.com> <1417073716-22997-12-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:59399 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753329AbaK0Lm1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Nov 2014 06:42:27 -0500
In-Reply-To: <1417073716-22997-12-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, mark.rutland@arm.com, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, geunsik.lim@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thursday 27 November 2014 16:35:08 Chanwoo Choi wrote:
> +  - "samsung,exynos5433-cmu-bus0", "samsung,exynos5433-cmu-bus1"
> +    and "samsung,exynos5433-cmu-bus2" - clock controller compatible for CMU_BUS
> +    which generates global data buses clock and global peripheral buses clock.
>  
>  - reg: physical base address of the controller and length of memory mapped
>    region.
> 

This looks like you are duplicating the bindings and the code, but
it's really the same hardware multiple times with minor variations
that you should be able to describe properly here. Why not make
three nodes with the same compatible string and have them handled
by the same code?

	Arnd
