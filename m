From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v7 1/9] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Mon, 13 Apr 2015 11:56:19 +0100
Message-ID: <20150413105618.GD4076@leverpostej>
References: <1426637856-3730-1-git-send-email-cw00.choi@samsung.com>
 <1426637856-3730-2-git-send-email-cw00.choi@samsung.com>
 <20150330160940.GA13731@leverpostej>
 <5519E2B6.2030905@samsung.com>
 <20150402173558.GB30669@leverpostej>
 <551DD321.6030707@samsung.com>
 <20150407102523.GA23190@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:59457 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932099AbbDMK4Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Apr 2015 06:56:24 -0400
Content-Disposition: inline
In-Reply-To: <20150407102523.GA23190@leverpostej>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, "kgene@kernel.org" <kgene@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>
Cc: Marc Zyngier <Marc.Zyngier@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "ideal.song@samsung.com" <ideal.song@samsung.com>, "a.kesavan@samsung.com" <a.kesavan@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Chanwoo,

Could you please reply to the below?

Without an answer I'm going to have to ask for the patch to be unqueued
for the moment, and I'd prefer that we came to a solution instead.

Thanks,
Mark.

On Tue, Apr 07, 2015 at 11:25:27AM +0100, Mark Rutland wrote:
> > >>> I'm very worried about adding a DT that's known broken, especially when
> > >>> we have no idea as to if/when the FW will be fixed judging from prior
> > >>> replies.
> > >>
> > >> As I replied, I can not fix the FW because I don't have any code of FW.
> > > 
> > > Surely you are able to contact those who do?
> > > 
> > >> I don't have any solution to fix it on Linux kernel level.
> > >>
> > >> So, If you agree, I can add the comment of CPU0 hotplug issue on DT file.
> > > 
> > > I disagree. I do not want to add a DT that is known to be broken;
> > > especially when we have no idea how to fix it. It creates long-term
> > > maintenance pain for everyone, and marginal gain for few. A comment does
> > > nothing to aid the end-user.
> > > 
> > > So NAK to the PSCI node and PSCI enable method in this dts until we
> > > either have a working firmware, or a reasonable mechanism to handle the
> > > deficiency.
> > 
> > There is only CPU0 hotplug issue. Excpet CPU{1-7} are well working.
> 
> I understand that, but the issue with CPU0 is still a blocker from my
> PoV.
> 
> > To fix this issue, we must need the help of firmware developer.
> > But, We never get the any help.
> 
> Previously you said that you did not have access to the source code
> rather than not having help from the relevant firmware engineers. I take
> it you have informed them of the issue with CPU0?
> 
> > Also, as I mentioned on previous mail, all Exynos SoCs can not turn
> > off the CPU0. I've never seen Exynos SoC that CP0 hotplug is possible.
> 
> While that may be the case, PSCI is a more generic standard, and it is
> used on systems where CPU0 can be hot unplugged. So Exynos-specific
> details cannot dictate how the kernel PSCI driver should behave.
> 
> Is there a particular reason that CPU0 cannot be hotplugged?
> 
> In PSCI 0.2 and later it's possible to determine whether a trusted OS
> prohibits a core from being hotplugged, but this mechanism doesn't exist
> in earlier versions. I am not averse to adding a property to PSCI 0.1
> to mark a CPU as not being hotpluggable if there is a fundamental reason
> (i.e. not simply a bug) for this being the case.
> 
> Thanks,
> Mark.
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
