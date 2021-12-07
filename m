Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60508C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Dec 2021 12:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236272AbhLGMUh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Dec 2021 07:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236236AbhLGMUf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 07:20:35 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FB7C061359
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Dec 2021 04:17:05 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id 84so9106485vkc.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Dec 2021 04:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/shVBi6JlRgjZTPddZCIWjR1bu5s4CCzjOrgUchEDkI=;
        b=e7/TY4gOh3+cE4hbY2wgLdgFALgqzNBVaatvNUV2/yBzXYjgbVN/BHQtzHFmJzh7DL
         2qzJtmSPG/QZof/R/Tasc6J7Mr+WXwrOh5jqSl/+J6+ypqPXR6dpeSway3BjIYS4XvmT
         7RDj5/MRtYTSSZryzfTJcKOobxbwO3U3SfRilM8+CG12IaIgB/JqDPSs1IXIwkZ4mP4y
         VU67Zm6P5PwUNA9QP+J0UHIP0hjzlP1fkyO9VZZypMETe1JZOR5LWKOMuOjfyVWAEvLJ
         9WeRjFZh9NxxNG7TdxtIbqqNeiBGXInMU3flTK8PB6xM59E/+bWUb1PtRwVoArLEgrxG
         HfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/shVBi6JlRgjZTPddZCIWjR1bu5s4CCzjOrgUchEDkI=;
        b=vWg271vJLD9pDeLRK6eV510DAzyNEs/VsRw6FgxATtL6JCZuaDYLhhCJOJ6FGV+TMW
         mPTuIHcLPXZ6HN70JBw9Rn42w1ZGvhbBkQBZa6BQ0pXJPtgDgflyV95+Xvl5zA6pv3VC
         6lTJ/mNacJAc0XIWtNLuQBgFLAyRZfc5BbwcKo0y8basSgQefUQblKkZFf5FuSdaquDA
         Y87rnIXlVDGvB8CAwoIMoZ5EFB8tZ1y5K6eeWPdfAB6/E5zqxL7XnCSJpCwwI1sk/3BW
         Vl542yW19F9gJZp/ejegojFwbGoxCfRJjZoHjx5G1p1A0WutrX6EOd2n7vCdoSEKEQna
         ad6w==
X-Gm-Message-State: AOAM530Ur5Vk0ijqdrRvxnsBZbQsoOTTKvdafqrrAl4hMOOUXbZNR6UI
        P8IkLutdz1lGlfdNY3e5FrH0gIWw/B2SQLyDXMffQw==
X-Google-Smtp-Source: ABdhPJxuGChhAZ4kIiu4qir8hGvBsDCFBjU9JFoH+t8icaVEomxm0J2X8jMAeeiM6ponxEUZHM06zKQNjmtJ+RJak40=
X-Received: by 2002:a1f:2849:: with SMTP id o70mr50408783vko.35.1638879423373;
 Tue, 07 Dec 2021 04:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20211203183517.11390-1-semen.protsenko@linaro.org> <Ya5wNM/cAt1rwazv@robh.at.kernel.org>
In-Reply-To: <Ya5wNM/cAt1rwazv@robh.at.kernel.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 7 Dec 2021 14:16:52 +0200
Message-ID: <CAPLW+4np+Cynat7yxaayK-DUKLywyvENS0wnXb=LVXD5s9XBTw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Only show unique unit address warning for
 enabled nodes
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Masahiro Yamada <masahiroy@kernel.org>,
        David Virag <virag.david003@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Dec 2021 at 22:19, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Dec 03, 2021 at 08:35:17PM +0200, Sam Protsenko wrote:
> > There are valid cases when two nodes can have the same address. For
> > example, in Exynos SoCs there is USI IP-core, which might be configured
> > to provide UART, SPI or I2C block, all of which having the same base
> > register address. But only one can be enabled at a time. That looks like
> > this:
> >
> >     usi@138200c0 {
> >         serial@13820000 {
> >             status = "okay";
> >         };
> >
> >         i2c@13820000 {
> >             status = "disabled";
> >         };
> >     };
> >
> > When running "make dt_binding_check", it reports next warning:
> >
> >     Warning (unique_unit_address):
> >     /example-0/usi@138200c0/serial@13820000:
> >     duplicate unit-address (also used in node
> >     /example-0/usi@138200c0/i2c@13820000)
> >
> > Disable "unique_unit_address" in DTC_FLAGS to suppress warnings like
> > that, but enable "unique_unit_address_if_enabled" warning, so that dtc
> > still reports a warning when two enabled nodes are having the same
> > address.
>
> Presumably you have a dts file needing the same thing, so I'll be
> expecting a patch for that too. That's in scripts/Makefile.lib BTW.
>

'-Wno-unique_unit_address' is already in scripts/Makefile.lib, and
when I add '-Wunique_unit_address_if_enabled' there, "make dtbs_check"
reports a lot of warnings (for ARCH=arm64 at least). Among obvious
bugs found, there are some cases like this:

        qfprom@784000 {
            compatible = "qcom,qfprom";
            reg = <0 0x00784000 0 0x8ff>;
            #address-cells = <1>;
            #size-cells = <1>;

            qusb2p_hstx_trim: hstx-trim-primary@1eb {
                reg = <0x1eb 0x1>;
                bits = <1 4>;
            };

            qusb2s_hstx_trim: hstx-trim-secondary@1eb {
                reg = <0x1eb 0x2>;
                bits = <6 4>;
            };
        };

where "dtbs_check" doesn't like duplicated "reg = <0x1eb 0x2>;" line.

I'll send the patch soon. Just want you to be on the same page about
side effects from that, because I'm not completely sure it's ok.

> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reported-by: Rob Herring <robh@kernel.org>
> > Suggested-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/Makefile | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> > index c9abfbe3f0aa..41c555181b6f 100644
> > --- a/Documentation/devicetree/bindings/Makefile
> > +++ b/Documentation/devicetree/bindings/Makefile
> > @@ -65,7 +65,9 @@ DT_DOCS = $(patsubst $(srctree)/%,%,$(shell $(find_all_cmd)))
> >  override DTC_FLAGS := \
> >       -Wno-avoid_unnecessary_addr_size \
> >       -Wno-graph_child_address \
> > -     -Wno-interrupt_provider
> > +     -Wno-interrupt_provider \
> > +     -Wno-unique_unit_address \
> > +     -Wunique_unit_address_if_enabled
> >
> >  # Disable undocumented compatible checks until warning free
> >  override DT_CHECKER_FLAGS ?=
> > --
> > 2.30.2
> >
> >
