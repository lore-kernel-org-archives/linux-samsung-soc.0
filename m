From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3] gpio: samsung: use pr_* instead of printk
Date: Tue, 23 Oct 2012 23:10:14 +0900
Message-ID: <021101cdb128$1f56c1c0$5e044540$%kim@samsung.com>
References: <002801cdac0a$11e4f340$35aed9c0$%han@samsung.com>
 <CACRpkdYx1HLF2==6DsPp+qC6Xyb7Ag8qa1K7g2Ht-Y2T-UjzMA@mail.gmail.com>
 <00a201cdaff0$d90a11a0$8b1e34e0$%han@samsung.com>
 <CACRpkdZCH_bxviyz5Qqx0ttFFGW-CkJT6vCT3-JcOgQ5quK0kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26436 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932655Ab2JWOKQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 10:10:16 -0400
In-reply-to: <CACRpkdZCH_bxviyz5Qqx0ttFFGW-CkJT6vCT3-JcOgQ5quK0kg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Ryan Mallon' <rmallon@gmail.com>

Linus Walleij wrote:
> 
> On Mon, Oct 22, 2012 at 3:02 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> > On Friday, October 19, 2012 7:09 PM Linus Walleij wrote
> >>
> >> On Wed, Oct 17, 2012 at 3:52 AM, Jingoo Han <jg1.han@samsung.com>
wrote:
> >>
> >> > This patch uses pr_* instead of printk. Also, gpio_dbg
> >> > is replaced with pr_debug.
> >> >
> >> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> >> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org> <- NAK
> >>
> >> Please consult Documentation/SubmittingPatches as to the conditions
> that
> >> apply when you add Reviewed-by tags.
> >
> > Um, you already gave the Reviewed-by to the same patch, a month ago.
> > Anyway, I will remove Reviewed-by and send v4 patch, soon.
> 
> My bad. I confused this mail thread for something else, sorry
> for this. :-(
> 
> Please keep the Reviewed-tag if you want to!
> 
Linus, if you don't have any objection, let me take this into Samsung tree.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
