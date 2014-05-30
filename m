From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix core ID used by platsmp and hotplug
 code
Date: Fri, 30 May 2014 13:39:57 +0200
Message-ID: <53886E0D.3050804@gmail.com>
References: <1400858430-4278-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:49397 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932070AbaE3LkR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 07:40:17 -0400
Received: by mail-wi0-f178.google.com with SMTP id cc10so934723wib.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 04:40:13 -0700 (PDT)
In-Reply-To: <1400858430-4278-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

On 23.05.2014 17:20, Tomasz Figa wrote:
> When CPU topology is specified in device tree, cpu_logical_map() does
> not return core ID anymore, but rather full MPIDR value. This breaks
> existing calculation of PMU register offsets on Exynos SoCs.
> 
> This patch fixes the problem by adjusting the code to use only core ID
> bits of the value returned by cpu_logical_map() to allow CPU topology to
> be specified in device tree on Exynos SoCs.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/hotplug.c | 10 ++++++----
>  arch/arm/mach-exynos/platsmp.c | 34 +++++++++++++++++++---------------
>  2 files changed, 25 insertions(+), 19 deletions(-)

Ping.

Best regards,
Tomasz
