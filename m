From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/5] ARM: exynos: enable/disable cpuidle when cpu1 is
 down/up
Date: Thu, 17 Jan 2013 19:51:31 -0800
Message-ID: <00be01cdf52f$1bc907c0$535b1740$@samsung.com>
References: <1357318799-24378-1-git-send-email-daniel.lezcano@linaro.org>
 <1357318799-24378-5-git-send-email-daniel.lezcano@linaro.org>
 <CADGdYn7y_SSmLoEpeRjL8PDSZS-YJwC1QpRcUocSSnDyM8BRhQ@mail.gmail.com>
 <50EF3369.2060902@free.fr>
 <CADGdYn4eRbkZt_Rshqg-a_CoAmF5LBobzT3=3h09syaH0z6uJA@mail.gmail.com>
 <50F551F3.2060400@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28091 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753963Ab3ARDvq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 22:51:46 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGS007H1YQ8WQF0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 12:51:44 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGS000IFYQ55M80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 12:51:44 +0900 (KST)
In-reply-to: <50F551F3.2060400@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Daniel Lezcano' <daniel.lezcano@linaro.org>
Cc: 'amit daniel kachhap' <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Daniel Lezcano wrote:
> 
> On 01/10/2013 11:33 PM, amit daniel kachhap wrote:
> > On Thu, Jan 10, 2013 at 1:32 PM, Daniel Lezcano <daniel.lezcano@free.fr>
> wrote:
> >> On 01/10/2013 09:07 PM, amit daniel kachhap wrote:
> >>> Hi Daniel,
> >>
> >> Hi Amit Daniel,
> >>
> >>> This hotplug noifiers looks fine. I suppose it should add extra state
> >>> C1 in cpu0. If it is done like below than for normal cases(when all
> >>> cpu's are online) there wont be any statistics for C0 state
> >>
> >> I guess you meant state 0 which is WFI, right ?
> >> C0 state is the intel semantic for cpu fully turned on.
> > Yes I meant C0 as wfi
> >>
> >>> also which
> >>> is required. Other patches look good.
> >>
> >> Ok, that makes sense to have statistics even if they are only doing WFI.
> >>
> >> Then the patch 4/5 is not ok, no ?
> > yes I suppose patch 4 and patch 5 are related and depends how you
> > frame patch 5. I think it is better to create C0/C1 sysfs and other
> > things in the beginning because it is a filesystem call and may
> > increase the cpu hotplug time which is not worth. May be if cpuidle
> > framework exposes some API to enable/disable states then it is better.
> >
> > For patch 1,2 and 3,
> > Acked-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> 
> Hi Kukjin,
> 
> is it possible to take these patches [1-3/5] ?
> 
Looks OK to me, I will apply with Amit's ack.

> The patches [3-4/5] could be ignored.
> 
Probably, you mean [4-5/5] :-)

Thanks.

- Kukjin
