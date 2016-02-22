From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v5 2/3] clk: samsung: Don't build ARMv8 clock drivers on ARMv7
Date: Mon, 22 Feb 2016 10:26:56 -0800
Message-ID: <20160222182656.2278.68402@quark.deferred.io>
References: <1455603632-11158-1-git-send-email-k.kozlowski@samsung.com>
 <1455603632-11158-3-git-send-email-k.kozlowski@samsung.com>
 <56C44578.5010009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <56C44578.5010009@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-clk@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2016-02-17 02:03:36)
> On 16/02/16 07:20, Krzysztof Kozlowski wrote:
> > Currently the Exynos5433 (ARMv8 SoC) clock driver depends on ARCH_EXYNOS
> > so it is built also on ARMv7. This does not bring any kind of benefit.
> > There won't be a single kernel image for ARMv7 and ARMv8 SoCs (like
> > multi_v7 for ARMv7).
> > 
> > Instead build clock drivers only for respective SoC's architecture.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 

Thanks for the Ack.

I've rebased patches #1 and #2 against James's b9e65ebc654d and pushed
the clk-samsung branch to the clk tree. I have deleted the
clk-samsung-kconfig branch that was blowing up the kbuild robot.
clk-samsung will not be rebased and can be used as a dependency for
arm-soc. It has been merged into clk-next.

Regards,
Mike
