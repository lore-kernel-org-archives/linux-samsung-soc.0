From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip: gic: Fix core ID calculation when topology is
 read from DT
Date: Fri, 18 Jul 2014 09:17:04 -0400
Message-ID: <20140718131704.GG24496@titan.lakedaemon.net>
References: <1405610624-18722-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1405610624-18722-1-git-send-email-t.figa@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jul 17, 2014 at 05:23:44PM +0200, Tomasz Figa wrote:
> Certain GIC implementation, namely those found on earlier, single
> cluster, Exynos SoCs, have registers mapped without per-CPU banking,
> which means that the driver needs to use different offset for each CPU.
> 
> Currently the driver calculates the offset by multiplying value returned
> by cpu_logical_map() by CPU offset parsed from DT. This is correct when
> CPU topology is not specified in DT and aforementioned function returns
> core ID alone. However when DT contains CPU topology, the function
> changes to return cluster ID as well, which is non-zero on mentioned
> SoCs and so breaks the calculation in GIC driver.
> 
> This patch fixes this by masking out cluster ID in CPU offset
> calculation so that only core ID is considered. Multi-cluster Exynos
> SoCs already have banked GIC implementations, so this simple fix should
> be enough.
> 
> Reported-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Reported-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/irqchip/irq-gic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> index ddee133..5c15a09 100644
> --- a/drivers/irqchip/irq-gic.c
> +++ b/drivers/irqchip/irq-gic.c
> @@ -40,6 +40,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqchip/arm-gic.h>

Applied to irqchip/urgent and Cc'd to stable for v3.3+

thx,

Jason.
