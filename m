Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F0BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 25 Jul 2022 07:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbiGYHg6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 25 Jul 2022 03:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiGYHg5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 Jul 2022 03:36:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DA812091;
        Mon, 25 Jul 2022 00:36:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7695CB80D81;
        Mon, 25 Jul 2022 07:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283CEC341C6;
        Mon, 25 Jul 2022 07:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658734613;
        bh=LUiMLAhA+OjPnzur2BcOAHYRJpUgPwPJevN7YbYoXG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UssAoRr2irhYEnKwR1jy9cAG6tz6GVQQNmEU4WpmgaCnzpRupWp213/TKp5sgXPxW
         f4FJqxs8C0bLuuyupi2rq7qmvnsiHwzs4pMXhF2GlY1RpYxsFfy+qfyALuf0ldeLci
         pJdoRH6sk7rRFo9c9Itb//58M3cMjOlEsWZoDe7siGpHYJNzoFjQY2j2YQBgV92qiW
         PTRAzFYecjITUELPVxv+025MDiMDYCsRK3CqAO2potzLcpKTwlBmSqeRYm88xVC34W
         bJiNGuqOjhC8vB9+/jf+DxjVhaxzEku51iUBR1l7u0xpmu+rv7wO1UrrJrDxqSOITI
         N6qLrUFDEqr2w==
Date:   Mon, 25 Jul 2022 13:06:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Alim Akhtar' <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: phy: samsung,ufs-phy: match clock items
Message-ID: <Yt5IEHK9OsRZDGi1@matsya>
References: <CGME20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21@epcas2p1.samsung.com>
 <20220707062807.135960-1-chanho61.park@samsung.com>
 <4e8a36de-a631-f6c9-44d7-7d873f775db2@linaro.org>
 <001b01d89d69$37d80320$a7880960$@samsung.com>
 <454232b3-2f98-c3ca-4661-5e9eb51998b6@linaro.org>
 <000001d89fb9$4ee00520$eca00f60$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001d89fb9$4ee00520$eca00f60$@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25-07-22, 08:58, Chanho Park wrote:
> > >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >
> > > Hi Krzysztof,
> > >
> > > No one takes this patch. Could you please pick this patch in your tree?
> > > Thanks.
> > 
> > You did not send it to PHY maintainers... The bindings go via subsystem
> > maintainers.
> > 
> > If Vinod doesn't want it, I could take it, but he never had a chance to
> > say :)
> > 
> > Please resend.
> 
> Oh, maybe I missed him due to not showing from get_maintainer.pl script.

./scripts/get_maintainer.pl Documentation/devicetree/bindings/phy/
Kishon Vijay Abraham I <kishon@ti.com> (supporter:GENERIC PHY FRAMEWORK)
Vinod Koul <vkoul@kernel.org> (supporter:GENERIC PHY FRAMEWORK)

:-|

> I'll resend this.

Pls do..

-- 
~Vinod
