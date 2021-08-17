Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B14C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 541F961056
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbhHQUZ6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:25:58 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:33488 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhHQUZ5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 16:25:57 -0400
Received: by mail-oi1-f176.google.com with SMTP id n27so1072091oij.0;
        Tue, 17 Aug 2021 13:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gqCWS94qFMQo89WcKVKUOC7+B5Uopx/LB045sFLOWjc=;
        b=lsrANVOEmVAB7Aq5QCNXpBS8zT0+XXS9lyYxIl4xJt0dBt1ydYNKRj4KGMUoFybO0A
         q/sloqG2DWv8FEHs8b7jARzFAUVEciVYwkSUVtTr3UUJLBWpXVAWRhMsi5Phn5R3Wl4C
         wgw+M/zm6Ygp8yCYsb78/8zu+p96lv4vCIZXAgNkaRea4STH+v9tzgpostHRfkf6oiPj
         0kW+QxvFg266+HuborGtB77e1VNB6rYePPszr6pp2DhRY1lxOeOq69fvJnxKi4u6Gh/0
         h2lzq0QSRor9Fjp0RvH/86Z+R3U3o4OSliFkIY46cxCq+v7eQ7OFuLHsK8sW8BUk6L6Z
         Tj7A==
X-Gm-Message-State: AOAM531Nee4WWw3LgyLo/XGuhM2SM86VMJGAKC4wmz5f9skb9puCOpeK
        NCNO2Dgz9WwqaMkw8DdSAg==
X-Google-Smtp-Source: ABdhPJw3WAOdSl9AOXFA1Bcnzo80QQ5HItahZY+gRyqMfrEbwR40R5tG0kH8KnJkxKYMvusGnp+OUA==
X-Received: by 2002:a05:6808:1290:: with SMTP id a16mr4013369oiw.115.1629231923724;
        Tue, 17 Aug 2021 13:25:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w14sm585525otl.58.2021.08.17.13.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:25:23 -0700 (PDT)
Received: (nullmailer pid 780338 invoked by uid 1000);
        Tue, 17 Aug 2021 20:25:22 -0000
Date:   Tue, 17 Aug 2021 15:25:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: clock: samsung: convert Exynos AudSS
 to dtschema
Message-ID: <YRwbMjZwnX5ix0O0@robh.at.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-7-krzysztof.kozlowski@canonical.com>
 <CAPLW+4=tOpaNGs6vxwyVy7xaeX+w_jhtY2P2U8sZGvm6mdqh1Q@mail.gmail.com>
 <2f8ff138-4d34-619c-e137-099dc9251e25@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f8ff138-4d34-619c-e137-099dc9251e25@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 11, 2021 at 08:46:46AM +0200, Krzysztof Kozlowski wrote:
> On 10/08/2021 19:46, Sam Protsenko wrote:
> > On Tue, 10 Aug 2021 at 12:32, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> Convert Samsung Exynos Audio SubSystem clock controller bindings to DT
> >> schema format using json-schema.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >> ---
> >>  .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
> >>  .../clock/samsung,exynos-audss-clock.yaml     |  79 ++++++++++++++
> >>  2 files changed, 79 insertions(+), 103 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
> >>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
> >> deleted file mode 100644
> >> index 6030afb10b5c..000000000000
> >> --- a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
> >> +++ /dev/null
> >> @@ -1,103 +0,0 @@
> >> -* Samsung Audio Subsystem Clock Controller
> >> -
> >> -The Samsung Audio Subsystem clock controller generates and supplies clocks
> >> -to Audio Subsystem block available in the S5PV210 and Exynos SoCs. The clock
> >> -binding described here is applicable to all SoCs in Exynos family.
> >> -
> >> -Required Properties:
> >> -
> >> -- compatible: should be one of the following:
> >> -  - "samsung,exynos4210-audss-clock" - controller compatible with all Exynos4 SoCs.
> >> -  - "samsung,exynos5250-audss-clock" - controller compatible with Exynos5250
> >> -    SoCs.
> >> -  - "samsung,exynos5410-audss-clock" - controller compatible with Exynos5410
> >> -    SoCs.
> >> -  - "samsung,exynos5420-audss-clock" - controller compatible with Exynos5420
> >> -    SoCs.
> >> -- reg: physical base address and length of the controller's register set.
> >> -
> >> -- #clock-cells: should be 1.
> >> -
> >> -- clocks:
> >> -  - pll_ref: Fixed rate PLL reference clock, parent of mout_audss. "fin_pll"
> >> -    is used if not specified.
> >> -  - pll_in: Input PLL to the AudioSS block, parent of mout_audss. "fout_epll"
> >> -    is used if not specified.
> >> -  - cdclk: External i2s clock, parent of mout_i2s. "cdclk0" is used if not
> >> -    specified.
> >> -  - sclk_audio: Audio bus clock, parent of mout_i2s. "sclk_audio0" is used if
> >> -    not specified.
> >> -  - sclk_pcm_in: PCM clock, parent of sclk_pcm.  "sclk_pcm0" is used if not
> >> -    specified.
> >> -
> >> -- clock-names: Aliases for the above clocks. They should be "pll_ref",
> >> -  "pll_in", "cdclk", "sclk_audio", and "sclk_pcm_in" respectively.
> >> -
> >> -Optional Properties:
> >> -
> >> -  - power-domains: a phandle to respective power domain node as described by
> >> -    generic PM domain bindings (see power/power_domain.txt for more
> >> -    information).
> >> -
> >> -The following is the list of clocks generated by the controller. Each clock is
> >> -assigned an identifier and client nodes use this identifier to specify the
> >> -clock which they consume. Some of the clocks are available only on a particular
> >> -Exynos4 SoC and this is specified where applicable.
> >> -
> >> -Provided clocks:
> >> -
> >> -Clock           ID      SoC (if specific)
> >> ------------------------------------------------
> >> -
> >> -mout_audss      0
> >> -mout_i2s        1
> >> -dout_srp        2
> >> -dout_aud_bus    3
> >> -dout_i2s        4
> >> -srp_clk         5
> >> -i2s_bus         6
> >> -sclk_i2s        7
> >> -pcm_bus         8
> >> -sclk_pcm        9
> >> -adma            10      Exynos5420
> >> -
> >> -Example 1: An example of a clock controller node using the default input
> >> -          clock names is listed below.
> >> -
> >> -clock_audss: audss-clock-controller@3810000 {
> >> -       compatible = "samsung,exynos5250-audss-clock";
> >> -       reg = <0x03810000 0x0C>;
> >> -       #clock-cells = <1>;
> >> -};
> >> -
> >> -Example 2: An example of a clock controller node with the input clocks
> >> -           specified.
> >> -
> >> -clock_audss: audss-clock-controller@3810000 {
> >> -       compatible = "samsung,exynos5250-audss-clock";
> >> -       reg = <0x03810000 0x0C>;
> >> -       #clock-cells = <1>;
> >> -       clocks = <&clock 1>, <&clock 7>, <&clock 138>, <&clock 160>,
> >> -               <&ext_i2s_clk>;
> >> -       clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in", "cdclk";
> >> -};
> >> -
> >> -Example 3: I2S controller node that consumes the clock generated by the clock
> >> -           controller. Refer to the standard clock bindings for information
> >> -           about 'clocks' and 'clock-names' property.
> >> -
> >> -i2s0: i2s@3830000 {
> >> -       compatible = "samsung,i2s-v5";
> >> -       reg = <0x03830000 0x100>;
> >> -       dmas = <&pdma0 10
> >> -               &pdma0 9
> >> -               &pdma0 8>;
> >> -       dma-names = "tx", "rx", "tx-sec";
> >> -       clocks = <&clock_audss EXYNOS_I2S_BUS>,
> >> -               <&clock_audss EXYNOS_I2S_BUS>,
> >> -               <&clock_audss EXYNOS_SCLK_I2S>,
> >> -               <&clock_audss EXYNOS_MOUT_AUDSS>,
> >> -               <&clock_audss EXYNOS_MOUT_I2S>;
> >> -       clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
> >> -                     "mout_audss", "mout_i2s";
> >> -};
> > 
> > Seems like some examples and "Provided clocks" table were dropped in
> > in yaml binding. Also there is no description for example present in
> > yaml file. Is that some redundant info and was dropped intentionally?
> > I'm just worrying about losing some useful info during the conversion.
> 
> I don't see any point of having a clock consumer example in a clock
> provider binding.

+1

Just another one to get wrong...
