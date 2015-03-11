From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: ARCH_EXYNOS5433 missing in Kconfig
Date: Wed, 11 Mar 2015 10:10:05 +0900
Message-ID: <54FF95ED.1040003@samsung.com>
References: <CAD3Xx4Jf5ACBKe-KvGRD=myHKrJ+K_P0vBrtrmfgh+1zNM4hug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8908 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbbCKBKI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Mar 2015 21:10:08 -0400
In-reply-to: <CAD3Xx4Jf5ACBKe-KvGRD=myHKrJ+K_P0vBrtrmfgh+1zNM4hug@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Inki Dae <inki.dae@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Andreas Ruprecht <rupran@einserver.de>, hengelein Stefan <stefan.hengelein@fau.de>, Paul Bolle <pebolle@tiscali.nl>, Arnd Bergmann <arnd@arndb.de>=?UTF-8?B?Iuq5gOq1reynhEBrZXJuZWwub3JnIg==?= <kgene@kernel.org>

Hi Valentin,

I sent the Exynos5433 clock patch and then separately I'm sending the
Exynos5433 devicetree patch-set[1].
[1] [PATCH v6 0/9] arm64: Add the support for new Exynos5433 SoC
- https://lkml.org/lkml/2015/3/9/1036

But, according to Arnd bergmann's comment[2], latest Exynos5433 dt patch-set[1]
removed the CONFIG_ARCH_EXYNOS5433.
[2] https://lkml.org/lkml/2015/2/24/85


So, I have plan to send following patch.

---
    clk: samsung: Use CONFIG_ARCH_EXYNOS instead of Exynos-specific configuration

    This patch removes the CONFIG_ARCH_EXYNOS{5433|7} and then use only the
    CONFIG_ARCH_EXYNOS for ARM-64bit Exynos SoC.

    Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
    Cc: Tomasz Figa <tomasz.figa@gmail.com>
    Cc: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 17e9af7..561719d 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -10,11 +10,11 @@ obj-$(CONFIG_SOC_EXYNOS5250)        += clk-exynos5250.o
 obj-$(CONFIG_SOC_EXYNOS5260)   += clk-exynos5260.o
 obj-$(CONFIG_SOC_EXYNOS5410)   += clk-exynos5410.o
 obj-$(CONFIG_SOC_EXYNOS5420)   += clk-exynos5420.o
-obj-$(CONFIG_ARCH_EXYNOS5433)  += clk-exynos5433.o
+obj-$(CONFIG_ARCH_EXYNOS)      += clk-exynos5433.o
 obj-$(CONFIG_SOC_EXYNOS5440)   += clk-exynos5440.o
 obj-$(CONFIG_ARCH_EXYNOS)      += clk-exynos-audss.o
 obj-$(CONFIG_ARCH_EXYNOS)      += clk-exynos-clkout.o


Regards,
Chanwoo Choi


On 03/11/2015 12:32 AM, Valentin Rothberg wrote:
> Hi Chanwoo,
> 
> your commit 96bd6224f07b ("clk: samsung: exynos5433: Add clocks using
> common clock framework") is included in today's linux-next tree (i.e.,
> next-20150310).
> 
> This patch conditionally compiles clk-exynos5433.c depending on the
> Kconfig option ARCH_EXYNOS5433.  However, this option is not defined
> in Kconfig, so that the driver cannot be compiled at the current
> state:
> 
> +obj-$(CONFIG_ARCH_EXYNOS5433)  += clk-exynos5433.o
> 
> Is there a patch queued somewhere that adds this Kconfig symbol?  I
> detected the issue by running undertaker-checkpatch from the
> Undertaker tool suite (undertaker.cs.fau.de).  There is also a tool in
> the git tree that can detect such issues (i.e.,
> scripts/checkkconfigsymbols.py).
> 
> Kind regards,
>  Valentin
> 
