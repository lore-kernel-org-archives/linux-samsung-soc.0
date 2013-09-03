From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: dts: Fix gpio pin of lcd_en node for exynos4210
Date: Tue, 03 Sep 2013 18:09:19 +0900
Message-ID: <000001cea885$45ef7200$d1ce5600$%han@samsung.com>
References: <001c01cea84b$5decd9e0$19c68da0$%han@samsung.com>
 <CAHbNUh0A7j95zePFL8b9nLvJNV0fJX4nmRq6rFrjk5Dd+Ba2pw@mail.gmail.com>
 <002401cea877$e7453490$b5cf9db0$%han@samsung.com>
 <CAHbNUh37pzeP24c2tqHE2BbNr1Eq=vc-OWb_gshwc2qnd0q3qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46097 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755399Ab3ICJJV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 05:09:21 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSJ00CWULEWQXW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Sep 2013 18:09:20 +0900 (KST)
In-reply-to: <CAHbNUh37pzeP24c2tqHE2BbNr1Eq=vc-OWb_gshwc2qnd0q3qw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, September 03, 2013 5:48 PM, Tushar Behera wrote:
> On 3 September 2013 13:03, Jingoo Han <jg1.han@samsung.com> wrote:
> > On Tuesday, September 03, 2013 3:52 PM, Tushar Behera wrote:
> >> On 3 September 2013 07:44, Jingoo Han <jg1.han@samsung.com> wrote:
> >> > According to datasheet, 'lcd_en' node should use gpf0-2,
> >> > instead of gpe3-4. gpe3-4 is used for MDM_DATA[4]; thus,
> >> > it should be fixed.
> >> >
> >> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> >> > ---
> >> >  arch/arm/boot/dts/exynos4210-pinctrl.dtsi |    2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-
> pinctrl.dtsi
> >> > index a7c2128..da5dd8d 100644
> >> > --- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
> >> > +++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
> >> > @@ -374,7 +374,7 @@
> >> >                 };
> >> >
> >> >                 lcd_en: lcd-en {
> >> > -                       samsung,pins = "gpe3-4";
> >> > +                       samsung,pins = "gpf0-2";
> >> >                         samsung,pin-function = <2>;
> >> >                         samsung,pin-pud = <0>;
> >> >                         samsung,pin-drv = <0>;
> >>
> >> With this change, the LCD display stops working on Origen board.
> >
> > The smdkv310 board worked properly.
> > gpe3-4 seems to be necessary for Origen board.
> > Can you describe why gpe3-4 is necessary for Origen board?
> >
> 
> Without setting this pin, LCD panel doesn't power up. It is quite
> possible that this is Origen specific. In that case, how do you
> suggest to implement this for Origen board?

OK, I see.
'gpe3-4' on Origen board is used as LCD panel reset pin.
Then, it should be handled as reset-pin control for LCD panel.

Also, one this is clear.
'gpe3-4' should NOT be used as pin-function <2>, because
it means MDM_DATA[4]. MDM_DATA[4] is not related to LCD control.
It is a definitely wrong usage.

Best regards,
Jingoo Han
