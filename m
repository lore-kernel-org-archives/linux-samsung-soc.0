From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv4 0/5] devfreq: exynos: Fix minor issue and code clean to
 remove legacy method
Date: Mon, 24 Mar 2014 10:36:04 +0900
Message-ID: <532F8C04.7060204@samsung.com>
References: <1395284353-22458-1-git-send-email-cw00.choi@samsung.com>
 <532DA3BB.5090000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21708 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983AbaCXBgF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Mar 2014 21:36:05 -0400
In-reply-to: <532DA3BB.5090000@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, rafael.j.wysocki@intel.com, Tomasz Figa <t.figa@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On 03/22/2014 11:52 PM, Tomasz Figa wrote:
> Hi,
> 
> [fixing mistyped addresses of me and Bartlomiej]
> 
> On 20.03.2014 03:59, Chanwoo Choi wrote:
>> This patchset use SIMPLE_DEV_PM_OPS macro intead of legacy method and fix
>> probe fail if CONFIG_PM_OPP is disabled. Also, this patchset fix minor issue.
>>
>> Changes from v3:
>> - Discard patches related to DT support because DT support patch of patchset
>>    don't satisfy the basic of dt concept. So, I'm going to implement DT support
>>    patch regardless this patchset separately.
>> - Use SIMPLE_DEV_PM_OPS macro instead of SET_SYSTEM_SLEEP_PM_OPS macro
>> - Delete devfreq->profile->exit callback to improve readability when failure
>>    happen in probe().
>> - Add exynos5 patch to clean code
>>
>> Changes from v2:
>> - Add detailed description to Documentation/devicetree/bindings/exynos4_bus.txt
>>    and change patch description of patch#8
>> - Change the sequence of patchset in patch #1 ~ #4
>> - Fix minor issue
>>
>> Changes from v1:
>> - Add exynos4_bus.txt documentation for devicetree guide
>> - Fix probe failure if CONFIG_PM_OPP is disabled
>> - Fix typo and resource leak(regulator/clock/memory) when happening probe failure
>> - Add additionally comment for PPMU usage instead of previous PPC
>> - Split separate patch to remove ambiguous of patch
>>
>> Chanwoo Choi (5):
>>    devfreq: exynos4: Fix bug of resource leak and code clean on probe()
>>    devfreq: exynos4: Use SIMPLE_DEV_PM_OPS macro
>>    devfreq: exynos4: Add CONFIG_PM_OPP dependency to fix probe fail
>>    devfreq: exynos5: Use SIMPLE_DEV_PM_OPS macro
>>    devfreq: exynos5: Add CONFIG_PM_OPP dependency to fix probe fail
>>
>>   drivers/devfreq/Kconfig              |  2 ++
>>   drivers/devfreq/exynos/exynos4_bus.c | 43 ++++++++++++++++++++++--------------
>>   drivers/devfreq/exynos/exynos5_bus.c |  7 ++++--
>>   3 files changed, 34 insertions(+), 18 deletions(-)
>>
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 

Thanks for your review always.

Best Regards,
Chanwoo Choi
