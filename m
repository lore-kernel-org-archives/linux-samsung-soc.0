From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Thu, 16 May 2013 11:00:12 -0700
Message-ID: <CAD=FV=XHVMFM8CHXD4-9uTb1rjNs+2susvUMCf_QhSeCjFCQ9w@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<4040680.Aq1C9TECZX@flatron>
	<CAD=FV=VQ5XS8UWeYyFmUqY=_pLzQ-E=vKR53vwLVXWNonXG4Tg@mail.gmail.com>
	<2396115.JIWghi6qt6@flatron>
	<CAD=FV=VmHGj9wz5neR+mkcpt6yvxb4jiFEhyO=E4JZRPZNMFbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:33157 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752144Ab3EPSAO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 May 2013 14:00:14 -0400
Received: by mail-la0-f50.google.com with SMTP id ed20so3350841lab.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 May 2013 11:00:12 -0700 (PDT)
In-Reply-To: <CAD=FV=VmHGj9wz5neR+mkcpt6yvxb4jiFEhyO=E4JZRPZNMFbA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Tomasz / Stephen,

On Wed, May 15, 2013 at 5:55 PM, Doug Anderson <dianders@google.com> wrote:
>> Also after reading Stephen's reply, I'm wondering if hogging wouldn't
>> solve the problem indeed. (It might have to be fixed on pinctrl-samsung
>> first, as last time I tried to use it, it caused some errors from pinctrl
>> core, but haven't time to track them down, as it wasn't anything important
>> at that time).
>
> I will give it a shot tomorrow morning and see how it looks.  I'll
> also evaluate Stephen's suggestions then once I've see how it looks
> with the current bindings...

I wrote this out and it had some nice properties (it was a little more
concise), but had the downside that there's no reference from the GPIO
usage back to the pinmux.  I'd rather have the reference there in the
hopes that it will help others get things right when they make changes
to the dts file (they'll notice the reference and know that they need
to change that too).

...so I think the summary is: I'm OK with keeping what we have.  It
may be a little awkward in some ways but it's definitely worth it to
get all of the benefits of the pinmux / GPIO separation.  :)

For the curious of what my prototype looked like (feel free to
ignore--I'm not planning on keeping this and I didn't actually try
testing it), I've included it below.  This is just the bit from
"cros5250-common" (the common file shared among several similar
boards), so I'd need something similar in "exynos5250-snow").

pinctrl@11400000 {
  /* Default states for hogs follow */
  nopull_inputs_cros5250_a: nopull-inputs-cros5250-a {
    samsung,pins =
      "gpx1-2", /* trackpad */
      "gpx1-3", /* gpio-keys - power */
      "gpx3-2"; /* max77686 */
    samsung,pin-function = <0>;
    samsung,pin-pud = <0>;
    samsung,pin-drv = <0>;
  };

  pulldown_inputs_cros5250-a: pulldown-inputs-cros5250_a {
    samsung,pins = "gpx3-7"; /* hdmi */
    samsung,pin-function = <0>;
    samsung,pin-pud = <1>;
    samsung,pin-drv = <0>;
  };

  simple_outputs_cros5250-a: simple-outputs-cros5250_a {
    samsung,pins =
      "gpx0-1", /* wifi-en */
      "gpx0-2", /* wifi-rst */
      "gpx1-7"; /* max98095-en */
    samsung,pin-function = <1>;
    samsung,pin-pud = <0>;
    samsung,pin-drv = <0>;
  }

  pinctrl-names = "default";
  pinctrl-0 = <&nopull_inputs_cros5250_a
               &pulldown_inputs_cros5250_a
               &simple_outputs_cros5250_a>;
};

pinctrl@13400000 {
  simple_outputs_cros5250-b: simple-outputs-cros5250_b {
    samsung,pins = "gpe1-0" /* hsic reset */;
    samsung,pin-function = <1>;
    samsung,pin-pud = <0>;
    samsung,pin-drv = <0>;

  };
  pinctrl-names = "default";
  pinctrl-0 = <&simple_outputs_cros5250_b>;
};

-Doug
