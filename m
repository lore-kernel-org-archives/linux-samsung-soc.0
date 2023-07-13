Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AE2EB64DD
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jul 2023 13:41:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbjGMNlH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jul 2023 09:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233737AbjGMNlG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jul 2023 09:41:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675D2B4;
        Thu, 13 Jul 2023 06:41:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05B87612FC;
        Thu, 13 Jul 2023 13:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0385C433C7;
        Thu, 13 Jul 2023 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689255665;
        bh=+dIcOrBILiSY92qNKpZOIRmdZzW/jgo0vMbRyiJDYrc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XC2GKC9tgAKfNYIxrSeQLKQcccmHJf+EXJDA/XUHS+cUZLm5vlPLNt2vnFZDIh3N/
         EkcWU5Hn/jPlaliUbFxtK9qwebOQT9JxJ1o3TpmuufCEJ7v4pcb/6k+bf49RLOQY8a
         lOlGDCIRrB2gB/rdF1AryXRkYGe1z2r5dggpAAd+58rAOFMoVIoo9COK6lg84ENugO
         JzxWKevIt+y75NvwJ4WDsVqRRaYcor6GEJxfbluvkLvXQ9jpZKeLZLiaxEEel2TY2K
         XMZh7Y47qhqRDGnjrT/q1eAVFlcNvOaqD9oI7cxnz/ik6uzcd9fnt8Hdqy+TLL1uD6
         hQ6FqtHs+K32A==
Date:   Thu, 13 Jul 2023 14:41:00 +0100
From:   Lee Jones <lee@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] mfd: exynos-lpass: Convert to
 devm_platform_ioremap_resource()
Message-ID: <20230713134100.GZ10768@google.com>
References: <20230706113939.1178-1-frank.li@vivo.com>
 <20230706113939.1178-4-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230706113939.1178-4-frank.li@vivo.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 06 Jul 2023, Yangtao Li wrote:

> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/mfd/exynos-lpass.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
