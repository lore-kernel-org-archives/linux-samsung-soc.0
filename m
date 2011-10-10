From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] ARM: plat-samsung: use Kconfig choice for debug UART selection
Date: Mon, 10 Oct 2011 18:05:54 +0530
Message-ID: <CAJuYYwQiXSSOQ_FvOn41NSUJ6F4axNbYgV-LfOxhhLvbUz-bMQ@mail.gmail.com>
References: <1313530873-24961-1-git-send-email-will.deacon@arm.com>
	<1313530873-24961-2-git-send-email-will.deacon@arm.com>
	<CAJuYYwRPwALAQcvsMPuz8XYsDicCmB52HzZehppUnKqv5itPEQ@mail.gmail.com>
	<20111010122319.GE2451@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:45873 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753867Ab1JJMfz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 08:35:55 -0400
Received: by ggnv2 with SMTP id v2so4415611ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Oct 2011 05:35:54 -0700 (PDT)
In-Reply-To: <20111010122319.GE2451@mudshark.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 10 October 2011 17:53, Will Deacon <will.deacon@arm.com> wrote:
> On Mon, Oct 10, 2011 at 12:56:24PM +0100, Thomas Abraham wrote:
>> Hi Will,
>
> Hi Thomas,
>>
>> What is your opinion about the following diff instead of the above o=
ne?
>>
>>
>> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
>> index 65cf8c6..035f5cd 100644
>> --- a/arch/arm/Kconfig.debug
>> +++ b/arch/arm/Kconfig.debug
>> @@ -120,6 +120,15 @@ choice
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Say Y here if you want the debug pri=
nt routines to direct
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 their output to the second serial po=
rt on these devices.
>>
>> + =A0 =A0 config DEBUG_SAMSUNG_UART
>> + =A0 =A0 =A0 =A0 =A0 =A0 bool "Kernel low-level debugging messages =
via samsung serial port"
>> + =A0 =A0 =A0 =A0 =A0 =A0 depends on PLAT_SAMSUNG
>> + =A0 =A0 =A0 =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 Say Y here if you want the debug print=
 routines to direct
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 their output to the serial port for Sa=
msung platforms. Choose
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 the uart port with the "S3C UART to us=
e for low-level debug"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 config option.
>> +
>> =A0endchoice
>>
>> =A0config EARLY_PRINTK
>> @@ -139,7 +148,7 @@ config OC_ETM
>> =A0 =A0 =A0 =A0 kernel code.
>>
>> =A0config DEBUG_S3C_UART
>> - =A0 =A0 depends on PLAT_SAMSUNG
>> + =A0 =A0 depends on DEBUG_SAMSUNG_UART
>> =A0 =A0 =A0 int "S3C UART to use for low-level debug"
>> =A0 =A0 =A0 default "0"
>> =A0 =A0 =A0 help
>
> Well, it's smaller so that's always a plus. However, I don't think th=
e extra
> level of indirection helps (that is, the "Kernel low-level debugging =
UART")
> choice should be where the UART is specified, rather than pointing yo=
u at
> another (platform-specific) option).
>
> Did your suggestion come purely out of aesthetics or are you running =
into
> difficulties with the original patch?

There are no difficulties with the original patch. But that was not
how Samsung boards have been selecting the low level debug uart port
number. The proposed patch tried to maintain the old style.

Another point is that Samsung's Exynos4 (and few other SoC's) has a
fourth UART port as well. Not that it is used as a debug port
currently, but there is no technical limitation in using that as a
console port. So that might need 'DEBUG_S3C_UART3' as well.

Thanks,
Thomas.

>
> Will
>
