Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F38EE49A5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Aug 2023 20:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjHUUht (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Aug 2023 16:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjHUUht (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 16:37:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72B4C7;
        Mon, 21 Aug 2023 13:37:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 745A861215;
        Mon, 21 Aug 2023 20:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1131C433C7;
        Mon, 21 Aug 2023 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692650266;
        bh=v+KShXU0zr3gwWEYt3vtELSHX2rEmXIbTNKQCNMA42g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P/gy2sWzgbbG3wmd9AO2AsEtxD3Y17Lr1GLJBVl3jwG/J8QqidqOXVJ9x6zEvQF3I
         svG13N4qJ6uqYk5+AwDP62aJbQVDKECe7lQ5+TAxjLVCMVgSN7b8LHRgBCDqrcKDh6
         7t+2keS2951P5VSWi46mu6W5EPaXFrXH4n/nJfJnkHiUIwQM/M+ZKLuVIUDKYCRp+a
         Fog6473E3OHKyanF5pX0IatcIQlaOxwTkowFDBuFeu9U/EQWmbQWD55oWTqdPg5hpD
         Z1nGs1LbqIgsNfo+MyDNKKjwccETH7p3KbDjgTtqpwVCJ5XLYKv7idthM2QlEOH5Ve
         vKjdo/u7vW6Gw==
Received: (nullmailer pid 2253239 invoked by uid 1000);
        Mon, 21 Aug 2023 20:37:44 -0000
Date:   Mon, 21 Aug 2023 15:37:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: fix order of
 clocks on Exynos5433
Message-ID: <169265026433.2253178.10308901567633056481.robh@kernel.org>
References: <20230818102911.18388-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818102911.18388-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 18 Aug 2023 12:29:11 +0200, Krzysztof Kozlowski wrote:
> The Exynos5433 DTSI had always different order of DWC USB3 controller
> clocks than the binding.  The order in the binding was introduced in the
> commit 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to
> dtschema") converting to DT schema.  The Linux driver does not care
> about order and was always getting clocks by name.  Therefore assume the
> DTS is the preferred order and correct the binding.
> 
> Fixes: 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to dtschema")
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

