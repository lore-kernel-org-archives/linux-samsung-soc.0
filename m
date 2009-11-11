From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Add plat-samsung as starting point for
	plat-s3c* moves
Date: Wed, 11 Nov 2009 17:31:24 +0900
Message-ID: <9c9fda240911110031x5fd0e2f1sefc1edbc8cda4d@mail.gmail.com>
References: <1257812406-17360-1-git-send-email-ben-linux@fluff.org>
	 <000a01ca61a5$c573d000$505b7000$%kim@samsung.com>
	 <9c9fda240911091927m46ed0fccyfbbc8873eb9c5da9@mail.gmail.com>
	 <20091110094756.GN4048@prithivi.gnumonks.org>
	 <000001ca620b$2141c080$63c54180$%szyprowski@samsung.com>
	 <20091111045835.GO4047@prithivi.gnumonks.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f192.google.com ([209.85.212.192]:33617 "EHLO
	mail-vw0-f192.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755794AbZKKIbT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2009 03:31:19 -0500
Received: by vws30 with SMTP id 30so254383vws.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2009 00:31:24 -0800 (PST)
In-Reply-To: <20091111045835.GO4047@prithivi.gnumonks.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Harald Welte <laforge@gnumonks.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomasz Fujak <t.fujak@samsung.com>

On Wed, Nov 11, 2009 at 1:58 PM, Harald Welte <laforge@gnumonks.org> wr=
ote:
> Hi Marek,
>
> On Tue, Nov 10, 2009 at 02:38:42PM +0100, Marek Szyprowski wrote:
>> >
>> > Of course. =A0The code for the C100, C110, V210, etc. is also subj=
ect to
>> > this. =A0Maybe Ben simply wanted to be polite and indicate he does=
 not
>> > intend to interfere with your current codebase. =A0After all, DMC =
is the
>> > maintainer of the C100 support in mainline, and we hope we can hav=
e your
>> > cooperation with this new structure. =A0But since we did not ask y=
ou yet,
>> > we couldn't assume that you would agree.
>>
>> We are also interested in improving mainline support for C100 series=
 as
>> well as upcoming C110.
>
> Ok. =A0The general goal of the work that Ben and me have been discuss=
ing
> and initiating is to remove the amount of code duplication when
> introducing support for a new SoC. =A0Right now, the c100 code contai=
ns a
> number of copies of the 6410 code, and the 6440 code also copies a lo=
t
> from 6410.
>
> A lot of copying was identified in things like the platform device fi=
les
> (*-dev.c) and the *-clock.c files - which is why that was the startin=
g
> point.
>
> There may also be other files up to something like sleep.S where agai=
n
> much duplication is visible (see my 6440 review mail recently)
>
>> > plat-samsung is intended for stuff that's shared between all the v=
arious
>> > arm9/arm11/a8 based SoCs. =A0This is so far in plat-s3c, even thou=
gh it's
>> > not only used (and will not only be used) by s3c parts.
>>
>> So most of the current code from plat-s3c (mainly common dev-* platf=
orm
>> resources, clocks, uart and gpio core functions) would be moved to
>> plat-samsung? Right?
>
> I think this is the goal, yes. =A0I personally don't care too much ab=
out
> correct naming or correct directory name. =A0The most important goal =
is to
> prevent/remove copy+paste style code and really have every function o=
nly
> once, if it is the same or 99% the same on multiple SoCs.
>
>> > Also, don't you think it is somewhat weird that soon samsung would=
 have
>> > as many plat-* directories as all other ARM SoC makers together?
>>
>> These multiple plat-* directories for all Samsung chip series are in
>> fact a big overhead for kernel tree. I assume that You want to end w=
ith
>> only one plat-samsung directory.
>
> I think currently having 3 directories: plat-samsung, plat-s3c and
> plat-s5p are in the discussion.
>
>> Am I right? What about multiple mach-* directories (mach-s3c2400, ..=
=2E,
>> mach-s3c24a0, mach-s3c6400, mach-s3c6410, mach-s5pc100, ...)? Do you
>> plan to keep them? Maybe a multilevel structure would be more
>> aproperiate? (mach-samsung/s3c2400, mach-samsung/s3c6400, and so on)=
?
>
> I think at the moment we're focusing on the plat-* directories first =
and
> try not to change everything at the same time. =A0I would not propose
> freely renaming / moving all directories if this does not at the same
> time mean that we can remove code duplication.
>
>> How do you plan to handle different includes, register map, register
>> offset defines, etc in each chip series? Would this result in moving
>> the series specific include directories to mach-* directories?
>
> I think the details will be worked out while the task is being done.
> The actual base addresses for each integrated peripheral will be
> provided through a soc-specific table that is passed to the platform
> device handling code that ben is working on.
>
>> How can we adapt the current plat-s5pcxx code to better match the
>> migration to common plat-samsung directory?
>
> I think it is best to first wait for those changes to appear on the
> 24xx/6410 code in mainline. =A0We are working with System LSI to add =
the
> 6440. =A0Once that has been implemented and is known to work in next-=
s3c,
> I think you can adapt your code and e.g. remove some code from
> s5pc100-clock.c
>
> So for right now, I would recommend to be a bit patient until the cor=
e
> changes have emerged and stabilized, to avoid wasting your time to
> change to a moving target.

We are waiting too much time. but nothing are change. As you mentioned
you and ben try to change frameworks and directories. However we did a
lot of works already. but your changes make it works twice since to
match framework changes
The point of view are different, you and LSI focuses on 64xx series
but I don't interest these SoCs. Since we are focusing on s5pc1xx
series whatever S5PV210 is.
Also I can't find any activities at ben's git or LSI git. Where's your
works and plan?

If you want to change, please also change the s5pc1xx that merged at ma=
inline.

Thank you,
Kyungmin Park
