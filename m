From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v6 1/4] ARM: EXYNOS: Add support for mapping PMU base
 address via DT
Date: Tue, 08 Jul 2014 16:25:49 +0200
Message-ID: <53BBFF6D.8070203@samsung.com>
References: <1404710376-16448-1-git-send-email-pankaj.dubey@samsung.com>
 <1404710376-16448-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:8569 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750957AbaGHO0Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 10:26:24 -0400
In-reply-to: <1404710376-16448-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

On 07.07.2014 07:19, Pankaj Dubey wrote:
> Add support for mapping Samsung Power Management Unit (PMU)
> base address from device tree.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h |    1 +
>  arch/arm/mach-exynos/exynos.c |   37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 

Thanks for keeping up with addressing the comments.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
