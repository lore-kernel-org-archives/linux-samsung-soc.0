From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 08 Sep 2014 13:55:29 +0200
Message-ID: <540D9931.6050603@collabora.co.uk>
References: <20140905115704.GO13515@arm.com> <20140905122232.GP13515@arm.com> <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com> <540C202E.2060009@collabora.co.uk> <540C7F5B.6070307@gmail.com> <540C83DE.10505@collabora.co.uk> <540C8577.2070907@gmail.com> <20140908112112.GK26030@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33626 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753095AbaIHLze (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 07:55:34 -0400
In-Reply-To: <20140908112112.GK26030@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>

Hello Will,

On 09/08/2014 01:21 PM, Will Deacon wrote:
> On Sun, Sep 07, 2014 at 05:19:03PM +0100, Tomasz Figa wrote:
>> At least for next 3.17-rc I'd suggest fixing this up in respective clock
>> driver and dropping the hack only after Exynos DRM patches are merged
>> and confirmed working.
> 
> Whilst I'm sympathetic to people working to enable DRM, I think this is
> the right solution to the problem. The transition from simplefb to DRM
> shouldn't break display for a bunch of kernel revisions whilst the code is
> in flux.
> 

Agreed, I'm preparing a patch-set to prevent the kernel to disable both the
clocks and regulators needed for the display, I'll try to post it today or
tomorrow at worst.

> Will
> 

Best regards,
Javier
