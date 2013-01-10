From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 09/26] ARM: SAMSUNG: cleanup mach/gpio-fns.h gpio-track.h
 and gpio-nrs.h
Date: Thu, 10 Jan 2013 10:44:35 -0800
Message-ID: <027801cdef62$8aec2e20$a0c48a60$@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
 <1357165443-3716-10-git-send-email-kgene.kim@samsung.com>
 <CACRpkda5rKrY85GXgdzomE5q6q0btGKX6UGgCn3N5AzxLv=s7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10725 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754856Ab3AJSot (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 13:44:49 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGF009UPAQLGPE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jan 2013 03:44:48 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGF004OKAQMSA20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jan 2013 03:44:48 +0900 (KST)
In-reply-to: <CACRpkda5rKrY85GXgdzomE5q6q0btGKX6UGgCn3N5AzxLv=s7Q@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>

Linus Walleij wrote:
> 
> On Wed, Jan 2, 2013 at 11:23 PM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
> 
> > remove <mach/gpio-fns.h>, <mach/gpio-track.h> and <plat/gpio-fns.h>
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> This really needs cleanup so

Yes! And sorry for late ;-)
Just note, I'm working on cleanup for other Samsung gpio stuff.

> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I guess you will carry this through the Samsung tree?

Yes :-) Let me add your ack on that.

Thanks.

- Kukjin
