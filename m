From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: dts: exynos4: fix pwm-cells in pwm node
Date: Mon, 23 Jun 2014 09:48:09 +0900
Message-ID: <023101cf8e7c$cdffdc60$69ff9520$@samsung.com>
References: <1403143414-6242-1-git-send-email-jaewon02.kim@samsung.com>
 <CAK5sBcFJpSvpwXGPckDcUoZP_Xqqo3Bm6p5qjF_mnZg6b7+T3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38937 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750823AbaFWAsN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 20:48:13 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7L00GYSJKA1AB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jun 2014 09:48:10 +0900 (KST)
In-reply-to: <CAK5sBcFJpSvpwXGPckDcUoZP_Xqqo3Bm6p5qjF_mnZg6b7+T3g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@samsung.com>, 'Jaewon Kim' <jaewon02.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'MyungJoo Ham' <myungjoo.ham@samsung.com>

Sachin Kamat wrote:
> 
> Hi Jaewon,
> 
> On Thu, Jun 19, 2014 at 7:33 AM, Jaewon Kim <jaewon02.kim@samsung.com> wrote:
> > pwm-cells should be 3. Third cell is optional PWM flags. And This flag
> > supported by this binding is PWM_POLARITY_INVERTED.
> >
> > Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> > ---
> >
> > Changes in v2:
> >  - Remove unnecessary handle.
> >
> >  arch/arm/boot/dts/exynos4.dtsi |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> > index b8ece4b..e118356 100644
> > --- a/arch/arm/boot/dts/exynos4.dtsi
> > +++ b/arch/arm/boot/dts/exynos4.dtsi
> > @@ -554,7 +554,7 @@
> >                 interrupts = <0 37 0>, <0 38 0>, <0 39 0>, <0 40 0>, <0 41 0>;
> >                 clocks = <&clock CLK_PWM>;
> >                 clock-names = "timers";
> > -               #pwm-cells = <2>;
> > +               #pwm-cells = <3>;
> >                 status = "disabled";
> >         };
> 
> I think I had already reviewed this patch. Anyway,
> Reviewed-by: Sachin Kamat <sachin.kamat@samsung.com>

Applied, thanks.

- Kukjin
