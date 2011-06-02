From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: exynos4: fix secondary CPU boot
Date: Thu, 2 Jun 2011 17:39:19 +0900
Message-ID: <BANLkTi=mvCgi_6Y57aVjpwrMhL58zPcUHw@mail.gmail.com>
References: <1305899190-16732-1-git-send-email-marc.zyngier@arm.com>
	<4DDD3C57.6020705@samsung.com>
	<1306346645.27474.182.camel@e102391-lin.cambridge.arm.com>
	<4DDD531A.50604@samsung.com>
	<1306422710.27474.237.camel@e102391-lin.cambridge.arm.com>
	<BANLkTi=fjq5ki8BGDhQxHVD3u-s7W-C1rw@mail.gmail.com>
	<1307003689.31098.6.camel@e102391-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:61632 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759725Ab1FBIjU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2011 04:39:20 -0400
Received: by vxi39 with SMTP id 39so466390vxi.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2011 01:39:19 -0700 (PDT)
In-Reply-To: <1307003689.31098.6.camel@e102391-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <Marc.Zyngier@arm.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

On Thu, Jun 2, 2011 at 5:34 PM, Marc Zyngier <Marc.Zyngier@arm.com> wro=
te:
> On Thu, 2011-06-02 at 16:01 +0900, Kyungmin Park wrote:
>> On Fri, May 27, 2011 at 12:11 AM, Marc Zyngier <Marc.Zyngier@arm.com=
> wrote:
>> > On Wed, 2011-05-25 at 12:06 -0700, Kukjin Kim wrote:
>> >> On 05/25/11 11:04, Marc Zyngier wrote:
>> >> > On Wed, 2011-05-25 at 10:28 -0700, Kukjin Kim wrote:
>> >> >> On 05/20/11 06:46, Marc Zyngier wrote:
>> >>
>> >> (snip)
>> >>
>> >> > So that address has changed between two SoC revisions? That's
>> >> > unfortunate, to say the least. I'm most probably using an early=
 revision
>> >> > of the hardware (EVT0?), as it doesn't even support MCT.
>> >> >
>> >> I'm afraid :( and I agree secondary CPU should work on all of
>> >> Exynos4210. But I'm still think about the method...
>> >>
>> >> > What about the following patch?
>> >> >
>> >> Uhm...this is really hack but I'd like to use another normal way.=
=2E.?
>> >
>> > Oh, no question about the hack status. The trouble is, unless ther=
e is a
>> > sure way to tell which SoC revision we're running on, there's litt=
le
>> > else we can do than poke both locations and pray.
>> >
>> > Is there such a way to identify the SoC revision?
>>
>> It's also required for OneNAND. as you know C210 EVT0 OneNAND DMA ha=
s
>> bug and need to workaround.
>>
>> platform codes should provide the these function. please see the OMA=
P
>> codes. how to handle it.
>
> So we know there's a need beyond the wish to see the second core up a=
nd
> running on my board.
>
> Now what is the proper method to detect the revision of the SOC?
> Handling it is no problem, once we have the information. Unfortunatel=
y
> the documentation I have is less than helpful on that subject.

It can be distinguished by chip id. but there's no code to handle this =
one.

0x4320 0200 EVT0
0x4321 0210 EVT1
0x4321 0211 EVT2

Thank you,
Kyungmin Park
>
> Cheers,
>
> =A0 =A0 =A0 =A0M.
> --
> Reality is an implementation detail.
>
>
>
