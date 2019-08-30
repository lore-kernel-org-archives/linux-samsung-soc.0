From: Guillaume Gardet <guillaume.gardet@arm.com>
Subject: [PATCH V3 0/4] Add GPU/Mali T604 node to arndale and snow (exynos5250)
Date: Fri, 30 Aug 2019 12:44:57 +0200
Message-ID: <20190830104502.7128-1-guillaume.gardet@arm.com>
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190725083433.6505-1-guillaume.gardet@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Guillaume Gardet <guillaume.gardet@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add nodes for GPU (Mali T604) to Exynos5250.
Tested with kmscube and some glmark2* tests on Chromebook snow and
arndale board.

V3 changes:
  * change clock name from 'g3d' to 'core'
  * disable node by default in exynos5250.dtsi
  * move dt-bindings before node addition in device tree
  * enable node for arndale and snow, with mali-supply, separetly
  * add patch to fix min/max values for buck4 regulator for gpu
    on arndale board

V2 changes: 
  * move mali node as /soc sub-node
  * move gpu_opp_table as mali sub-node
  * minor style updates
  * test on arndale board
  * enable by default
  * add dt bindings, in a separate patch


Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org

Guillaume Gardet (5):
  dt-bindings: gpu: mali-midgard: Add samsung exynos5250 compatible
  arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
  arm: dts: exynos: snow: Enable GPU/Mali T604 node
  arm: dts: exynos: arndale: Enable GPU/Mali T604 node
  arm: dts: exynos: arndale: Fix min/max for buck4 regulator for gpu

 .../bindings/gpu/arm,mali-midgard.txt         |  1 +
 arch/arm/boot/dts/exynos5250-arndale.dts      |  9 +++-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |  5 ++
 arch/arm/boot/dts/exynos5250.dtsi             | 47 +++++++++++++++++++
 4 files changed, 60 insertions(+), 2 deletions(-)

-- 
2.22.1
