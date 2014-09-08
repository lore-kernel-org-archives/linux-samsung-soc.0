From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 08 Sep 2014 16:05:40 +0200
Message-ID: <540DB7B4.4060300@collabora.co.uk>
References: <20140905115704.GO13515@arm.com> <20140905122232.GP13515@arm.com> <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com> <540C202E.2060009@collabora.co.uk> <540C7F5B.6070307@gmail.com> <540C83DE.10505@collabora.co.uk> <540C8577.2070907@gmail.com> <20140908112112.GK26030@arm.com> <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com> <20140908134937.GK4015@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33742 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754079AbaIHOFq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 10:05:46 -0400
In-Reply-To: <20140908134937.GK4015@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Stephen Warren <swarren@nvidia.com>

Hello Will,

On 09/08/2014 03:49 PM, Mark Brown wrote:
> On Mon, Sep 08, 2014 at 01:20:11PM +0100, Grant Likely wrote:
>> On Mon, Sep 8, 2014 at 12:21 PM, Will Deacon <will.deacon@arm.com> wrote:
> 
>> > Whilst I'm sympathetic to people working to enable DRM, I think this is
>> > the right solution to the problem. The transition from simplefb to DRM
>> > shouldn't break display for a bunch of kernel revisions whilst the code is
>> > in flux.
> 
>> I would go further. The kernel behaviour has changed, and we have to
>> deal with platforms that assume the old behaviour. That means either
>> defaulting to leaving enabled regulators/clocks alone unless there is
>> a flag in the DT saying they can be power managed, or black listing
>> platforms that are known to depend on the regulator being on.
> 
> For regulators there is essentially a flag in DT already - the
> regulators should not be described in DT if the OS isn't supposed to be
> managing them.
> 
>> Updating the device tree must not be required to get the kernel to
>> boot, but it is valid to require a DT upgrade to get better
>> performance (battery life) out of the platform.
> 
> This has got to be a blacklist then, and it seems like we've got to fix
> simplefb to actually support managing the resources it's using.  The
> current plan does not seem at all sensible - we're talking about adding
> hacks in every subsystem that provides resources and bodging DTs in
> order to work around simplefb.
> 

Since many folks don't agree that hacking different subsystems is the way
forward I'll hold the patches and don't post them. The sunxi thread [0]
already shows how different people have strong opposite positions on the
correct approach to handle this.

For now you can just disable the tps65090 PMIC support by not enabling the
CONFIG_REGULATOR_TPS65090 kconfig symbol on your kernel config. That will give
you exactly the same behavior that before tps65090 support was added to the
Snow DT on commit b16be76 ("ARM: dts: add tps65090 power regulator for
exynos5250-snow") which AFAIU was good enough for your workflow.

Best regards,
Javier

[0]: https://www.mail-archive.com/linux-sunxi@googlegroups.com/msg06623.html
