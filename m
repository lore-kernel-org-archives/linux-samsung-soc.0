From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 02/11] ARM: EXYNOS: Move cpufreq and cpuidle device
 registration to init_machine
Date: Tue, 10 Jun 2014 13:46:03 +0200
Message-ID: <5396EFFB.3040704@samsung.com>
References: <1399704998-13321-1-git-send-email-pankaj.dubey@samsung.com>
 <1399704998-13321-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40096 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751248AbaFJLqT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 07:46:19 -0400
In-reply-to: <1399704998-13321-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com

Hi Pankaj,

On 10.05.2014 08:56, Pankaj Dubey wrote:
> As exynos_cpuidle_init and exynos_cpufreq_init function have just one lines
> of code for registering platform devices. We can move these lines to
> exynos_dt_machine_init and delete exynos_cpuidle_init and exynos_cpufreq_init
> function. This will help in reducing lines of code in exynos.c, making it
> more cleaner.
> 
> Suggested-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c |   19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Btw. This and other simple clean-up patches from this series could be
applied separately, without re-spinning them every time with this series.

Best regards,
Tomasz
