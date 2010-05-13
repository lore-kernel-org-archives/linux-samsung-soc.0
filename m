From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 11/11] ARM: S5P6440: Remove redundant defines
Date: Thu, 13 May 2010 13:54:12 +0900
Message-ID: <AANLkTilIvm2AlZeh_1cdcgZFFL5YuJUnYiytXA2tZktB@mail.gmail.com>
References: <1273710481-14856-1-git-send-email-kgene.kim@samsung.com>
	 <AANLkTimTm_Vxvb2xvJnVxTxUaYguFgGeaWGypzA1yjwM@mail.gmail.com>
	 <20100513020236.GS6684@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:65174 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763Ab0EMEyN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 May 2010 00:54:13 -0400
Received: by vws17 with SMTP id 17so230230vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 May 2010 21:54:12 -0700 (PDT)
In-Reply-To: <20100513020236.GS6684@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, May 13, 2010 at 11:02 AM, Ben Dooks <ben-linux@fluff.org> wrote=
:
> On Thu, May 13, 2010 at 10:49:29AM +0900, Jassi Brar wrote:
>> On Thu, May 13, 2010 at 9:28 AM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > From: Thomas Abraham <thomas.ab@samsung.com>
>> > --- a/arch/arm/mach-s5p6440/clock.c
>> > +++ b/arch/arm/mach-s5p6440/clock.c
>> > @@ -357,121 +357,121 @@ static struct clk init_clocks_disable[] =3D=
 {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.parent =A0 =A0 =A0 =A0 =3D &clk_hc=
lk.clk,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D s5p6440=
_mem_ctrl,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D S5P_CLKC=
ON_MEM0_HCLK_NFCON,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 2)=
,
>> Peculiar. I have never seen defines dropped in favor of magic number=
s.
>
> I know it seems a little odd at first, but people seem to be clinging
> on to writing it down in a header file and then using it once as some
> form of high law of programming. Whilst talking with Kukjin and other=
s
> last year and looking at this, we came to the following conclusions
> about single-use defines:
>
> 1) It takes two lines of code, where one is sufficient.
>
> 2) You only have to look in the relevant .c file to find out the
> =A0 value instead of tracking down a header. This makes it easier
> =A0 to verify the value against the manual and easier to compare
> =A0 against simialr code.

Then define it at c code and use the macro. I also don't like the
hard-coded values.

Thank you,
Kyungmin Park
