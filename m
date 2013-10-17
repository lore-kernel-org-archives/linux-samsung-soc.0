From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2] irqchip: exynos-combiner: remove hard-coded irq_base value
Date: Thu, 17 Oct 2013 10:53:02 -0700 (PDT)
Message-ID: <1949846.N3fAUHQ1Nx@flatron>
References: <1379937815-21746-1-git-send-email-chander.kashyap@linaro.org> <02c701ceba75$f95b1900$ec114b00$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:40250 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757608Ab3JQRxF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 13:53:05 -0400
In-Reply-To: <02c701ceba75$f95b1900$ec114b00$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, 'Chander Kashyap' <chander.kashyap@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, tglx@linutronix.de, thomas.abraham@linaro.org, t.figa@samsung.com

Hi Kukjin,

On Thursday 26 of September 2013 14:05:09 Kukjin Kim wrote:
> Chander Kashyap wrote:
> > Replace irq_domain_add_simple with "irq_domain_add_linear" in order to
> > use linear irq domain, and to remove hardcoded irq_base_value.
> > 
> > Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> > ---
> > 
> > Changes since v1:
> > 	- Replaced irq_domain_add_simple with irq_domain_add_linear,
> > 	
> > 	  as suggested by Tomasz
> >  
> >  drivers/irqchip/exynos-combiner.c |   15 +++------------
> >  1 file changed, 3 insertions(+), 12 deletions(-)
[snip]
> 
> Looks nice to me, applied with Tomasz's review.

I don't see this patch in your tree. Did you apply it in the end?

Best regards,
Tomasz
