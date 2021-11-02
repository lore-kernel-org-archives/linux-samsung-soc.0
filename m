Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E8DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 13:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FBB661053
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 13:55:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhKBN6c (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 09:58:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:45270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbhKBN6b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 09:58:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D0C560F5A;
        Tue,  2 Nov 2021 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635861356;
        bh=QpTSfSb9o/C1wysngZJ+pdD4bKpWwSIYxeQXsJuFSGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fUPrRyRsIu56E6YSFysTKTY98CDJlpoalc9ucN2lw4g1DYUXx7KVfNKKhOoBQiOaP
         yxvFl0e3dvE3UwWJzopnlvY4x4g7H1nkpRgSH+4OQDdIMG9GfUYem3pMzvFU1QAS23
         CF76CMyv5+K9nL93yA8k1TqaEXQjTM4mF3NjjSR8=
Date:   Tue, 2 Nov 2021 14:55:49 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/22] usb: host: ehci-exynos: deny IRQ0
Message-ID: <YYFDZb35RK+lWdgi@kroah.com>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-2-s.shtylyov@omp.ru>
 <YX0IQ/boUgVseZvS@kroah.com>
 <46d41d2b-4701-fb7f-9a0b-f4a35e59c3d3@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46d41d2b-4701-fb7f-9a0b-f4a35e59c3d3@omp.ru>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 01, 2021 at 11:39:13PM +0300, Sergey Shtylyov wrote:
> Hello!
> 
> On 10/30/21 11:54 AM, Greg Kroah-Hartman wrote:
> 
> >> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
> >> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
> >> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
> >>
> >> Fixes: 44ed240d6273 ("usb: host: ehci-exynos: Fix error check in exynos_ehci_probe()")
> >> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> >> ---
> >> Changes in version 2:
> >> - added Alan's ACK.
> >>
> >>  drivers/usb/host/ehci-exynos.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> >> index 1a9b7572e17f..ff4e1261801a 100644
> >> --- a/drivers/usb/host/ehci-exynos.c
> >> +++ b/drivers/usb/host/ehci-exynos.c
> >> @@ -207,6 +207,10 @@ static int exynos_ehci_probe(struct platform_device *pdev)
> >>  		err = irq;
> >>  		goto fail_io;
> >>  	}
> >> +	if (!irq) {
> >> +		err = -EINVAL;
> >> +		goto fail_io;
> >> +	}
> > 
> > This is a huge sign that the api being used here is broken.
> 
>    And you're telling me that after I've wasted  time on v2? :-( Well, at least the series had
> couple blunders, so it couldn't merged for 5.16-rc1 anyway (not sure why these weren't detected
> in v1).

I thought about it some more and noticed it on your v2 submission.

> > Please fix the root cause here, if returning a 0 is an error, then have
> > the function you called to get this irq return an error.
> 
>    Well, technically not, although that doesn't match the kernel-doc for the function now.
> I only don't understand why returning IRQ0 hasn't been replaced still...

Then please work on that.

> > Otherwise you
> > will have to fix ALL callers, and people will always get it wrong.
> > Fix the root cause here, don't paper it over.
> 
>    As I have already told you, I won't have to do it as filtering out is only needed iff 0 is
> used as an indication for something special. IRQ0 is still perfectly valid for request_irq()
> and is even called by arch/{aplha|mips|x86}...

If it is valid, then why can it not be a valid irq for all of these
drivers that you are changing here?  What is preventing them from
running on the platforms where 0 is a valid irq value?

thanks,

greg k-h
