From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and
 SSDK-GH7 board
Date: Wed, 12 Feb 2014 11:40:33 +0000
Message-ID: <52FB5DB1.4090609@arm.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <1392100183-30930-2-git-send-email-kgene.kim@samsung.com> <CAOesGMjE=zOStKoZQhYLhYtL_aWD73DcF4w6STboZPMfHkLtxA@mail.gmail.com> <52FB575F.3070104@arm.com> <20140212112946.GD21992@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:39775 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751808AbaBLLkg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:40:36 -0500
In-Reply-To: <20140212112946.GD21992@e106331-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Olof Johansson <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 12/02/14 11:29, Mark Rutland wrote:
>>>> +       gic: interrupt-controller@1C000000 {
>>>> +               compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>>
>>> This looks incorrect -- you should at the very least have a more
>>> specific one than a15-gic? Marc?
>>
>> "arm,cortex-a9-gic" is definitely wrong (the A9 GIC doesn't have the
>> virt extensions). This binding matches what the A15 GIC has, so
>> "arm,cortex-a15-gic" is probably fine. Main issue here is that the GICv2
>> driver has no compatible string for anything else.
>>
>> Should we define something more generic (like "arm,gic-v2")? Or carry on
>> adding more compatible strings?
> 
> It's been proposed repeatedly, and it probably makes sense to add the
> generic versions to the driver, and allow for more specific ones in the
> binding which DTs can use. That way we don't get an explosion of strings
> in the driver, but if we need to handle any particular GIC specially in
> future we can do so.
> 
> I guess for Linux we'd want to add "arm,gic-v1" and "arm,gic-v2" to the
> driver. We could just add "arm,gic-v1" and expect it later in the
> compatible list if v2 is a strict superset of v1; I think it is but I'm
> not a GIC expert.

Sounds good to me.

	M.
-- 
Jazz is not dead. It just smells funny...
