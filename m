From: =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Subject: Re: [PATCH] ARM: S3C24XX: Fix configuration of gpio port sizes on
 S3C24XX.
Date: Fri, 13 Dec 2013 01:55:21 +0000
Message-ID: <52AA6909.8050200@inov.pt>
References: <1378889173-7437-1-git-send-email-jose.goncalves@inov.pt> <CACRpkdYbCzOJ9k8AyriM9quafx=dseK6w1DYjyrJ9F53ka8TEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYbCzOJ9k8AyriM9quafx=dseK6w1DYjyrJ9F53ka8TEw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
List-Id: linux-samsung-soc@vger.kernel.org

On 27-09-2013 15:17, Linus Walleij wrote:
> On Wed, Sep 11, 2013 at 10:46 AM, Jos=E9 Miguel Gon=E7alves
> <jose.goncalves@inov.pt> wrote:
>
>> Some GPIO line limits are incorrectly set which, for instance,
>> does not allow nRTS1 (GPH11) configuration on a S3C2416 chip.
>>
>> Signed-off-by: Jos=E9 Miguel Gon=E7alves <jose.goncalves@inov.pt>
>> ---
>>   arch/arm/mach-s3c24xx/include/mach/gpio.h |   10 +++++-----
> OK but grrrr!
>
> What needs to happen to the s3c24xx is to get rid of this file.
>
> - Define ARCH_NR_GPIOS in arch/arm/Kconfig entry
>    ARCH_NR_GPIO like everyone else
>
> - Get rid of the config symbol NEED_MACH_GPIO_H
>
> -  Move this file down into arch/arm/mach-s3c24xx/s3c24xx-gpio.h
>    or whatever and make it local...
>
> I will try to do this myself if noone else helps out, so I'd like to
> carry this patch in the GPIO tree provided I can get an ACK from
> the S3C24xx maintainer. Tomasz, is that you or Kukjin?
>
> (BTW the above maybe goes for S3c64xx as well .. and S5P
> oh well I will get to it.)
>

Was this patch forgotten?

Jos=E9 Gon=E7alves
