From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: Add Exynos5250 Snow Rev5+ support
Date: Tue, 29 Sep 2015 10:28:15 -0700
Message-ID: <CAD=FV=Vmdv6sTmbVyxE=04ycNCOzEWJpfMpzGnihOwaW0ZFzmQ@mail.gmail.com>
References: <1443527855-434-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:32997 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934406AbbI2R2Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Sep 2015 13:28:16 -0400
Received: by ykft14 with SMTP id t14so14171977ykf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2015 10:28:16 -0700 (PDT)
In-Reply-To: <1443527855-434-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Javier,

On Tue, Sep 29, 2015 at 4:57 AM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> There are 2 revisions of the Exynos5250 Snow Chromebook that were shipped:
> Rev4 and Rev5. The only difference between these 2 revisions is the codec,
> Rev4 has a max98095 codec while Rev5 has a max98090.
>
> Mainline only supports Rev4 so this patch moves the common device nodes to
> a DTSI file and adds a DTS for the Exynos5250 Snow Rev5.
>
> The Snow Rev5 DTS is based on the DTS found in the ChromiumOS 3.8 tree.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
> ---
>
> The DTS in the vendor ChromeOS tree are called exynos5250-snow-rev{4,5}.dtb
> but I decided to leave Rev4 as exynos5250-snow.dtb to avoid breaking u-boot
> that has CONFIG_DEFAULT_DEVICE_TREE="exynos5250-snow" in snow_defconfig.
>
> Also, ChromiumOS Rev4 DTS has "google,snow-rev4" in its compatible string
> but was not added in mainline since Rev4 firmware fallbacks to "google,snow"
> and Rev5 searches for "google,snow-rev5". That way the compatible string
> could be consistent with the DTS naming and still be able to pack both Rev4
> and Rev5 FDT in the same FIT image and let the firmware pick the correct FDT.

Looking at all the notes in the DTS in the ChromeOS tree, this sounds
like it should be fine.


>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi | 684 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250-snow-rev5.dts    |  47 ++
>  arch/arm/boot/dts/exynos5250-snow.dts         | 666 +------------------------
>  4 files changed, 733 insertions(+), 665 deletions(-)

Thanks!  Note:

$ pwclient git-am 7285451
Applying patch #7285451 using 'git am'
Description: ARM: dts: Add Exynos5250 Snow Rev5+ support
Applying: ARM: dts: Add Exynos5250 Snow Rev5+ support
.git/rebase-apply/patch:774: new blank line at EOF.
+
warning: 1 line adds whitespace errors.


One other nit is that the exynos5250-snow.dts" ends up with the
"max98095" pinctrl properties sorted differently than the
"exynos5250-snow-rev5.dts".  Is it worth reordering the
"exynos5250-snow.dts" in the same patch?

Otherwise this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
