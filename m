Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A9AC05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 13:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjBCNl5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 08:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbjBCNl4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 08:41:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CEB1167B;
        Fri,  3 Feb 2023 05:41:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A54A461F35;
        Fri,  3 Feb 2023 13:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A094C433EF;
        Fri,  3 Feb 2023 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675431715;
        bh=BqaOPD7dtW+RNHVp4mgKLBVQpvvG60YANreOlI0gJxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JEL3ms4aky4mGro9nclf+YSpo4wIBk2JCpPYcDAbY4baq08IBt7okTWrLo02yxAtf
         l8PXET00rxRHm6oaCxfObVJ5uLqAoaRxbKU3ZQps/CzUfsyqHq4XhPuVATv77/4WVu
         86WymKtbblho1p/fJirBQzeZTNAebrVSmfhhRQnAVPbz69RgrMEYOI5KiRAgCui1TG
         Fl8I9NLKPK1NMXgqh9P6F2jj9/SegxLDRayWKzQT99FTFqwKNd4ncAGbKZ+AGtc6Gp
         V8A4rMFRXIa5hvV20m+htcxp5J/c5WyWPcS+DnuG+FNsXcTSoamonJmWzMXG0PGMgy
         iSQAXs31ggHdQ==
Date:   Fri, 3 Feb 2023 19:11:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, replicant@osuosl.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 4/8] phy: samsung,dp-video-phy: deprecate syscon phandle
Message-ID: <Y90PHhuszch7wcx9@matsya>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
 <20230127194057.186458-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127194057.186458-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27-01-23, 20:40, Krzysztof Kozlowski wrote:
> The DisplayPort phy is actually part of the Power Management Unit system
> controller, thus it should be its child, instead of sibling node with
> syscon phandle.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
