From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/2] ARM: exynos: Enable TMU support in exynos platforms
Date: Tue, 24 Jul 2012 12:20:33 +0530
Message-ID: <CAK9yfHwGU8EWsXoY9_gDn5=zyJhqtaZbKXzwyGais8u0iaL8xA@mail.gmail.com>
References: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
	<117e01cd60ea$99f24e60$cdd6eb20$%kim@samsung.com>
	<20120713144138.GB25264@roeck-us.net>
	<CADGdYn5mrHVBEhYF-Zv1UJK1YtVNk=kBA98xOdWevRU+_tu6cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:32975 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754614Ab2GXGue (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jul 2012 02:50:34 -0400
Received: by vcbfk26 with SMTP id fk26so5536125vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jul 2012 23:50:33 -0700 (PDT)
In-Reply-To: <CADGdYn5mrHVBEhYF-Zv1UJK1YtVNk=kBA98xOdWevRU+_tu6cg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: amit kachhap <amit.kachhap@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lenb@kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi Amit,

On 14 July 2012 12:55, amit kachhap <amit.kachhap@gmail.com> wrote:
> On Fri, Jul 13, 2012 at 8:11 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On Fri, Jul 13, 2012 at 08:28:18PM +0900, Kukjin Kim wrote:
>>> Amit Daniel Kachhap wrote:
>>> >
>>> > These TMU enablement patches are needed for exynos4 and exynos5 TMU
>>> > driver patches sent earlier. The link for those are
>>> > http://www.spinics.net/lists/lm-sensors/msg35858.html.
>>> >
>>> How was going on above patches? I can't see them you said in linux-next now,
>>> it means if I apply this series in my tree, problem will be happened :(
>>>
>>> Note1: I've seen Rafael's updating exynos4_tmu patch which is using struct
>>> dev_pm_ops for pm and applied by Guenter.
>>>
>> If that is in the way, I can drop it, to be applied after the move. Let me know.
>> There is now another patch pending, to convert the driver to use devm_ functions.
>> Please let me know what you want me to do with it.
>>
> Hi Guenter,
>
> I rebased my V5 patch series with  hwmon-next branch so Rafael's pm
> changes are already included. Regarding the devm_ patch by sachin
> please hold it.

Guenter has already sent the pull request to Linus for v3.6 [1].
That does not include your patches. I do not understand why you want
to hold back my patch when you can rebase your series on top of it.

[1] https://lkml.org/lkml/2012/7/23/414



>
> Thanks,
> Amit D
>>> Note2: would be helpful if you could do adding me in Cc of exynos tmu
>>> patches...
>>>
>> If you want to be copied, it might make sense to add yourself as maintainer for
>> this file. Otherwise you can not expect people to know.
>>
>> Thanks,
>> Guenter
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
