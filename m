From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2] ARM: exynos: add debug_ll_io_init() call in
 exynos_init_io()
Date: Fri, 7 Jun 2013 18:12:22 -0700
Message-ID: <20130608011222.GC27436@quad.lixom.net>
References: <1370397539-21653-1-git-send-email-dianders@chromium.org>
 <1370465793-7997-1-git-send-email-dianders@chromium.org>
 <CAOesGMhQX9ip=nb9AQa5fcDFRNpZZSxUO0N0GTX051dakWZD9Q@mail.gmail.com>
 <09ca01ce6244$e2f0e7a0$a8d2b6e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:60492 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752746Ab3FHBMU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jun 2013 21:12:20 -0400
Received: by mail-pb0-f41.google.com with SMTP id rp16so1782260pbb.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Jun 2013 18:12:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <09ca01ce6244$e2f0e7a0$a8d2b6e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Simon Glass' <sjg@chromium.org>, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Thu, Jun 06, 2013 at 08:32:04AM +0900, Kukjin Kim wrote:
> Olof Johansson wrote:
> > 
> > On Wed, Jun 5, 2013 at 1:56 PM, Doug Anderson <dianders@chromium.org>
> > wrote:
> > > If the early MMU mapping of the UART happens to get booted out of the
> > > TLB between the start of paging_init() and when we finally re-add the
> > > UART at the very end of s3c_init_cpu(), we'll get a hang at bootup if
> > > we've got early_printk enabled.  Avoid this hang by calling
> > > debug_ll_io_init() early.
> > >
> > > Without this patch, you can reliably reproduce a hang when early
> > > printk is enabled by adding flush_tlb_all() at the start of
> > > exynos_init_io().  After this patch the hang goes away.
> > >
> > > Signed-off-by: Doug Anderson <dianders@chromium.org>
> > 
> > Acked-by: Olof Johansson <olof@lixom.net>
> > 
> > 
> > Kukjin, this seems appropriate for 3.10. Do you have other fixes
> > queued or should I apply this directly?
> > 
> If I remember correctly, nothing in my tree for 3.10.
> 
> So please go ahead with my ack if you want,
> 
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> 

Applied for 3.10 (together with the uncompress.h fix from Tushar)


-Olof
