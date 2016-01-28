From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v4 1/3] clk: samsung: Enable COMPILE_TEST for Samsung
 clocks
Date: Thu, 28 Jan 2016 16:12:41 -0300
Message-ID: <56AA6829.8050900@osg.samsung.com>
References: <1453941324-15742-1-git-send-email-k.kozlowski@samsung.com>
 <1453941324-15742-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1453941324-15742-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/27/2016 09:35 PM, Krzysztof Kozlowski wrote:
> Enable the COMPILE_TEST to get build coverage of some of Samsung clock
> controller drivers. Still some of them will be built only if
> appropriate SoC is chosen (like SOC_EXYNOS4415 or ARCH_S3C64XX).
>
> Anyway in case of COMPILE_TEST the Samsung clocks would show up in main
> drivers section because they are not inside the "Common Clock Framework"
> menu item. Move them under the "Common Clock Framework".
>
> This changes the logic of selecting Samsung clocks from specific
> architectures. Now the COMMON_CLK should be selected before selecting
> specific clock (like S3C2410_COMMON_CLK or COMMON_CLK_SAMSUNG).
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

I have also verified that more samsung clocks drivers are built for
allyesconfig (where COMPILE_TEST is enabled) when make M=drivers/clk

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
