From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/2] clk: samsung: exynos5250: Add DISP1 clocks
Date: Fri, 16 Oct 2015 10:26:51 -0700
Message-ID: <20151016172651.GB23912@codeaurora.org>
References: <1444905084-22540-1-git-send-email-tomeu.vizoso@collabora.com>
 <1444905084-22540-2-git-send-email-tomeu.vizoso@collabora.com>
 <56203AD3.2050905@samsung.com>
 <20151016124935.20687.4394@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151016124935.20687.4394@quantum>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/16, Michael Turquette wrote:
> Quoting Krzysztof Kozlowski (2015-10-15 16:46:27)
> > On 15.10.2015 19:31, Tomeu Vizoso wrote:
> > > When the DISP1 power domain is powered off, there's two clocks that need
> > > to be temporarily reparented to OSC, and back to their original parents
> > > when the domain is powered on again.
> > > 
> > > We expose these two clocks in the DT bindings so that the DT node of the
> > > power domain can reference them.
> > > 
> > > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> > > ---
> > > 
> > > Changes in v2:
> > > - Reuse mout_aclk200_p
> > > - Rename div_aclk300 as div_aclk300_disp
> > > 
> > >  drivers/clk/samsung/clk-exynos5250.c   | 14 +++++++++++++-
> > >  include/dt-bindings/clock/exynos5250.h |  4 +++-
> > >  2 files changed, 16 insertions(+), 2 deletions(-)
> > > 
> > 
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Applied to clk-next.
> 

I think Tomeu wanted to take this through arm-soc? Otherwise
we'll need to provide a stable branch for the dt header.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
