Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CE8C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jan 2022 19:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242389AbiAJTWY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jan 2022 14:22:24 -0500
Received: from h02mx15.reliablemail.org ([185.76.66.168]:53131 "EHLO
        h02mx15.reliablemail.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbiAJTWX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 14:22:23 -0500
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 Jan 2022 14:22:23 EST
X-Halon-Out: c998cc03-7249-11ec-930f-f5be715b97e5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grimler.se;
        s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=jj9126eP+CzjjlUSP5fq2CHgbfrCwlncgS1asGSjZeM=; b=d/wr6JQI+ZEc9FxBYK9LLIwLJe
        poDDb2yueSmgWeTH8LbIjo/0UoyGGyrCHCyDiCAx/oXNjzdRcIXIDA6o8sy9Cp/i638sJKz48d/OD
        5vEjLIer6LWOlBWZYbfm8tCxWgREZo6a2Cgb+gGypX1oNIdQC/01F2pAEVSbCn8XGA6WkJb3FX2qX
        TlueIFsYdEq4BOvZyDA0pfYheSfvohJ2zW5oumHQWtLnzS/EcE7e3/DuI/4gyltHuzQG86kuMGqci
        9eVsMSm7sj2c+4s3R7jZczqLGPthyVAqSWdTXWpV1VtVGmj3iOhDgn9Pj64bYQ8mAMHylRLdUrQTe
        9CuiEeUg==;
Date:   Mon, 10 Jan 2022 20:16:11 +0100
From:   Henrik Grimler <henrik@grimler.se>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux@armlinux.org.uk, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, martin.juecker@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] ARM: exynos: only do SMC_CMD_CPU1BOOT call on
 Exynos4
Message-ID: <YdyF4cvS2GRxKPVn@localhost>
References: <20220108215733.705865-1-henrik@grimler.se>
 <CGME20220108215952eucas1p1bb9bc56c7f8ac7117b5e5576635460d5@eucas1p1.samsung.com>
 <20220108215733.705865-2-henrik@grimler.se>
 <2202f06f-e901-44bb-b6dc-7225dd093e1b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2202f06f-e901-44bb-b6dc-7225dd093e1b@samsung.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpsrv07.misshosting.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - grimler.se
X-Get-Message-Sender-Via: cpsrv07.misshosting.com: authenticated_id: henrik@grimler.se
X-Authenticated-Sender: cpsrv07.misshosting.com: henrik@grimler.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

> Works fine on all ARM 32bit Exynos-based boards I have for tests.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for testing!  Would you mind telling me which Exynos boards you
have in your test-setup?

Best regards,
Henrik Grimler
