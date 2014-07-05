From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: RE: [PATCH] thermal: Add missing cpumask_clear
Date: Sat, 05 Jul 2014 09:40:38 +0900
Message-ID: <000801cf97e9$bde80f70$39b82e50$@samsung.com>
References: <000001cf9771$e2f465c0$a8dd3140$@samsung.com>
 <CAK5sBcHDTgyj67xVWgtNH-Z7XU1Ykp6m650_mWBVp=Az2P6f=Q@mail.gmail.com>
 <000101cf97e0$f9ba7a50$ed2f6ef0$@samsung.com> <53B747FF.5010604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35082 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753682AbaGEAkk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 20:40:40 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8700B9NR7Q5NA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 05 Jul 2014 09:40:38 +0900 (KST)
In-reply-to: <53B747FF.5010604@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sachin Kamat' <spk.linux@gmail.com>
Cc: 'Jonghwa Lee' <jonghwa3.lee@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Lukasz Majewski' <l.majewski@samsung.com>, 'Eduardo Valentin' <eduardo.valentin@ti.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org

On Fri, Jul 5, 2014 at 9:34 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> > Console message-> 4.861157] [c6] --ID [ 1] = 0,4-5,7 (4,5,7 cpu bit
> > was set.)
> >
> > And when I tried to register two cooling devices with cpumask_set_cpu(0, &mask_val) and
> cpumask_set_cpu(4, &mask_val).
> >
> > I found that cpu 0 bit is also set in latter cpumask. (I hope latter
> > cpumask has a cpu 4 bit.)
> >
> > So I think that cpumask_clear should be inserted.
> 
> I believe Sachin's concern was related to your patch description. A good description should say what
> the patch changes and what is the rationale behind this change. Also for fixes it is a good practice
> to specify observed issues in patch description as well.
> 
> Best regards,

-> You are right.

Thanks for your kind advice.


Best regards.
