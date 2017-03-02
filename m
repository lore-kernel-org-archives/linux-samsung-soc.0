From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 0/7] Fix the parse_dt of exynos dsi and remove the OF graph
Date: Thu, 02 Mar 2017 19:20:12 +0900
Message-ID: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170302102112epcas5p476b30508bbaffbf1fe9781b941cd418f@epcas5p4.samsung.com>
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
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

The dsi + panel is a parental relationship, so OF grpah is not needed.
Therefore, the current dsi_parse_dt function will throw an error,
because there is no linked OF graph for case such as fimd + dsi +
panel.

So the 1/5 patch parse the Pll, burst and esc clock frequency
properties in dsi_parse_dt and modified to create a bridge_node only
if there is an OF graph associated with dsi.

Also fixed the dts, which depend on the 1/5 patch. So removed the
ports node and move burst and esc clock frequency properties to the
parent (DSI node).

Changes for V3:
- Split the patches considering the bisectability problem.

Changes for V2:
- Added the clear explanation for commit. (1/5 patch)
- Fixed it to the same subject as the actual work. (2/5 ~ 5/5 patches)

Best Regards,
Hoegeun

Hoegeun Kwon (7):
  arm64: dts: exynos: Add the burst and esc clock frequency properties
    for exynos5433 dts
  arm: dts: Add the burst and esc clock frequency properties for
    exynos3250 dts
  arm: dts: Add the burst and esc clock frequency properties for
    exynos4412 dts
  arm: dts: Add the burst and esc clock frequency properties for
    exynos4210 dts
  drm/exynos: dsi: Fix the parse_dt function
  arm64: dts: exynos: Remove the OF graph from DSI node
  arm: dts: Remove the OF graph from DSI node

 arch/arm/boot/dts/exynos3250-rinato.dts            | 23 ++--------------
 arch/arm/boot/dts/exynos4210-trats.dts             | 23 ++--------------
 arch/arm/boot/dts/exynos4412-trats2.dts            | 23 ++--------------
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 16 ++---------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 32 ++++++----------------
 5 files changed, 16 insertions(+), 101 deletions(-)

-- 
1.9.1
