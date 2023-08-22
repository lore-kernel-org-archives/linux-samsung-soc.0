Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9F6EE49A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Aug 2023 12:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235564AbjHVMZz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Aug 2023 08:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbjHVMZy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 08:25:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A76199;
        Tue, 22 Aug 2023 05:25:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB97760C56;
        Tue, 22 Aug 2023 12:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFF5C433C8;
        Tue, 22 Aug 2023 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692707152;
        bh=8eUEWJPTSeLQx03vuAPCyuAPr8wQILlpjH22aTpmHjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QjWw1AroDZC+blk+bVJ/Wub/9AcH2Fg1/1G3AKK+vV0hWW/99iUyCzY52D5R0+a5B
         r7O7/ADAwr+u3bFe493brSNtQa5W4FYi9T0Fuq4nkUQFRiU5utX7aw/HR6DDSkYy4u
         abPMxW7jxySC2xDFcjbuHOfzCr0SQBHEXYTQgQ4U=
Date:   Tue, 22 Aug 2023 14:25:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: Fix Exynos5433
 compatible
Message-ID: <2023082243-quickness-pacifier-a958@gregkh>
References: <20230816201123.3530-1-semen.protsenko@linaro.org>
 <acec7eb3-92b5-e431-f84c-500f07a2dd14@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acec7eb3-92b5-e431-f84c-500f07a2dd14@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 18, 2023 at 11:52:15AM +0200, Krzysztof Kozlowski wrote:
> On 16/08/2023 22:11, Sam Protsenko wrote:
> > The correct compatible for Exynos5433 is "samsung,exynos5433-dwusb3".
> > Fix the typo in its usage.
> > 
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Fixes: 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to dtsche
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Greg,
> I assume this one is for you.

Great, I'll take it, thanks.

greg k-h
