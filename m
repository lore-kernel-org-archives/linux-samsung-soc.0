Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F86C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Aug 2023 23:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjHGXOC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Aug 2023 19:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjHGXNv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Aug 2023 19:13:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7186170B;
        Mon,  7 Aug 2023 16:13:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DA316228D;
        Mon,  7 Aug 2023 23:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2455BC433C7;
        Mon,  7 Aug 2023 23:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691450003;
        bh=sHveayqydBN1Brz7x3ocQnkmPo6C+nsWsslvZeviEAg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dw8ZMhze5ZrZj4Y38Di76h0nFqQq9f/KZmJz8ZU6TRJI07ichbVJrR/9BhYKB51Qg
         gjXSt0lyKeiO6o83RXaT2I0n6tJUpcMz5Xyxg/jEmQlnsxAleX10iRMExcOriD7lq0
         KWxatIsERKx0v0E0tNDUFP/OILIFkFNwrJWrXrC8QYg7bLNJwaSso2tsyYG9hLk5y4
         FMmUqsBhMdfo0QgcIUGMWroDdy3aXmuhs8fY7yr4uhlI+qE8xSJS5o6a/UEY6UZJEt
         KtSpARB4M8n7IHv6f6ZOWuBRW+OH23uDa25RiQN/25mrx+tkvKjBKwgAF4cn4jpCjZ
         bE0yzkNAz4D2Q==
Date:   Tue, 8 Aug 2023 01:13:20 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: exynos4-is: fimc-is: replace duplicate pmu
 node with phandle
Message-ID: <20230807231320.svssge6uymw3jiho@intel.intel>
References: <20230807131256.254243-1-krzysztof.kozlowski@linaro.org>
 <20230807131256.254243-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230807131256.254243-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

[...]

> +static void __iomem *fimc_is_get_pmu_regs(struct device *dev)
> +{
> +	struct device_node *node;
> +	void __iomem *regs;
> +
> +	node = of_parse_phandle(dev->of_node, "samsung,pmu-syscon", 0);
> +	if (!node) {
> +		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
> +		node = of_get_child_by_name(dev->of_node, "pmu");
> +		if (!node)
> +			return IOMEM_ERR_PTR(-ENODEV);

in my opinion this should be:

		...
		if (!node)
			return IOMEM_ERR_PTR(-ENODEV);

		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");

Because if you don't have both "samsung,pmu-syscon and "pmu" then
the warning should not be printed and you need to return -ENODEV.

... and... "*please* update your DTB", the user might get upset
and out of sheer spite, decides not to do it – just because! :)

Andi

> +	}
