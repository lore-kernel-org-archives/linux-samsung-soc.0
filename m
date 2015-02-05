From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [v2,3/3] ARM: EXYNOS: Remove left over 'extra_save'
Date: Thu, 05 Feb 2015 08:14:46 +0100
Message-ID: <1423120486.29408.2.camel@AMDC1943>
References: <1422961601-7087-3-git-send-email-k.kozlowski@samsung.com>
 <54D2F646.3090306@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48231 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751589AbbBEHOv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 02:14:51 -0500
In-reply-to: <54D2F646.3090306@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On czw, 2015-02-05 at 10:19 +0530, Pankaj Dubey wrote:
> Hi Krzysztof,
> 
> On Tuesday 03 February 2015 04:36 PM, Krzysztof Kozlowski wrote:
> > Since 32b0aa9aaeb4 ("ARM: EXYNOS: Remove i2c sys configuration related
> > code") the Exynos 5250 no longer saves additional registers under
> > 'exynos_pm_data.extra_save' field.
> >
> > No one else uses this code so get rid of it making also 'exynos_pm_data'
> > const everywhere.
> >
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >
> > ---
> > Changes since v1:
> > 1. New patch.
> > ---
> >   arch/arm/mach-exynos/suspend.c | 13 ++-----------
> >   1 file changed, 2 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
> > index e6c961126087..d56bd6ca5e86 100644
> > --- a/arch/arm/mach-exynos/suspend.c
> > +++ b/arch/arm/mach-exynos/suspend.c
> > @@ -63,7 +63,6 @@ static struct sleep_save exynos_core_save[] = {
> >
> >   struct exynos_pm_data {
> >   	const struct exynos_wkup_irq *wkup_irq;
> > -	struct sleep_save *extra_save;
> >   	int num_extra_save;
> 
> 'num_extra_save' can be removed at the same time.
> 
> Rest changes looks ok.

Right, thanks for pointing this out. I'll resend the patchset.

Best regards,
Krzysztof
> 
> Thanks,
> Pankaj Dubey
