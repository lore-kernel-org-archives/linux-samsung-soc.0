From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3 0/6] Introducing Exynos ChipId driver
Date: Mon, 12 May 2014 10:52:22 +0900
Message-ID: <53702956.6060607@samsung.com>
References: <1399706287-13919-1-git-send-email-y@samsung.com>
 <CAOesGMi9J=03NY+0FFTusMnMG_Xu--zLnX=QbiG=ym2n=tn8ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30811 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbaELBeI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 May 2014 21:34:08 -0400
In-reply-to: <CAOesGMi9J=03NY+0FFTusMnMG_Xu--zLnX=QbiG=ym2n=tn8ow@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Arnd Bergmann <arnd@arndb.de>

On 05/11/2014 04:12 PM, Olof Johansson wrote:
> Hi,
>
> On Sat, May 10, 2014 at 12:18 AM,  <y@samsung.com> wrote:
>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>
>> This patch series attempts to get rid of soc_is_exynosXXXX macros
>> and eventually with the help of this series we can probably get
>> rid of CONFIG_SOC_EXYNOSXXXX in near future.
>> Each Exynos SoC has ChipID block which can give information about
>> SoC's product Id and revision number. Currently we have single
>> DT binding information for this as "samsung,exynos4210-chipid".
>> But Exynos4 and Exynos5 SoC series have one small difference in
>> chip Id, with resepect to product id bit-masks. So it means we
>> should have separate compatible string for these different series
>> of SoCs. So I have added second compatible string for handling
>> this difference.
>> This patch series is based on Kukjin Kim's for-next (3.14_rc1 tag)
>> and prepared on top of following patch series and it's dependent
>> patch series.
>>
>> [1]: Map SYSRAM through generic SRAM bindings by Sachin Kamat.
>>          http://www.spinics.net/lists/arm-kernel/msg327677.html
>> [2]: Exynos PMU cleanup and refactoring.
>>          https://lkml.org/lkml/2014/4/30/44
>> [3]: Introduce drivers/soc and add QCOM GSBI driver.
>>          https://lkml.org/lkml/2014/4/24/520
>>
>> Revision 2 and it's discussion can be found here
>>   - https://lkml.org/lkml/2014/5/6/100
> As I just realized when I commented on the last patch in the patchset
> (the cpufreq section): I think you can, and should, use
> of_machine_is_compatible() for most of these cases, instead of using a
> new API through a chipid driver. Since all boards based on an SoC
> should have that in the string of compatibles, it's a shared and easy
> way to handle this without adding custom drivers per manufacturer.
I am sorry, I could not see your comments in my last patch-set.

Anyway, thanks for review. During first version of this patch, I had
discussion with Arnd [1], and it looks like he do not like idea of using
"of_machine_is_compatible".

[1]: https://lkml.org/lkml/2014/5/5/126
       and
https://lkml.org/lkml/2014/5/5/335

So my proposal was till we get generic solution for all files
under mach-exynos let's use chip-id driver provided APIs.

Also chip-id driver is not only for providing this API but also
to provide SoC specific information as a sysfs entry to userspace.
So even though we do not want to use chipid driver API's
for identifying SoCs we can keep this driver.

So let us discuss again and decide which will be best way
(at the same time less overhead) solution for removing usage
of soc_is_exynosXYZ and related CONFIG macros from exynos.

@Arnd and Tomasz, I would appreciate if you spent some time
to review this series as I have addressed many of your
review comments.

> There will possibly be some cases where it doesn't fit well, but for
> nearly all cases it should be sufficient.
>
> (The patchset contains some other good cleanups, of course you should
> keep those).

Thanks and sure, I would like those should get merged.

>
> -Olof
>


-- 
Best Regards,
Pankaj Dubey
