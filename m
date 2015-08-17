From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/4] clk: samsung: exynos3250: Add MMC2 clock
Date: Mon, 17 Aug 2015 10:48:05 +0900
Message-ID: <55D13D55.5030207@samsung.com>
References: <1439264784-30322-1-git-send-email-cw00.choi@samsung.com>
 <1439264784-30322-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24882 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753196AbbHQBsQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Aug 2015 21:48:16 -0400
In-reply-to: <1439264784-30322-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 11.08.2015 12:46, Chanwoo Choi wrote:
> This patch add the MMC2 clocks (mux, divider, gate) of Exynos3250 SoC.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos3250.c   | 9 +++++++++
>  include/dt-bindings/clock/exynos3250.h | 7 ++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)



Assuming that numbers/addresses are good (reserved in my datasheet) the
code itself looks good:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


Best regards,
Krzysztof
