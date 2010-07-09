From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Requested features for next merge on s5pc110
Date: Fri, 9 Jul 2010 10:57:50 +0900
Message-ID: <AANLkTin7FWTf7SMGkyCxcTmfEmo21OrovYj7hz3QAeSJ@mail.gmail.com>
References: <AANLkTim58_kJFO0vjTXufYc0DkLhT-nVv25trxgjmsFk@mail.gmail.com>
	<022e01cb1f08$319726e0$94c574a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:49372 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751281Ab0GIB5v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Jul 2010 21:57:51 -0400
Received: by pxi14 with SMTP id 14so563460pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Jul 2010 18:57:50 -0700 (PDT)
In-Reply-To: <022e01cb1f08$319726e0$94c574a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Marek Szyprowski <m.szyprowski@samsung.com>, =?EUC-KR?B?x9S47cHW?= <myungjoo.ham@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Iqbal <iqbal.ams@samsung.com>, Singh Madhav <singh.madhav@samsung.com>

2010/7/9 Kukjin Kim <kgene.kim@samsung.com>:
> Kyungmin Park wrote:
>>
>> Hi Kukjin,
>>
> Hi,
>
>> Before next merge window, I hope these features will be included.
>> If your team is done already, please reply it. If not, our team will=
 do
> it.
>>
>> 1. High-resolution timer using timer 4 and systimer.
>> =A0 =A0 other timer 1, 2, 3, is used
>
> HR-Timer patch for S5P SoCs will be submitted in a few days. And mayb=
e used
> 2 PWM Timers because S5P6440 does not have System Timer.
>
> Also, will be submitted specific SoC support HR-Timer together..but I=
'm not
> sure whether used timer4 and systimer.

Then make it configurable, In case of s5pc110, LSI guided to use the
RTC and systimer for deep sleep.
We will prepare it.

>
>>
>> 2. Basic suspend & resume feature.
>> =A0 =A0 No clock gating, and cpufreq. Of course I hope it's included=
=2E
>>
> Now preparing re-submit..so maybe can be submitted soon.

Please see the Mr. Ham patch also.

>
>> 3. Aquila & goni board support.
>> =A0 =A0 If possible all feature are included at current maineline ke=
rnel
>> implemented.
>>
>> If I'm missing one features, please let me know,
>>
>> Give your opinions.
>>
> Need to sort out items for merge window..and will inform soon.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
