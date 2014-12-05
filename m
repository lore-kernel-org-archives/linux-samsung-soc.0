From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 1/3] clk: samsung: Fix clock disable failure because
 domain being gated
Date: Fri, 05 Dec 2014 13:43:59 +0100
Message-ID: <5481A88F.9090308@samsung.com>
References: <1417777254-26579-1-git-send-email-k.kozlowski@samsung.com>
 <1417777254-26579-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17573 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbaLEMoQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Dec 2014 07:44:16 -0500
In-reply-to: <1417777254-26579-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@kernel.org>
Cc: Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Vivek Gautam <gautam.vivek@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,

On 05/12/14 12:00, Krzysztof Kozlowski wrote:
> Audio subsystem clocks are located in separate block. If clock for this
> block (from main clock domain) 'mau_epll' is gated then any read or
> write to audss registers will block.
> 
> This was observed on Exynos 5420 platforms (Arndale Octa and Peach
> Pi/Pit) after introducing runtime PM to pl330 DMA driver. After that
> commit the 'mau_epll' was gated, because the "amba" clock was disabled
> and there were no more users of mau_epll. The system hang on disabling
> unused clocks from audss block.
> 
> Unfortunately the 'mau_epll' clock is not parent of some of audss clocks.
> 
> Whenever system wants to operate on audss clocks it has to enable epll
> clock. The solution reuses common clk-gate/divider/mux code and duplicates
> clk_register_*() functions.
> 
> Additionally this patch fixes memory leak of clock gate/divider/mux
> structures. The leak exists in generic clk_register_*() functions. Patch
> replaces them with custom code with managed allocation.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reported-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Reported-by: Kevin Hilman <khilman@kernel.org>
> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Instead of this big patch perhaps for v3.19 we could just add
a clk_enable() call in exynos5420 clock controller driver, to make
sure the required clock is always enabled, as it was before you have
added runtime PM support to the PL330 DMA controller driver ?

It sounds like a workaround but wouldn't be as intrusive as this
patch.

--
Regards,
Sylwester
