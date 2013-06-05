From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: exynos: add debug_ll_io_init() call in
 exynos_init_io()
Date: Thu, 06 Jun 2013 08:32:04 +0900
Message-ID: <09ca01ce6244$e2f0e7a0$a8d2b6e0$%kim@samsung.com>
References: <1370397539-21653-1-git-send-email-dianders@chromium.org>
 <1370465793-7997-1-git-send-email-dianders@chromium.org>
 <CAOesGMhQX9ip=nb9AQa5fcDFRNpZZSxUO0N0GTX051dakWZD9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35468 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905Ab3FEXcH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 19:32:07 -0400
In-reply-to: <CAOesGMhQX9ip=nb9AQa5fcDFRNpZZSxUO0N0GTX051dakWZD9Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Doug Anderson' <dianders@chromium.org>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Simon Glass' <sjg@chromium.org>, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Olof Johansson wrote:
> 
> On Wed, Jun 5, 2013 at 1:56 PM, Doug Anderson <dianders@chromium.org>
> wrote:
> > If the early MMU mapping of the UART happens to get booted out of the
> > TLB between the start of paging_init() and when we finally re-add the
> > UART at the very end of s3c_init_cpu(), we'll get a hang at bootup if
> > we've got early_printk enabled.  Avoid this hang by calling
> > debug_ll_io_init() early.
> >
> > Without this patch, you can reliably reproduce a hang when early
> > printk is enabled by adding flush_tlb_all() at the start of
> > exynos_init_io().  After this patch the hang goes away.
> >
> > Signed-off-by: Doug Anderson <dianders@chromium.org>
> 
> Acked-by: Olof Johansson <olof@lixom.net>
> 
> 
> Kukjin, this seems appropriate for 3.10. Do you have other fixes
> queued or should I apply this directly?
> 
If I remember correctly, nothing in my tree for 3.10.

So please go ahead with my ack if you want,

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin
