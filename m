From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC PATCH 12/15] irqchip/s3c24xx: fixup IO accessors for big
 endian
Date: Fri, 17 Jun 2016 10:56:52 +0200
Message-ID: <5763BB54.5040202@samsung.com>
References: <20160608183110.13851-1-matthew@mattleach.net>
 <20160608183110.13851-13-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37006 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754025AbcFQI5D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 04:57:03 -0400
In-reply-to: <20160608183110.13851-13-matthew@mattleach.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Matthew Leach <matthew@mattleach.net>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>

On 06/08/2016 08:31 PM, Matthew Leach wrote:
> From: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> Instead of using the __raw accesors, use the _relaxed versions
> to deal with any issues due to endian-ness of the CPU.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> ---
> CC: Thomas Gleixner <tglx@linutronix.de> (maintainer:IRQCHIP DRIVERS)
> CC: Jason Cooper <jason@lakedaemon.net> (maintainer:IRQCHIP DRIVERS)
> CC: Marc Zyngier <marc.zyngier@arm.com> (maintainer:IRQCHIP DRIVERS)
> CC: linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS)
> CC: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/irqchip/irq-s3c24xx.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
