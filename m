From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH RESEND v3] ARM: s3c2442: Setup gpio {set,get}_pull callbacks
Date: Tue, 30 Nov 2010 14:12:37 +0100
Message-ID: <4CF4F845.7010207@metafoo.de>
References: <000201cb8fae$4d61fd20$e825f760$%kim@samsung.com> <001801cb9056$65296530$2f7c2f90$%kim@samsung.com> <4CF4E5C7.5020600@metafoo.de> <201011301401.44973.anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailhost.informatik.uni-hamburg.de ([134.100.9.70]:54834 "EHLO
	mailhost.informatik.uni-hamburg.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751049Ab0K3NMr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Nov 2010 08:12:47 -0500
In-Reply-To: <201011301401.44973.anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>

On 11/30/2010 01:01 PM, Vasily Khoruzhick wrote:
> On Tuesday 30 November 2010 13:53:43 Lars-Peter Clausen wrote:
> 
>>> Hmm...how about s3c_gpio_setpull_1updown(...)?
>>> And actually, not used 3rd argument, "pull" now.
>>> I prefer follwoing.
>>
>> You need the 4th arguemnt, because the s3c2440 only supports pullups and
>> the s3c2442 only supports pulldowns. So you want to return -EINVAL if
>> somebody tries to set a pullup on a s3c2442 based board.
>> Your proposed solution would return 0 and set a pulldown instead.
> 
> Well, at least it allows single-binary kernel for s3c24xx to exist. I think 
> it's OK, as setting pull{up,down} bit for any non S3C_GPIO_PULL_NONE arg 
> preserves semantics for all SoCs (s3c2410/s3c2440/s3c2442) by cost of not 
> handling errors. Anyway, who wants to call cfgpull with S3C_GPIO_PULL_DOWN on 
> s3c2410/s3c2440 or with S3C_GPIO_PULL_UP on s3c2442?
>  
> Regards
> Vasily

Hi

While this might work for setting the pullup, what to you want to return in get_pull?

The reason why s3c24xx_gpiocfg_default needs to have {get,set}_pull set at compile
time is that the board init code is called before the cpu init code. Which is in my
opinion a bit odd and should be fixed instead.
If it is not fixed for whatever reason we could fallback to using some sort of
"cpu_is_s3c2442() ? S3C_GPIO_PULL_UP : S3C_GPIO_PULL_DOWN"

- Lars
