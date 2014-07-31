From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: samsung: Changed return behavior of samsung_clk_init
Date: Fri, 01 Aug 2014 00:25:42 +0200
Message-ID: <53DAC266.4080102@gmail.com>
References: <1406843002-15652-1-git-send-email-hsnaves@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:54099 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbaGaWZr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 18:25:47 -0400
In-Reply-To: <1406843002-15652-1-git-send-email-hsnaves@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Humberto Silva Naves <hsnaves@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Andreas Farber <afaerber@suse.de>

Humberto,

On 31.07.2014 23:43, Humberto Silva Naves wrote:
> Instead of invoking panic, the samsung_clk_init returns a NULL
> pointer to indicate that an error has occurred. All the drivers
> using this function were changed appropriately (in this case
> just the clk-exynos5410).
> 
> This patch was suggested by Tomasz Figa in
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34982.html

There is a Suggested-by tag that can be added before your sign-off.
Similarly there are few other useful tags which are good to know.

> 
> Signed-off-by: Humberto Silva Naves <hsnaves@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos5410.c |    2 ++
>  drivers/clk/samsung/clk.c            |    8 +++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 

In general the patch looks good, thanks for you work. Will wait some
time to let people review it and then apply.

As a side note, it is always good to say why the patch is good in commit
message, so that maintainers know that author knows what he does, they
indeed want this patch and people that would stumble upon this patch in
future could know the rationale behind this change. This patch is pretty
trivial, though, so I'll let it go this time.

Best regards,
Tomasz
