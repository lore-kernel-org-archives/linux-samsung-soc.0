From: Rob Clark <robdclark@gmail.com>
Subject: Re: exynos-drm-next todo work.
Date: Sun, 7 Jul 2013 19:31:23 -0400
Message-ID: <CAF6AEGu_MV_898Vvg0NZOZ+uGH5q0cATzj8eoD7TFNv=istZdw@mail.gmail.com>
References: <007401ce6bed$bc802920$35807b60$%dae@samsung.com>
	<CAPdUM4M4fyiKUES-BW4BKBL_0nfPjNY5Fk_H7i2FUWyxhSv_nA@mail.gmail.com>
	<007e01ce6ca8$35c23a70$a146af50$%dae@samsung.com>
	<20130705181241.GH27646@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:44200 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753254Ab3GGXbZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Jul 2013 19:31:25 -0400
Received: by mail-ie0-f169.google.com with SMTP id 10so8961498ied.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Jul 2013 16:31:23 -0700 (PDT)
In-Reply-To: <20130705181241.GH27646@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, DRI mailing list <dri-devel@lists.freedesktop.org>

On Fri, Jul 5, 2013 at 2:12 PM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Jun 19, 2013 at 01:48:15PM +0900, Inki Dae wrote:
>
>> > Related to HDMI sound support in Alsa, I have posted a working RFC
>> > "exynos-hdmi to CDF complaint display driver". It registers a separate
>> > sound card by registering hdmi audio codec dai and cpu-dai, as you
>> > mentioned. But there is a problem with this approach that I2S being the
>> > single cpu dai for HDMI and Speaker sound card, only one card can
>> > support playback at a time.
>
>> > I would like to work on this to provide a more refined solution.
>
>> Thanks. However, I think it's not good to use the CDF framework to interface
>> between ALSA SoC DAI driver and DRM HDMI driver. The purpose of the CDF
>> framework is to provide common interfaces to display bus drivers to Linux
>> framebuffer and DRM KMS based display controller drivers as long as I know.
>> So my opinion is to implement ALSA Soc DAI driver-it seems like possible to
>> use as is-based on a new common framework that the other can also use it.
>
> You guys really want to be discussing this on the ALSA list and CCing
> the ASoC maintainers...  I do note that OMAP and SH both have HDMI
> support in mainline, whatever they're doing seems like a good place to
> start.

I don't know about SH, but at least OMAP (and I've seen same on MSM
non-upstream driver, and I guess it is the same elsewhere), there end
up being some calls from audio driver to functions exported by the
display driver.  I guess there is probably some better way to do it
compared to how the existing drivers work.

BR,
-R

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
