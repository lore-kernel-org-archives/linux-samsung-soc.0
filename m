From: =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Subject: Re: Broken IRQ handling for S3C2416
Date: Thu, 27 Jun 2013 15:48:16 +0100
Message-ID: <51CC50B0.2090308@inov.pt>
References: <51CC290B.5080701@inov.pt> <201306271626.42419.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lmv.inov.pt ([146.193.64.2]:35103 "EHLO lmv.inov.pt"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751663Ab3F0OtD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Jun 2013 10:49:03 -0400
In-Reply-To: <201306271626.42419.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Hi Heiko,

On 27-06-2013 15:26, Heiko St=FCbner wrote:
> Hi Jose,
>
> Am Donnerstag, 27. Juni 2013, 13:59:07 schrieb Jos=E9 Miguel Gon=E7al=
ves:
>> Hi,
>>
>> While migrating from kernel 3.8 to kernel 3.9 I've detected a proble=
m on my
>> S3C2416 based board. I'm using UART 3 as console and with kernel 3.9=
 I'm
>> unable to have a getty working on that port and see a lot of these o=
n
>> dmesg:
>>
>> samsung-uart s3c2440-uart.3: cannot get irq 94
>>
>> Also WDT is not correctly initialized in 3.8, I see in dmesg:
>>
>> s3c2410-wdt s3c2410-wdt: watchdog inactive, reset disabled, irq disa=
bled
>>
>> while in 3.9 I see:
>>
>> s3c2410-wdt s3c2410-wdt: tmr_margin value out of range, default 15 u=
sed
>> s3c2410-wdt s3c2410-wdt: failed to install irq (-38)
>> s3c2410-wdt: probe of s3c2410-wdt failed with error -38
>>
>> So I guess something is broken in 3.9 kernel's IRQ handling for S3C2=
416.
> when I checked two days ago, the irqs where working fine on my s3c241=
6 board.
>
> Basic questions, did you change the init_irq callback to the correct =
new
> function (s3c2416_init_irq) in your board file, can you provide a mor=
e
> complete log and of course and is your board-file available somewhere=
?
>

My bad! I missed that change on the init_irq callback. Everything is wo=
rking fine now.
Thank you and sorry for the inconvenience.

Best regards,
Jos=E9 Gon=E7alves
