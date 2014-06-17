From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v4 02/11] ARM: EXYNOS: Move cpufreq and cpuidle device
 registration to init_machine
Date: Tue, 17 Jun 2014 09:18:25 +0530
Message-ID: <000101cf89de$ffbb1730$ff314590$@samsung.com>
References: <1399704998-13321-1-git-send-email-pankaj.dubey@samsung.com>
 <1399704998-13321-3-git-send-email-pankaj.dubey@samsung.com>
 <5396EFFB.3040704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36053 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754848AbaFQDro (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jun 2014 23:47:44 -0400
In-reply-to: <5396EFFB.3040704@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com

Hi Tomasz,

> -----Original Message-----
> 
> Hi Pankaj,
> 
> On 10.05.2014 08:56, Pankaj Dubey wrote:
> > As exynos_cpuidle_init and exynos_cpufreq_init function have just one
> > lines of code for registering platform devices. We can move these
> > lines to exynos_dt_machine_init and delete exynos_cpuidle_init and
> > exynos_cpufreq_init function. This will help in reducing lines of code
> > in exynos.c, making it more cleaner.
> >
> > Suggested-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > ---
> >  arch/arm/mach-exynos/exynos.c |   19 ++++---------------
> >  1 file changed, 4 insertions(+), 15 deletions(-)
> >
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 

Thanks for review.

> Btw. This and other simple clean-up patches from this series could be
applied
> separately, without re-spinning them every time with this series.
> 

OK, I will separate cleanup patches.

> Best regards,
> Tomasz

Thanks,
Pankaj Dubey
