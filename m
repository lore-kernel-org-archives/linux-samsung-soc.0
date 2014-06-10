From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 01/11] ARM: EXYNOS: Make exynos machine_ops as static
Date: Tue, 10 Jun 2014 13:43:31 +0200
Message-ID: <5396EF63.8030506@samsung.com>
References: <1399704998-13321-1-git-send-email-pankaj.dubey@samsung.com>
 <1399704998-13321-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39954 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035AbaFJLns (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 07:43:48 -0400
In-reply-to: <1399704998-13321-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com

Hi Pankaj,

On 10.05.2014 08:56, Pankaj Dubey wrote:
> As machine function ops are used only in this file let's make
> them static. Also remove unused and unwanted declarations from
> common.h.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h |    8 --------
>  arch/arm/mach-exynos/exynos.c |    6 +++---
>  2 files changed, 3 insertions(+), 11 deletions(-)
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
