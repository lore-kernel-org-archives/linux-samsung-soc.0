Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EEEC61D97
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 13:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjAZNTq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 08:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjAZNTp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 08:19:45 -0500
Received: from out-7.mta0.migadu.com (out-7.mta0.migadu.com [IPv6:2001:41d0:1004:224b::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69D66EB7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 05:19:43 -0800 (PST)
Date:   Thu, 26 Jan 2023 14:19:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1674739182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7HNJWFqealdvgKRtGiwa2+ioxixWDlOCGthcjmBJ1L8=;
        b=kDUtiUALGgrW3oJEFAOWS/vsmw6nuZ+Kz6gPA2jNO4/mM6JuFHAOAgbttBjF4QjtccltTm
        /8mmsdT7+V5mfTHg6nbGHmjvpKx1QZTTOfqzw2Bsz2/GmS3WkmPyRgj7vvERYFc4zEEcIF
        ySPj47d8ImgZczOsv348w0NLK80XP6Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Henrik Grimler <henrik@grimler.se>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/6] ARM: dts: add mmc aliases for Exynos devices
Message-ID: <Y9J97CU7f5qoiO/F@grimlerstat>
References: <20230126103828.481441-1-henrik@grimler.se>
 <0807a4ab-c544-2695-67d4-df9a3b1de4cf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0807a4ab-c544-2695-67d4-df9a3b1de4cf@linaro.org>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Thu, Jan 26, 2023 at 01:22:54PM +0100, Krzysztof Kozlowski wrote:
> On 26/01/2023 11:38, Henrik Grimler wrote:
> > It is convenient to have fixed mmcblk numbering of the eMMC and
> > sdcard, and with these aliases all Exynos 4 and 5 devices (and
> > probably Exynos 3, but I do not have one of those boards so cannot
> > verify) will have the eMMC as mmc0 and sdcard as mmc2.
> > 
> > I also removed sdhc aliases, as they should not be needed after [1] as
> > I understand it.
> > 
> > [1] https://lkml.kernel.org/lkml/20211124184603.3897245-1-john@metanate.com/
> 
> Marek sent the same in the past:
> https://lore.kernel.org/all/?q=%22exynos%3A+Use+fixed+index+for+the+MMC+devices%22
> 
> The patches are fine for me except, that these actually do not belong to
> DTSI. Aliases for board or user-exposable interfaces are actually board
> specific and each board should customize the ones it uses.

Thanks for reviewing!  I will change the series to only add aliases to
the boards I am familiar with.

> Best regards,
> Krzysztof

Best regards,
Henrik Grimler
