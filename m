From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH RESEND 1/2] ARM: dts: exynos3250: remove unecessary property
 of gpio-keys node
Date: Mon, 12 Jan 2015 18:04:04 +0900
Message-ID: <54B38E04.6030705@kernel.org>
References: <1420515809-5151-1-git-send-email-beomho.seo@samsung.com> <1420515809-5151-2-git-send-email-beomho.seo@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34289 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751645AbbALJEM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 04:04:12 -0500
In-Reply-To: <1420515809-5151-2-git-send-email-beomho.seo@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beomho Seo <beomho.seo@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, yj44.cho@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, Kukjin Kim <kgene@kernel.org>

On 01/06/15 12:43, Beomho Seo wrote:
> This patch remove unecessary property of gpio-keys node.

The checkpatch complains like 'perhaps 'unnecessary'?' ;)

Applied this and 2nd one.

Thanks,
Kukjin

> gpio-keys driver do not uses interrupts and interrupt-parent.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Youngjun Cho <yj44.cho@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-monk.dts   |    2 --
>  arch/arm/boot/dts/exynos3250-rinato.dts |    2 --
>  2 files changed, 4 deletions(-)
