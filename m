From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 4/4] ARM: defconfig: Exynos for v4.9
Date: Fri, 2 Sep 2016 18:30:25 +0200
Message-ID: <20160902163025.GA5534@kozik-lap>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
 <1472548739-20050-2-git-send-email-k.kozlowski@samsung.com>
 <4575445.BeuOIIGatt@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35612 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932338AbcIBQae (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 12:30:34 -0400
Content-Disposition: inline
In-Reply-To: <4575445.BeuOIIGatt@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

On Fri, Sep 02, 2016 at 05:47:11PM +0200, Arnd Bergmann wrote:
> On Tuesday, August 30, 2016 11:18:56 AM CEST Krzysztof Kozlowski wrote:
> > Expected conflict in multi_v7 - take all the changes:
> > 
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@@ -135,8 -136,7 +136,8 @@@ CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=
> >   CONFIG_CPU_FREQ_GOV_POWERSAVE=m
> >   CONFIG_CPU_FREQ_GOV_USERSPACE=m
> >   CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
> > - CONFIG_CPU_FREQ_GOV_SCHEDUTIL=m
> > + CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
> >  +CONFIG_ARM_IMX6Q_CPUFREQ=y
> >   CONFIG_QORIQ_CPUFREQ=y
> >   CONFIG_CPU_IDLE=y
> >   CONFIG_ARM_CPUIDLE=y
> > 
> > 
> 
> I pulled this into next/defconfig, but didn't see the conflict,
> presumably I'll get it after merging the other branches?

The conflict is between my tree and imx-mxs tree so you might encounter
it later when merging IMX changes.

Best regards,
Krzysztof
