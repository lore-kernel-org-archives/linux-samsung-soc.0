From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Thu, 7 Mar 2013 08:57:59 +0100
Message-ID: <CACRpkdaCzmW5C1tEm5D=WRyoZc5+gGf2gVtTt1QSkF8SNKrjRg@mail.gmail.com>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
	<1534249.MsU3ROUVJz@flatron>
	<CAD=FV=XMpL7z-UX4UgqaUv-=QcJAPOD3bKbLVTRsR15RTG1A2Q@mail.gmail.com>
	<CAJuYYwR41V4m_tZU5Usksb7L8ynOAQpK2i3QP33JDmW9YDkvPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:65344 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752138Ab3CGH6A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 02:58:00 -0500
Received: by mail-ie0-f177.google.com with SMTP id 16so199243iea.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 23:58:00 -0800 (PST)
In-Reply-To: <CAJuYYwR41V4m_tZU5Usksb7L8ynOAQpK2i3QP33JDmW9YDkvPw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>

On Wed, Mar 6, 2013 at 12:49 AM, Thomas Abraham
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

I don't quite understand the above. Is it such that there is one device,
with two slots, and in the device model you have represented this
two-slot device with a single struct device?

Have you considered just registering one device for each slot?

That would make things quite a lot simpler, just a single pinctrl
handle per device, right?

You need to pass this by Stephen Warren, I think he had a similar
case in the Tegra.

Yours,
Linus Walleij
