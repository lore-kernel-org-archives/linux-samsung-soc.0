From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 5/6] Samsung PM updates for v3.15
Date: Tue, 11 Mar 2014 10:50:03 +0900
Message-ID: <01d001cf3ccc$39f339b0$add9ad10$@samsung.com>
References: <8259832.260591393840570438.JavaMail.weblogic@epml16>
 <20140309183523.GD22881@quad.lixom.net> <531CFA28.9020600@gmail.com>
 <CAOesGMiqhVk6JYhx=4446E1ZFWy7CrQNsjp8U6jf_De8FzidFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20829 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753562AbaCKBuJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 21:50:09 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N290040W13IRN00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Mar 2014 10:50:06 +0900 (KST)
In-reply-to: <CAOesGMiqhVk6JYhx=4446E1ZFWy7CrQNsjp8U6jf_De8FzidFw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Mike Turquette' <mturquette@linaro.org>, arm@kernel.org, arnd@arndb.de, khilman@linaro.org, linux-arm-kernel@lists.infradead.org

Olof Johansson wrote:
> 
> >> Hi,
> >>
> >> I don't see a single cc or acked-by line from Mike Turquette here. I'll
> >> hold
> >> off until he's had a chance to take a look at these ones; I suspect
> >> they'll be
> >> fine since it's mostly code refactoring though.
> >
> >
> > I guess I should have ACKed them too, but it felt kind of strange to ACK
> my
> > own patches. ;)
> >
> > Anyway, for all samsung-clk patches:
> >
> > Acked-by: Tomasz Figa <t.figa@samsung.com>
> 
> Yeah, self-acking doesn't make much sense. :)
> 
> I'm mostly worried about patches touching other subsystems without the
> other maintainer being aware of it or having reviewed them. As I said,
> these mostly look like refactorings but it's still good habit.
> 
OK, agreed, I think Mike knew about that though. Let's wait for Mike's
response.

BTW, should I sort out the branch again if Mike gives ack on that?

- Kukjin
