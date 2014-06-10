From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RESEND PATCH] ARM: EXYNOS: Fix the sequence of secondary CPU
 boot for Exynos3250
Date: Wed, 11 Jun 2014 01:35:27 +0200
Message-ID: <5397963F.30109@gmail.com>
References: <1402442827-2321-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:58354 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753195AbaFJXfr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 19:35:47 -0400
In-Reply-To: <1402442827-2321-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux@arm.linux.org.uk, kgene.kim@samsung.com, t.figa@samsung.com
Cc: kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Chanwoo,

On 11.06.2014 01:27, Chanwoo Choi wrote:
> This patch set AUTOWAKEUP_EN bit to ARM_CORE_CONFIGURATION register
> because Exynos3250 removes WFE in secure mode so that turn on automatically
> after setting CORE_LOCAL_PWR_EN. Also, This patch use dbs_sev() macro
> to guarantee the data synchronization of command instead of IPI_WAKEUP
> because Exynos3250 don't have WFE mode in secue mode.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c  | 9 ++++++++-
>  arch/arm/mach-exynos/pm.c       | 8 ++++++--
>  arch/arm/mach-exynos/regs-pmu.h | 4 ++++
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 

This patch seems to be unneeded with Krzysztof's patch send a while ago
[1]. As reported by Krzysztof, that patch apparently fixes SMP support
on Exynos3250 and is much smaller and less invasive.

[1] - http://thread.gmane.org/gmane.linux.kernel.samsung-soc/32809

Best regards,
Tomasz
