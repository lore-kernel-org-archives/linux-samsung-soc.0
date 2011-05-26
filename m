From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH 7/7] ARM: Exynos4: Add clkdev support
Date: Thu, 26 May 2011 08:21:56 +0530
Message-ID: <BANLkTim=bgsFx+xN3mDU+WMMeuC=yCT1qw@mail.gmail.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
	<1305839906-1815-8-git-send-email-thomas.ab@samsung.com>
	<4DDD75ED.2010805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:49888 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751974Ab1EZCv5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 22:51:57 -0400
Received: by gyd10 with SMTP id 10so121560gyd.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 19:51:56 -0700 (PDT)
In-Reply-To: <4DDD75ED.2010805@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Mr. Kukjin Kim,

On Thu, May 26, 2011 at 3:04 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> On 05/19/11 14:18, Thomas Abraham wrote:
>>
>> Add clkdev support for Samsung's Exynos4 platform.
>>
>> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
>> ---
>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A01 +
>> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 6=
3
>> +++++++++++++++++++++++++--
>> =A0arch/arm/mach-exynos4/include/mach/clkdev.h | =A0 =A07 +++
>> =A0arch/arm/mach-exynos4/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +
>> =A04 files changed, 69 insertions(+), 4 deletions(-)
>> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>>
>
> (snip)
>
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 4,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "dwmmc",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>
> This change should be split :)

Ok. I will move these changes to another patch.

Thanks,
Thomas.

>
> (snip)
>
>> @@ -1072,8 +1127,8 @@ static struct clksrc_clk clksrcs[] =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.reg_div =3D { .reg =3D S5P_CLKDIV_FS=
YS2, .shift =3D 24, .size =3D
>> 8 },
>> =A0 =A0 =A0 =A0}, {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =
=A0 =3D "sclk_mmc",
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0=
 =A0 =3D 4,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =
=A0 =3D "sclk_dwmmc",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0=
 =A0 =3D -1,
>
> Same as above.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
