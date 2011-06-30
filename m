From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: EXYNOS4: Add EPLL clock operations
Date: Thu, 30 Jun 2011 11:21:44 +0530
Message-ID: <BANLkTi=aGo3WPaftzBxR=Jy6oHAzt+Yhbw@mail.gmail.com>
References: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
 <1308655463-8787-4-git-send-email-ch.naveen@samsung.com> <BANLkTim_0yj8hSefv5BUg5Z1vLh5SWhqjA@mail.gmail.com>
 <BANLkTim2pK5qKwQ5fmJxRHmNHCU=oJtf3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:62112 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752568Ab1F3FwF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 01:52:05 -0400
Received: by iwn6 with SMTP id 6so1627828iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2011 22:52:04 -0700 (PDT)
In-Reply-To: <BANLkTim2pK5qKwQ5fmJxRHmNHCU=oJtf3A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <claude.youn@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, sbkim73@samsung.com, sw.youn@samsung.com, kgene.kim@samsung.com

Hi Seungwhan,

On 22 June 2011 13:31, Seungwhan Youn <claude.youn@gmail.com> wrote:
> Hi Naveen,
>
> On Wed, Jun 22, 2011 at 3:51 PM, Naveen Krishna Ch
> <naveenkrishna.ch@gmail.com> wrote:
>> Hi Every one,
>>
>> 1. Both S5P6440 and S5P6450 uses PLL90XX for EPLL.
>> =A0However, the same epll_ops is duplicated in the following files
>> =A0arch/arm/mach-s5p64x0/clock-s5p6440.c
>> =A0arch/arm/mach-s5p64x0/clock-s5p6450.c
>>
>> =A0Please find attached patch which moves it to the common clock.c
>> =A0Attachment: "0001-ARM-S5P64X0-Move-duplicated-epll-code.patch"
>>
>> 2. Also, S5PV210, C110, C100, 6450/6440 and EXYNOS4 define their own
>> =A0epll_ops.
>>
>> =A0The following attachment consolidates the same on the basis of PL=
L types
>> =A0"Eg: PLL90XX. PLL46XX, PLL45XX and PLL65XX"
>>
>> =A0Kindly, review the approach and comment.
>> =A0Attachment: "0001-ARM-Samsung-organize-duplicated-EPLL-code.patch=
"
>
> I think this is a good try to clean-up Samsung platform's PLL setting=
s. :)
> But one thing that I concern is 'epll_div' values are not a common
> value, it depends on board because of these values come from outer xt=
l
> which was selected by OM on board side. So, I wonder if you want to
> make PLL as a common platform, you may solve these 'epll_div' values
> to be correct. For example, you may calculate 'epll_div' values with
> formula which is in user manual or set 'epll_div' values in board
> specific file not platform file.

Thanks for your comments.

So far i was not lucky in finding out a generic way of deriving the
epll_div values.
And it doesn't seem to
1. Save lines of code or
2. Consolidate the PLL code.

Any suggestions for a simpler implementation are welcome.

>
> =A0 =A0 =A0 =A0claude
>


--=20
Shine bright,
(: Nav :)
