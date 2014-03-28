From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Fri, 28 Mar 2014 17:52:29 +0900
Message-ID: <021e01cf4a63$0cdb7380$26925a80$@samsung.com>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16>
 <20140309183523.GD22881@quad.lixom.net> <531CFA28.9020600@gmail.com>
 <CAOesGMiqhVk6JYhx=4446E1ZFWy7CrQNsjp8U6jf_De8FzidFw@mail.gmail.com>
 <01d001cf3ccc$39f339b0$add9ad10$@samsung.com>
 <CAOesGMiYJa7uM21ot_h6mGRTQX+HLcOsmTjk78WS0KZD6=piyw@mail.gmail.com>
 <20140319040149.30995.80279@quantum> <532B43F9.9060001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46179 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751771AbaC1Iwc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 04:52:32 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N350046R1ZH8ED0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Mar 2014 17:52:30 +0900 (KST)
In-reply-to: <532B43F9.9060001@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Kukjin Kim wrote:
> 
> On 03/19/14 13:01, Mike Turquette wrote:
> > Quoting Olof Johansson (2014-03-10 19:52:01)
> >> On Mon, Mar 10, 2014 at 6:50 PM, Kukjin Kim<kgene.kim@samsung.com>
> wrote:
> >>> Olof Johansson wrote:
> >>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> I don't see a single cc or acked-by line from Mike Turquette here.
> I'll
> >>>>>> hold
> >>>>>> off until he's had a chance to take a look at these ones; I suspect
> >>>>>> they'll be
> >>>>>> fine since it's mostly code refactoring though.
> >>>>>
> >>>>>
> >>>>> I guess I should have ACKed them too, but it felt kind of strange to
> ACK
> >>>> my
> >>>>> own patches. ;)
> >>>>>
> >>>>> Anyway, for all samsung-clk patches:
> >>>>>
> >>>>> Acked-by: Tomasz Figa<t.figa@samsung.com>
> >>>>
> >>>> Yeah, self-acking doesn't make much sense. :)
> >>>>
> >>>> I'm mostly worried about patches touching other subsystems without
> the
> >>>> other maintainer being aware of it or having reviewed them. As I
said,
> >>>> these mostly look like refactorings but it's still good habit.
> >>>>
> >>> OK, agreed, I think Mike knew about that though. Let's wait for Mike's
> >>> response.
> >>>
> >>> BTW, should I sort out the branch again if Mike gives ack on that?
> >>
> >> If I hear from Mike that he's OK with it then I can merge it, no need
> to rebase.
> >
> Thanks :-)
> 
> > Acked-by: Mike Turquette<mturquette@linaro.org>
> >
> It's time. Please pull this [5/6] and "[GIT PULL 6/6] Samsung
> clk-s3c24xx updates for v3.15".
> 
Hi Arnd, Olof and Mike,

Still I cannot see this in arm-soc. Any problems?

- Kukjin
