From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: SAMSUNG: Add check for NULL in clock interface
Date: Thu, 20 Sep 2012 08:22:30 +0900
Message-ID: <09a001cd96bd$a4155820$ec400860$%kim@samsung.com>
References: <1346941534-4501-1-git-send-email-chander.kashyap@linaro.org>
 <CAJuYYwR9ttbL9oknv7L60GnS3U1c_MX0Qddr6fg1zh7T1LzR=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11499 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601Ab2ISXWk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:22:40 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM00KPVE8WDD50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:22:31 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM00KHEE9JQI90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:22:31 +0900 (KST)
In-reply-to: <CAJuYYwR9ttbL9oknv7L60GnS3U1c_MX0Qddr6fg1zh7T1LzR=w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Chander Kashyap' <chander.kashyap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Thomas Abraham wrote:
> 
> On 6 September 2012 19:55, Chander Kashyap <chander.kashyap@linaro.org>
> wrote:
> > The clock instance parameter in Samsung clock interface is not being
> checked
> > for NULL pointers. Add checks for NULL pointers.
> >
> > Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> > ---
> >  arch/arm/plat-samsung/clock.c |    8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-
> samsung/clock.c
> > index 65c5eca..7938fbc 100644
> > --- a/arch/arm/plat-samsung/clock.c
> > +++ b/arch/arm/plat-samsung/clock.c
> > @@ -119,7 +119,7 @@ void clk_disable(struct clk *clk)
> >
> >  unsigned long clk_get_rate(struct clk *clk)
> >  {
> > -       if (IS_ERR(clk))
> > +       if (IS_ERR_OR_NULL(clk))
> >                 return 0;
> >
> >         if (clk->rate != 0)
> > @@ -136,7 +136,7 @@ unsigned long clk_get_rate(struct clk *clk)
> >
> >  long clk_round_rate(struct clk *clk, unsigned long rate)
> >  {
> > -       if (!IS_ERR(clk) && clk->ops && clk->ops->round_rate)
> > +       if (!IS_ERR_OR_NULL(clk) && clk->ops && clk->ops->round_rate)
> >                 return (clk->ops->round_rate)(clk, rate);
> >
> >         return rate;
> > @@ -146,7 +146,7 @@ int clk_set_rate(struct clk *clk, unsigned long
rate)
> >  {
> >         int ret;
> >
> > -       if (IS_ERR(clk))
> > +       if (IS_ERR_OR_NULL(clk))
> >                 return -EINVAL;
> >
> >         /* We do not default just do a clk->rate = rate as
> > @@ -175,7 +175,7 @@ int clk_set_parent(struct clk *clk, struct clk
> *parent)
> >  {
> >         int ret = 0;
> >
> > -       if (IS_ERR(clk))
> > +       if (IS_ERR_OR_NULL(clk) || IS_ERR_OR_NULL(parent))
> >                 return -EINVAL;
> >
> >         spin_lock(&clocks_lock);
> > --
> > 1.7.9.5
> 
> Acked-by: Thomas Abraham <thomas.abraham@linaro.org>

Looks OK, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
