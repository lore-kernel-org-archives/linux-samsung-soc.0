From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 2/2] regulator: Add support for MAX77686.
Date: Thu, 10 May 2012 16:26:48 +0530
Message-ID: <CAKew6eWRFQMsPFhrA2g54VTTkV4ibMDTeFiz6nHDmZjOmVk__g@mail.gmail.com>
References: <1336580695-1184-1-git-send-email-yadi.brar@samsung.com>
	<1336580695-1184-3-git-send-email-yadi.brar@samsung.com>
	<20120509184709.GC32037@sirena.org.uk>
	<CAKew6eWEYBP1zXXwLL4eWOhOKZ-HwAfUX_kg8cnsaDyUXVKSkQ@mail.gmail.com>
	<20120510093442.GK3908@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53750 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759213Ab2EJK4t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 06:56:49 -0400
In-Reply-To: <20120510093442.GK3908@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Yadwinder Singh <yadi.brar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Mark,

On Thu, May 10, 2012 at 3:04 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, May 10, 2012 at 12:54:24PM +0530, Yadwinder Singh Brar wrote:
>> On Thu, May 10, 2012 at 12:17 AM, Mark Brown
>> > On Wed, May 09, 2012 at 09:54:55PM +0530, Yadwinder Singh wrote:
>
>> >> + =A0 =A0 [MAX77686_EN32KHZ_AP] =3D NULL,
>> >> + =A0 =A0 [MAX77686_EN32KHZ_CP] =3D NULL,
>
>> > Now that the generic clock API is in mainline these should be move=
d over
>> > to use it.
>
>> Sorry, I cann't get your point here. Please explain it little bit mo=
re.
>
> These are not regulators, these are clocks. =A0They should use the cl=
ock
> API.
>

Ok. I got it.

>> >> + =A0 =A0 if (pdata->ramp_delay) {
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 max77686->ramp_delay =3D pdata->ramp_de=
lay;
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 max77686_update_reg(i2c, MAX77686_REG_B=
UCK2CTRL1,
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RAMP_VALUE, RAMP_MASK);
>
>> > This appears not to actually use the value passed in as platform_d=
ata.
>
>> It gets corresponding index of ramp_rate value in ramp_rate_value
>> table supported by hardware, from platform_data which we write to
>> ramp_rate control bits of control registers.
>
> Why is the driver unconditionally writing these register values here
> rather than setting the ramp delay that was passed in?

Here we are setting the max77686->ramp_delay and writing the same
value(max77686->ramp_delay << 6) at register also.


Thanks,
Yadwinder.
