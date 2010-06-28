From: Rabin Vincent <rabin@rab.in>
Subject: Re: [PATCH 4/8] ARM: S5PV310: Add IRQ support
Date: Mon, 28 Jun 2010 20:17:43 +0530
Message-ID: <20100628144743.GB3287@debian>
References: <1277476037-8806-1-git-send-email-kgene.kim@samsung.com>
	<1277476037-8806-5-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1277476037-8806-5-git-send-email-kgene.kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 25, 2010 at 11:27:13PM +0900, Kukjin Kim wrote:
> +static DEFINE_SPINLOCK(irq_controller_lock);

Hmm, why is this lock needed?  The uses below don't seem like they need
locking:

> +static void combiner_mask_irq(unsigned int irq)
> +{
> +	u32 mask = 1 << (irq % 32);
> +
> +	spin_lock(&irq_controller_lock);
> +	__raw_writel(mask, combiner_base(irq) + COMBINER_ENABLE_CLEAR);
> +	spin_unlock(&irq_controller_lock);
> +}
> +
> +static void combiner_unmask_irq(unsigned int irq)
> +{
> +	u32 mask = 1 << (irq % 32);
> +
> +	spin_lock(&irq_controller_lock);
> +	__raw_writel(mask, combiner_base(irq) + COMBINER_ENABLE_SET);
> +	spin_unlock(&irq_controller_lock);
> +}
> +
> +static void combiner_handle_cascade_irq(unsigned int irq, struct irq_desc *desc)
> +{
...
> +	spin_lock(&irq_controller_lock);
> +	status = __raw_readl(chip_data->base + COMBINER_INT_STATUS);
> +	spin_unlock(&irq_controller_lock);
