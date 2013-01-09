From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH 0/3] ARM:exynos5:power-domain: Save and restore CLK_TOP_SRC3
 via clock framework.
Date: Wed, 09 Jan 2013 18:24:38 +0530
Message-ID: <1357736081-19390-1-git-send-email-prasanna.ps@samsung.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, jhbird.choi@samsung.com
Cc: Prasanna Kumar <prasanna.ps@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

After Suspend-Resume operation of exynos5, CLK_TOP_SRC3 register modified
while power gating G-scaler and MFC power domains.This is seen only after
suspend and resume.

The solution to this problem is to save CLK_SRC_TOP3 register and restore
it while powergating. But CLK_SRC_TOP3 register cannot accessed directly 
by power domain code.
Please refer below URL to know the background of this issue.
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg14347.html.

This patch set adds clock framework support for save and restore
clock register (CLK_SRC_TOP3)  for G-scaler and MFC power domains.

This patch set depends on
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg14648.html

Prasanna Kumar (3):
  ARM: dts: exynos5: Add power domain clocks to pd node of Gscaler and MFC
  ARM:exynos5:dts: Bindings for clock definitions are added.
  ARM: exynos5: Add clock save and restore operation(CLK_SRC_TOP3) using clock framework.

 .../bindings/arm/exynos/power_domain.txt           |   14 ++
 arch/arm/boot/dts/exynos5250.dtsi                  |    2 +
 arch/arm/mach-exynos/pm_domains.c                  |  125 ++++++++++++++++++++
 3 files changed, 141 insertions(+), 0 deletions(-)

-- 
1.7.5.4
