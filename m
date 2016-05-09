From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 21/22] ARM: dts: exynos: Add USB to Exynos5410
Date: Mon, 9 May 2016 17:55:16 -0400
Message-ID: <419e078b-a0c5-e7a6-0bea-9961147380d5@osg.samsung.com>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-22-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462734367-5619-22-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
> Move USB 3.0 DWC and 2.0 EHCI/OHCI nodes from exynos5420.dtsi to
> exynos54xx.dtsi common for entire family. For Exynos542x/5800 this
> should not have functional impact but for Exynos5410 this effectively
> adds USB support.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
