From: Chanho Park <chanho61.park@samsusng.com>
Subject: RE: [PATCH] clk: exynos4: fix g2d/mdma clocks of exynos4x12
Date: Tue, 23 Jul 2013 09:42:24 +0900
Message-ID: <00f401ce873d$7fabbf80$7f033e80$@samsusng.com>
References: <1374480750-30962-1-git-send-email-chanho61.park@samsung.com>
 <CAK9yfHwNgZrZPT5c4DxfsDchWFXR2nWTVxCY2kZTEZW4PwyOng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47520 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751589Ab3GWAmr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 20:42:47 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQD00HOW5YNNQ60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Jul 2013 09:42:24 +0900 (KST)
In-reply-to: <CAK9yfHwNgZrZPT5c4DxfsDchWFXR2nWTVxCY2kZTEZW4PwyOng@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Chanho Park' <chanho61.park@samsung.com>
Cc: mturquette@linaro.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

> -----Original Message-----
> From: Sachin Kamat [mailto:sachin.kamat@linaro.org]
> Sent: Monday, July 22, 2013 7:01 PM
> To: Chanho Park
> Cc: mturquette@linaro.org; kgene.kim@samsung.com;
> thomas.abraham@linaro.org; t.figa@samsung.com; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; Kyungmin
> Park
> Subject: Re: [PATCH] clk: exynos4: fix g2d/mdma clocks of exynos4x12
> 
> Hi Chanho,
> 
> On 22 July 2013 13:42, Chanho Park <chanho61.park@samsung.com> wrote:
> > The exynos4x12 has different address of GATE_IP_IMAGE reg. We should
> > use EXYNOS4X12_GATE_IP_IMAGE for g2d gating clocks instead of 4210's
> reg.
> > In case of mdma node, We don't use it for any exynos4 chipsets. I
> > think we'll need to change it to 'none' or leave it on.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynos4.c |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos4.c
> > b/drivers/clk/samsung/clk-exynos4.c
> > index 1bdb882..6300c9d 100644
> > --- a/drivers/clk/samsung/clk-exynos4.c
> > +++ b/drivers/clk/samsung/clk-exynos4.c
> > @@ -820,8 +820,10 @@ struct samsung_gate_clock exynos4210_gate_clks[]
> > __initdata = {  struct samsung_gate_clock exynos4x12_gate_clks[]
> __initdata = {
> >         GATE(audss, "audss", "sclk_epll", E4X12_GATE_IP_MAUDIO, 0, 0,
0),
> >         GATE(mdnie0, "mdnie0", "aclk160", GATE_IP_LCD0, 2, 0, 0),
> > +       GATE(g2d, "g2d", "aclk200", E4X12_GATE_IP_IMAGE, 0, 0, 0),
> >         GATE(rotator, "rotator", "aclk200", E4X12_GATE_IP_IMAGE, 1, 0,
> 0),
> > -       GATE(mdma2, "mdma2", "aclk200", E4X12_GATE_IP_IMAGE, 2, 0, 0),
> > +       GATE(mdma, "mdma", "aclk200", E4X12_GATE_IP_IMAGE, 2, 0, 0),
> > +       GATE(smmu_g2d, "smmu_g2d", "aclk200", E4X12_GATE_IP_IMAGE, 3,
> > + 0, 0),
> >         GATE(smmu_mdma, "smmu_mdma", "aclk200", E4X12_GATE_IP_IMAGE, 5,
> 0, 0),
> >         GATE(mipi_hsi, "mipi_hsi", "aclk133", GATE_IP_FSYS, 10, 0, 0),
> >         GATE(chipid, "chipid", "aclk100", E4X12_GATE_IP_PERIR, 0, 0,
> > 0),
> 
> Which kernel version is this patch based on? G2D clocks for 4x12 has
> already been added by commit 5cd644d837 ("clk: exynos4: Add additional
> G2D clocks").

I think I missed your patch.
I'll check it and re-send it without g2d gate clock.
Thanks

Best Regards,
Chanho Park
