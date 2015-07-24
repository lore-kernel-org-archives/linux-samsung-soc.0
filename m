From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL] Non-critical fixes for v4.3
Date: Fri, 24 Jul 2015 20:49:06 +0900
Message-ID: <CAJKOXPcEFmOnffViq8X+NxmAB=_wLKj9oLHy28dpYqp4z4QnQQ@mail.gmail.com>
References: <1437719695-22340-1-git-send-email-k.kozlowski@samsung.com>
	<359442387.iGIak59Qte@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48]:34077 "EHLO
	mail-qg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751715AbbGXLtG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jul 2015 07:49:06 -0400
In-Reply-To: <359442387.iGIak59Qte@amdc1976>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

2015-07-24 20:04 GMT+09:00 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>:
>
> Hi,
>
> On Friday, July 24, 2015 03:34:55 PM Krzysztof Kozlowski wrote:
>> Dear Kukjin,
>>
>> Previously you did not picked up the fix for cpufreq memory leak.
>> I am sending it again with respective acks from LKML. Also another
>> minor improvement in the set.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit 1c4c7159ed2468f3ac4ce5a7f08d79663d381a93:
>>
>>   Merge tag 'ext4_for_linus_stable' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4 (2015-07-05 16:24:54 -0700)
>>
>> are available in the git repository at:
>>
>>
>>   https://github.com/krzk/linux.git tags/samsung-fixes-non-critical-v4.3-2
>>
>> for you to fetch changes up to 434213f727c12fab8657c8db3d23da4b0463365d:
>>
>>   video: fbdev: s3c-fb: Constify platform_device_id (2015-07-24 15:17:32 +0900)
>>
>> ----------------------------------------------------------------
>> Improvements for Exynos boards:
>> 1. Fix memory leak in cpufreq error path.
>> 2. Constify platform_device_id in video/fbdev/s3c-fb.
>>
>> ----------------------------------------------------------------
>> Krzysztof Kozlowski (1):
>>       video: fbdev: s3c-fb: Constify platform_device_id
>>
>> Shailendra Verma (1):
>>       cpufreq: exynos: Fix for memory leak in case SOC name does not match
>
> I would suggest merging this fix in v4.2 not v4.3:
>
> - it is obvious and touches only error paths

Indeed, good point, thanks for pointing this. Although these are not
regressions for issues introduced in current release but they are are
non-intrusive.

Kukjin, do you agree? Can you pull them for second round of v4.2 fixes (not 4.3)

>
> - (hopefully) in v4.3 the exynos-cpufreq driver will be completely
>   replaced by using cpufreq-dt for Exynos platforms (thus there will be
>   no benefits of having this fix in v4.3 but there will be potential
>   risk of merge conflicts due to exynos-cpufreq driver removal)
>

We'll see... The Exynos 4x12 requires OPP patches. Are these ready for 4.3?

Best regards,
Krzysztof
