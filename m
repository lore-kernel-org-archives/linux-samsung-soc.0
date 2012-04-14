From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH][RESEND] ARM: SAMSUNG: make SAMSUNG_PM_DEBUG select DEBUG_LL
Date: Sat, 14 Apr 2012 08:44:49 -0700
Message-ID: <4F899B71.1090303@samsung.com>
References: <201203202120.45806.heiko@sntech.de> <4F6B398A.8040703@samsung.com> <201204121411.55054.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:58485 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751922Ab2DNPoy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Apr 2012 11:44:54 -0400
Received: by obbta14 with SMTP id ta14so1809598obb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Apr 2012 08:44:53 -0700 (PDT)
In-Reply-To: <201204121411.55054.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>

On 04/12/12 05:11, Heiko St=FCbner wrote:
> Am Donnerstag, 22. M=E4rz 2012, 15:39:06 schrieb Kukjin Kim:
>> On 03/20/12 13:20, Heiko St=FCbner wrote:
>>> From: Maurus Cuelenaere<mcuelenaere@gmail.com>
>>>
>>> When selecting SAMSUNG_PM_DEBUG, it complains about a missing
>>> printascii() function if you do not select DEBUG_LL, so make the fo=
rmer
>>> select the latter.
>>>
>>> Signed-off-by: Maurus Cuelenaere<mcuelenaere@gmail.com>
>>> Acked-by: Heiko Stuebner<heiko@sntech.de>
>>> ---
>>> This was originally sent in september 2010, but seems to have been
>>> forgotten. As this problem has bitten me today, here it is again.
>>
>> Yeah, missed. Looks good to me and will apply.
>
> thanks, but it seems I can't find it in the linux-samsung git current=
ly.
>
> Any news on this?
>
Oops, I didn't push :( thanks for your reminder.

You can see it now :)

Ah one more note will look at your s3c24xx patches in the beginning of=20
next week, sorry for late.

Thanks.

Best regards,
Gene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
