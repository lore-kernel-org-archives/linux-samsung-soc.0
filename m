From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Support Suspend-to-RAM on EXYNOS5420
Date: Sat, 21 Dec 2013 12:36:37 +0530
Message-ID: <CAM4voanaq9MPK=icad+5DVSBfT39XdM581txKs_skS7aB-DKBg@mail.gmail.com>
References: <1387195271-3613-1-git-send-email-a.kesavan@samsung.com>
	<2459303.277Jr8aotM@amdc1032>
	<CAM4voamU5hc7uC5MTOA7OtYuqpsis7cTX3sx0UrmpdZx7_TpzA@mail.gmail.com>
	<CANruHrS1D8d_y43xa-2OGduTvAGWfdeY1REVzZ6YJHjhzLg+hw@mail.gmail.com>
	<CAM4voamD4Cj594fbkciNS32U7PSkByxakZmjPnhFo0mpCj8hug@mail.gmail.com>
	<CAOesGMjfcTki4qqD-ZP2zt3ERLRF9DX5_K5rfJXfx1KGa5bG-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:54013 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944Ab3LUHGi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Dec 2013 02:06:38 -0500
Received: by mail-qc0-f178.google.com with SMTP id i17so3175079qcy.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 23:06:37 -0800 (PST)
In-Reply-To: <CAOesGMjfcTki4qqD-ZP2zt3ERLRF9DX5_K5rfJXfx1KGa5bG-g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: sunil joshi <sjoshi.open@gmail.com>, abrestic@chromium.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Douglas Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Olof,

On Sat, Dec 21, 2013 at 2:52 AM, Olof Johansson <olof@lixom.net> wrote:
> On Fri, Dec 20, 2013 at 3:38 AM, Abhilash Kesavan
> <kesavan.abhilash@gmail.com> wrote:
>> Hi Sunil,
>>
>> On Fri, Dec 20, 2013 at 3:56 PM, sunil joshi <sjoshi.open@gmail.com> wrote:
>>> Hi Abhilash,
>>> I saw another patch in chrome tree ..by Andrew Bresticker
>>> which may be relevant here ..
>>>
>>> Just wondering if you missed adding this ? or this is not needed ?
>>> You did not face any issue in getting core to suspend ?
>>
>> This has not been added for Exynos5250 in mainline yet. We did notice
>> that the system would fail to suspend on the rare occasion (~1% of the
>> time on exynos5250) when we repeatedly suspended and resumed the
>> system.
>>
>> I have not run s2r stress tests, but have had no issues suspending the
>> system in my limited testing. We can probably let this be for now as
>> the system would resume fine even on a failed suspend. I will do some
>> stress testing and then post if needed.
>
> Hold on, you're claiming that this patch you've posted has only seen
> very limited testing, and that you are aware of failures?
>
> Don't merge known-broken code into the mainline kernel.
I have tested this patch on an 5250-snow and SMDK5420 through 30
cycles without any failure. Yes, I have seen failures on a 3.4
chromium kernel on an exynos5250 during stress testing. Mainline
kernel is significantly different from what we are carrying in 3.4 or
3.8 chromium and the reason for me not adding the GIC patch was that
it was a hack in the first place. The basic S2R functionality works
fine, but if you'd rather have it pass a stress test of say a 1000
cycles then let me do the same and provide you with the results.

>
>
> -Olof
