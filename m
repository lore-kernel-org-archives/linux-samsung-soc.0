From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5 2/3] clk: samsung: Don't build ARMv8 clock drivers on
 ARMv7
Date: Wed, 17 Feb 2016 11:03:36 +0100
Message-ID: <56C44578.5010009@samsung.com>
References: <1455603632-11158-1-git-send-email-k.kozlowski@samsung.com>
 <1455603632-11158-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1455603632-11158-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 16/02/16 07:20, Krzysztof Kozlowski wrote:
> Currently the Exynos5433 (ARMv8 SoC) clock driver depends on ARCH_EXYNOS
> so it is built also on ARMv7. This does not bring any kind of benefit.
> There won't be a single kernel image for ARMv7 and ARMv8 SoCs (like
> multi_v7 for ARMv7).
> 
> Instead build clock drivers only for respective SoC's architecture.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

