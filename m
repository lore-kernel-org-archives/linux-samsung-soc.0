From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/4] clk: samsung: remove np check in clock init
Date: Tue, 12 Mar 2013 15:06:54 +0530
Message-ID: <CAJuYYwQ_BTSCejXoX6F5NbdFBgBH+3QYLxkL2=QMusMpREERmg@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de>
	<CAJuYYwSU_pFoyHkzt=sP6AfN03F9V1_Rx+3o1ekbLHD4jC5SpA@mail.gmail.com>
	<201303121002.56535.heiko@sntech.de>
	<201303121017.49655.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f181.google.com ([209.85.210.181]:36749 "EHLO
	mail-ia0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754901Ab3CLJgy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 05:36:54 -0400
Received: by mail-ia0-f181.google.com with SMTP id w33so4585053iag.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 02:36:54 -0700 (PDT)
In-Reply-To: <201303121017.49655.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

On 12 March 2013 14:47, Heiko St=FCbner <heiko@sntech.de> wrote:
> Am Dienstag, 12. M=E4rz 2013, 10:02:55 schrieb Heiko St=FCbner:
>> Am Dienstag, 12. M=E4rz 2013, 09:53:00 schrieb Thomas Abraham:
>> > On 12 March 2013 05:14, Heiko St=FCbner <heiko@sntech.de> wrote:
>> > > This let to the suspend init never being reached on non-DT platf=
orms.
>> > >
>> > > Signed-off-by: Heiko Stueber <heiko@sntech.de>
>> > > ---
>> > >
>> > >  drivers/clk/samsung/clk.c |    2 --
>> > >  1 files changed, 0 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk=
=2Ec
>> > > index d36cdd5..1a5de69 100644
>> > > --- a/drivers/clk/samsung/clk.c
>> > > +++ b/drivers/clk/samsung/clk.c
>> > > @@ -57,8 +57,6 @@ void __init samsung_clk_init(struct device_nod=
e *np,
>> > > void __iomem *base,
>> > >
>> > >                 unsigned long nr_rdump)
>> > >
>> > >  {
>> > >
>> > >         reg_base =3D base;
>> > >
>> > > -       if (!np)
>> > > -               return;
>> >
>> > Hi Heiko,
>> >
>> > Sorry, I did not understand the need for this. Could you please ad=
d
>> > few more details on this change.
>>
>> Hi Thomas,
>>
>> On non-dt platforms the init would stop here, therefore never reachi=
ng the
>> code that inits the syscore ops below to save the register values on
>> suspend and restores them on resume.
>>
>> I might be overlooking something, but I think we want to save/restor=
e the
>> register values on both dt and non-dt platforms.
>
> ok, I did overlook something :-)
>
> The register saving seems to be done separately on non-dt platforms (=
mach-
> exynos/pm.c for example). So I probably need to redo patch 2 and 3.

The register saving is supposed to be done in the clock driver itself
for both dt and non-dt platforms. So you are right in pointing out
this issue.

But in this patch, removing the check on 'np' is not right. Because,
on builds were CONFIG_OF is enabled but kernel image executing on
non-dt platforms, the allocation of clk_table should be avoided.

So instead of removing the check on 'np', the code inside #ifdef
CONFIG_PM_SLEEP should be placed after the assignment to reg_base. The
check on 'np' should then follow.

Thanks,
Thomas.

>
>
> Heiko
>
>
>> > >  #ifdef CONFIG_OF
>> > >
>> > >         clk_table =3D kzalloc(sizeof(struct clk *) * nr_clks,
>> > >         GFP_KERNEL);
>> > >
>> > > --
>> > > 1.7.2.3
>
