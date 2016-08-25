From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 0/3] clk: samsung: exynos5420: Add clocks for CMU_CDREX
 domain
Date: Thu, 25 Aug 2016 15:57:15 +0900
Message-ID: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, chanwoo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patches add the clocks for CMU_CDREX (DRAM Express Controller)
that generates the clocks for DRAM and NoC (Network on Chip) bus clock.

[clk_summary on exynos5422-odroidxu3 board]
fout_bpll                             0            0   800000000          0 0
    mout_bpll                          0            0   800000000          0 0
       mout_mclk_cdrex                 0            0   800000000          0 0
          dout_pclk_core_mem           0            0   200000000          0 0
          dout_sclk_cdrex              0            0   800000000          0 0

Changes from v1:
- Use the BPLL for DRAM clock to generate the 800MHz
- Add patch3 to assign the clock rate for DRAM clock

Chanwoo Choi (3):
  dt-bindings: Add the clock id for CMU_CDREX (DRAM Express Controller)
  clk: samsung: exynos5420: Add clocks for CMU_CDREX domain
  ARM: dts: Set the clock rate for DREX block 800Mhz on exynos5422-odroidxu3

 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  5 +++
 drivers/clk/samsung/clk-exynos5420.c               | 37 ++++++++++++++++++++++
 include/dt-bindings/clock/exynos5420.h             | 11 ++++++-
 3 files changed, 52 insertions(+), 1 deletion(-)

-- 
1.9.1
