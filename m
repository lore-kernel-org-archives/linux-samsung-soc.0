From: Will Deacon <will.deacon@arm.com>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Wed, 10 Sep 2014 17:23:13 +0100
Message-ID: <20140910162313.GA1710@arm.com>
References: <540C202E.2060009@collabora.co.uk> <540C7F5B.6070307@gmail.com>
 <540C83DE.10505@collabora.co.uk> <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <20140908134937.GK4015@sirena.org.uk>
 <540DB7B4.4060300@collabora.co.uk> <20140910111728.GG28488@arm.com>
 <CAD=FV=Uf+4=mcwMM8qhx4r9WzcKZkgwHjUR26wnvPJJzDvmvSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=Uf+4=mcwMM8qhx4r9WzcKZkgwHjUR26wnvPJJzDvmvSg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Stephen Warren <swarren@nvidia.com>, Tomasz Figa <tomasz.figa@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "olof@lixom.net" <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 10, 2014 at 05:03:52PM +0100, Doug Anderson wrote:
> On Wed, Sep 10, 2014 at 4:17 AM, Will Deacon <will.deacon@arm.com> wrote:
> > On Mon, Sep 08, 2014 at 03:05:40PM +0100, Javier Martinez Canillas wrote:
> >> Since many folks don't agree that hacking different subsystems is the way
> >> forward I'll hold the patches and don't post them. The sunxi thread [0]
> >> already shows how different people have strong opposite positions on the
> >> correct approach to handle this.
> >>
> >> For now you can just disable the tps65090 PMIC support by not enabling the
> >> CONFIG_REGULATOR_TPS65090 kconfig symbol on your kernel config. That will give
> >> you exactly the same behavior that before tps65090 support was added to the
> >> Snow DT on commit b16be76 ("ARM: dts: add tps65090 power regulator for
> >> exynos5250-snow") which AFAIU was good enough for your workflow.
> >
> > Disabling the regulator support gives me my framebuffer back, thanks.
> 
> Yay!  Is this good enough to tide you over until DRM support lands?

I'm a happy camper as long as it doesn't break again. It looks like I've
started another discussion as to whether simplefb breakages count as
regressions.

> > I
> > then get stuck mounting my root filesystem over sd card because it's
> > reported as read-only. The following hack solved the issue, but I'm not
> > exactly sure where this regression has come from (whether this is a board
> > quirk or pinctrl is really misconfigured).
> 
> This is a regression that was introduced by:
> 
> 9795a84 mmc: dw_mmc: remove dw_mci_of_cd_gpio/wp_gpio()
> 
> In "exynos5250-cros-common.dtsi" you can see that the "wp-gpios =
> <&gpc2 1 0>;" is still listed under the slot node.  Nobody is looking
> there anymore.
> 
> This is fixed in linux-next by:
> 
> aaa25a5 ARM: dts: unuse the slot-node and deprecate the
> supports-highspeed for dw-mmc in exynos

Thanks for the patch info.

> I'll let Kukjin decide what he wants to do about the regression in
> v3.17 (how to deal with conflicts, backporting, etc).

Kukjin, please can you see about getting this merged? Not being able to
mount my root filesystem is less than ideal.

Will
