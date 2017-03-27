From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4 0/5] phy/mfd/soc: exynos: Header cleanup
Date: Mon, 27 Mar 2017 15:56:26 +0530
Message-ID: <63f8c601-a428-3326-0aff-9b965e742a5d@ti.com>
References: <20170314164653.15771-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170314164653.15771-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



On Tuesday 14 March 2017 10:16 PM, Krzysztof Kozlowski wrote:
> Suggested by Marek, continuation of cleanup of PMU register defines
> in headers.
> Let's keep all of them in include/linux/soc/samsung/exynos-regs-pmu.h.
> 
> Everything is bisectable but should go in through one tree.
> It can go through phy tree - in that case 4/5 (added in v3) needs Lee's
> ack. For the rest - samsung-soc ack is given by me.
> I can also take it through samsung-soc - please let me know.
> 
> Changes since v3:
> =================
> 1. Minor adjust of commit msg in patch 2/5 (suggested by Bartlomiej).
> 2. Add Bartlomiej's reviews.
> 
> Changes since v2:
> =================
> 1. Rebase wasn't done properly (and MFD Exynos LPASS is not build by exynos
>    defconfig) so Kbuild test robot reported issue. New patch 4/5.
> 
> Changes since v1:
> =================
> 1. Rebase - dependencies should be already in.
> 2. Add Lee's acks.

merged, thanks!

-Kishon
> 
> 
> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (5):
>   phy: exynos4: Remove duplicated defines of PHY register defines
>   phy: exynos5: Remove duplicated defines of PHY register defines
>   phy: exynos-mipi-video: Use consistent method to address phy registers
>   mfd: exynos-lpass: Use common soc/exynos-regs-pmu.h header
>   phy: exynos: Use one define for enable bit
> 
>  drivers/mfd/exynos-lpass.c                  |  4 +-
>  drivers/phy/phy-exynos-dp-video.c           |  6 +--
>  drivers/phy/phy-exynos-mipi-video.c         | 71 ++++++++++++++---------------
>  drivers/phy/phy-exynos5-usbdrd.c            |  6 +--
>  include/linux/mfd/syscon/exynos4-pmu.h      | 21 ---------
>  include/linux/mfd/syscon/exynos5-pmu.h      | 52 ---------------------
>  include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++-
>  7 files changed, 58 insertions(+), 118 deletions(-)
>  delete mode 100644 include/linux/mfd/syscon/exynos4-pmu.h
>  delete mode 100644 include/linux/mfd/syscon/exynos5-pmu.h
> 
