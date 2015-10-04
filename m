From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL] Samsung fixes for v4.3
Date: Mon, 05 Oct 2015 08:59:05 +0900
Message-ID: <5611BD49.5030806@samsung.com>
References: <1443571154-28722-1-git-send-email-k.kozlowski@samsung.com>
 <560B864A.9050400@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45288 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751835AbbJDX7T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Oct 2015 19:59:19 -0400
In-reply-to: <560B864A.9050400@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>

On 30.09.2015 15:50, Kukjin Kim wrote:
> On 09/30/15 08:59, Krzysztof Kozlowski wrote:
>> Dear Kukjin,
>>
>> Below you will find fixes for current release cycle which are not
>> present yet in your tree.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:
>>
>>   Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/krzk/linux.git tags/samsung-fixes-4.3
>>
>> for you to fetch changes up to c7d2ecd9f64c351cb4d551f1f472d0fc09c3cae8:
>>
>>   ARM: dts: Fix wrong clock binding for sysmmu_fimd1_1 on exynos5420 (2015-09-29 15:39:58 +0900)
>>
>> ----------------------------------------------------------------
>> Fixes for Exynos (DT and mach code):
>> 1. Finally fix booting of all 8 cores on Exynos Octa (Exynos542x): all
>>    8 cores are booting and can be used. The fix, based on vendor
>>    code and bootloader behavior, is as for time being only
>>    for MCPM enabled path.
>> 2. Fix thermal boot issue on SMDK5250.
>> 3. Fix invalid clock used for FIMD IOMMU.
>>
> Pulled, thanks.
> 
> Note it will be sent to upstream in a day.

A day extended to a week. Please do not hold the fixes but send them. If
they reached Linus tree late and they required any further fix, then we
would have less time for any updates.

The same applies for regular pull request for 4.4. For previous v4.3
release many changes were too late (so they could even slip from 4.3 to
4.4). Can we just avoid such issues and send pull requests earlier?

Best regards,
Krzysztof
