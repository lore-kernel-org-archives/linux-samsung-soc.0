From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 05/19] clk: samsung: exynos5433: Add clocks for CMU_G2D
 domain
Date: Mon, 08 Dec 2014 17:06:11 +0530
Message-ID: <54858D2B.3040809@samsung.com>
References: <1417510196-6714-1-git-send-email-cw00.choi@samsung.com>
 <1417510196-6714-6-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:16441 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755256AbaLHLgE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Dec 2014 06:36:04 -0500
In-reply-to: <1417510196-6714-6-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, geunsik.lim@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Chanwoo,

On Tuesday 02 December 2014 02:19 PM, Chanwoo Choi wrote:
> This patch adds ths mux/divider/gate clocksof CMU_G2D domain which includes

nit: %s/clocksof/clocks of

> G2D/MDMA IPs. The CMU_G2D must need the clocks related to G2D by providing
> CMU_TOP domain. So, this patch add several clocks for G2D from CMU_TOP domain.
>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Geunsik Lim <geunsik.lim@samsung.com>
> ---
>   .../devicetree/bindings/clock/exynos5433-clock.txt |   8 ++
>   drivers/clk/samsung/clk-exynos5433.c               | 144 +++++++++++++++++++++
>   include/dt-bindings/clock/exynos5433.h             |  42 +++++-
>   3 files changed, 193 insertions(+), 1 deletion(-)
>

Verified all changes in clock file against UM I have with me, all 
changes are OK.

With small nit in commit message feel free to add:

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks,
Pankaj Dubey
