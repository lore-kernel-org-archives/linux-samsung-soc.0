From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 1/5] Samsung non-critical-fixes for v4.3
Date: Tue, 04 Aug 2015 16:57:02 +0900
Message-ID: <55C0704E.7020907@samsung.com>
References: <55C06995.2030600@kernel.org> <55C06C2D.2010804@samsung.com>
 <052201d0ce8a$aba37790$02ea66b0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48339 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754940AbbHDH5G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Aug 2015 03:57:06 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NSJ00J00SR4BWA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Aug 2015 08:57:04 +0100 (BST)
In-reply-to: <052201d0ce8a$aba37790$02ea66b0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 04.08.2015 16:53, Kukjin Kim wrote:
> Krzysztof Kozlowski wrote:
>>
>> On 04.08.2015 16:28, Kukjin Kim wrote:
>>> Hi Arnd, Olof, Kevin,
>>>
>>> Here is Samsung non-critical-fixes for v4.3.
>>> Please pull.
>>>
>>> Thanks,
>>> Kukjin
>>>
>>> The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
>>>
>>>   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>> tags/samsung-non-critical-1
>>>
>>> for you to fetch changes up to 2cc6b813579415c4f627b08a043079bdc5b87a33:
>>>
>>>   ARM: EXYNOS: Use IOMEM_ERR_PTR when function returns iomem (2015-07-21
>>> 13:19:06 +0900)
>>>
>>> ----------------------------------------------------------------
>>> Samsung non-critical fixes for v4.3
>>>
>>> - fix sparse warning for returning iomem
>>> - fix clock-frequency of display timing0 for exynos3250-rinato
>>
> Hi,
> 
>> One more set, which we agreed for pushing to v4.2, is missing:
>> 1. cpufreq: exynos: Fix for memory leak in case SOC name does not match
> 
> As you can see in ml, I've sent it to Rafael because it would be handled in
> cpufreq tree not samsung tree/arm-soc tree.
> 
>> 2. video: fbdev: s3c-fb: Constify platform_device_id (this can actually
> 
> Same as above, this would be handled in fb tree? Can you please send it?

This was on LKML for 3 months (including a resend). As this is S3C frame
buffer I think this can go via samsung-soc tree, since fb guys did not
picked it.

On list of patches few more are also missing:
1. cpufreq: exynos: remove Exynos5250 specific cpufreq driver support
2. clk: samsung: exynos5250: add cpu clock configuration data and
instantiate cpu clock
3. defconfig changes (separate pull request?)

Best regards,
Krzysztof
