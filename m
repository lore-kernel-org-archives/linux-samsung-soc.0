From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5420
Date: Tue, 06 May 2014 09:29:04 +0900
Message-ID: <060d01cf68c2$31598c10$940ca430$@samsung.com>
References: <1399034937-24683-1-git-send-email-arun.kk@samsung.com>
 <CAD=FV=V30qfsRfFZ7LXnF9VmMo5dGJx6FfOaKwGrLtS5_r7PGQ@mail.gmail.com>
 <5363D6BD.6070001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <5363D6BD.6070001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Tomasz Figa' <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Doug Anderson' <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, 'Arun Kumar K' <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Arun Kumar' <arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:
> 
> Hi,
> 
Hi,

> On 02.05.2014 17:44, Doug Anderson wrote:
> > Arun,
> >
> > On Fri, May 2, 2014 at 5:48 AM, Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> >> Adds the PWM nodes to 5420 pinctrl dtsi file.
> >>
> >> Signed-off-by: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >>   arch/arm/boot/dts/exynos5420-pinctrl.dtsi |   28
> ++++++++++++++++++++++++++++
> >>   1 file changed, 28 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> >> index e62c8eb..ba686e4 100644
> >> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> >> @@ -624,6 +624,34 @@
> >>                          samsung,pin-drv = <0>;
> >>                  };
> >>
> >> +               pwm0_out: pwm0-out {
> >> +                       samsung,pins = "gpb2-0";
> >> +                       samsung,pin-function = <2>;
> >> +                       samsung,pin-pud = <0>;
> >> +                       samsung,pin-drv = <0>;
> >> +               };
> >> +
> >> +               pwm1_out: pwm1-out {
> >> +                       samsung,pins = "gpb2-1";
> >> +                       samsung,pin-function = <2>;
> >> +                       samsung,pin-pud = <0>;
> >> +                       samsung,pin-drv = <0>;
> >> +               };
> >> +
> >> +               pwm2_out: pwm2-out {
> >> +                       samsung,pins = "gpb2-2";
> >> +                       samsung,pin-function = <2>;
> >> +                       samsung,pin-pud = <0>;
> >> +                       samsung,pin-drv = <0>;
> >> +               };
> >> +
> >> +               pwm3_out: pwm3-out {
> >> +                       samsung,pins = "gpb2-3";
> >> +                       samsung,pin-function = <2>;
> >> +                       samsung,pin-pud = <0>;
> >> +                       samsung,pin-drv = <0>;
> >> +               };
> >> +
> >>                  i2c7_hs_bus: i2c7-hs-bus {
> >>                          samsung,pins = "gpb2-2", "gpb2-3";
> >>                          samsung,pin-function = <3>;
> >
> > Possibly pwm3-out belongs below this one (since the start pin is
> > "larger" than the start pin of i2c7-hs-bus).  Tomasz probably has a
> > definite opinion on this.
> 
> Well, I'm not opposed to keeping it as is. Having all the pwm nodes
> together might be even more readable.
> 
+1 ;-)

> So feel free to add my Reviewed-by tag.
> 
Thanks for you two guys' review.

Applied, thanks.

- Kukjin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
