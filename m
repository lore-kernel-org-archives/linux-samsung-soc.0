From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: samsung: avoid racy early printk at bootup
Date: Tue, 4 Jun 2013 20:15:36 -0700
Message-ID: <20130605031536.GA24910@quad.lixom.net>
References: <1370397539-21653-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:50550 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751326Ab3FEDPf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 23:15:35 -0400
Received: by mail-pd0-f182.google.com with SMTP id g10so1157566pdj.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jun 2013 20:15:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1370397539-21653-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Simon Glass <sjg@chromium.org>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hi,

On Tue, Jun 04, 2013 at 06:58:59PM -0700, Doug Anderson wrote:
> At boot, we've got a stack trace that looks something like this
> (exynos5 as example)
> * exynos5_map_io
> * s3c_init_cpu
> * exynos_init_io
> * exynos5_dt_map_io
> * paging_init
> * setup_arch
> 
> When paging_init() runs we'll lose any early MMU mappings that we
> might have had to allow us access to S3C_VA_UART.  We won't add those
> mappings back in until after the SoC-specific map_io() function is
> called.  However, we print the CPU ID _right before_ we call the
> SoC-specific function.  Oops.
> 
> 
> Things happen to work all right most of the time because the mapping
> is sticking around in our TLB.  ...but if we get really unlucky (like
> me!) or we put an explicit flush_tlb_all() at the start of
> exynos_init_io(), then things go boom.
> 
> This patch moves the problematic printk() till after the cpu->map_io()
> call.  It also switches it over to pr_info().  This patch _doesn't_
> remove the questionable printks in the panic case, since we might get
> lucky and the TLB might still let us print.  This patch also adds a
> few warnings to help others avoid similar headaches.

This seems to be caused by not calling iotable_ini() in exynos_init_io()
when a device tree is passed into the kernel, thus not setting up the
mapping for the UART in that case.

I think the solution is instead to map the uart earlier. The window of
exposure is still there, but much smaller (and similar to how it always
has been).

In current upstream, if there is no map_io mach_desc entry at all,
debug_ll_io_init() will be called on all platforms. Seems appropriate
to call that explicitly before of_scan_flat_dt() in exynos_init_io()
in this case.

Or am I missing something?


-Olof
