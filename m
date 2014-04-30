From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH Resend] ARM: EXYNOS: Map SYSRAM address through DT
Date: Wed, 30 Apr 2014 09:39:54 +0530
Message-ID: <CAK9yfHxBh3x7coj1FtLOrYvRv9viN_1tS3irL5+inarwuHZWYw@mail.gmail.com>
References: <1397649051-3288-1-git-send-email-sachin.kamat@linaro.org>
	<5721231.s2ATyWsK21@wuerfel>
	<1493367.CDjMd4ghZP@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:36599 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921AbaD3EJz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 00:09:55 -0400
Received: by mail-oa0-f52.google.com with SMTP id l6so1315382oag.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2014 21:09:54 -0700 (PDT)
In-Reply-To: <1493367.CDjMd4ghZP@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Heiko,

On 16 April 2014 22:55, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> Hi,
>
> Am Mittwoch, 16. April 2014, 16:35:36 schrieb Arnd Bergmann:
>> On Wednesday 16 April 2014 17:20:51 Sachin Kamat wrote:
>> > Instead of hardcoding the SYSRAM details for each SoC,
>> > pass this information through device tree (DT) and make
>> > the code SoC agnostic.
>> >
>> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> > ---
>> > Rebased on latest linux-next.
>>
>> Thanks for sending this again. I'd like Heiko to have a look
>> and provide an Ack if he's happy with it.
>>
>> It seems similar to what he did with the SRAM for mach-rockchip,
>> and if it is we should use the same binding that he introduced,
>> which would be a minor variation of this.
>
> The sram binding is derived from the generic reserved-memory bindings=
 to
> enable the sram in general to be used generically through the sram dr=
iver,
> while still retaining some areas for special purposes, like the smp-t=
rampoline
> in my case.
>
> From my reading of platsmp.c, it looks like offset+0x4 starts the so =
called
> boot-registesr, which get the smp-start-address written to.
>
> So I guess it all depends on what is contained in the rest of the sys=
ram. If
> it is all covered with such special registers or other special uses, =
the code
> below is fine. But if the most of the area is just general purpose sr=
am, a
> solution like on rockchip might be nicer - i.e. handling the sysram v=
ia the
> sram driver and declaring a reserved section for the boot registers.

Thanks for your inputs. In our case, we use sram for secondary boot
addresses but could not find any other general purpose use.

> So, depending on the above:
> Acked-by: Heiko Stuebner <heiko@sntech.de>

So I believe your ack applies to our case :). Thanks again.

--=20
With warm regards,
Sachin
