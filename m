From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: Exynos4: Put PCM, Slimbus,
 Spdif clocks to off state
Date: Thu, 20 Sep 2012 08:23:49 +0900
Message-ID: <09a101cd96bd$d33e4030$79bac090$%kim@samsung.com>
References: <1346940968-4423-1-git-send-email-chander.kashyap@linaro.org>
 <CAJuYYwT443=NPZX4n2Y9TToWZ9-yH5YQyCa3iq_LRCv1XnF0WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24129 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752665Ab2ISXXv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:23:51 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM006XFEBG7MB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:23:50 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM009P5EBQZE50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:23:50 +0900 (KST)
In-reply-to: <CAJuYYwT443=NPZX4n2Y9TToWZ9-yH5YQyCa3iq_LRCv1XnF0WQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Chander Kashyap' <chander.kashyap@linaro.org>, 'Sangbeom Kim' <sbkim73@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Thomas Abraham wrote:
> 
> On 6 September 2012 19:46, Chander Kashyap <chander.kashyap@linaro.org>
> wrote:
> > The clocks for PCM, Slimbus, Spdif added to off list in order
> > to turn them off at boot time.
> >
> > Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> > ---
> >  arch/arm/mach-exynos/clock-exynos4.c |   19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-
> exynos/clock-exynos4.c
> > index 7cc5491..6a45c9a 100644
> > --- a/arch/arm/mach-exynos/clock-exynos4.c
> > +++ b/arch/arm/mach-exynos/clock-exynos4.c
> > @@ -627,6 +627,25 @@ static struct clk exynos4_init_clocks_off[] = {
> >                 .enable         = exynos4_clk_ip_peril_ctrl,
> >                 .ctrlbit        = (1 << 21),
> >         }, {
> > +               .name           = "pcm",
> > +               .devname        = "samsung-pcm.1",
> > +               .enable         = exynos4_clk_ip_peril_ctrl,
> > +               .ctrlbit        = (1 << 22),
> > +       }, {
> > +               .name           = "pcm",
> > +               .devname        = "samsung-pcm.2",
> > +               .enable         = exynos4_clk_ip_peril_ctrl,
> > +               .ctrlbit        = (1 << 23),
> > +       }, {
> > +               .name           = "slimbus",
> > +               .enable         = exynos4_clk_ip_peril_ctrl,
> > +               .ctrlbit        = (1 << 25),
> > +       }, {
> > +               .name           = "spdif",
> > +               .devname        = "samsung-spdif",
> > +               .enable         = exynos4_clk_ip_peril_ctrl,
> > +               .ctrlbit        = (1 << 26),
> > +       }, {
> >                 .name           = "ac97",
> >                 .devname        = "samsung-ac97",
> >                 .enable         = exynos4_clk_ip_peril_ctrl,
> > --
> > 1.7.9.5
> 
> Acked-by: Thomas Abraham <thomas.abraham@linaro.org>

Sangbeom, could you please check this one more?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
