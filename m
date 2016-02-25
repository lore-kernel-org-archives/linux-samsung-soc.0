From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 3/7] drivers: soc: EXYNOS drivers for v4.6
Date: Thu, 25 Feb 2016 13:50:20 +0900
Message-ID: <56CE880C.8090703@samsung.com>
References: <1455496446-23779-1-git-send-email-k.kozlowski@samsung.com>
 <1455496446-23779-4-git-send-email-k.kozlowski@samsung.com>
 <20160224222254.GT10126@localhost> <56CE4E14.2050701@samsung.com>
 <56CE80C1.8040801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:37183 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757934AbcBYEua (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 23:50:30 -0500
In-reply-to: <56CE80C1.8040801@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>, Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Fedin <p.fedin@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On 25.02.2016 13:19, pankaj.dubey wrote:
> Hi Krzysztof,
> 
>>>
>>> OMAP has GPMC drivers under drivers/memory. I wonder if SROM should go there
>>> too, since it's a quite similar bus.
>>
>> I wish I get this feedback before, when we were discussing the SROM
>> patches. :/
>>
>> Indeed this sounds reasonable. On some boards the omap-gpmc is used for
>> the same purpose: interfacing to smsc,lan9115 (like on SMDK5410).
>>
>>
>>> Feel free to respin this without SROM now, so we can get the other pieces in
>>> sooner and then revisit the SROM asyncronously. That'll remove the dependencies
>>> on DT as well.
>>
>> Okay, I'll rebase all drivers/soc branches and respin the pull request
>> so PMU driver and other stuff could go in.
>>
>> BTW, just in case, although PMU stands for "Power Management Unit" I
>> don't think it should be placed under drivers/power because it is not a
>> avs/charger/battery/reset driver. Existing power-related drivers are
>> under driver/soc (bcm, dove, tegra).
>>
>> Re-work of SROM drivers could be started on top of it.
>>
> 
> Please let me know if I need to take care of any of this work.

Yes, unfortunately I need your help with that.

I rebased mach-exynos/drivers-soc related patches and pushed it to my
next/soc branch:
https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/log/?h=next/soc

There are some changes in commits, mostly for movement of PMU driver
(now it is applied first, before SROMc driver). I also applied some of
the cleanup and maintainer patches from SROMc patchset. DT changes are
already merged.

Overall, could you rebase remaining patches on top of my next/soc and
move SROM driver to drivers/memory? You can also rebase Pavel Fedin's
patches (if you don't I will rebase them).


Last version of applied SROMc patches is here:
https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/log/?h=for-v4.6/drivers-soc-exynos-srom-pmu

Best regards,
Krzysztof
