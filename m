From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: [PATCH 4/4] ARM: S3C64XX: Add s3c64xx support to touchscreen driver
Date: Mon, 25 Jan 2010 11:22:34 +0100
Message-ID: <873a1uzdp1.fsf@lechat.rtp-net.org>
References: <b2e8f9f71001221447u550c9713l9f04aeec030c86db@mail.gmail.com>
	<87aaw2zfd9.fsf@lechat.rtp-net.org> <4B5D682F.2020000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lechat.rtp-net.org ([88.191.19.38]:34032 "EHLO
	lechat.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753297Ab0AYKPt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2010 05:15:49 -0500
In-Reply-To: <4B5D682F.2020000@gmail.com> (Maurus Cuelenaere's message of "Mon\, 25 Jan 2010 10\:45\:19 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

Maurus Cuelenaere <mcuelenaere@gmail.com> writes:

[...]

>>> @@ -40,7 +40,9 @@
>>>   #include<plat/regs-adc.h>
>>>   #include<plat/ts.h>
>>>
>>> +#ifdef PLAT_S3C24XX
>>>   #include<mach/regs-gpio.h>
>>> +#endif
>>>
>>>   #define TSC_SLEEP  (S3C2410_ADCTSC_PULL_UP_DISABLE | S3C2410_ADCTSC_XY_PST(0))
>>>
>>> @@ -88,6 +90,12 @@ struct s3c2410ts {
>>>
>>>   static struct s3c2410ts ts;
>>>
>>> +enum s3c_cpu_type {
>>> +	TYPE_S3C2410,
>>> +	TYPE_S3C2440,
>>> +	TYPE_S3C64XX,
>>> +};
>>> +
>>>   /**
>>>    * s3c2410_ts_connect - configure gpio for s3c2410 systems
>>>    *
>>> @@ -95,6 +103,7 @@ static struct s3c2410ts ts;
>>>    * connected to the device (later systems such as the S3C2440 integrate
>>>    * these into the device).
>>>   */
>>> +#ifdef PLAT_S3C24XX
>>>   static inline void s3c2410_ts_connect(void)
>>>   {
>>>   	s3c2410_gpio_cfgpin(S3C2410_GPG(12), S3C2410_GPG12_XMON);
>>> @@ -102,6 +111,7 @@ static inline void s3c2410_ts_connect(void)
>>>   	s3c2410_gpio_cfgpin(S3C2410_GPG(14), S3C2410_GPG14_YMON);
>>>   	s3c2410_gpio_cfgpin(S3C2410_GPG(15), S3C2410_GPG15_nYPON);
>>>   }
>>> +#endif
>>>      
>> Please, remove all theses #ifdef. I don't see the point of them as it's
>> only few lines of C code and they don't get executed when running on
>> other platforms than 2410.
>>
>> Arnaud
>>    
>
> The problem is that s3c2410_gpio_cfgpin() and S3C2410_* isn't defined
> on S3C64XX builds so this gives implicit declaration errors.

hmm... I didn't look in details but I thought such kind of issues was
going to be fixed thanks to the changes in Ben's -next-* branches.

Arnaud
