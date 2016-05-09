From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 20/22] ARM: dts: exynos: Move common
 Exynos5410/542x/5800 nodes to new DTSI
Date: Mon, 9 May 2016 17:53:09 -0400
Message-ID: <9e642e0d-87e1-4661-0233-acecf0082f24@osg.samsung.com>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-21-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1462734367-5619-21-git-send-email-krzk@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
> The Exynos5410/542x/5800 are very similar designs. Create new new

s/new new/a new

> DTSI with common nodes to remove DTS duplication. Although currently
> only MCT and SysRAM are shared but in future more nodes will be added to
> common file.
> 
> The patch should not have functional impact.
> 

A nice way to check this is to diff the disassembled compiled DTBs with
and without the patch and making sure that the resulted DTS is the same.

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
 
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
