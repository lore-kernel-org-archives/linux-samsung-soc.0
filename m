From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCHv3 1/3] ARM: Exynos: JPEG board definition
Date: Fri, 09 Mar 2012 11:02:11 -0800
Message-ID: <4F5A53B3.8060806@samsung.com>
References: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com> <1328095165-31628-2-git-send-email-andrzej.p@samsung.com> <001601cce726$3dee9080$b9cbb180$%kim@samsung.com> <008101cce739$9839f8f0$c8adead0$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:54677 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757566Ab2CITCP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 14:02:15 -0500
Received: by qcqw6 with SMTP id w6so1341181qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 11:02:13 -0800 (PST)
In-Reply-To: <008101cce739$9839f8f0$c8adead0$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

2012-02-09 =EC=98=A4=EC=A0=84 6:46, Marek Szyprowski =EC=93=B4 =EA=B8=80=
:
> Hello,
>
> On Thursday, February 09, 2012 1:28 PM Kukjin Kim wrote:
>
>>> ARM: Exynos: JPEG board definition
>>>
>>
>> [...]
>>
>>>
>>> +#define EXYNOS4_PA_JPEG			0x11840000
>>> +
>>>   #define EXYNOS4_PA_G2D			0x12800000
>>>
>>>   #define EXYNOS4_PA_I2S0			0x03830000
>>> @@ -164,6 +166,7 @@
>>>   #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
>>>   #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
>>>   #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
>>> +#define S5P_PA_JPEG			EXYNOS4_PA_JPEG
>>
>> I'm not sure we _really_ need to re-define for JPEG.
>> Why not just use EXYNOS4_PA_JPEG?
>
> The s5p-jpeg driver can be also used on S5PV210 so this approach seem=
s
> to be fine, the patch only lacks definitions for the S5PV210 series.
>
I mean, if we use still this style, re-definition for physical address=20
and interrupt number, it will break one kernel image with others.=20
Anyway, I will apply this and will sort it out next time.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
