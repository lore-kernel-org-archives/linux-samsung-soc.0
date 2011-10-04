From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH V2 2/2] ARM: SAMSUNG: Cleanup resources by using macro
Date: Wed, 5 Oct 2011 08:27:49 +0900
Message-ID: <CAH9JG2UR+QY=Ni7BTThgUBf2iBUKX9cdkbq_XRia4aQXDwEeSg@mail.gmail.com>
References: <005901cc817e$51a56d00$f4f04700$%kim@samsung.com>
	<1957187.UuLfeIqa6D@wuerfel>
	<019301cc8293$79a6f510$6cf4df30$%kim@samsung.com>
	<201110041726.03056.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:62757 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933678Ab1JDX1v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 19:27:51 -0400
Received: by qyk30 with SMTP id 30so3828086qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Oct 2011 16:27:50 -0700 (PDT)
In-Reply-To: <201110041726.03056.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org

On Wed, Oct 5, 2011 at 12:26 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 04 October 2011, Kukjin Kim wrote:
>> > I think the string concatenation really just obfuscates the code, =
and
>> > it does not actually save much at all. When you replace
>> >
>> > + =A0 =A0 =A0 [0] =3D SAMSUNG_RES_MEM(S3C, WDT, SZ_1K),
>> > + =A0 =A0 =A0 [1] =3D SAMSUNG_RES_IRQ(WDT),
>> >
>> > with
>> >
>> > + =A0 =A0 =A0 [0] =3D DEFINE_RES_MEM(S3C_PA_WDT, SZ_1K),
>> > + =A0 =A0 =A0 [1] =3D DEFINE_RES_IRQ(IRQ_WDT),
>> >
>> > you need practically no extra space, but you gain the advantages t=
hat
>> >
>> > * Someone using grep for DEFINE_RES_MEM finds all memory resources=
 without
>> > =A0 having to look up what your macros do an where they are used.
>> > * Someone using grep to look for S3C_PA_WDT finds the place where =
it is
>> used.
>> > * Someone reading the resource definition immediately knows what t=
he
>> > =A0 macro does if familiar with other platforms using that macro.
>>
>> Yes, right. But I'm preparing to reduce the 'soc' part to consolidat=
e some
>> duplicated resources and platform data after this and the new SAMSUN=
G_RES
>> macro will be used.
There are tools for source browsing e.g., ctags, cscope, grep, git
grep and so on.
If you create new SAMSUNG_RES, these tools can't find macro and
symbols properly.

Please use the existing macros for own purpose.

Thank you,
Kyungmin Park
>
> Hmm, can't you instead change the names of these constants to be
> always the same? That would let you use the regular DEFINE_RES_*
> definitions without having to introduce your own.
>
> =A0 =A0 =A0 =A0Arnd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
