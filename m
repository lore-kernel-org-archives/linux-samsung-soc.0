Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEE6C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiKYOF3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 09:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiKYOF2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 09:05:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC231E71F;
        Fri, 25 Nov 2022 06:05:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9C50BB82A92;
        Fri, 25 Nov 2022 14:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC909C433C1;
        Fri, 25 Nov 2022 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669385125;
        bh=DRn5Jso4mMhB2yfvIbIsbzLAh0LJRniW2BI/aXXkdw4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aeDB3wI00BtU1YX7z0iwD/DGtnFkNSSvkfG69YeGaIh+RBOgWyxQLhl3zJFgibl67
         sk38YAOFs2go1I1/FiFZz2mdWNxi5Nw/eILM2kFXJ0C/b/DRQji2aLd5EpJgAYKrpR
         NC8ccLP5jy1a4FNFpwG/hi132JAWyjiWUO/shFbTgvvXh0H559OB5e/piwJgw/8DcJ
         ivVI3Ne26KUMEIFYGDYtA/unAxlx3mwHmPjoOlR1VlRq+GGlzYYIFz1tULhfd2qEoF
         ug8wW05+w/9Iu+PMgYpbX+Cqpj1U3CqkfaJQeMGsJ4FojzhqXnD85gqNCLXVLGwPcS
         OFUrNMMEFbsuQ==
Date:   Fri, 25 Nov 2022 14:05:19 +0000
From:   Lee Jones <lee@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: soc: samsung: exynos-sysreg: split from
 syscon
Message-ID: <Y4DLn3BkC2SCahee@google.com>
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
 <20221125112201.240178-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221125112201.240178-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 25 Nov 2022, Krzysztof Kozlowski wrote:

> Split Samsung Exynos SoC SYSREG bindings to own file to narrow the
> bindings and do not allow other parts of syscon.yaml.  This allows
> further customization of Samsung SoC bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Sriranjani P <sriranjani.p@samsung.com>
> Cc: Chanho Park <chanho61.park@samsung.com>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../devicetree/bindings/mfd/syscon.yaml       |  6 ---

Acked-by: Lee Jones <lee@kernel.org>

>  .../soc/samsung/samsung,exynos-sysreg.yaml    | 39 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml

-- 
Lee Jones [李琼斯]
