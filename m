From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos: add UART3 to DEBUG_LL ports
Date: Wed, 21 Nov 2012 18:49:40 +0900
Message-ID: <0dff01cdc7cd$86b14500$9413cf00$%kim@samsung.com>
References: <1353451739-6317-1-git-send-email-dianders@chromium.org>
 <20121121072959.GK7615@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42531 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751051Ab2KUJtm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Nov 2012 04:49:42 -0500
In-reply-to: <20121121072959.GK7615@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Doug Anderson' <dianders@chromium.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Olof Johansson wrote:
> 
> On Tue, Nov 20, 2012 at 02:48:58PM -0800, Doug Anderson wrote:
> > From: Olof Johansson <olof@lixom.net>
> >
> > UART3 is used for debugging on exynos5250-snow.
> >
> > [dianders: cleaned commit message.]
> >
> > Signed-off-by: Olof Johansson <olof@lixom.net>
> > Signed-off-by: Doug Anderson <dianders@chromium.org>
> 
> >
> > ---
> >  arch/arm/Kconfig.debug        |   11 +++++++++++
> >  arch/arm/plat-samsung/Kconfig |    1 +
> >  2 files changed, 12 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> > index 33a8930..35ba7dc 100644
> > --- a/arch/arm/Kconfig.debug
> > +++ b/arch/arm/Kconfig.debug
> > @@ -355,6 +355,17 @@ choice
> >  		  The uncompressor code port configuration is now handled
> >  		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
> >
> > +	config DEBUG_S3C_UART3
> > +		depends on PLAT_SAMSUNG
> 
> 
> Sorry, the reason I hadn't re-posted this is that Kukjin had proposed
> to protect users of <= 3 UART platforms to select it. An added "Depends
> on ARCH_EXYNOS4 || ARCH_EXYNOS5" should cover that. Can you add and
> repost, please?
> 
Yes, please :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
