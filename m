From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: ARCH_EXYNOS5433 missing in Kconfig
Date: Tue, 10 Mar 2015 16:32:29 +0100
Message-ID: <CAD3Xx4Jf5ACBKe-KvGRD=myHKrJ+K_P0vBrtrmfgh+1zNM4hug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Andreas Ruprecht <rupran@einserver.de>, hengelein Stefan <stefan.hengelein@fau.de>, Paul Bolle <pebolle@tiscali.nl>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

your commit 96bd6224f07b ("clk: samsung: exynos5433: Add clocks using
common clock framework") is included in today's linux-next tree (i.e.,
next-20150310).

This patch conditionally compiles clk-exynos5433.c depending on the
Kconfig option ARCH_EXYNOS5433.  However, this option is not defined
in Kconfig, so that the driver cannot be compiled at the current
state:

+obj-$(CONFIG_ARCH_EXYNOS5433)  += clk-exynos5433.o

Is there a patch queued somewhere that adds this Kconfig symbol?  I
detected the issue by running undertaker-checkpatch from the
Undertaker tool suite (undertaker.cs.fau.de).  There is also a tool in
the git tree that can detect such issues (i.e.,
scripts/checkkconfigsymbols.py).

Kind regards,
 Valentin
