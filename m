From: Julia Lawall <julia.lawall@lip6.fr>
Subject: question about arch/arm/mach-s3c24xx/irq.c
Date: Sun, 24 Feb 2013 12:45:11 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1302241241440.1943@hadrien>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The function s3c24xx_irq_map in arch/arm/mach-s3c24xx/irq.c contains the
code:

                parent_irq_data = &parent_intc->irqs[irq_data->parent_irq];
		if (!irq_data) {
                        pr_err("irq-s3c24xx: no irq data found for hwirq %lu\n",
                               hw);
                        goto err;
		}

At this point irq_data has already been tested, so the null test on
irq_data does not look correct.  But I wonder if parent_irq_data could
ever be null here?

julia
