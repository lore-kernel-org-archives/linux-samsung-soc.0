From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Thu, 23 Oct 2014 10:54:34 +0900
Message-ID: <54485FDA.8070508@samsung.com>
References: <7133556.456161412823997169.JavaMail.weblogic@epml02>
 <7hzjd4lxc5.fsf@deeprootsystems.com> <loom.20141015T133306-266@post.gmane.org>
 <CAMAWPa8ANvzaC4EfvRbwCZSya6xt=u6qmvN5cF1jhAROTdW3Pg@mail.gmail.com>
 <54485433.2040008@samsung.com> <54485730.10803@samsung.com>
 <CAGc3s_cS4zYUtdB=+8bPh2sa4Exy5guzupu-TvgJ_KmuyGGBPg@mail.gmail.com>
 <54485B99.2000703@samsung.com>
 <CAGc3s_e86Lx+pF12osoKoROXq4rUNf_GQtfJ8xB9w-X4pGVOmQ@mail.gmail.com>
 <54485E99.9020004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47813 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753710AbaJWBy1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 21:54:27 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NDV00HJ5JYPRU20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Oct 2014 10:54:25 +0900 (KST)
In-reply-to: <54485E99.9020004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mauro Ribeiro <mdrjr0@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, a.kesavan@samsung.com, k.chander@samsung.com, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, abhijeet@abhijeet-dev.net, "kgene.kim@samsung.com >> Kukjin Kim" <kgene.kim@samsung.com>

On 10/23/2014 10:49 AM, Joonyoung Shim wrote:
> Hi,
> 
> On 10/23/2014 10:42 AM, Mauro Ribeiro wrote:
>> Joonyoung,
>>
>> Abhilash looks to be the father of it...
>> Also I have no idea why I'm appearing as a commiter of that.. as me or
>> anyone from Hardkernel doesn't have access to that github account or
>> contributed to it.
>> I do have a 3.17 branch here locally on my computer but its not public anywhere.
> 
> You are just author of the patch on github and it was committed to github by Abhilash.

Sorry, not Abhilash, by Abhijeet Dev <abhijeet@abhijeet-dev.net>, i don't know who he is.

> 
> Thanks.
> 
>>
>> On Wed, Oct 22, 2014 at 11:36 PM, Joonyoung Shim
>> <jy0922.shim@samsung.com> wrote:
>>> On 10/23/2014 10:25 AM, Mauro Ribeiro wrote:
>>>> Joonyoung,
>>>>
>>>> This patch was provided by Samsung and if someone can explain is you
>>>> guys from Samsung.
>>>> I have no idea of the logics behind this or what it would take to fix it.
>>>> Keep in mind that our u-boot and kernel (downstream 3.10) is part of
>>>> Samsung provided BSP.
>>>> Would be nice if you guys could explain this.
>>>>
>>>
>>> Mauro,
>>>
>>> Thanks to reply, do you know author of this patch written by Samsung?
>>>
>>>
>>> To Kukjin,
>>>
>>> The patch[1] seems to come from S.LSI guys, could you contact about this?
>>>
>>> [1]: https://github.com/abhijeet-dev/linux-samsung/commit/553b7f40465ab4fad6c270f289cd4780942f7fae
>>>
>>>>
>>>>
>>>> On Wed, Oct 22, 2014 at 11:17 PM, Joonyoung Shim
>>>> <jy0922.shim@samsung.com> wrote:
>>>>> Add Cc the patch author and committer from github.
>>>>>
>>>>> On 10/23/2014 10:04 AM, Joonyoung Shim wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 10/17/2014 09:06 PM, Kevin Hilman wrote:
>>>>>>> On Wed, Oct 15, 2014 at 4:35 AM, Joonyoung Shim <jy0922.shim@samsung.com> wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Kevin Hilman <khilman <at> kernel.org> writes:
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Hi hdmi_resources_init,
>>>>>>>>>
>>>>>>>>> Abhilash Kesavan <a.kesavan <at> samsung.com> writes:
>>>>>>>>>
>>>>>>>>>> I had noticed a similar issue where only 6 cores would come up during
>>>>>>>>>> development on 5420. This was because there was a check in our u-boot
>>>>>>>>>> secondary boot-up path which would put a core into WFI if a flag was
>>>>>>>>>> not present and hence fail to boot. I wonder if it is the same
>>>>>>>>>> situation in your case too.
>>>>>>>>>> Is the u-boot for odroid-xu3 publically available or can you check if
>>>>>>>> there is any such code present in your
>>>>>>>>> secondary bring-up path.
>>>>>>>>>
>>>>>>>>> I'm using the hardkernel u-boot[1], branch: odroidxu3-v2012.07.  I'm
>>>>>>>>> currently using the pre-built binaries that are in the
>>>>>>>>> sd_fuse/hardkernel directory of that branch, but I can rebuild u-boot if
>>>>>>>>> needed.
>>>>>>>>>
>>>>>>>>> I'm not very familiar with u-boot, but if f you have some pointers where
>>>>>>>>> to start looking in that code, that would be helpful.
>>>>>>>>>
>>>>>>>>> Kevin
>>>>>>>>>
>>>>>>>>> [1] https://github.com/hardkernel/u-boot.git
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>> It seems to need magic code.
>>>>>>>>
>>>>>>>> Please refer
>>>>>>>> https://github.com/abhijeet-dev/linux-samsung/commit/553b7f40465ab4fad6c270f289cd4780942f7fae
>>>>>>>
>>>>>>> Thanks, Abhilash had pointed me to the same code, and it works.  But...
>>>>>>>
>>>>>>> Can someone explain this "magic", ideally in the form of a changelog
>>>>>>> and patch submitted upstream?
>>>>>>>
>>>>>>
>>>>>> I also really wonder.
>>>>>>
>>>>>> One more problem, cpu0 doesn't boot after offline and system is halted.
>>>>>>
>>>>>> # echo 0 > /sys/devices/system/cpu/cpu0/online
>>>>>> [   28.027852] IRQ152 no longer affine to CPU0
>>>>>> [   28.028087] IRQ256 no longer affine to CPU0
>>>>>> [   28.028344] CPU0: shutdown
>>>>>> #
>>>>>> # echo 1 > /sys/devices/system/cpu/cpu0/online
>>>>>>
>>>>>> So, it's failed script[1] to test MCPM functionalities
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>> [1]: http://www.spinics.net/lists/arm-kernel/msg330946.html
>>>>>>
>>>>>
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
