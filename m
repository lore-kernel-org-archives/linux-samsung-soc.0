From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 2/7] ARM: dts: Exynos DT dependency for v4.6
Date: Thu, 25 Feb 2016 09:13:31 +0900
Message-ID: <56CE472B.5020201@samsung.com>
References: <1455496446-23779-1-git-send-email-k.kozlowski@samsung.com>
 <1455496446-23779-3-git-send-email-k.kozlowski@samsung.com>
 <20160224222319.GU10126@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34322 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802AbcBYANl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 19:13:41 -0500
In-reply-to: <20160224222319.GU10126@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, Pavel Fedin <p.fedin@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On 25.02.2016 07:23, Olof Johansson wrote:
> On Mon, Feb 15, 2016 at 09:34:01AM +0900, Krzysztof Kozlowski wrote:
>> Hi Arnd, Kevin and Olof,
>>
>> Early DT changes for v4.6, needed before removal of SROM support
>> from mach-exynos.
>>
>> Kind regards,
>> Krzysztof
>>
>>
>> The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:
>>
>>   Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-srom-4.6
>>
>> for you to fetch changes up to d2deef6c61e65d1e0cee40c1d74fa99007da8c84:
>>
>>   ARM: dts: Add SROM to exynos5410 (2016-01-25 10:32:07 +0900)
>>
>> ----------------------------------------------------------------
>> Device Tree changes for v4.6 adding the nodes for Exynos SROM controller
>> driver. The driver saves and restores SROM registers during suspend to RAM.
>> DT changes should go in before removal of SROM support from mach-exynos.
>>
>> ----------------------------------------------------------------
>> Pankaj Dubey (2):
>>       ARM: dts: Add SROM device node for exynos4
>>       ARM: dts: Add SROM device node for exynos5
>>
>> Pavel Fedin (1):
>>       ARM: dts: Add SROM to exynos5410
> 
> Hi,
> 
> Please use the format:
> 
> ARM: dts: exynos: ...
> 
> in the future.

Sure! I was using it before... but switched to Kukjin's format.

Thanks for merging,
Krzysztof
