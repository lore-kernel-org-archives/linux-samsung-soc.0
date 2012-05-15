From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 10/20] of/irq: fix interrupt parent lookup procedure
Date: Tue, 15 May 2012 17:29:14 +0900
Message-ID: <07f801cd3274$cfbe4200$6f3ac600$%kim@samsung.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
 <1335813270-13083-11-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39025 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757914Ab2EOI3b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 04:29:31 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4200E5828RUME0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:29:16 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M420066Q28NF040@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 17:29:12 +0900 (KST)
In-reply-to: <1335813270-13083-11-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com

Thomas Abraham wrote:
> 
> The interrupt parent lookup fails for a node that is a interrupt-controller
> but does not have an explict interrupt-parent property and instead inherits
> this property from the root node.
> 
> Consider the nodes listed below.
> 
>     / {
>         interrupt-parent = <&intc_level1>;
> 
>         intc_level1: interrupt-controller@xxx {
>                 interrupt-controller;
>                 #interrupt-cells = <3>;
>                 <rest of the properties here>;
>         };
> 
>         intc_level2: interrupt-controller@yyy {
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>                 <rest of the properties here>;
>         };
>     };
> 
> The interrupt parent lookup for interrupt-controller@yyy fails. It inherits
> the interrupt-parent property from the root node and the root node ('/')
> specifies a 'interrupt-parent' property which represents the default interrupt
> root controller. But, the property '#interrupt-cells' might not be specified
> in the root node.
> 
> In case a interrupt controller node does not include a 'interrupt-parent'
> property but inherits that property from the root node, the check for
> 'interrupt-cells' property in the root node fails. Fix this removing the
> check for 'interrupt-cells' property.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  drivers/of/irq.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 9cf0060..a520363 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -66,14 +66,16 @@ struct device_node *of_irq_find_parent(struct device_node *child)
>  		if (parp == NULL)
>  			p = of_get_parent(child);
>  		else {
> +			of_node_put(child);
>  			if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
>  				p = of_node_get(of_irq_dflt_pic);
>  			else
>  				p = of_find_node_by_phandle(be32_to_cpup(parp));
> +			return p;
>  		}
>  		of_node_put(child);
>  		child = p;
> -	} while (p && of_get_property(p, "#interrupt-cells", NULL) == NULL);
> +	} while (p);
> 
>  	return p;
>  }
> --
> 1.7.5.4

Hi Grant and Rob,

I'm ok on this and this patch and #11 patch in this series are required for patches that add device tree based support for wakeup
interrupts on EXYNOS5250.

So could you have a look at this patch and let us know if this is okay or any rework is required.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
