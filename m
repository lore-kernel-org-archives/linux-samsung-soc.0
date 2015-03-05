From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 1/9] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Thu, 5 Mar 2015 18:54:07 +0000
Message-ID: <20150305185407.GK14093@leverpostej>
References: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
 <1425533911-14800-2-git-send-email-cw00.choi@samsung.com>
 <20150305122459.GC14093@leverpostej>
 <CAGTfZH3Bf1ueFO25NXFbN+Mvb9TcGbErbSp=a+vQ0=A+E07mQA@mail.gmail.com>
 <20150305170450.GG14093@leverpostej>
 <CAGTfZH3nkCvnuu+fC1Gv5DrRQXEg6Y19tQnh+phj6c_jAFpbvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58115 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754257AbbCESyh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Mar 2015 13:54:37 -0500
Content-Disposition: inline
In-Reply-To: <CAGTfZH3nkCvnuu+fC1Gv5DrRQXEg6Y19tQnh+phj6c_jAFpbvg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cwchoi00@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, "kgene@kernel.org" <kgene@kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "ideal.song@samsung.com" <ideal.song@samsung.com>, "a.kesavan@samsung.com" <a.kesavan@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

> >> >> +       psci {
> >> >> +               compatible = "arm,psci";
> >> >> +               method = "smc";
> >> >> +               cpu_off = <0x84000002>;
> >> >> +               cpu_on = <0xC4000003>;
> >> >> +       };
> >> >
> >> > Back at v2 you mentioned that CPU_OFF wasn't working [1].
> >> >
> >> > Do both CPU_ON and CPU_OFF work for all CPUs, including the boot CPU?
> >>
> >> The CPU1 ~ CPU7 are well woking about CPU_ON/OFF.
> >> CPU0 (boot CPU) is only well working for CPU_OFF.
> >> But when I try to turn on the CPU0 after CPU_OFF, I failed it.
> >
> > That's rather worrying. Can you look into what's going on here? I'd
> > rather not have dts describing things which are known to be broken.
> 
> The board dts don't include any node for CPU_ON/OFF.

I don't understand. The CPU_ON and CPU_OFF IDs are in the psci node
quoted above, and all the CPUs had enable-method = "psci".

> When I try to turn on the CPU0 (boot CPU), fail to turn on and lockup happen.
> After lockup happen, I cannot use the console.

That sounds like a pretty major bug.

Are you able to investigate with a hardware debugger?

Do other CPUs eventually log errors regarding the lockup? Or is the
machine completely dead from this point on?

> >> > I take it CPUs boot at EL2?
> >
> > Do the CPUs boot at EL1 or EL2?
> 
> Unfortunately, I cannot check the secure firmware for Exynos5433 SoC.
> I think that a few SoC provider probably would know it.

I guess I asked the wrong question.

Do CPUs enter the kernel at EL2 or at EL1?

Thanks,
Mark.
