From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/3] irqchip/mips-gic: pr_err() strings should end with
 newlines
Date: Mon, 13 Nov 2017 14:39:44 +0000
Message-ID: <6c243286-203e-3d05-feb9-7a81a0eb624a@arm.com>
References: <cover.1510580710.git.arvind.yadav.cs@gmail.com>
 <500e0c48a5e46003d33b31a257806a4991c0ff9d.1510580710.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:47154 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752653AbdKMOjr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 09:39:47 -0500
In-Reply-To: <500e0c48a5e46003d33b31a257806a4991c0ff9d.1510580710.git.arvind.yadav.cs@gmail.com>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, tglx@linutronix.de, jason@lakedaemon.net, kgene@kernel.org, krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 13/11/17 13:53, Arvind Yadav wrote:
> pr_err() messages should end with a new-line to avoid other messages
> being concatenated.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/irqchip/irq-mips-gic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index c90976d..e87d33b 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -737,7 +737,7 @@ static int __init gic_of_init(struct device_node *node,
>  					       gic_shared_intrs, 0,
>  					       &gic_irq_domain_ops, NULL);
>  	if (!gic_irq_domain) {
> -		pr_err("Failed to add GIC IRQ domain");
> +		pr_err("Failed to add GIC IRQ domain\n");
>  		return -ENXIO;
>  	}
>  
> @@ -746,7 +746,7 @@ static int __init gic_of_init(struct device_node *node,
>  						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
>  						  node, &gic_ipi_domain_ops, NULL);
>  	if (!gic_ipi_domain) {
> -		pr_err("Failed to add GIC IPI domain");
> +		pr_err("Failed to add GIC IPI domain\n");
>  		return -ENXIO;
>  	}
>  
> 

This patch doesn't apply to the current state of the irqchip tree, nor
of tip/irq/core. Please verify that it applies and resubmit if required.

I've applied patches 2 and 3.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
