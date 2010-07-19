From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3 1/7] ARM: S5PV210: Add a Kconfig entry
	"S5PC110_EVT0_WORKAROUND"
Date: Mon, 19 Jul 2010 17:09:28 +0900
Message-ID: <AANLkTim9UtCiyqhLRRWw42WyzgwjTY1OGbsPTwGJKn7p@mail.gmail.com>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
	<002c01cb2718$46fcc4a0$d4f64de0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:49636 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758688Ab0GSIJ3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 04:09:29 -0400
Received: by pwi5 with SMTP id 5so1558287pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jul 2010 01:09:29 -0700 (PDT)
In-Reply-To: <002c01cb2718$46fcc4a0$d4f64de0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Mon, Jul 19, 2010 at 4:59 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> Early S5PC110 (EVT0) chip had some issues required workaround from a
>> kernel. We can add such workaround codes with this Kconfig entry.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv210/Kconfig | =A0 =A07 +++++++
>> =A01 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index 631019a..18802e7 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -101,4 +101,11 @@ config MACH_SMDKC110
>> =A0 =A0 =A0 =A0 Machine support for Samsung SMDKC110
>> =A0 =A0 =A0 =A0 S5PC110(MCP) is one of package option of S5PV210
>>
>> +config S5PC110_EVT0_WORKAROUND
>> + =A0 =A0 bool "S5PC110 Early Chip Workaround (EVT0)"
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Early S5PC110 (so called EVT0) has errata items that s=
hould be
>> + =A0 =A0 =A0 addressed; otherwise the kernel may panic or be locked=
 up. Enable
>> + =A0 =A0 =A0 this option to execute workaround instructions.
>> +
>> =A0endif
>> --
>
> As I said earlier, EVT0 is not real chip and not for mass production.
>
> Why do you submit the EVT0 patch which can only available for you?
> It is better to not add code into mainline that is not going to be us=
ed.

Did you read the previous mail? I explain that.
The LSI focus the latest SoCs. but we got the early chip and used it.
You see the chip itself but I see the product which used the chips
whether for mass production or not.

Actually it's management and maintenance problem. you only show the
latest codes and chips to outside.
but I want to maintain our board at mainline.

Thank you,
Kyungmin Park
