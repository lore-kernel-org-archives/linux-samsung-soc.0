From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v7 1/9] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Thu, 2 Apr 2015 18:35:58 +0100
Message-ID: <20150402173558.GB30669@leverpostej>
References: <1426637856-3730-1-git-send-email-cw00.choi@samsung.com>
 <1426637856-3730-2-git-send-email-cw00.choi@samsung.com>
 <20150330160940.GA13731@leverpostej>
 <5519E2B6.2030905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:40992 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751473AbbDBRgE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 13:36:04 -0400
Content-Disposition: inline
In-Reply-To: <5519E2B6.2030905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: "kgene@kernel.org" <kgene@kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "ideal.song@samsung.com" <ideal.song@samsung.com>, "a.kesavan@samsung.com" <a.kesavan@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 31, 2015 at 12:56:38AM +0100, Chanwoo Choi wrote:
> Hi Mark,
> 
> On 03/31/2015 01:09 AM, Mark Rutland wrote:
> > Hi,
> > 
> > On Wed, Mar 18, 2015 at 12:17:28AM +0000, Chanwoo Choi wrote:
> >> This patch adds new Exynos5433 dtsi to support 64-bit Exynos5433 SoC based on
> >> Octal core CPUs (quad Cortex-A57 and quad Cortex-A53). And Exynos5433 supports
> >> PSCI (Power State Coordination Interface) v0.1.
> >>
> >> This patch includes following dt node to support Exynos5433 SoC:
> >> 1. Octa core for big.LITTLE architecture
> >> - Cortex-A53 LITTLE Quad-core
> >> - Cortex-A57 big Quad-core
> >> - Support PSCI v0.1
> > 
> > Is CPU0 hotplug still broken, or has the FW been fixed?
> 
> CPU0 hotplug is still not working.
> 
> > 
> > I'm very worried about adding a DT that's known broken, especially when
> > we have no idea as to if/when the FW will be fixed judging from prior
> > replies.
> 
> As I replied, I can not fix the FW because I don't have any code of FW.

Surely you are able to contact those who do?

> I don't have any solution to fix it on Linux kernel level.
> 
> So, If you agree, I can add the comment of CPU0 hotplug issue on DT file.

I disagree. I do not want to add a DT that is known to be broken;
especially when we have no idea how to fix it. It creates long-term
maintenance pain for everyone, and marginal gain for few. A comment does
nothing to aid the end-user.

So NAK to the PSCI node and PSCI enable method in this dts until we
either have a working firmware, or a reasonable mechanism to handle the
deficiency.

Mark.
