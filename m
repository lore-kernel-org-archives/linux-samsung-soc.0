From: Mike Turquette <mturquette@linaro.org>
Subject: Re: RE: [PATCH 1/1] of/documentation: Fix a typo in exynos5250-clock.txt
Date: Sun, 21 Jul 2013 21:42:54 -0700
Message-ID: <20130722044254.5453.82900@quantum>
References: <1373012281-26433-1-git-send-email-sachin.kamat@linaro.org>
 <0ab501ce867e$0adadd40$209097c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <0ab501ce867e$0adadd40$209097c0$%kim@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@linaro.org, rob@landley.net, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Kukjin Kim (2013-07-21 18:51:54)
> Sachin Kamat wrote:
> > 
> > The clocks should be numbered sequentially as they are represented as
> > enum values in the clock driver.
> > 
> > Typo introduced by commit 17d4caccef ("clk: exynos5250: register
> > display block gate clocks to common clock framework")
> > 
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/exynos5250-clock.txt |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> > b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> > index 781a627..1a05761 100644
> > --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> > +++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> > @@ -154,7 +154,7 @@ clock which they consume.
> >    dsim0                      341
> >    dp                 342
> >    mixer                      343
> > -  hdmi                       345
> > +  hdmi                       344
> > 
> >  Example 1: An example of a clock controller node is listed below.
> > 
> > --
> > 1.7.9.5
> 
> Looks OK to me.
> 
> Mike, do you want me to take into the samsung tree?

I've pulled this into clk-next.

Thanks!
Mike

> 
> Thanks,
> Kukjin
