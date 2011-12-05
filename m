From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/2] arm: exynos: allow platform-lcd driver to control lcd
 regulator source on origen
Date: Mon, 5 Dec 2011 16:17:16 +0530
Message-ID: <CAJuYYwRD9iop3k1ApcELgpk1R2rw0PX-nVLcstj35cVq9VKy7A@mail.gmail.com>
References: <1323075148-29356-1-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2XfNqCtxhfqiikuZKbvZnc2tZ2vGJ0FZuL=JcQirYJXTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:37389 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755836Ab1LEKrQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Dec 2011 05:47:16 -0500
Received: by vbbfc26 with SMTP id fc26so3747275vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Dec 2011 02:47:16 -0800 (PST)
In-Reply-To: <CAH9JG2XfNqCtxhfqiikuZKbvZnc2tZ2vGJ0FZuL=JcQirYJXTA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, rpurdie@rpsys.net, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org, jhkim@insignal.co.kr, inderpal.singh@linaro.org, tushar.behera@linaro.org

Dear Mr. Park,

On 5 December 2011 15:44, Kyungmin Park <kmpark@infradead.org> wrote:

[...]

>> =A0static struct regulator_init_data __initdata max8997_ldo1_data =3D=
 {
>> @@ -379,11 +379,11 @@ static struct regulator_init_data __initdata
>> max8997_buck5_data =3D {
>> =A0static struct regulator_init_data __initdata max8997_buck7_data =3D=
 {
>> =A0 =A0 =A0 .constraints =A0 =A0=3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "VDD_LCD_3=
=2E3V",
>> - =A0 =A0 =A0 =A0 =A0 =A0 .min_uV =A0 =A0 =A0 =A0 =3D 3300000,
>> - =A0 =A0 =A0 =A0 =A0 =A0 .max_uV =A0 =A0 =A0 =A0 =3D 3300000,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .min_uV =A0 =A0 =A0 =A0 =3D 750000,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .max_uV =A0 =A0 =A0 =A0 =3D 3900000,
> It can support the voltage change at buck itself, but in board it's
> fixed. I'm not sure it's correct usage at board file.
>
> I think original code is better to understand and use it as name, it'=
s
> fixed v3.3 voltage.

Yes, that is true. If the board cannot support any other voltage for
buck7, there is no need to change min_uV and max_uV. I will revert it
to the original values.

Thanks,
Thomas.

>
> Thank you,
> Kyungmin Park

[...]
