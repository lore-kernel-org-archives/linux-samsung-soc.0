From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [RFC PATCH v3 1/2] clk: samsung: Add a clock lookup function
Date: Mon, 30 Mar 2015 18:40:13 -0700
Message-ID: <20150331014013.25195.26862@quantum>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
 <1427730803-28635-2-git-send-email-javier.martinez@collabora.co.uk>
 <CA+Ln22Fn+TRGcFXH7m=LkOCpAtbdKq98jNNNDM0shYWvfHEBiA@mail.gmail.com>
 <55197508.5030501@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:35493 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932262AbbCaBk0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 21:40:26 -0400
Received: by ierf6 with SMTP id f6so4648078ier.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2015 18:40:25 -0700 (PDT)
In-Reply-To: <55197508.5030501@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Quoting Javier Martinez Canillas (2015-03-30 09:08:40)
> Hello Tomasz,
> 
> On 03/30/2015 06:02 PM, Tomasz Figa wrote:
> > Hi Javier,
> > 
> > 2015-03-31 0:53 GMT+09:00 Javier Martinez Canillas
> > <javier.martinez@collabora.co.uk>:
> >> The Samsung helpers functions to register clocks, add the clock instance
> >> returned by the common clock framework to a lookup table that is used by
> >> OF to lookup the clocks.
> >>
> >> But this table could also be useful to clock drivers if they need to get
> >> a clock instance since the helper functions don't return them.
> >>
> >> The common clock framework __clk_lookup() function from the clk provider
> >> API could be used by drivers as well. But it's more efficient to use the
> >> Samsung specific lookup table that returns the clock instance in constant
> >> time, than using the __clk_lookup() function that uses the clock name as
> >> an index so it has a linear search time.
> > 
> > Is this really something we should be concerned about? If so, maybe
> > the generic look-up function should be rewritten to use something
> > faster, such as tree or hash table?
> >
> 
> I don't performance is a big issue here. I just thought that since the
> lookup table is already filled by the driver and the lookup function
> is one line, we could use that instead to get the performance benefit.
> 
> But I don't mind to drop this patch and use the generic lookup function
> from the CCF API if that is preferred.

Hello,

I am not a fan of __clk_lookup and I don't like to see it used more and
more outside of drivers/clk/clk.c. You mentioned that performance wasn't
really the problem here.  The real method for a driver to get a clock is
with clk_get(). Any reason to not use that?

Regards,
Mike

>  
> > Best regards,
> > Tomasz
> >
> 
> Best regards,
> Javier
