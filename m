From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/7] drivers: soc: EXYNOS drivers for v4.6
Date: Wed, 24 Feb 2016 17:35:25 -0800
Message-ID: <CAOesGMig_djAEfBjmU8Vu4jO+hR3w6JDAR8pPT1ze0sNck_4-g@mail.gmail.com>
References: <1455496446-23779-1-git-send-email-k.kozlowski@samsung.com>
	<1455496446-23779-4-git-send-email-k.kozlowski@samsung.com>
	<20160224222254.GT10126@localhost>
	<56CE4E14.2050701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:35525 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757581AbcBYBf1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 20:35:27 -0500
Received: by mail-yk0-f169.google.com with SMTP id r207so16380311ykd.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Feb 2016 17:35:26 -0800 (PST)
In-Reply-To: <56CE4E14.2050701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Pavel Fedin <p.fedin@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On Wed, Feb 24, 2016 at 4:43 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 25.02.2016 07:22, Olof Johansson wrote:
>> On Mon, Feb 15, 2016 at 09:34:02AM +0900, Krzysztof Kozlowski wrote:
>>> Hi Arnd, Kevin and Olof,
>>>
>>> This finally moves SROM controller and PMU code to separate
>>> driver under drivers/soc/samsung.
>>>
>>> Kind regards,
>>> Krzysztof
>>>
>>>
>>> The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:
>>>
>>>   Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-soc-srom-pmu-4.6
>>>
>>> for you to fetch changes up to 74a6659e8bf193066ba6bf365de66baa897aebb1:
>>>
>>>   drivers: soc: Add support for Exynos PMU driver (2016-01-25 10:46:59 +0900)
>>>
>>> ----------------------------------------------------------------
>>> A set of changes adding new drivers under drivers/soc/samsung:
>>>
>>> 1. Split code for handling SROM registers out of arm/mach-exynos
>>>    in to separate SROM controller driver under drivers/soc/samsung.
>>>    The driver will save and restore SROM registers during Suspend
>>>    to RAM.
>>>
>>> 2. Add to this SROM controller driver support for bank configuration
>>>    used by child devices. This allows usage of SMSC9115 Ethernet chip
>>>    on SMDK5410 (Exynos5410) directly connected to SROM controller.
>>
>> Hi,
>>
>> OMAP has GPMC drivers under drivers/memory. I wonder if SROM should go there
>> too, since it's a quite similar bus.
>
> I wish I get this feedback before, when we were discussing the SROM
> patches. :/

Yeah, I apologize -- I usually don't have the bandwidth to follow all
discussions, so I have to catch them when the pull requests come in.

I usually look up the discussions, this time I didn't.


>
> Indeed this sounds reasonable. On some boards the omap-gpmc is used for
> the same purpose: interfacing to smsc,lan9115 (like on SMDK5410).
>
>
>> Feel free to respin this without SROM now, so we can get the other pieces in
>> sooner and then revisit the SROM asyncronously. That'll remove the dependencies
>> on DT as well.
>
> Okay, I'll rebase all drivers/soc branches and respin the pull request
> so PMU driver and other stuff could go in.
>
> BTW, just in case, although PMU stands for "Power Management Unit" I
> don't think it should be placed under drivers/power because it is not a
> avs/charger/battery/reset driver. Existing power-related drivers are
> under driver/soc (bcm, dove, tegra).
>
> Re-work of SROM drivers could be started on top of it.

Sounds good, and yes -- those sound appropriate to have under
drivers/soc at least at this time.

(At some point in time we'll have to go through and cleanup
drivers/soc, but we're letting it grow at the moment).


-Olof
