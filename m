From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 2/5] clk: samsung: Add support to register rate_table
 for PLL3xxx
Date: Mon, 03 Jun 2013 17:25:10 +0200
Message-ID: <1710144.fZn06WrzIc@amdc1227>
References: <1369834677-20312-1-git-send-email-vikas.sajjan@linaro.org>
 <CAD=FV=VDi+SfebiFnPNp8qR__9L=o9TJ+WSPRfRQLX+p+TMmJw@mail.gmail.com>
 <CAKew6eVGnHNN7Fk=sqzE1iV+SFtJ1z4k1freeWdbGaYPXqpUvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:30422 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756694Ab3FCPZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jun 2013 11:25:19 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MNT00GMRPFEZPB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Jun 2013 16:25:16 +0100 (BST)
In-reply-to: <CAKew6eVGnHNN7Fk=sqzE1iV+SFtJ1z4k1freeWdbGaYPXqpUvQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Hi Yadwinder,

On Thursday 30 of May 2013 12:25:40 Yadwinder Singh Brar wrote:
> Hi Doug,
> 
> On Thu, May 30, 2013 at 5:14 AM, Doug Anderson <dianders@chromium.org> 
wrote:
> > Vikas / Yadwinder,
> > 
> > On Wed, May 29, 2013 at 6:37 AM, Vikas Sajjan <vikas.sajjan@linaro.org> 
wrote:
> >> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
> >> 
> >> This patch defines a common rate_table which will contain recommended p,
> >> m, s, k values for supported rates that needs to be changed for changing
> >> corresponding PLL's rate.
> >> 
> >> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> >> ---
> >> 
> >>  drivers/clk/samsung/clk-exynos4.c    |    8 ++++----
> >>  drivers/clk/samsung/clk-exynos5250.c |   14 +++++++-------
> >>  drivers/clk/samsung/clk-pll.c        |   14 ++++++++++++--
> >>  drivers/clk/samsung/clk-pll.h        |   33
> >>  +++++++++++++++++++++++++++++++-- 4 files changed, 54 insertions(+), 15
> >>  deletions(-)
> > 
> > I also reviewed this in our gerrit
> > <https://gerrit.chromium.org/gerrit/#/c/56742/>, but I'll summarize
> > here for the list...
> > 
> >>  struct clk * __init samsung_clk_register_pll35xx(const char *name,
> >> 
> >> -                       const char *pname, const void __iomem *base)
> >> +                       const char *pname, const void __iomem *base,
> >> +                       const struct samsung_pll_rate_table *rate_table,
> >> +                       const unsigned int rate_count)
> > 
> > Feels like you should document here that rate_table needs to be sorted
> > and the sort order.
> 
> sure,  we will add comment  to sort the table in descending order.
> 
> >> +struct samsung_pll_rate_table {
> >> +       unsigned  int rate;
> > 
> > nit: extra space before "int" should be removed.
> 
> ok
> 
> > Also: you can include rate here if you need a convenient place to
> > store it (which sadly means that this structure can't be const).
> > ...but I do like Tomasz's idea of actually calculating it.  You can't
> > know it at compile time since the parent rate comes from the device
> > tree.
> > 
> > compatible = "samsung,clock-xxti";
> > clock-frequency = <24000000>;
> 
> Actually this table should contain the recommended values
> and if we see the user manual, the input(parent) rate is also a part
> of recommended
> table of different output rate for a particular PLL for that SoC.

>From what I understood in the documentation is that there is a set of 
recommended P, M, S (, K) tuples for each PLL and they are not dependent on 
input frequency - f_in and f_out are provided in the table just for reference 
to see the relation between output frequency and input frequency.

I think we should ask some H/W engineer about that to make sure and choose the 
proper implementation, which will work properly for future cases, instead of 
ending with something that works just with current cases.

Best regards,
-- 
Tomasz Figa
Linux Kernel Developer
Samsung R&D Institute Poland
Samsung Electronics

> So as Tomasz said input(parent) rate may change with board,
> then, do those corresponding recommended p, m, s, k will be valid?
> 
> In case, input(parent) rate changes then we may need different set of p, m
> ,s, k values recommended for new input rate to get required(recommended to
> use) output rate.
>
> So, we think its better that the p, m, s and k along with the parent
> is known at the compile time ( or DT ?),
> as these p, m, s, k values are very much coupled with the parent rate
> to achieve the
>  required(recommended to use) output rate.
> 
> Also, since the sorted table is required (sorted based on "rate"),
> its better to have the rate in a const rate table.
> 
> And the whole set of recommended values should come from same place(DT
> or static table),
> to keep the things simple and consistent.
> 
> Moreover, practically for a particular SoC , we use the recommended
> input(parent) rate only for a PLL.
> So we should keep the things simple here presently.
> 
> >> +       unsigned int pdiv;
> >> +       unsigned int mdiv;
> >> +       unsigned int sdiv;
> >> +       unsigned int kdiv;
> > 
> > I think kdiv is signed.
> 
> No, as these values should be the recommended values to be written in
> corresponding  register bits. So it should remain unsigned.
> 
> K value should be considered as negative only while recalculating rate.
> 
> As per exynos5250 user manual's section 7.3.2 :
> " K value description "Postive value (Negative value)":
> Postive values is that you should write EPLLCON/VPLLCON register.
> Negative value is that you can calculate PLL output frequency with it."
> 
> > -Doug
> 
> Regards,
> Yadwinder & Vikas.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
