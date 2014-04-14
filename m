From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8 1/3] ARM: EXYNOS: Add support for EXYNOS5410 SoC
Date: Mon, 14 Apr 2014 13:03:42 +0200
Message-ID: <5617478.sn2TYu7iO3@wuerfel>
References: <1397459860-21869-1-git-send-email-t.dakhran@samsung.com> <1397459860-21869-2-git-send-email-t.dakhran@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:62225 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753834AbaDNLEq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 07:04:46 -0400
In-Reply-To: <1397459860-21869-2-git-send-email-t.dakhran@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tarek Dakhran <t.dakhran@samsung.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>, Romain Naour <romain.naour@openwide.fr>, Tarek Dakhran <t.dakhran@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>

On Monday 14 April 2014 11:17:38 Tarek Dakhran wrote:
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -159,6 +159,15 @@ static struct map_desc exynos5250_iodesc[] __initdata = {
>         },
>  };
>  
> +static struct map_desc exynos5410_iodesc[] __initdata = {
> +       {
> +               .virtual        = (unsigned long)S5P_VA_SYSRAM_NS,
> +               .pfn            = __phys_to_pfn(EXYNOS5410_PA_SYSRAM_NS),
> +               .length         = SZ_4K,
> +               .type           = MT_DEVICE,
> +       },
> +};
> +
>  static struct map_desc exynos5_iodesc[] __initdata = {

NAK

Why does this keep coming up?

	Arnd
