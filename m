From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] phy: exynos-mipi-video: avoid uninitialized variable use
Date: Wed, 25 May 2016 20:54:59 +0200
Message-ID: <14219690.YQPrXjp7cP@wuerfel>
References: <1462971012-562097-1-git-send-email-arnd@arndb.de> <20160511185155.GB8265@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:61490 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750732AbcEYSzc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2016 14:55:32 -0400
In-Reply-To: <20160511185155.GB8265@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Wednesday, May 11, 2016 8:51:55 PM CEST Krzysztof Kozlowski wrote:
> On Wed, May 11, 2016 at 02:49:53PM +0200, Arnd Bergmann wrote:
> > A rework of the exynos-mipi-video driver caused a warning
> > about the new __set_phy_state function potentially accessing
> > a variable before its initialization:
> > 
> > drivers/phy/phy-exynos-mipi-video.c: In function '__set_phy_state':
> > drivers/phy/phy-exynos-mipi-video.c:238:13: error: 'val' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >   return val & data->resetn_val;
> >          ~~~~^~~~~~~~~~~~~~~~~~
> > drivers/phy/phy-exynos-mipi-video.c:235:6: note: 'val' was declared here
> >   u32 val;
> > 
> > The failure scenario here is the offset passed into a the
> > stub regmap_read() function that does not modify its output,
> > however regmap_read() can also fail for other reasons, so
> > adding error handling (in this case, returning zero from
> > is_running) seems the best solution.
> > 
> > Note that this warning showed up with the ARM s5pv210_defconfig,
> > indicating that we most likely want to either enable CONFIG_REGMAP
> > in that defconfig as well, or disable the phy-exynos-mipi-video
> > driver.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Fixes: 97a3042f7616 ("phy: exynos-mipi-video: Rewrite handling of phy registers")
> > ---
> >  drivers/phy/phy-exynos-mipi-video.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
> > index cc093ebfda94..8b851f718123 100644
> > --- a/drivers/phy/phy-exynos-mipi-video.c
> > +++ b/drivers/phy/phy-exynos-mipi-video.c
> > @@ -233,8 +233,12 @@ static inline int __is_running(const struct exynos_mipi_phy_desc *data,
> >                       struct exynos_mipi_video_phy *state)
> >  {
> >       u32 val;
> 
> Other way would be to initialize val=0 since there is no real error code
> returned. Anyway:
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This hasn't made it into linux-next yet, any chance we'll see it in -rc1 or -rc2?

	Arnd
