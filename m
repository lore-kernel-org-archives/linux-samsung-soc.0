From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2] ARM: s5pv210_defconfig: Update for removing
	s5pc110_defconfig
Date: Tue, 13 Jul 2010 15:23:48 +0900
Message-ID: <AANLkTikZZjqTrGtv7ts4_a_dxMZ1ZyMCugoltIwH8sTy@mail.gmail.com>
References: <1278987726-10803-1-git-send-email-kgene.kim@samsung.com>
	<AANLkTilAKmCrHm5pZU5s6oJkSGGZyYihsnPsG4Z1uKFw@mail.gmail.com>
	<00fc01cb2253$27307c30$75917490$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:33764 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751288Ab0GMGXu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jul 2010 02:23:50 -0400
Received: by pxi14 with SMTP id 14so2149894pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jul 2010 23:23:48 -0700 (PDT)
In-Reply-To: <00fc01cb2253$27307c30$75917490$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jul 13, 2010 at 3:17 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Kyungmin Park wrote:
>>
>> Question?
>>
>> Are there difference between smdkc110 and smdkv210?
>
> Yes.
>
> The components on the board are different such as default LCD module,
> external memory, connector, and so on.

It seems to be handle at one board file. Maybe you register it as
different machine ID so you can handle it.
Look at current board files.

Thank you,
Kyungmin Park

>
>>
>> Thank you,
>> Kyungmin Park
>>
>> On Tue, Jul 13, 2010 at 11:22 AM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
>> > Now that S5PC110 machines and S5PV210 machines can be built into
>> > one kernel, update mach-s5pv210/Kconfig and s5pv210_defconfig.
>> >
>> > Tested on SMDKC110(S5PC110) and SMDKV210(S5PV210).
>> > Note that GONI machine ID is not included in the kernel.
>> >
>> > Created and tested against linux-2.6.35-rc5.
>> >
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > ---
>> > Changes since v1:
>> > - This patch re-based against linux-2.6.35-rc5 which includes
>> > =A0'ARM: reduce defconfigs' from Uwe Kleine-Konig.
>> >
>> > =A0arch/arm/configs/s5pc110_defconfig | =A0 66
> ------------------------------------
>> > =A0arch/arm/configs/s5pv210_defconfig | =A0 =A04 ++
>> > =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0| =A0 28 +++++++++----=
--
>> > =A03 files changed, 21 insertions(+), 77 deletions(-)
>> > =A0delete mode 100644 arch/arm/configs/s5pc110_defconfig
>
> (snip)
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
