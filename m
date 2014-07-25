From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH 1/1] i2c: Kconfig: Enable HSI2C for Exynos5 platform
Date: Fri, 25 Jul 2014 17:06:32 +0530
Message-ID: <CAK5sBcGoYC5qpwy1C95Nx5+ni6bEqCTFShYoVEAdxQVeekZhtQ@mail.gmail.com>
References: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
	<CAD=FV=WzPxT4okEur8C2G=FZK=zq3EsyCv9aAJwZ1PDkfoOcpA@mail.gmail.com>
	<20140716174002.GG2759@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:53914 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348AbaGYLge (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 07:36:34 -0400
In-Reply-To: <20140716174002.GG2759@katana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Doug Anderson <dianders@chromium.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>

On Wed, Jul 16, 2014 at 11:10 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Wed, Jun 25, 2014 at 10:55:31AM -0700, Doug Anderson wrote:
>> Sachin,
>>
>> On Wed, Jun 25, 2014 at 3:02 AM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
>> > All Exynos5 platforms have HSI2C controllers and are needed by
>> > various IPs connected to the boards based on these SoCs. Thus
>> > select this by default for Exynos5 platforms.
>> >
>> > Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>> > Cc: Doug Anderson <dianders@chromium.org>
>> > ---
>> >  drivers/i2c/busses/Kconfig |    4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> > index 9f7d5859cf65..c7918cffe790 100644
>> > --- a/drivers/i2c/busses/Kconfig
>> > +++ b/drivers/i2c/busses/Kconfig
>> > @@ -465,9 +465,9 @@ config I2C_EG20T
>> >  config I2C_EXYNOS5
>> >         tristate "Exynos5 high-speed I2C driver"
>> >         depends on ARCH_EXYNOS5 && OF
>> > +       default y
>> >         help
>> > -         Say Y here to include support for high-speed I2C controller in the
>> > -         Exynos5 based Samsung SoCs.
>> > +         High-speed I2C controller on Exynos5 based Samsung SoCs.
>> >
>> >  config I2C_GPIO
>> >         tristate "GPIO-based bitbanging I2C"
>> > --
>> > 1.7.9.5
>>
>> This seems reasonable to me and I will also take the blame for
>> suggesting this.  It's hard to imagine running a real exynos5 system
>> without I2C.  One could argue that on an exynos5250 the high speed I2C
>> controller is not mandatory (since all the ports can be muxed to use
>> the old controller) but on newer exynos5 products you're expected to
>> have the main PMIC on one of the i2c ports.  An exynos system without
>> access to its PMIC will just sorta limp by.
>>
>> ...but I've added Arnd to this thread as he expressed some
>> reservations about this type of thing, so we'll see what he says.
>
> Ping. Arnd? I have no strong opinion and would take this patch...

Wolfram,

How do you want to proceed with this?

>
>>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>



-- 
Regards,
Sachin.
