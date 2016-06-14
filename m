From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [GIT PULL 8/8] ARM: defconfig: exynos: Defconfig for v4.8
Date: Tue, 14 Jun 2016 14:03:40 -0400
Message-ID: <a1239955-19cb-92f1-30c8-d354bacc34de@osg.samsung.com>
References: <1465215933-22709-1-git-send-email-k.kozlowski@samsung.com>
 <1465215933-22709-9-git-send-email-k.kozlowski@samsung.com>
 <20160613222423.GA29879@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:51437 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752365AbcFNSDz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 14:03:55 -0400
In-Reply-To: <20160613222423.GA29879@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

Hello Olof,

On 06/13/2016 06:24 PM, Olof Johansson wrote:
> On Mon, Jun 06, 2016 at 02:25:33PM +0200, Krzysztof Kozlowski wrote:
>>
>> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
>>
>>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.8
>>
>> for you to fetch changes up to 4b388071a2235ed8f05d05d069f5a5a29782a8c5:
>>
>>   ARM: exynos_defconfig: Save defconfig on current linux-next (2016-06-06 08:36:55 +0200)
>>
>> ----------------------------------------------------------------
>> Samsung defconfig update for v4.8:
>> 1. Disable big.LITTLE switcher so the cpufreq-dt could be enabled.
>> 2. Enable Samsung media platform drivers.
>> 3. Enable some board-specific drivers for boards: Trats2, Universal C210.
>> 4. Few more minor additions.
> 
> Hmm. So this made me wonder what's used on the 5420/5800 chromebooks, but it

You mean as CPUFreq driver? It's used cpufreq-dt as well but the compatible
strings for exynos5420/5800 are not registered when the switcher is enabled.

> looks like they don't even boot with SMP, at least not the way I boot them
> (with u-boot as a chainloaded kernel).
>

All 8 cores for the Exynos5420/5800 Chromebooks have been brought up via MCPM
for a long time in mainline, look for example at Kevin's Peach Pi boot log [0].

This is also true when chainloading u-boot (that's my setup as well), but I see
that only one CPU is powered up on your boot farm indeed [1].

I'm using the latest ChromeOS u-boot and chain loading u-boot version 2016.01.
 
> Branch merged.
> 
> 
> -Olof
> 

[0]: https://storage.kernelci.org/next/next-20160614/arm-exynos_defconfig/lab-baylibre-seattle/boot-exynos5800-peach-pi.html
[1]: http://arm-soc.lixom.net/bootlogs/next/next-20160614/pi-arm-exynos_defconfig.html 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
