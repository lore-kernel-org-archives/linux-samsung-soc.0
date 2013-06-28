From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH V2 3/3] video: exynos_dp: Use the generic PHY driver
Date: Fri, 28 Jun 2013 12:27:02 +0200
Message-ID: <20130628102702.GK305@game.jcrosoft.org>
References: <002101ce73cf$ac989b70$05c9d250$@samsung.com>
 <20130628093459.GD11297@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130628093459.GD11297@arwen.pp.htv.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: linux-fbdev@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, Jingoo Han <jg1.han@samsung.com>, 'Donghwa Lee' <dh09.lee@samsung.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Inki Dae' <inki.dae@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 12:35 Fri 28 Jun     , Felipe Balbi wrote:
> On Fri, Jun 28, 2013 at 04:18:23PM +0900, Jingoo Han wrote:
> > Use the generic PHY API instead of the platform callback to control
> > the DP PHY. The 'phy_label' field is added to the platform data
> > structure to allow PHY lookup on non-dt platforms.
> > 
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> >  .../devicetree/bindings/video/exynos_dp.txt        |   17 ---
> >  drivers/video/exynos/exynos_dp_core.c              |  118 ++------------------
> >  drivers/video/exynos/exynos_dp_core.h              |    2 +
> >  include/video/exynos_dp.h                          |    6 +-
> >  4 files changed, 15 insertions(+), 128 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt b/Documentation/devicetree/bindings/video/exynos_dp.txt
> > index 84f10c1..a8320e3 100644
> > --- a/Documentation/devicetree/bindings/video/exynos_dp.txt
> > +++ b/Documentation/devicetree/bindings/video/exynos_dp.txt
> > @@ -1,17 +1,6 @@
> >  The Exynos display port interface should be configured based on
> >  the type of panel connected to it.
> >  
> > -We use two nodes:
> > -	-dp-controller node
> > -	-dptx-phy node(defined inside dp-controller node)
> > -
> > -For the DP-PHY initialization, we use the dptx-phy node.
> > -Required properties for dptx-phy:
> > -	-reg:
> > -		Base address of DP PHY register.
> > -	-samsung,enable-mask:
> > -		The bit-mask used to enable/disable DP PHY.
> > -
> >  For the Panel initialization, we read data from dp-controller node.
> >  Required properties for dp-controller:
> >  	-compatible:
> > @@ -67,12 +56,6 @@ SOC specific portion:
> >  		interrupt-parent = <&combiner>;
> >  		clocks = <&clock 342>;
> >  		clock-names = "dp";
> > -
> > -		dptx-phy {
> > -			reg = <0x10040720>;
> > -			samsung,enable-mask = <1>;
> > -		};
I've an issue here you break dt compatibilty

Best Regards,
J.
