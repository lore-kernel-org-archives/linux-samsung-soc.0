Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270BAC6FD19
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Mar 2023 20:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjCMU3A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Mar 2023 16:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjCMU2y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 16:28:54 -0400
Received: from out-42.mta1.migadu.com (out-42.mta1.migadu.com [IPv6:2001:41d0:203:375::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95FF25E31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Mar 2023 13:28:16 -0700 (PDT)
Date:   Mon, 13 Mar 2023 21:28:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1678739291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0wf+Vp/ygCIY+3+XGg+nQBvGdHXJe5C3XUMAiqj5pNU=;
        b=egflwHISZeEFwj30KD5DUbmDtT4EZkkNQCAco/2OjzHZtMzO2xpVT//OT8qQrk5Ao6Do/b
        7Lpsv2ytSIDiBXGerrzxZjfDlDtUbSuzCmYygNQ/XP/QoR1l+zjMWgHiVdtmAZZ4LPwn+M
        lXlqWkzqDa15wH63Fc/+lFk/0WAqy1I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Henrik Grimler <henrik@grimler.se>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        jenneron@protonmail.com, markuss.broks@gmail.com,
        martin.juecker@gmail.com, virag.david003@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/2] ARM: dts: exynos: replace mshc0 alias with
 mmc-ddr-1_8v property
Message-ID: <ZA+HWF9Lwu9q4yKA@L14.lan>
References: <20230227193819.30133-1-henrik@grimler.se>
 <20230227193819.30133-2-henrik@grimler.se>
 <08baf8d8-d93d-780e-6b17-9485ccb5350a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08baf8d8-d93d-780e-6b17-9485ccb5350a@linaro.org>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Sun, Mar 12, 2023 at 05:31:48PM +0100, Krzysztof Kozlowski wrote:
> On 27/02/2023 20:38, Henrik Grimler wrote:
> > Previously, the mshc0 alias has been necessary so that
> > MMC_CAP_1_8V_DDR | MMC_CAP_8_BIT_DATA are set for mshc_0/mmc_0.
> > However, these capabilities should be described in the device tree so
> > that we do not have to rely on the alias.
> > 
> > The property mmc-ddr-1_8v replaces MMC_CAP_1_8V_DDR, while bus_width =
> > <8>, which is already set for all the mshc0/mmc0 nodes, replaces
> > MMC_CAP_8_BIT_DATA.
> > 
> > Also cleanup and sort (but keep status property at top) some of the
> 
> status is rather the last property

Thanks for the info! Is this documented somewhere? There seem to be
more nodes with status property first than nodes with status property
last for Exynos devices, so I mistakenly assumed that was the
preferred style.

> > nodes while we are modifying them.
> 
> Don't mix cleanups with any other changes.

[ ... ]

> >  &mshc_0 {
> > -	non-removable;
> > +	status = "okay";> +	bus-width = <8>;
> >  	cap-mmc-highspeed;
> >  	card-detect-delay = <200>;
> > -	vmmc-supply = <&ldo12_reg>;
> >  	clock-frequency = <100000000>;
> >  	max-frequency = <100000000>;
> > +	mmc-ddr-1_8v;
> > +	non-removable;
> > +	pinctrl-0 = <&sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
> > +	pinctrl-names = "default";
> >  	samsung,dw-mshc-ciu-div = <1>;
> > -	samsung,dw-mshc-sdr-timing = <0 1>;
> >  	samsung,dw-mshc-ddr-timing = <1 2>;
> > -	pinctrl-names = "default";
> > -	pinctrl-0 = <&sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
> > -	bus-width = <8>;
> > -	status = "okay";
> > +	samsung,dw-mshc-sdr-timing = <0 1>;
> > +	vmmc-supply = <&ldo12_reg>;
> 
> It is impossible to review what happenned here.

Will leave cleanup out of next version, thanks for the feedback!

> Best regards,
> Krzysztof

Best regards,
Henrik Grimler
