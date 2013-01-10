From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 01/26] gpio: samsung: remove inclusion <mach/regs-clock.h>
Date: Thu, 10 Jan 2013 10:41:12 -0800
Message-ID: <027701cdef62$12363bb0$36a2b310$@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
 <1357165443-3716-2-git-send-email-kgene.kim@samsung.com>
 <CACRpkdYhNHwqK3YkEKQedFvYDc6kuwesY4gmMroipnnhrLP6pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12056 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab3AJSl2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 13:41:28 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGF00BC2AKXJFM0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jan 2013 03:41:26 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGF002URAKZ3KB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jan 2013 03:41:26 +0900 (KST)
In-reply-to: <CACRpkdYhNHwqK3YkEKQedFvYDc6kuwesY4gmMroipnnhrLP6pA@mail.gmail.com>
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
> > The <mach/regs-clock.h> is not needed for gpio-samsung.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> Applied to fixes, thanks.
> 
Thanks :-)

BTW, do you have any comments on following patches?

[PATCH] gpio: samsung: silent build warning for EXYNOS5
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg14443.html

[PATCH] gpio: samsung: fix pinctrl condition for exynos and exynos5440
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/14758

[PATCH] gpio: samsung: skip gpio lib registration for EXYNOS5440
http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/14673

Any problems, please kindly let me know.

- Kukjin
