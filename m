Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E74C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Oct 2021 08:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38D0E6103E
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Oct 2021 08:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhJ3I5A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Oct 2021 04:57:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:50914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230427AbhJ3I47 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Oct 2021 04:56:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 866C361038;
        Sat, 30 Oct 2021 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635584070;
        bh=c52Wntt5s9OoFBF1jdvF7shL8eVEBkvJVgyOd9zNJjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hFN4OkxWi54pg8ZRryV9msy84nbZgKnUEhVngdxIGo14ykjAwCb/6LVOm0GKF0G1f
         lUJfpo0PXbFNBP1m6pMQDexQI5UXY2o7zvv48SYBa/u+NTlKx9otZKZ0/4D0KBXYtr
         SUAijaYJFoV3PZD2z7WTofGK4lguIyGbZuKVSkmM=
Date:   Sat, 30 Oct 2021 10:54:27 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/22] usb: host: ehci-exynos: deny IRQ0
Message-ID: <YX0IQ/boUgVseZvS@kroah.com>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-2-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026173943.6829-2-s.shtylyov@omp.ru>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 26, 2021 at 08:39:22PM +0300, Sergey Shtylyov wrote:
> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
> 
> Fixes: 44ed240d6273 ("usb: host: ehci-exynos: Fix error check in exynos_ehci_probe()")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
> Changes in version 2:
> - added Alan's ACK.
> 
>  drivers/usb/host/ehci-exynos.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index 1a9b7572e17f..ff4e1261801a 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -207,6 +207,10 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>  		err = irq;
>  		goto fail_io;
>  	}
> +	if (!irq) {
> +		err = -EINVAL;
> +		goto fail_io;
> +	}

This is a huge sign that the api being used here is broken.

Please fix the root cause here, if returning a 0 is an error, then have
the function you called to get this irq return an error.  Otherwise you
will have to fix ALL callers, and people will always get it wrong.

Fix the root cause here, don't paper it over.

thanks,

greg k-h
