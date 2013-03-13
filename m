From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/4] clk: samsung: always allocate the clk_table
Date: Wed, 13 Mar 2013 09:05:14 +0530
Message-ID: <CAK9yfHwQreXt+tXLz7YsNqDXwaT19U2KJvqmd-tPTx_E6nKBsQ@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de>
	<201303120044.29499.heiko@sntech.de>
	<CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
	<513F1037.3080107@samsung.com>
	<CAJuYYwRDv4ULqXQOXmTsGfqVopt6XPR+XXb-pPZ35+pC7kUN3A@mail.gmail.com>
	<513F321E.1020703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f182.google.com ([209.85.210.182]:55665 "EHLO
	mail-ia0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754993Ab3CMDfP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 23:35:15 -0400
Received: by mail-ia0-f182.google.com with SMTP id b35so561664iac.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 20:35:15 -0700 (PDT)
In-Reply-To: <513F321E.1020703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>

>
> So except Universal_c210 and Nuri the only ones not supporting booting
> from DT are these two simple boards, which seem to be maintained by
> Samsung:
>
> arch/arm/mach-exynos/mach-smdk4x12.c

SMDK4412 is already supported through DT (exynos4412-smdk4412.dts) as
you already pointed out. I am not sure if anyone is using SMDK4212.
Even if it is required, one can easily add a dts file for that board
as DT support for 4x12 already exists.

arch/arm/boot/dts/exynos4x12.dtsi
arch/arm/boot/dts/exynos4x12-pinctrl.dtsi

-- 
With warm regards,
Sachin
