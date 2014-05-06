From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 2/2] ARM: dts: Add peach-pit board support
Date: Tue, 06 May 2014 11:05:52 +0900
Message-ID: <06a801cf68cf$b5151350$1f3f39f0$@samsung.com>
References: <1399281933-31064-1-git-send-email-arun.kk@samsung.com>
 <1399281933-31064-3-git-send-email-arun.kk@samsung.com>
 <CAD=FV=VH_WMQ+bENDDHB1OEPs9WOTVz7MLqYS6b=43vP5KgPkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54880 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933564AbaEFCFy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 22:05:54 -0400
In-reply-to: <CAD=FV=VH_WMQ+bENDDHB1OEPs9WOTVz7MLqYS6b=43vP5KgPkA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, 'Arun Kumar K' <arun.kk@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>, 'Arun Kumar' <arunkk.samsung@gmail.com>

Doug Anderson wrote:
> 
> Arun,
> 
> On Mon, May 5, 2014 at 2:25 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
> > Adds the google peach-pit board dts file which uses
> > exynos5420 SoC.
> >
> > Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> > Signed-off-by: Doug Anderson <dianders@chromium.org>
> > ---
> >  arch/arm/boot/dts/Makefile                 |    1 +
> >  arch/arm/boot/dts/exynos5420-peach-pit.dts |  147
> ++++++++++++++++++++++++++++
> >  2 files changed, 148 insertions(+)
> 
> Note that this has an implicit dependency upon
> <https://patchwork.kernel.org/patch/4101881/> (ARM: dts: Add pwmX_out
> pinctrl nodes to Exynos5420).  Once that has landed then I think we're
> good to go.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Hi,

Thanks for Arun's re-spin and Tomasz and Doug's review.

Applied 1st and this.

Thanks,
Kukjin
