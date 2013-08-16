From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH V5] ARM: dts: Change i2s compatible string on exynos5250
Date: Fri, 16 Aug 2013 14:43:17 +0900
Message-ID: <13f801ce9a43$823571b0$86a05510$@org>
References: <1376627178-28649-1-git-send-email-padma.v@samsung.com>
 <CAOesGMj4y=uVMmETLXs_1ZfTD+CrQgKuirrpGrqs=CU3uk5__Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64461 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab3HPFnU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 01:43:20 -0400
In-reply-to: <CAOesGMj4y=uVMmETLXs_1ZfTD+CrQgKuirrpGrqs=CU3uk5__Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Padmavathi Venna' <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, 'Mark Brown' <broonie@kernel.org>, 'Tushar Behera' <tushar.behera@linaro.org>

Olof Johansson wrote:
> 
> On Thu, Aug 15, 2013 at 9:26 PM, Padmavathi Venna <padma.v@samsung.com>
> wrote:
> > This patch removes quirks from i2s node and change the i2s
> > compatible names.
> >
> > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> > ---
> >
> > Changes since V4:
> >         - Mark Brown reverted the below two patches due to below build
> failure with
> >           exynos_defconfig.
> >                 "ARM: dts: exynos5250: move common i2s properties to
exynos5
> dtsi"
> >                 "ARM: dts: Change i2s compatible string on exynos5250"
> >
> >           build error:
> >           DTC     arch/arm/boot/dts/exynos5420-smdk5420.dtb
> >           ERROR (phandle_references): Reference to non-existent node or
> label "pdma1"
> >           ERROR (phandle_references): Reference to non-existent node or
> label "pdma1"
> >           ERROR (phandle_references): Reference to non-existent node or
> label "pdma0"
> >           ERROR (phandle_references): Reference to non-existent node or
> label "pdma0"
> >
> > But with out "ARM: dts: Change i2s compatible string on exynos5250" will
> break the i2s
> > driver.
> >
> > So posting this patch now and will take care of posting other patch
> later after dependent
> > patches got merged.
> >
> >  arch/arm/boot/dts/exynos5250.dtsi |    9 +++------
> >  1 files changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> > index ef57277..376090f 100644
> > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > @@ -405,7 +405,7 @@
> >         };
> >
> >         i2s0: i2s@03830000 {
> > -               compatible = "samsung,i2s-v5";
> > +               compatible = "samsung,s5pv210-i2s";
> 
> Device tree reviewers, this is something to look out for in the
> future. Some samsung platforms/drivers use "samsung,<chip>-<ip>",
> others "samsung,<ip>-<chip>". I don't personally care much one way or
> another, but it really should be consistent.
> 
Hmm...I think, if "samsung,<ip name>-<ip version>" is possible, it would be
nice. I remember there are no versions in datasheet for some IPs but
something have like i2s and mfc. So "samsung,<ip>-<version>" is used for
only i2s and mfc. But actually there are versions for Samsung IPs, no
comments for that in datasheet. So I think, if Samsung can provide the
specific version of Samsung IPs, we can use that like other platforms. I
will prepare some table for that after meeting with Samsung hardware IP team
so that samsung platform use one format "samsung,<ip>-<version>".

Thanks,
Kukjin
