From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 17/22] ARM: dts: exynos: Include common exynos5 in
 exynos5410.dtsi
Date: Mon, 9 May 2016 17:39:51 -0400
Message-ID: <89bcdacc-e404-ad55-c087-92ba87901ee4@osg.samsung.com>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-18-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:36244 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751784AbcEIVkC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 May 2016 17:40:02 -0400
In-Reply-To: <1462734367-5619-18-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org

Hello Krzysztof,

On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
> The exynos5.dtsi is used for common nodes shared between Exynos5250 and
> Exynos542x. Since Exynos5410 is very similar to Exynos5420 it can
> include the common file as well to remove duplication and make
> everything more consistent.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
