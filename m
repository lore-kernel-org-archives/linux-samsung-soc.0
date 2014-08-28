From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 11/14] arm64: dts: Add initial device tree support for
 EXYNOS7
Date: Thu, 28 Aug 2014 18:37:19 +0100
Message-ID: <53FF68CF.2010608@arm.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com> <1409132660-1898-3-git-send-email-ch.naveen@samsung.com> <20140828035639.GB4972@localhost> <20140828094846.GD14650@leverpostej> <CAOesGMjY8wfAcq2fLgs=ZWHdiWtFqxr+ncUKTje0SnXqO-CCgQ@mail.gmail.com> <20140828170306.GQ14650@leverpostej> <53FF6668.4080502@arm.com> <20140828173037.GA18005@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:55237 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750834AbaH1Rh0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 13:37:26 -0400
In-Reply-To: <20140828173037.GA18005@leverpostej>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Olof Johansson <olof@lixom.net>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Rob Herring <robh@kernel.org>

On 28/08/14 18:30, Mark Rutland wrote:
> On Thu, Aug 28, 2014 at 06:27:04PM +0100, Marc Zyngier wrote:
>> On 28/08/14 18:03, Mark Rutland wrote:
>>
>>> From 67104ad5a56e4c18f9c41f06af028b7561740afd Mon Sep 17 00:00:00 2001
>>> From: Mark Rutland <mark.rutland@arm.com>
>>> Date: Thu, 28 Aug 2014 17:41:03 +0100
>>> Subject: [PATCH] Doc: dt: arch_timer: discourage clock-frequency use
>>>
>>> The ARM Generic Timer (AKA the architected timer, arm_arch_timer)
>>> features a CPU register (CNTFRQ) which firmware is intended to
>>> initialize, and non-secure software can read to determine the frequency
>>> of the timer. On CPUs with secure state, this register cannot be written
>>> from non-secure states.
>>>
>>> The firmware of early SoCs featuring the timer did not correctly
>>> initialize CNTFRQ correctly on all CPUs, requiring the frequency to be
>>> described in DT as a workaround. This workaround is not complete however
>>> as CNTFRQ is exposed to all software in a privileged non-secure mode,
>>> including KVM guests. The firmware and DTs for recent SoCs have followed
>>
>> I believe Xen is also affected by this.
> 
> True.
> 
> s/KVM/KVM\/Xen/, then?

Yup. Or "including guests running under a hypervisor", I expect this to
be such a fundamental problem that all hypervisors will trip over on
that one (Jailhouse definitely does).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
