From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/5] Power Related Fixes for Exynos5250
Date: Wed, 11 Dec 2013 13:41:48 +0100
Message-ID: <1474895.cu1U1Gy5We@amdc1227>
References: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: yadi.brar@samsung.com, kgene.kim@samsung.com, mturquette@linaro.org, devicetree-discuss@lists.ozlabs.org, jonghwa3.lee@samsung.com, dianders@chromium.org, linux-samsung-soc@vger.kernel.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Abhilash,

On Wednesday 11 of December 2013 17:27:04 Abhilash Kesavan wrote:
> Patch 1 prevents the gating of sysreg clock on Exynos5250.
> Patch 2 is a re-send of an earlier patch.
> (http://www.spinics.net/lists/linux-samsung-soc/msg15485.html)
> Patches 3 and 4 are fixes for MAX77686 on Exynos5250 based Snow
> board (boot-up issues).
> Patch 5 implements a power-off call-back for Exynos5250 that can
> be re-used for Exynos5420.
> 
> The patches have been tested on an SMDK5250 based Chromebook.
> 
> Abhilash Kesavan (4):
>   clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag for the sysreg
>     clock
>   ARM: EXYNOS5: Fix PMU register configuration for local power blocks
>   clk: max77686: Replace is_enabled() with is_prepared call-back
>   ARM: dts: Setup the interrupt parent for max77686
> 
> Olof Johansson (1):
>   ARM: EXYNOS5250: Implement pm_power_off
> 
>  arch/arm/boot/dts/cros5250-common.dtsi       |   11 ++++
>  arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
>  arch/arm/mach-exynos/pmu.c                   |   86 ++++++++++++++++++++------
>  drivers/clk/clk-max77686.c                   |    4 +-
>  drivers/clk/samsung/clk-exynos5250.c         |    3 +-
>  5 files changed, 86 insertions(+), 21 deletions(-)

You used the old and now invalid address of DT mailing list.

Anyway, there is no need to send patches for .dts* files to DT mailing
list anymore. Just changes in drivers that affect how they handle data
from DT and binding documentation (Documentation/devicetree/.*). So
please drop the DT mailing list in next iteration of the series.

Best regards,
Tomasz
