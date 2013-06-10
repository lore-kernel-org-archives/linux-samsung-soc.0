From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: add pin state information for DP HPD support to
 Exynos5250
Date: Mon, 10 Jun 2013 17:35:08 +0900
Message-ID: <0ea201ce65b5$6a78ca30$3f6a5e90$%kim@samsung.com>
References: <000001ce4e1e$d1cc5de0$756519a0$@samsung.com>
 <CAD=FV=V9oBR1ZAEsMs5-x7NaD1fiHJO=9dn1mPAMg0MX6tnxYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAD=FV=V9oBR1ZAEsMs5-x7NaD1fiHJO=9dn1mPAMg0MX6tnxYA@mail.gmail.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, 'Jingoo Han' <jg1.han@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Sean Paul' <seanpaul@chromium.org>, =?ISO-8859-1?Q?'St=E9phane_Marchesin'?= <marcheu@chromium.org>, 'Andrew Bresticker' <abrestic@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Doug Anderson wrote:
> 
> Jingoo,
> 
> On Sat, May 11, 2013 at 1:09 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> > Add pin state information for DP HPD support that requires
> > pin configuration support using pinctrl interface.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> > Tested on Exynos5250
> >
> >  arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    7 +++++++
> >  arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 +++
> >  2 files changed, 10 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> > index d1650fb..e9cdee3 100644
> > --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> > @@ -553,6 +553,13 @@
> >                         samsung,pin-pud = <0>;
> >                         samaung,pin-drv = <0>;
> >                 };
> > +
> > +               dp_hpd: dp_hpd {
> > +                       samsung,pins = "gpx0-7";
> > +                       samsung,pin-function = <3>;
> > +                       samsung,pin-pud = <0>;
> > +                       samaung,pin-drv = <0>;
> > +               };
> >         };
> >
> >         pinctrl@13400000 {
> > diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > index 3e0c792..d53ea34 100644
> > --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > @@ -224,6 +224,9 @@
> >                 samsung,color-depth = <1>;
> >                 samsung,link-rate = <0x0a>;
> >                 samsung,lane-count = <4>;
> > +
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&dp_hpd>;
> 
> I was going to suggest moving this to exynos5250.dtsi but then
> realized that I saw a board recently that used a non-standard HPD pin
> recently!  ...so keeping it in the board file (like you've done) is
> good.
> 
> ...so looks good to me.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Yeah, I agreed with Doug's comment :-)

Applied, thanks.

- Kukjin
