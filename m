Return-Path: <SRS0=CwGy=23=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BA3C33C8C
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jan 2020 22:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BC3F2081E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jan 2020 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578349007;
	bh=fu2DqfrbuFaGWXKt9NCaBaBO2DiLlEmXWK2BMRTlfzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=exrsh6ToL4jfT7macBN+BR+UVIT7V4gRSZHUJ5gDMs3yKvSTVXxESwL1TPAg418bY
	 Hjbs1bgp9+6p70Hl6kLygwtwnXe/dwoV28XsmkxDsw29fHhRKcbv7prrfRC+wt6Gic
	 YXpoxkiwK1Ad8TUKi+7epLiZ3y9FPpZned8WQpak=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgAFWQq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:16:46 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35443 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAFWQq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jan 2020 17:16:46 -0500
Received: by mail-oi1-f195.google.com with SMTP id k4so17009745oik.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2020 14:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JawZyvCEqxbxDbUWcz/6qCJtFgFJJZ6Kq0F51D4TyLs=;
        b=Y050GYG7NAHlHdqqEsnFtEgmuiY+sdihyAmJdfPFS0yWPzTBeB1+Q5aK1rhVMuzwHH
         tgMsxiW95JnIbmSYNLt1adMp3m0K4wD3tIBiiDHna0CmJZtrx6PTclVSxSygRvJ9SVvS
         jTRDsaghJpq1BUUlsuE+HjW3Cp13rx7DXO9gOqANY+zzyvkxalNTg2eQrMIy9P/NBTD3
         vtxKOp8srE7lDqFZBho1EKl+SWPwg3J8sTqLKQ3C2VdIBpCP9XjLftalJGzJMO/e5F2c
         brqJIRXb2+oVGWtitzevyCMy6SWk6H8A1vMzVrgIGacKdyGxdqICcQpF4DlqqFhAmAcq
         Kxxg==
X-Gm-Message-State: APjAAAVAkLRRyoGocPZPPwhD6hTZ0c76kWRhgV7ePwBFwWfCmD2i7OZ0
        Y0u4xvjSxDAGvKm3zboXy5Fh3I8=
X-Google-Smtp-Source: APXvYqyqraSTV5OAS2WxdbleupmjMjX7PgpzgVBdvQ8i+PTpDLG0DTj9ibTqD6I2aAO6khUb+ie2Mg==
X-Received: by 2002:aca:f505:: with SMTP id t5mr6709381oih.136.1578349005523;
        Mon, 06 Jan 2020 14:16:45 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id d7sm18888518oic.46.2020.01.06.14.16.44
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:16:44 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:16:43 -0600
Date:   Mon, 6 Jan 2020 16:16:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kamil Debski <kamil@wypas.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/20] dt-bindings: Rename Exynos to lowercase
Message-ID: <20200106221643.GA31683@bogus>
References: <20200104152107.11407-1-krzk@kernel.org>
 <20200104152107.11407-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200104152107.11407-2-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat,  4 Jan 2020 16:20:48 +0100, Krzysztof Kozlowski wrote:
> Fix up inconsistent usage of upper and lowercase letters in "Exynos"
> name.
> 
> "EXYNOS" is not an abbreviation but a regular trademarked name.
> Therefore it should be written with lowercase letters starting with
> capital letter.
> 
> The lowercase "Exynos" name is promoted by its manufacturer Samsung
> Electronics Co., Ltd., in advertisement materials and on website.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  .../devicetree/bindings/media/exynos-jpeg-codec.txt         | 2 +-
>  Documentation/devicetree/bindings/media/exynos5-gsc.txt     | 2 +-
>  Documentation/devicetree/bindings/media/samsung-fimc.txt    | 2 +-
>  .../devicetree/bindings/media/samsung-mipi-csis.txt         | 2 +-
>  Documentation/devicetree/bindings/phy/samsung-phy.txt       | 6 +++---
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 

Applied, thanks.

Rob
