From: Giridhar Bachalli Maruthy <giridhar.maruthy@linaro.org>
Subject: Re: [PATCH] SAMSUNG: S5PV310: Add I2S playback support
Date: Thu, 10 Mar 2011 16:38:23 +0530
Message-ID: <AANLkTinoFkWABtHbWB8FB77fXjJziuTX9=mdESQ7vxQF@mail.gmail.com>
References: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
	<AANLkTikoUUJmp6=PnumaCF8JD6pec9KZj_dFbOu66Smo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:37650 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751394Ab1CJLIY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 06:08:24 -0500
Received: by iyb26 with SMTP id 26so1414003iyb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2011 03:08:23 -0800 (PST)
In-Reply-To: <AANLkTikoUUJmp6=PnumaCF8JD6pec9KZj_dFbOu66Smo@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <claude.youn@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Claude,

On 10 March 2011 15:38, Seungwhan Youn <claude.youn@gmail.com> wrote:
> Hi,
>
> On Tue, Mar 8, 2011 at 7:40 PM, Giridhar Maruthy
> <giridhar.maruthy@linaro.org> wrote:
>> This commit adds the platform device and data of
>> wm8994 regulator to enable the I2S playback on
>> S5PV310 board on linux-linaro-2.6.38.
>>
>> Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos4/mach-smdkv310.c | =A0167 ++++++++++++++++++=
++++++++++++++-
>> =A01 files changed, 166 insertions(+), 1 deletions(-)
>>
>
> I'm so sad about this patch is pretty much same as my previous patch,
> "ARM: SMDKC210: Add regulator settings for WM8994
> audio"(http://git.kernel.org/?p=3Dlinux/kernel/git/kki_ap/linux-2.6-s=
amsung.git;a=3Dcommitdiff;h=3D1307c0dac85bc5e5f26de4f615040a2b06eb64ac)=
,
> and there is no comment about this source comes from in your patch.
> But, I think that you just _forgot_ to write this comment and you wil=
l
> add it into your re-worked patch. ;)
>
> Thanks,
> Claude.
>
Thanks for the link. Actually I had completely missed that out.
I will be adding appropriate _Signed-off-by_ when I resubmit the patch.

Regards,
Giridhar
