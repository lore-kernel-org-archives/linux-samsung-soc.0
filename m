From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] ARM: dts: add pinctrl support to Exynos5420
Date: Sat, 15 Jun 2013 21:23:04 -0700
Message-ID: <CAD=FV=XN9WD2qVmdqWyS6BcHpa_v-ijN0Vax=kWkR=dQ51BcfQ@mail.gmail.com>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
	<1371048688-9089-2-git-send-email-l.krishna@samsung.com>
	<1531737.EaJZJjF9GR@flatron>
	<CAD=FV=VhmCVzy-ahhhE-5ZF-cvXktchnAuaiRAG8A-KUj+azbw@mail.gmail.com>
	<CAL1wa8cWSiwW0uUNDhoagYZaOoBo2QJyp3D+pn1rHKFqC_5-tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:64585 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754901Ab3FPEXG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Jun 2013 00:23:06 -0400
Received: by mail-la0-f41.google.com with SMTP id fn20so1538351lab.14
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jun 2013 21:23:04 -0700 (PDT)
In-Reply-To: <CAL1wa8cWSiwW0uUNDhoagYZaOoBo2QJyp3D+pn1rHKFqC_5-tQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Leela

On Fri, Jun 14, 2013 at 5:21 AM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> Here the GPIO pins added for sd0_bus1, sd0_bus4 and sd0_bus8 are correct
> Please look at the below example dwmmc node configured for 8bit bus width
>
> dwmmc0@12200000 {
>                 /*...*/
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
>
>                 slot@0 {
>                         reg = <0>;
>                         bus-width = <8>;
>                 };
>         };
>
> In the above node we are specifying "&sd0_bus4 &sd0_bus8" in pinctrl-0
> Pinctrl driver will configure the respective gpio pins given in
> sd0_bus4 and sd0_bus8 nodes.
> (which are "gpc0-3", "gpc0-4", "gpc0-5", "gpc0-6", "gpc3-0", "gpc3-1",
> "gpc3-2", "gpc3-3")
>
> But if we make gpio entries for sd0_bus1, sd0_bus4 and sd0_bus8 like below
>
>                sd0_bus1: sd0-bus-width1 {
>                         samsung,pins = "gpc0-3";
>                         /*...*/
>                 };
>
>                 sd0_bus4: sd0-bus-width4 {
>                         samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
>                         /*...*/
>                 };
>
>                 sd0_bus8: sd0-bus-width8 {
>                         samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
>                         /*...*/
>                 };
>
> we have to make entries like below for dwmmc node to configure 8bit bus width.
> pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
>
> or if we choose like below
>
>                 sd0_bus1: sd0-bus-width1 {
>                         samsung,pins = "gpc0-3";
>                         /*...*/
>                 };
>
>                 sd0_bus4: sd0-bus-width4 {
>                         samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5", "gpc0-6";
>                         /*...*/
>                 };
>
>                 sd0_bus8: sd0-bus-width8 {
>                         samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5",
> "gpc0-6", "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
>                         /*...*/
>                 };
>
> Then specifying pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>; is enough
>
> Because all the other boards have the similar kind of nodes specified
> in their DT files, I followed the same convention.

Right.  I think what we're saying here is that all the other boards
are wrong and ought to be fixed in a separate patch.  ...following
existing convention is often a good thing to do, but in this case
we're asking to break convention and do the correct thing.

I think Tomasz expressed a desire to use the syntax:
    pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;

-Doug
