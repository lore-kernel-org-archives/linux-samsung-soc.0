From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 3/3] i2c/busses: Select I2C bus support for S5PV210 and
	S5P6440.
Date: Wed, 21 Jul 2010 23:02:22 +0900
Message-ID: <AANLkTikV2oR5t9-xUxuJ_CHfMyJUWjdt-6AsoAUm5YqL@mail.gmail.com>
References: <1279717167-24456-1-git-send-email-kgene.kim@samsung.com>
	<AANLkTilygLmO9n0oconz73C6Bjtsgbh0cbfnJ1zU9YMb@mail.gmail.com>
	<00a901cb28dc$75b5dc80$61219580$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:34968 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758570Ab0GUOCX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 10:02:23 -0400
In-Reply-To: <00a901cb28dc$75b5dc80$61219580$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>

On Wed, Jul 21, 2010 at 10:55 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Kyungmin Park wrote:
>>
>> I don't want to modify Kconfig anymore. it's simple to modify driver
> itself.
>>
> Yeah, I think so.
>
>> Think the usage of I2c. I think there's no case don't use it.
>>
>> At this time modify Kconfig once, and just fix the driver if new SoC=
s
>> are arrives.
>> Of course we can modify Kconfig one more, If there's really new IPs =
of
>> I2C are created. but I expect we also need to define new PLAT_SAMSUN=
G2
>>
> Maybe you did see the Watchdog driver...I think, in this case, the de=
pending
> on 'HAVE_xxx_I2C' is better than 'PLAT_xxx'.
>
> If there is newer I2C, the 'HAVE_xxx_I2Cv2' is enough.

yes it's personal taste. I just don't want to modify each Kconfig for
every samsung ARCH.
Now your team enables Samsung SoCs peripherals and if you like this
way, you should define all SoCs peripherals like this.

>
>> Thank you,
>> Kyungmin Park
>>
>> On Wed, Jul 21, 2010 at 9:59 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > From: Naveen Krishna Ch <ch.naveen@samsung.com>
>> >
>> > This patch is to select support I2C channels 0, 1 and 2 for S5PV21=
0 and
>> S5P6440.
>> >
>> > Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > ---
>> > Changes since v1:
>> > - Modifed the Kconfig help comments.
>> >
>> > =A0drivers/i2c/busses/Kconfig | =A0 =A06 +++---
>> > =A01 files changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconf=
ig
>> > index bceafbf..27c96ec 100644
>> > --- a/drivers/i2c/busses/Kconfig
>> > +++ b/drivers/i2c/busses/Kconfig
>> > @@ -523,10 +523,10 @@ config I2C_PXA_SLAVE
>> >
>> > =A0config I2C_S3C2410
>> > =A0 =A0 =A0 =A0tristate "S3C2410 I2C Driver"
>> > - =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX
>> > + =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5P6=
440 ||
>> ARCH_S5PV210
>> > =A0 =A0 =A0 =A0help
>> > - =A0 =A0 =A0 =A0 Say Y here to include support for I2C controller=
 in the
>> > - =A0 =A0 =A0 =A0 Samsung S3C2410 based System-on-Chip devices.
>> > + =A0 =A0 =A0 =A0 Say Y here to include support for I2C controller=
 in the
> Samsung
>> > + =A0 =A0 =A0 =A0 S3C2410, S3C64XX, S5P6440 and S5PV210 based Syst=
em-on-Chip
>> devices.
>> >
>> > =A0config I2C_S6000
>> > =A0 =A0 =A0 =A0tristate "S6000 I2C support"
>> > --
>> > 1.6.2.5
>> >
>> > --
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
