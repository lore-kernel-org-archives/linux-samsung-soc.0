From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/2] ARM: exynos: delete redundant HAVE_SCHED_CLOCK option
 in Kconfig
Date: Fri, 31 Aug 2012 18:52:19 +0900
Message-ID: <CAH9JG2W8xZrkmGkVw_JDY3qSsqHnaTi8-BNoW99V3FUyvWBXng@mail.gmail.com>
References: <1346406296-16223-1-git-send-email-Barry.Song@csr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:40796 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751957Ab2HaJwT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Aug 2012 05:52:19 -0400
Received: by qcro28 with SMTP id o28so1896484qcr.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Aug 2012 02:52:19 -0700 (PDT)
In-Reply-To: <1346406296-16223-1-git-send-email-Barry.Song@csr.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Barry Song <Barry.Song@csr.com>
Cc: olof@lixom.net, arnd@arndb.de, kgene.kim@samsung.com, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, workgroup.linux@csr.com, Barry Song <Baohua.Song@csr.com>

Hi,

then where select it HAVE_SCHED_CLOCK? apart from other exynos board,
universal have to use another clock.

Thank you,
Kyungmin Park

On 8/31/12, Barry Song <Barry.Song@csr.com> wrote:
> From: Barry Song <Baohua.Song@csr.com>
>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>
> ---
>  arch/arm/mach-exynos/Kconfig |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index b5b4c8c..3fd4ab3 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -243,7 +243,6 @@ config MACH_UNIVERSAL_C210
>  	select CPU_EXYNOS4210
>  	select S5P_HRT
>  	select CLKSRC_MMIO
> -	select HAVE_SCHED_CLOCK
>  	select S5P_GPIO_INT
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
> --
> 1.7.0.4
>
>
>
> Member of the CSR plc group of companies. CSR plc registered in England and
> Wales, registered number 4187346, registered office Churchill House,
> Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
> More information can be found at www.csr.com. Follow CSR on Twitter at
> http://twitter.com/CSR_PLC and read our blog at www.csr.com/blog
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
