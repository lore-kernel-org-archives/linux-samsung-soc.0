From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL v2 1/5] Samsung clk driver updates for v4.3
Date: Thu, 20 Aug 2015 18:35:53 -0700
Message-ID: <20150821013553.GD4865@localhost>
References: <55CCE517.2070003@kernel.org>
 <55CCE685.40501@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:33083 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752793AbbHUCHo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 22:07:44 -0400
Received: by pabyb7 with SMTP id yb7so474945pab.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2015 19:07:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55CCE685.40501@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Aug 14, 2015 at 03:48:37AM +0900, Kukjin Kim wrote:
> The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> 
>   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-clk-driver
> 
> for you to fetch changes up to cd6aceef028afc3fa216e3e7bc94cc31632cad43:
> 
>   clk: exynos4x12: add cpu clock configuration data and instantiate cpu
> clock (2015-08-14 02:00:43 +0900)
> 
> ----------------------------------------------------------------
> Samsung clk driver updates for v4.3
> 
> - add cpu clock configuration data and instantiate cpu clock
>   for exynos3250, 4210, 4412 and 5250 SoCs to support Samsung
>   specific cpu-clock type
> 
> * Note this branch has been provided to clk tree as a topic branch

Merged into next/late.


-Olof
