From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Sat, 21 Nov 2015 18:40:13 +0900
Message-ID: <CAAQKjZPJhwuZ_wnSoU6ZpCCAVhHXfLFsNQeVxEbPXNwjrHy3Jg@mail.gmail.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <564DE209.8030004@osg.samsung.com> <564DE2DB.6050608@osg.samsung.com>
 <564DEFEC.50802@osg.samsung.com> <564EFD13.7040409@samsung.com> <564F48F1.9070205@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:36611 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755986AbbKUJkx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Nov 2015 04:40:53 -0500
Received: by ykdr82 with SMTP id r82so190701389ykd.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Nov 2015 01:40:52 -0800 (PST)
In-Reply-To: <564F48F1.9070205@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tyler Baker <tyler.baker@linaro.org>, Kevin Hilman <khilman@linaro.org>

2015-11-21 1:23 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.=
com>:
> Hello Inki,
>
> On 11/20/2015 07:59 AM, Inki Dae wrote:
>> Hi Javier,
>>
>> 2015=EB=85=84 11=EC=9B=94 20=EC=9D=BC 00:51=EC=97=90 Javier Martinez=
 Canillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> On 11/19/2015 11:55 AM, Javier Martinez Canillas wrote:
>>>>>>
>>>>>
>>>>> This series causes a boot failure on at least an Exynos5800 Peach=
 Pi
>>>>> Chromebook (tested myself) and seems to be the cause of other Exy=
nos
>>>>> boards failing to boot: http://kernelci.org/boot/?exynos&fail
>>>>>
>>>>> [snip]
>>>>>
>>>>>>   drm/exynos: add pm_runtime to Mixer
>>>>>>   drm/exynos: add pm_runtime to FIMD
>>>>>
>>>>> I had to revert these patches in order to get the machine in a bo=
otable
>>>>> state again, the sha1 hash for these patches in next-20151119 are=
:
>>>>>
>>>>> 045febd5f813 drm/exynos: add pm_runtime to FIMD
>>>
>>> On a closer look, only reverting the FIMD patch is enough
>>> to make at least the Exynos5800 Peach Pi to boot again.
>>
>> Thanks for report.
>>
>
> Thanks to you for the quick answer and providing a fix.
>
>> I assume that the issue is because above patch removed 'suspended' v=
ariable
>> for checking the suspend status in runtime so I revived it.
>>
>
> It seems your assumption was correct...
>
>> I'm not sure that the change could resolve the issue. Could you test=
 it
>> with the change again? I have no Exynos5800 Peach Pi board. :(
>>
>> For this, I pushed it to below exynos-drm/for-next branch,
>>       https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exyno=
s.git/commit/?h=3Dexynos-drm/for-next&id=3De84f43e2b2c3388694b0b3a58c2c=
4447f1fbae7c
>>
>> If the issue is resolved by the change then I will modify other patc=
hes for
>> DECON series. And if really so, there may be a corner case we missed=
=2E
>>
>
> ... since I reverted the offending commit and cherry-picked the one
> in your for-next branch and the machine booted again.

Great. I'll update and post the patch series again.

Thanks,
Inki Dae

>
>> Thanks,
>> Inki Dae
>>
>
> Best regards,
> --
> Javier Martinez Canillas
> Open Source Group
> Samsung Research America
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
