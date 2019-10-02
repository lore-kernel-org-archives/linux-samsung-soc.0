From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: exynos: Add support ARM architected
 timers on Exynos5
Date: Wed, 2 Oct 2019 17:43:53 +0200
Message-ID: <20191002154353.GA3469@kozik-lap>
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
 <CGME20190828121012eucas1p10bac7ebb742d968bca251f21dd3aad11@eucas1p1.samsung.com>
 <20190828121005.29368-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190828121005.29368-2-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 28, 2019 at 02:10:04PM +0200, Marek Szyprowski wrote:
> All CortexA7/A15 based Exynos5 SoCs have ARM architected timers, so enable
> support for them directly in the base dtsi. None of the known firmware
> properly configures CNTFRQ arch timer register, so force clock frequency
> to 24MHz, which is the only configuration supported by the remaining
> clock drivers so far.
> 
> Stock firmware for Peach Pit and Pi Chromebooks also doesn't reset
> properly other arch timer registers, so add respective properties
> indicating that. Other Exynos5-based boards behaves correctly in this area,
> what finally allows to enable support for KVM-based virtualization.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 ++++
>  arch/arm/boot/dts/exynos54xx.dtsi          | 9 +++++++++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 ++++

Thanks, applied.

Best regards,
Krzysztof
