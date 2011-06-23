From: Banajit Goswami <banajit.goswami@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Add PWM backlight support on Samsung SMDKV310
Date: Thu, 23 Jun 2011 15:42:09 +0530
Message-ID: <BANLkTikb33PCQtiVmcVm38-ptZPMXMk60g@mail.gmail.com>
References: <22693111.118621308725759945.JavaMail.weblogic@epv6ml03>
	<BANLkTi=SqB7NHQ7vStegFgQjihoQRmzVCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:53565 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759069Ab1FWKMK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 06:12:10 -0400
Received: by fxm17 with SMTP id 17so1175731fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2011 03:12:09 -0700 (PDT)
In-Reply-To: <BANLkTi=SqB7NHQ7vStegFgQjihoQRmzVCw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com

> From: JinGoo Han <jg1.han@samsung.com>
>
> Hi, Banajit.
Hi Jingoo,

>>
>> Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
>> ---
=2E..
<snip>
=2E..
>> + =C2=A0 =C2=A0 .pwm_period_ns =C2=A0=3D 78770,
> Please use 1000 as pwm_period_ns instead of 78770 as follows:
> - =C2=A0 =C2=A0 =C2=A0 .pwm_period_ns =C2=A0=3D 78770,
> + =C2=A0 =C2=A0 =C2=A0 .pwm_period_ns =C2=A0=3D 1000,
>
Yes, I will modify the period value and send updated patch

> The value '78770' makes noise related to resonance at LCD board.
>
> I will explain how I get the value of PWM period.
>
> The SMDK boards use LT3591 as backlight LED driver of LTE480WV LCD
> According to the LT3591 datasheet, the switching frequency should
> be 1MHz. So, PWM period is calculated by following formula:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0PWM period =3D 1/switching frequency
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 1/1MHz
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 1000 ns
>
Thanks for the explanation.

> You can find LT3591 datasheet easily on the Internet. Please refer to=
 it
> for more information.
> Good luck.
Thanks you.

>> + =C2=A0 =C2=A0 .init =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D smdkv31=
0_backlight_init,
=2E..
<snip>
=2E..
>

Regards,
Banajit
