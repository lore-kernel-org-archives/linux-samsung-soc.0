From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] arch/arm/mach-s5pv210: adding ifdef
 CONFIG_CPU_S5PV210to fix compiling issue
Date: Thu, 17 Jan 2013 19:33:34 -0800
Message-ID: <009801cdf52c$99adc200$cd094600$@samsung.com>
References: <001c01cdf510$c89c9800$59d5c800$@samsung.com>
 <20130118011846.3CEE21840258@intranet.asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25889 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754560Ab3ARDeM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 22:34:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGS00J2BXW9NMB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 12:33:47 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGS00JWLXW9LTA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 12:33:47 +0900 (KST)
In-reply-to: <20130118011846.3CEE21840258@intranet.asianux.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Chen=2CGang=28_=E9=99=88=E5=88=9A=29'?= <gang.chen@asianux.com>
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Chen,Gang( ??) wrote:
> 
> 
> > For subject:
> > Please see the git log before your commit, it should be helpful to you.
> > In this case, 'ARM: S5PV210: ...' is used.
> 
>   thank you, I should notice it next time.
>     an incorrect subject is not easy to get maintainer's notice
>     maybe it is the reason why you can not reply in time, since you can not notice it.
> 
>   :-)
> 
Just I was busy ;-) sorry for late my reply.

Anyway Gang, don't post with html typed e-mail, probably, you got some kind of error that your previous reply wasn't accepted from mailing list mail server. Please make sure that your e-mail is plain text type for mailing list.

[...]

> > I don't think so, because common.c in mach-s5pv210 should be built with
> > selecting CONFIG_CPU_S5PV210, actually it depends on CONFIG_ARCH_S5PV210
> > though.
> > 
> > Any concerns, please let me know.
> 
>   ok, thank you.
>   and
>     is it suitable to delete the reletive code of  " define NULL in common.h for s5pv210_* "  ?
>     it seems they are wast.
> 
Yes, right. We don't need more that.  I missed it when I introduced common.[ch] local at the commit 3fa754c2. Thanks for pointing out and I will sort out.

[...]

Thanks.

- Kukjin
