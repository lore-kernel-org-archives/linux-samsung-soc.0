Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331D5C41513
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Aug 2023 20:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjHNUrn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbjHNUrW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 16:47:22 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E235DD;
        Mon, 14 Aug 2023 13:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=XF4k3vYE8W6Xz2QZAPKY0H1yW6ZovDPl0KP1KYBcfJo=; b=Ld4JFLMJlmPdcx4JoMj94n0ZtP
        GwIvyBwFGZGiYs+VTALqibCYaQv2pQLUwzCR0p+chV9Jf6vzlDpXxnpjZaPE8p4GGZxMyw141/o+R
        8N2pU/GL0HNHMkVuLnvz9sPShBO43PPgYzE8dUFmC5qyTUNiJ/Wco4A7Vzhc8fgN5H0E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qVeSz-0045Z2-Kc; Mon, 14 Aug 2023 22:47:09 +0200
Date:   Mon, 14 Aug 2023 22:47:09 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sriranjani P <sriranjani.p@samsung.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        richardcochran@gmail.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
        alim.akhtar@samsung.com, linux-fsd@tesla.com,
        pankaj.dubey@samsung.com, swathi.ks@samsung.com,
        ravi.patel@samsung.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chandrasekar R <rcsekar@samsung.com>,
        Suresh Siddha <ssiddha@tesla.com>
Subject: Re: [PATCH v3 2/4] net: stmmac: dwc-qos: Add FSD EQoS support
Message-ID: <c17ce6db-4823-44cb-8fda-6ef62f4768fd@lunn.ch>
References: <20230814112539.70453-1-sriranjani.p@samsung.com>
 <CGME20230814112612epcas5p275cffb4d3dae86c6090ca246083631c4@epcas5p2.samsung.com>
 <20230814112539.70453-3-sriranjani.p@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814112539.70453-3-sriranjani.p@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> +static const int rx_clock_skew_val[] = {0x2, 0x0};

> +static int dwc_eqos_setup_rxclock(struct platform_device *pdev, int ins_num)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct regmap *syscon;
> +	unsigned int reg;
> +
> +	if (np && of_property_read_bool(np, "fsd-rx-clock-skew")) {
> +		syscon = syscon_regmap_lookup_by_phandle_args(np,
> +							      "fsd-rx-clock-skew",
> +							      1, &reg);
> +		if (IS_ERR(syscon)) {
> +			dev_err(&pdev->dev,
> +				"couldn't get the rx-clock-skew syscon!\n");
> +			return PTR_ERR(syscon);
> +		}
> +
> +		regmap_write(syscon, reg, rx_clock_skew_val[ins_num]);

Please could you explain what this is doing.

       Andrew
