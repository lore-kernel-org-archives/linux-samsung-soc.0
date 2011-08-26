From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 03/15] DMA: PL330: Modify device_control()
Date: Fri, 26 Aug 2011 20:49:05 +0530
Message-ID: <CABb+yY3s6g3HrfHa9n-WOzhfzi26g46WxzNDCHzEaRg95zSC5w@mail.gmail.com>
References: <1314238425-6480-1-git-send-email-boojin.kim@samsung.com>
	<1314238425-6480-4-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:51928 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753693Ab1HZPTI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 11:19:08 -0400
Received: by bke11 with SMTP id 11so2619531bke.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2011 08:19:06 -0700 (PDT)
In-Reply-To: <1314238425-6480-4-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>

On Thu, Aug 25, 2011 at 7:43 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
> This patch modifies device_control() to support both DMA_TERMINATE_ALL
> and DMA_SLAVE_CONFIG command.
> First, modify the flush control for DMA_TERMINATE_ALL command.
> Second, add the slave configuration control for DMA_SLAVE_CONFIG command.

I repeat what I said for v6.
*********
Apart from the alleged purpose "Support DMA_SLAVE_CONFIG command"
this patch also modifies the behavior of DMA_TERMINATE_ALL.
If the change is intended, please split it into two patches and
explain the reason.
Otherwise, restore the behavior.
*********
