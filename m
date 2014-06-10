From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 3/6] ARM: EXYNOS: Remove soc_is_exynos4/5 from exynos.c
Date: Tue, 10 Jun 2014 15:55:09 +0200
Message-ID: <53970E3D.9080501@samsung.com>
References: <1399706287-13919-1-git-send-email-y@samsung.com>
 <1399706419-13976-1-git-send-email-pankaj.dubey@samsung.com>
 <1399706419-13976-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56557 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbaFJNz0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 09:55:26 -0400
In-reply-to: <1399706419-13976-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, arnd@arndb.de, Russell King <linux@arm.linux.org.uk>, Thomas Abraham <thomas.abraham@linaro.org>

On 10.05.2014 09:20, Pankaj Dubey wrote:
> This patch removes usage of soc_is_exynos4/5 from exynos.c.
> For this we need to separate machine descriptors for exynos4
> and exynos5. While doing this patch does some consolidation also.
> 
> CC: Russell King <linux@arm.linux.org.uk>
> CC: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c            |   52 +++++++++++++++++++-----------
>  arch/arm/plat-samsung/include/plat/cpu.h |    3 --
>  2 files changed, 33 insertions(+), 22 deletions(-)
> 

I don't think this is needed. All those static mappings should just go
away, which will also eliminate the need to have separate machine
descriptor or soc_is_exynos{4,5}() macros.

Best regards,
Tomasz
