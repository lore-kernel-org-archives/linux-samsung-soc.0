From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 3/3] rtc: rtc-s3c: allow multiple open / allow
 no-ioctl-open'ed rtc to have irq.
Date: Mon, 4 Jul 2011 13:58:51 +0900
Message-ID: <CAJ0PZbTqHr8-A-sm5YVVxicygDiTi6NCx2B8ycmpS9ARHMFMZA@mail.gmail.com>
References: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
	<1309175006-9218-4-git-send-email-myungjoo.ham@samsung.com>
	<014001cc39fc$27cb52c0$7761f840$%youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:46825 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751286Ab1GDE6x convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 00:58:53 -0400
Received: by bwd5 with SMTP id 5so3795256bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jul 2011 21:58:51 -0700 (PDT)
In-Reply-To: <014001cc39fc$27cb52c0$7761f840$%youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Changhwan Youn <chaos.youn@samsung.com>
Cc: rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, kyungmin.park@samsung.com, dg77.kim@samsung.com

On Mon, Jul 4, 2011 at 12:40 PM, Changhwan Youn <chaos.youn@samsung.com=
> wrote:
> AbwBwAGUAbgAgAC8AIAB
> =A0 =A0 =A0 =A0hAGwAbABvAHcAIABuAG8ALQBpAG8AYwB0AGwALQBvAHAAZQBuACcAZ=
QBkACAAcgB0AGMAIAB0AG8AIABoAGEAdgBlACAAaQByAHEALgA=3D
> x-cr-puzzleid: {71A23705-5400-4E21-9C23-2B1E96E33A68}
>
> MyungJoo Ham wrote:
>> The previous rtc-s3c had two issues related with its IRQ.
>> 1. Users cannot open rtc multiple times because an open operation ca=
lls
>> request_irq on the same IRQ. (e.g., two user processes wants to open=
 and
>> read RTC time from rtc-s3c at the same time)
>> 2. If alarm is set and no one has the rtc opened with filesystem
>> (either the alarm is set by kernel/boot-loader or user set an alarm
>> and closed rtc dev file), the pending bit is not cleared and no furt=
her
>> interrupt is invoked. When the alarm is used by the system itself su=
ch
>> as a resume from suspend-to-RAM or other Low-power modes/idle, this =
is a
>> critical issue.
>>
>> This patch mitigates these issue by calling request_irq at probe and
>> free_irq at remove.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[]
>>
>> - =A0 =A0 return 0;
>> + =A0 =A0 ret =3D request_irq(s3c_rtc_alarmno, s3c_rtc_alarmirq,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQF_DISABLED, =A0"s3c=
2410-rtc alarm", rtc);
>>
>> + =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "IRQ%d error %d\n", s3=
c_rtc_alarmno,
>> ret);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 ret =3D request_irq(s3c_rtc_tickno, s3c_rtc_tickirq,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQF_DISABLED, =A0"s3c=
2410-rtc tick", rtc);
>> +
>> + =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "IRQ%d error %d\n", s3=
c_rtc_tickno,
> ret);
>> + =A0 =A0 =A0 =A0 =A0 =A0 free_irq(s3c_rtc_alarmno, rtc);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return ret;
>
> You need proper error handlings.
>
> Regards,
> Changhwan

Ah.. ok, I'll let them go through the error handling code like other er=
rors do.

Thanks.


- MyungJoo

>
>> =A0 err_nortc:
>> =A0 =A0 =A0 s3c_rtc_enable(pdev, 0);
>> =A0 =A0 =A0 clk_disable(rtc_clk);
>> --
>> 1.7.4.1
>>
>> --
>> You received this message because you are subscribed to "rtc-linux".
>> Membership options at http://groups.google.com/group/rtc-linux .
>> Please read http://groups.google.com/group/rtc-linux/web/checklist
>> before submitting a driver.
>
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
