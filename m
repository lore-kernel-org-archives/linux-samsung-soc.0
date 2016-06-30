From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v3 0/2] mark spi clocks as critical and enable spi3 clocks
Date: Thu, 30 Jun 2016 16:15:09 +0900
Message-ID: <1467270911-10971-1-git-send-email-andi.shyti@samsung.com>
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
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi@etezian.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, Andi Shyti <andi.shyti@samsung.com>, linux-kernel@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset enables spi3 clocks by marking critical clocks as
CLK_IS_CRITICAL and in the meantime replaces the use of
CLK_IGNORE_UNUSED for spi1 clocks.

The sclk needs to be considered critical as well.

The SPI3 in the tm2/tm2e boards will control an irled for remote
controlling.

Changelog:

V1 -> V2
 - the "sclk_spi3" doesn't need to be enabled in boot time as it
  is handled by the spi driver itself.

 - use the CLK_IS_CRITICAL flag for the ioclk

V2 -> V3
 - some more tests has confirmed taht "sclk_spi1,3" need to be
   enabled as critical!

 - added Chanwoo's review in the second commit.

Thanks,
Andi

Andi Shyti (2):
  clk: exynos5433: do not use CLK_IGNORE_UNUSED for SPI clocks
  clk: exynos5433: enable sclk_ioclk for SPI3

 drivers/clk/samsung/clk-exynos5433.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.8.1
