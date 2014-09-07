From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Sun, 07 Sep 2014 17:51:03 +0200
Message-ID: <540C7EE7.6030903@collabora.co.uk>
References: <20140905115704.GO13515@arm.com> <20140905122232.GP13515@arm.com> <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com> <540C202E.2060009@collabora.co.uk> <20140907150122.GK2601@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:32865 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752437AbaIGPvL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Sep 2014 11:51:11 -0400
In-Reply-To: <20140907150122.GK2601@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Mark,

On 09/07/2014 05:01 PM, Mark Brown wrote:
> On Sun, Sep 07, 2014 at 11:06:54AM +0200, Javier Martinez Canillas wrote:
> 
>> But maybe we could add a boot argument similar to "clk_ignore_unused" but for
>> regulators? Something like "regulator_ignore_unused" that would prevent the
>> regulator core to disable unused regulators? If Mark agrees with that idea
>> I'll be glad to propose a patch.
> 
> I'm not all that sympathetic to the idea; we already have quite enough
> quality problems with the way people hook up regulators without
> providing yet another way for them to hack around things, I'm concerned
> it'll just make things more fragile as people require magic command line
> arguments to get things working.
> 

I understand your position and I fully agree, I just was thinking aloud.

It seems the simplefb approach is somewhat fragile since the driver relies on
the bootloader to correctly setup the display hardware and its needed
resources (clock, regulators, etc) but also relies on the kernel to not
disable those resources even when they are unused from its point of view.

So, the best option for Will is to just use Ajay's proposed in-flight Exynos
DRM patches or if he really wants to have simplefb working then he can carry
the patch I shared to force tps65090 fet1 and fet6 regulators to be always on.

Best regards,
Javier
