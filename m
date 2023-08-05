Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F89FC0015E
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  5 Aug 2023 22:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjHEWNr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 5 Aug 2023 18:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjHEWNo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 5 Aug 2023 18:13:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DA810C9;
        Sat,  5 Aug 2023 15:13:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5088060F39;
        Sat,  5 Aug 2023 22:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5402CC433C9;
        Sat,  5 Aug 2023 22:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691273621;
        bh=Fv6xOJZuHno+soULBoFjqvGf1qqQIZ28lqSa/yaepNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cWO3s+9aPMtvvprSTvt2Q7uwb7A5V1/T1GBpjD4FemWJBT5S7hXTio62lrmiTV3UQ
         tNbd9kM3syKurONPvGL9ft6QrpvEKjS6Ng/vtK9lcA/HLcMRBkaqg6xFl8O57ObDt5
         rU/igyl8r4co4aTgmbbuDSDTNI07hhMcX/2bT+9Cjkd62yUD66ZUBTSYn7iLAUDDd7
         gPGkUkTBrHezef/Ps0qsxMsFngrCOsgRX8gmkBHymJwMkVDHmllwv7kAazHKo3jG02
         4gcImQkVDVvS1x3/j50ueDfm79HeS8Lzh6NTPKk7q0zdnf6qGoIFPgKnMgME9MMtlm
         n8QIaElvZTxtw==
Date:   Sun, 6 Aug 2023 00:13:39 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yue Haibing <yuehaibing@huawei.com>
Cc:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] i2c: s3c2410: Remove unused extern declarations
Message-ID: <20230805221339.7vl3jcutustlvhgc@intel.intel>
References: <20230728132318.25072-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728132318.25072-1-yuehaibing@huawei.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Yue,

On Fri, Jul 28, 2023 at 09:23:18PM +0800, Yue Haibing wrote:
> commit 0d297df03890 ("ARM: s3c: simplify platform code") left behind
> s3c_i2c(*)_set_platdata().
> commit d78c16ccde96 ("ARM: SAMSUNG: Remove remaining legacy code")
> leave s5p_i2c_hdmiphy_set_platdata() declaration.
> And commit bad1e6aadd17 ("ARM: SAMSUNG: Cleanup plat-samsung/devs.c and devs.h")
> leave s3c_i2c(*)_cfg_gpio() alone.

I don't understand anything from the commit message here.

How about:

"
After some cleanups[*] certain s3c_i2c(*)_cfg_gpio() prototypes
have become unused. Remove them.

[*] 0d297df03890 ("ARM: s3c: simplify platform code")
    d78c16ccde96 ("ARM: SAMSUNG: Remove remaining legacy code")
    bad1e6aadd17 ("ARM: SAMSUNG: Cleanup plat-samsung/devs.c and devs.h")
"

> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

which branch should this go? Samsung or i2c?

Andi
