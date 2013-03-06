From: Doug Anderson <dianders@chromium.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Tue, 5 Mar 2013 17:00:02 -0800
Message-ID: <CAD=FV=U2Nb32ZA+gb4X5XyhLe_zUWB7oEWknqeyhtDcgtWuoTw@mail.gmail.com>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
	<1534249.MsU3ROUVJz@flatron>
	<CAD=FV=XMpL7z-UX4UgqaUv-=QcJAPOD3bKbLVTRsR15RTG1A2Q@mail.gmail.com>
	<CAJuYYwR41V4m_tZU5Usksb7L8ynOAQpK2i3QP33JDmW9YDkvPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:42152 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752548Ab3CFBAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 20:00:04 -0500
Received: by mail-la0-f46.google.com with SMTP id fq12so6832685lab.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 17:00:02 -0800 (PST)
In-Reply-To: <CAJuYYwR41V4m_tZU5Usksb7L8ynOAQpK2i3QP33JDmW9YDkvPw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Linus Walleij <linus.walleij@linaro.org>

Thomas,

On Tue, Mar 5, 2013 at 3:49 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> Yes, I am currently held up with supporting default pin states at slot
> level. One option that could be considered is to list out the default
> pin states for all slots in the parent node of the slots. So it would
> be something like below as an example.
>
>         dwmmc2@12220000 {
>                <....>
>
>                 pinctrl-names = "slot0-default", "slot1-default";
>                 pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
>                 pinctrl-1 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4 &sd2_bus8>;
>
>                 slot@0 {
>                         reg = <0>;
>                         bus-width = <4>;
>                         disable-wp;
>                 };
>
>                 slot@1 {
>                         reg = <0>;
>                         bus-width = <8>;
>                         disable-wp;
>                 };
>         };
>
> Then, during the initial slot setup stage, the driver, knowing the
> current slot number that is being setup, can setup the pin state for
> the particular slot using the devm_pinctrl_get_select API. pinctrl
> subsystem would not setup the default pin state in this case.
>
> Does this look like a hack?

That feels like a hack to me.  The right place for the slot data is
under the slot node, not in the parent.  ...but I would certainly
defer to any experts that might have a different opinion.


> For now, I have prepared patches without
> this approach, since Exynos5250 has just one slot, I have just listed
> only one default pin state, which the pinctrl framework helps to setup
> during driver bind.

That actually doesn't seem awful to me.  It's basically saying that we
are describing pinmux at a device level and not a slot level.  It
would make it a pain to dynamically adjust pinmux on a slot-by-slot
basis, but is that a terrible thing?

In the two-slot case you could just do:

  pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_cd &sd2_bus4 &sd2_clk &sd2_cmd
&sd1_cd &sd1_bus4>;
  pinctrl-names = "default";

In other words the default state just sets up pin muxing for all the
whole controller (AKA all slots).

...but maybe someone will yell at me for that suggestion.  It's really
hard to justify all this extra work for the multiple slot case when
there are no current users that I know of...


-Doug
