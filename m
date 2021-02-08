Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098FEC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 08:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDED364E8C
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 08:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhBHIpL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Feb 2021 03:45:11 -0500
Received: from muru.com ([72.249.23.125]:58752 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230398AbhBHImE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 03:42:04 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E962A80A3;
        Mon,  8 Feb 2021 08:40:45 +0000 (UTC)
Date:   Mon, 8 Feb 2021 10:40:26 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <YCD4+pb4MfuA1b9e@atomide.com>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

* Geert Uytterhoeven <geert@linux-m68k.org> [210206 19:48]:
> On Sat, Feb 6, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > What do others think about this? Should we generally assume
> > that breaking old kernels with new dtbs is acceptable, or should
> > we try to avoid it if possible, the same way we try to avoid
> > breaking new kernels with old dtbs? Should this be a platform
> > specific policy or should we try to handle all platforms the same
> > way?
> 
> For Renesas SoCs, we typically only consider compatibility of new
> kernels with old DTBs, not the other way around.
> However, most DTB updates are due to new hardware support, so using the
> new DTB with an old kernel usually just means no newly documented
> hardware, or new feature, is being used by the old kernel.
> 
> In case there was a real issue fixed, and using the new DTB with the old
> kernel would cause a regression, and we're aware of it, we do make sure
> the DTS update is postponed until the corresponding driver update has
> hit upstream.

Yeah agreed. Adding new devicetree properties should not be a problem
for device drivers.

For renamed devicetree properties, the driver won't be aware of them
if a newer dtb is used. The only thing the driver can possibly do at
this point is maybe warn about some missing old property and bail out.

Making sure the driver changes are in place first helps a bit..
But naturally fixing the driver in advance won't help booting kernels
before the driver changes with a newer dtb :)

What helps though is to make sure git bisect works for building and
booting already at -rc1 kernel to make debugging the issue easy. As
-rc1 is used typically as the merge base the problem causing branches
can be tested separately that way.

Regards,

Tony
