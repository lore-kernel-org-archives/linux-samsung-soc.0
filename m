From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: exynos4x12: Device tree node definition
 for TMU on Exynos4x12
Date: Wed, 27 Nov 2013 08:11:44 +0100
Message-ID: <20131127081144.5402a81e@amdc308.digital.local>
References: <1380010102-25817-1-git-send-email-l.majewski@samsung.com>
 <1381300194-13134-1-git-send-email-l.majewski@samsung.com>
 <1381300194-13134-5-git-send-email-l.majewski@samsung.com>
 <20131015082750.4b2f3325@amdc308.digital.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60673 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750842Ab3K0HL4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Nov 2013 02:11:56 -0500
In-reply-to: <20131015082750.4b2f3325@amdc308.digital.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "kgene.kim@samsung.com" <kgene.kim@samsung.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Kukjin,

> Hi Kukjin,
> 
> > The TMU device tree node definition for Exynos4x12 family of SoCs.
> > 
> > Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> > Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > 
> > ---
> > Changes for v2:
> > - None
> > 
> >  arch/arm/boot/dts/exynos4x12.dtsi |   10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/exynos4x12.dtsi
> > b/arch/arm/boot/dts/exynos4x12.dtsi index ad531fe..64c0ece 100644
> > --- a/arch/arm/boot/dts/exynos4x12.dtsi
> > +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> > @@ -176,4 +176,14 @@
> >  			};
> >  		};
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
> 
> Can you pull this DT node definition for TMU (as a fix to v3.12)?
> 
> It is crucial for Exynos4412.
> 

Kukjin, could you pull this patch?

-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
