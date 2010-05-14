From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 2/2] ARM: S5PV210: Add Ext interrupt support
Date: Fri, 14 May 2010 09:17:23 +0100
Message-ID: <20100514081723.GC26822@n2100.arm.linux.org.uk>
References: <1273749209-32461-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:48788 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758072Ab0ENIRj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 04:17:39 -0400
Content-Disposition: inline
In-Reply-To: <1273749209-32461-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Pannaga Bhushan <p.bhushan@samsung.com>, Jongpill Lee <boyko.lee@samsung.com>, ben-linux@fluff.org

On Thu, May 13, 2010 at 08:13:29PM +0900, Kukjin Kim wrote:
> +static int s5p_irq_eint_set_type(unsigned int irq, unsigned int type)
> +{
> +	default:
> +		printk(KERN_ERR "No such irq type %d", type);
> +		return -1;

Is this really "Operation not permitted" aka -EPERM ?  Please change it
to a proper error code rather than being lazy.
