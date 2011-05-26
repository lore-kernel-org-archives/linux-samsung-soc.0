From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH 4/7] ARM: S5P64X0: Add clkdev support
Date: Thu, 26 May 2011 08:40:43 +0530
Message-ID: <BANLkTinpCtxrb+V3xAwUU7pi5vENPYrhJQ@mail.gmail.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
	<1305839906-1815-5-git-send-email-thomas.ab@samsung.com>
	<4DDD7886.6010105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:48478 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752869Ab1EZDKo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 23:10:44 -0400
Received: by yia27 with SMTP id 27so128876yia.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 20:10:44 -0700 (PDT)
In-Reply-To: <4DDD7886.6010105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Mr. Kukjin Kim,

On Thu, May 26, 2011 at 3:15 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> On 05/19/11 14:18, Thomas Abraham wrote:
>>
>> Add clkdev support for Samsung's s5p64x0 platforms.
>>
>> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
>> ---
>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A01 +
>> =A0arch/arm/mach-s5p64x0/clock-s5p6440.c =A0 =A0 =A0 | =A0 20 ++++++=
++++++++++++++
>> =A0arch/arm/mach-s5p64x0/clock-s5p6450.c =A0 =A0 =A0 | =A0 19 ++++++=
+++++++++++++
>> =A0arch/arm/mach-s5p64x0/include/mach/clkdev.h | =A0 =A07 +++++++
>> =A0arch/arm/plat-s5p/s5p-time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A09 +++++++++
>> =A05 files changed, 56 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h
>
> (snip)
>
> I wonder why following is included in this, "S5P64X0: Add clkdev supp=
ort".

=46or clock lookups (using clk_get) based on clkdev, the platform
devices should be registered before calling the clk_get function. In
this case, the clk_get is called when platform devices
(s3c_device_timer[]) is not registered. So these platform devices can
be assigned a init_name which is then used by clk_dev to lookup the
clocks. So, that is the reason for modifying the clock lookup in
s5p-time.c file.

Thanks,
Thomas.

>
>> diff --git a/arch/arm/plat-s5p/s5p-time.c b/arch/arm/plat-s5p/s5p-ti=
me.c
>> index 8090403..d9efd29 100644
>> --- a/arch/arm/plat-s5p/s5p-time.c
>> +++ b/arch/arm/plat-s5p/s5p-time.c
>> @@ -408,6 +408,7 @@ static void __init s5p_timer_resources(void)
>>
>> =A0 =A0 =A0 =A0unsigned long event_id =3D timer_source.event_id;
>> =A0 =A0 =A0 =A0unsigned long source_id =3D timer_source.source_id;
>> + =A0 =A0 =A0 char devname[15];
>>
>> =A0 =A0 =A0 =A0timerclk =3D clk_get(NULL, "timers");
>> =A0 =A0 =A0 =A0if (IS_ERR(timerclk))
>> @@ -415,6 +416,10 @@ static void __init s5p_timer_resources(void)
>>
>> =A0 =A0 =A0 =A0clk_enable(timerclk);
>>
>> + =A0 =A0 =A0 sprintf(devname, "s3c24xx-pwm.%lu", event_id);
>> + =A0 =A0 =A0 s3c_device_timer[event_id].id =3D event_id;
>> + =A0 =A0 =A0 s3c_device_timer[event_id].dev.init_name =3D devname;
>> +
>> =A0 =A0 =A0 =A0tin_event =3D clk_get(&s3c_device_timer[event_id].dev=
, "pwm-tin");
>> =A0 =A0 =A0 =A0if (IS_ERR(tin_event))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0panic("failed to get pwm-tin clock fo=
r event timer");
>> @@ -425,6 +430,10 @@ static void __init s5p_timer_resources(void)
>>
>> =A0 =A0 =A0 =A0clk_enable(tin_event);
>>
>> + =A0 =A0 =A0 sprintf(devname, "s3c24xx-pwm.%lu", source_id);
>> + =A0 =A0 =A0 s3c_device_timer[source_id].id =3D source_id;
>> + =A0 =A0 =A0 s3c_device_timer[source_id].dev.init_name =3D devname;
>> +
>> =A0 =A0 =A0 =A0tin_source =3D clk_get(&s3c_device_timer[source_id].d=
ev, "pwm-tin");
>> =A0 =A0 =A0 =A0if (IS_ERR(tin_source))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0panic("failed to get pwm-tin clock fo=
r source timer");
>
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
