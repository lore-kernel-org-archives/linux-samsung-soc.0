From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Fri, 22 Feb 2013 23:10:38 +0100
Message-ID: <1409675.goC3jgaHoi@flatron>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org> <CAD025yRmvSpnM9RJJvN+FM00Rgz8Bt5msmEYcyFVxNTEKsM2xg@mail.gmail.com> <CAD025yTb5yfXWpzCnCg7KY9NsTw1wfsLFU6y32aD=WXe23xiwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:42213 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757947Ab3BVWKl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Feb 2013 17:10:41 -0500
Received: by mail-ee0-f49.google.com with SMTP id d41so544948eek.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Feb 2013 14:10:40 -0800 (PST)
In-Reply-To: <CAD025yTb5yfXWpzCnCg7KY9NsTw1wfsLFU6y32aD=WXe23xiwg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>

Hi,

On Friday 22 of February 2013 12:36:22 Vikas Sajjan wrote:
> On 21 February 2013 12:34, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> > Hi,
> > 
> > On 19 February 2013 03:16, Sylwester Nawrocki
> > 
> > <sylvester.nawrocki@gmail.com> wrote:
> >> Hi,
> >> 
> >> On 02/18/2013 11:51 AM, Vikas Sajjan wrote:
> >>> On 15 February 2013 16:08, Sylwester
> >>> Nawrocki<s.nawrocki@samsung.com>
> >>> 
> >>> wrote:
> >>>> On 02/15/2013 08:10 AM, Vikas Sajjan wrote:
> >>>>> Adds FIMD DT binding documentation both SoC and Board, with an
> >>>>> example
> >>>>> 
> >>>>> Signed-off-by: Vikas Sajjan<vikas.sajjan@linaro.org>
> >>>>> ---
> >>>>> 
> >>>>>   .../devicetree/bindings/drm/exynos/fimd.txt        |   37
> >>>>> 
> >>>>> ++++++++++++++++++++
> >>>>> 
> >>>>>   1 file changed, 37 insertions(+)
> >>>>>   create mode 100644
> >>>>> 
> >>>>> Documentation/devicetree/bindings/drm/exynos/fimd.txt
> >>>>> 
> >>>>> diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt
> >>>>> b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
> >>>>> new file mode 100644
> >>>>> index 0000000..bec9d07
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
> >> 
> >> Wouldn't Documentation/devicetree/bindings/video/exynos-fimd.txt be
> >> more appropriate location for this file ? There is also framebuffer
> >> driver for FIMD. Even if the framebuffer driver gets phased out it
> >> still feels like a more intuitive location for a display controller
> >> bindings.
> >> This is just my humble suggestion though.
> > 
> > I think we can move it there.
> > 
> >> I think you should CC the device tree mailing list and the
> >> maintainers.
> > 
> > will do.
> > 
> >>>>> @@ -0,0 +1,37 @@
> >>>>> +Device-Tree bindings for fimd driver
> >>>>> +
> >>>>> +FIMD stands for Fully Interactive Mobile Display, is the Display
> >>>>> Controller for
> >>>>> +the Exynos series of SoCs which transfers the image data from a
> >>>>> video
> >>>>> buffer
> >>>>> +located in the system memory to an external LCD interface.
> >>>>> +
> >>>>> +Required properties:
> >>>>> +- compatible := value should be "samsung,exynos5-fimd" or
> >>>>> "samsung,exynos4-fimd"
> >>>> 
> >>>> What about older SoCs like S5Pv210 ? There is the FIMD IP block in
> >>>> those SoCs
> >>>> as well. There are also differences in the FIMD IP block across
> >>>> various
> >>>> SoC
> >>>> version, so either you need to list the quirks in the bindings or
> >>>> use an appropriate compatible properties if there are significant
> >>>> differences across
> >>>> FIMDs that make them not really compatible.
> >>> 
> >>> as of now, I was working on Exynos4 and Exynos5 SoC. have to really
> >>> see the differences in the previous SoC and how to handle all those
> >>> FIMD IPs in the driver.
> >>> if you know the differences between these FIMD IPs, please let me
> >>> know.
> >> 
> >> Please have a look at drivers/video/s3c-fb.c and all driver_data
> >> structures defined for various SoCs.
> >> 
> >> [...]
> > 
> > I went through the driver_data structures define for s5p64x0,s3c2443,
> > s5pv210, s5pc100 ad 64xx SoCs.
> > there are some differences w.r.t number of windows, osd_stride  length
> > and regsiter offsets.
> > but  I dont have access to all the above mentioned Boards and so that
> > I can modify and test on each one of them.
> 
> as far as i know this file exynos_drm_fimd.c is meant only for exynos4
> onwards SoCs,

This is probably true, as even the name suggests that this is a DRM 
implementation for Exynos SoCs.

However DRM is not the only driver which can handle FIMD. There is also 
the s3c-fb driver. Since it supports the same hardware, it is also 
affected by Device Tree bindings you are describing in this patch.

> ( I think Mr. Inki Dae can throw more light on this )
> and also the previous  boards based on  s5p64x0,s3c2443,s5pv210,
> s5pc100 and 64xx, dont have DT support.

This is true only at the moment. S3C24xx (Heiko Stuebner is working on it) 
and S3C64xx (I'm working on it) are on good way to have DT support soon. 
Other S5P SoCs will have to be eventually moved to DT too (or dropped, 
whatever gets decided by maintainers).

Best regards,
Tomasz
