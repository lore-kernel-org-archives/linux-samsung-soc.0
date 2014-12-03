From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] mfd: max77686: Fix parent of rtc device
Date: Wed, 03 Dec 2014 10:25:34 +0100
Message-ID: <1417598734.23732.11.camel@AMDC1943>
References: <1417523620-4311-1-git-send-email-yadi.brar@samsung.com>
 <1417524339-4604-1-git-send-email-yadi.brar@samsung.com>
 <547DBFAD.30605@samsung.com> <000001d00ed7$db623bb0$9226b310$%brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47360 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031AbaLCJZi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 04:25:38 -0500
In-reply-to: <000001d00ed7$db623bb0$9226b310$%brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lee.jones@linaro.org, sameo@linux.intel.com, akpm@linux-foundation.org, tomasz.figa@gmail.com, robh+dt@kernel.org, yadi.brar01@gmail.com

On =C5=9Bro, 2014-12-03 at 14:32 +0530, Yadwinder Singh Brar wrote:
>=20
> On Tuesday, December 02, 2014 7:04 PM, Krzysztof Koz=C5=82owski wrote=
:=20
> > On 02.12.2014 13:45, Yadwinder Singh Brar wrote:
> > > rtc have different i2c client than power(pmic) block. So rtc devi=
ce
> > > should sit under its own i2c client in device hierarchy, which
> > reflects in sysfs also.
> > > This patch modifies code to register rtc cell with rtc->dev as
> > parent.
> > >
> > > Without this patch :
> > > # ls /sys/class/i2c-adapter/i2c-0/0-0009/
> > > driver         max77686-pmic  modalias       power          ueven=
t
> > > max77686-clk   max77686-rtc   name           subsystem
> > >
> > > After applying patch :
> > > # ls /sys/class/i2c-adapter/i2c-0/0-0006/
> > > driver/        modalias       power/         uevent
> > > max77686-rtc/  name           subsystem/
> > >
> > > Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> > > ---
> > >
> > > Or Can we follow another (exhaustive but more cleaner) approach,
> > which
> > > will be more like code refactoring and cleanup rather than only f=
ix:
> > > Since rtc uses i2c client, which gets created using i2c_new_dummy=
()
> > > and is not shared by any other cell of max77686. So we can covert=
 rtc
> > > platform driver itself to i2c client driver. It will also allow t=
o
> > > expilicitly describe max77686-rtc in DT which we can't do now.
> > > It can be applicable to some other existing and new mfd pmic driv=
ers.
> > > Any suggestion/comments ?
> >=20
> > Hi,
> >=20
> > What kind of problem is solved by this patch?
> >
>=20
> Let me try to explain once again :)
> After seeing a message "i2c i2c-0: .... , addr=3D0x06, .." in dmesg l=
og,
> I was not able to find any such device in sysfs as well as device tre=
e.
> There was no device under /sys/class/i2c-dev/i2c-0/device/0-0006/
> Isn't something wrong or missing ?
>=20
> This patch fixes that missing parent child relation, which IMO
> should be correct always, though it causes any major problem or not.

OK, I got your point. I'm fine with both solutions and the patch looks
good, so:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

> Still I am thinking, 0-0006 slave device(rtc) shouldn't also appear i=
n DT?
> As DT should describe the hardware that we are using.

Your patch properly describes the hardware. However from driver
perspective, the RTC here is not an standalone driver and depends on
parent (MFD) driver.

Although max77686 RTC could have its own DeviceTree node, I think it
should still be put under main MFD driver's node, because the parent
manages stuff like interrupts.

Best regards,
Krzysztof
