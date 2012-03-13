From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v4 2/2] ARM: Exynos: Add device tree support for interrupt combiner
Date: Mon, 12 Mar 2012 21:52:46 -0600
Message-ID: <20120313035246.6BC8A3E07E4@localhost>
References: <1329798806-32482-1-git-send-email-thomas.abraham@linaro.org> <1329798806-32482-3-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:41585 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759578Ab2CMDwu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 23:52:50 -0400
Received: by iagz16 with SMTP id z16so190108iag.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 20:52:50 -0700 (PDT)
In-Reply-To: <1329798806-32482-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: rob.herring@calxeda.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On Tue, 21 Feb 2012 10:03:26 +0530, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> Add device tree based instantiation of the interrupt combiner controller.
> 
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> @@ -406,13 +432,33 @@ void __init combiner_init(void __iomem *combiner_base, struct device_node *np)
>  
>  	for (i = 0; i < MAX_COMBINER_NR; i++) {
>  		combiner_init_one(i, combiner_base + (i >> 2) * 0x10);
> -		combiner_cascade_irq(i, IRQ_SPI(i));
> +#ifdef CONFIG_OF
> +		irq = np ? irq_of_parse_and_map(np, i) : IRQ_SPI(i);
> +#else
> +		irq = IRQ_SPI(i);
> +#endif

Hmmm, the #ifdef is rather ugly.  I'd rather have an empty
irq_of_parse_and_map() that always returns 0.

The patch series is fine, and you can add my acked-by, but please send
a follow-up patch to clean it up.

Acked-by: Grant Likely <grant.likely@secretlab.ca>
