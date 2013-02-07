From: Alexander Varnin <fenixk19@mail.ru>
Subject: Re: Help connect s3c2410-lcd device to SMDK2443
Date: Fri, 08 Feb 2013 03:43:28 +0400
Message-ID: <51143C20.1050704@mail.ru>
References: <51115F34.8030503@mail.ru> <201302052317.44431.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback1.mail.ru ([94.100.176.18]:53662 "EHLO
	fallback1.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422758Ab3BGXod (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 18:44:33 -0500
In-Reply-To: <201302052317.44431.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org

06.02.2013 02:17, Heiko St=C3=BCbner =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Alexander,
>
> Am Dienstag, 5. Februar 2013, 20:36:20 schrieb Alexander Varnin:
>> Hello. I'm trying to setup "s3c2410-lcd" device on SMDK2443 with 3.6
>> kernel. On requesting interrupt it fails with EINVAL:
>> ~ # dmesg | grep lcd
>> s3c2410-lcd s3c2410-lcd: cannot get irq 32 - err -22
>> s3c2410-lcd: probe of s3c2410-lcd failed with error -16
> If I remember correctly the s3c2443 has a new-style framebuffer. So u=
sing the
> s3c2410-fb/lcd driver is the wrong approach. The correct driver to us=
e would
> be the s3cfb.
>
> Take a look at mach-smdk2416.c which uses this driver. The init for t=
he
> s3c2443 should probably be similar.
>
>
> Also the irq you requested is a parent irq to different lcd-irqs in t=
he sub-
> register on the s3c2443 and s3c2416. Therfore requesting it directly =
is
> disabled by the irq-subsystem.
>
>
> Hope that helps
> Heiko
Thank you for help. I have used s3c-fb driver and all is ok.
>
>> The interrupt is not busy by something else. Here is my table:
>> ~ # cat /proc/interrupts
>> CPU0
>>    17:          0  s3c-ext0 s3c-mci
>>    30:     409934       s3c  S3C2410 Timer Tick
>>    37:          0       s3c s3c-mci
>>    42:        416       s3c ohci_hcd:usb1
>>    43:          0       s3c s3c2410-i2c
>>    56:          1   s3c-ext uio_mcross
>>    57:      72585   s3c-ext eth0
>>    73:         63  s3c-uart1 s3c2440-uart
>>    74:        108  s3c-uart1 s3c2440-uart
>>    97:          0         - s3c2410-wdt
>> Err:
>>
>> Please, help me to find the reason.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
