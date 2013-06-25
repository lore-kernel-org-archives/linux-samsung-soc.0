From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/2] Samsung Exynos5420 clock for hdmi for v3.11
Date: Tue, 25 Jun 2013 10:16:55 -0700
Message-ID: <20130625171655.GD10694@quad.lixom.net>
References: <51C87D3B.90701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:39102 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751738Ab3FYRQq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 13:16:46 -0400
Received: by mail-pa0-f53.google.com with SMTP id tj12so12954915pac.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jun 2013 10:16:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51C87D3B.90701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

On Tue, Jun 25, 2013 at 02:09:15AM +0900, Kukjin Kim wrote:
> The following changes since commit eff4e7c7f32a4e4be60b19b209ffab5cb430b385:
> 
>   ARM: EXYNOS: extend soft-reset support for EXYNOS5420 (2013-06-19
> 04:09:37 +0900)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/soc-exynos5420-3
> 
> for you to fetch changes up to 2c862cf943771b4859ecc54bc13d72b309472427:
> 
>   clk: exynos5420: assign sclk_pixel id to pixel clock divider
> (2013-06-25 01:43:42 +0900)
> 
> ----------------------------------------------------------------
> based on tags/soc-exynos5420-1
> 
> Add clock support hdmi subsystem on exynos5420
> - add new clocks, mout_hdmi and smmu_tv, associating ID to clk_hdmiphy
> - include some essential corrections

This should wait for 3.12, we're well past -rc6. Please merge through
Mike since it's 100% clock changes.


-Olof
