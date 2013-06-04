From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: s5p64x0: Use common uncompress.h part for plat-samsung
Date: Tue, 04 Jun 2013 15:17:03 +0530
Message-ID: <51ADB797.8020502@linaro.org>
References: <1368916282-22896-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:48476 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738Ab3FDJr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 05:47:26 -0400
Received: by mail-pb0-f53.google.com with SMTP id un4so6945764pbc.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jun 2013 02:47:26 -0700 (PDT)
In-Reply-To: <1368916282-22896-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On 05/19/2013 04:01 AM, Tomasz Figa wrote:
> Since uart_base can be set dynamically in arch_detect_cpu(), there is no
> need to have a copy of all code locally, just to override UART base
> address.
> 
> This patch removes any duplicate code in uncompress.h variant of s5p64x0
> and implements proper arch_detect_cpu() function to initialize UART with
> SoC-specific parameters.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  arch/arm/mach-s5p64x0/include/mach/uncompress.h | 155 +-----------------------
>  1 file changed, 5 insertions(+), 150 deletions(-)
> 

This patch (with a minor modification) has been included in the
patchset[1] to consolidate uncompress subroutine for Samsung platforms.

[1] [PATCH v2 0/3] Consolidate uncompress code for Samsung platform
http://www.gossamer-threads.com/lists/linux/kernel/1723429


-- 
Tushar Behera
