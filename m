From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [RESEND PATCH 1/2] ARM: dts: exynos4x12: Device tree node
 definition for TMU on Exynos4x12
Date: Mon, 24 Nov 2014 09:49:26 +0100
Message-ID: <20141124094926.04ffacfd@amdc2363>
References: <1416474343-1283-1-git-send-email-l.majewski@samsung.com>
 <035001d005fd$7abac670$70305350$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56511 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985AbaKXItg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 03:49:36 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFJ00I1ECIMM1C0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 17:49:34 +0900 (KST)
In-reply-to: <035001d005fd$7abac670$70305350$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hi Kukjin,

> Lukasz Majewski wrote:
> > 
> + Bart, Tomasz and MLs
> 
> Hi Lukasz,
> 
> Please post including MLs, even resending.
> 
> Will apply for v3.19, and just note that you asked me to apply this
> for 3.18 in personal talk but I couldn't see any requirements for
> fixes-3.18. If I'm missing something, please let me know.

The thing is that by default Exynos 4412 (trats2) can run with modified
cpufreq to support SW governed overclocking (BOOST).

To provide safe BOOST operation, TMU (thermal) _must_ be configured.
Configuration is not possible when trats2 DTS lacks of those patches.

So, yes there is a requirement to add those patches to v3.18 (if not
possible please add it to v3.19).

> 
> Thanks,
> Kukjin
> 
> > The TMU device tree node definition for Exynos4x12 family of SoCs.
> > 
> > Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> > Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> >  arch/arm/boot/dts/exynos4x12.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/exynos4x12.dtsi
> > b/arch/arm/boot/dts/exynos4x12.dtsi index 861bb91..2e9f1f7 100644
> > --- a/arch/arm/boot/dts/exynos4x12.dtsi
> > +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> > @@ -271,4 +271,14 @@
> >  		compatible = "samsung,exynos4x12-usb2-phy";
> >  		samsung,sysreg-phandle = <&sys_reg>;
> >  	};
> > +
> > +	tmu@100C0000 {
> > +		compatible = "samsung,exynos4412-tmu";
> > +		interrupt-parent = <&combiner>;
> > +		interrupts = <2 4>;
> > +		reg = <0x100C0000 0x100>;
> > +		clocks = <&clock 383>;
> > +		clock-names = "tmu_apbif";
> > +		status = "disabled";
> > +	};
> >  };
> > --
> > 2.0.0.rc2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
