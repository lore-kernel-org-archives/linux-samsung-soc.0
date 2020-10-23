Return-Path: <SRS0=uz1o=D6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E308C388F9
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 11:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB9BB24182
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603452865;
	bh=yitxDveLp7gb378cd6M1GqApDS4EOwZaZ6lGFlzXqqI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=J9MVDB8YWCGeyT3/nQANgUpLZK4Oub988pG4FHXzy/nhZgeLi8seKHofta3T75Gwj
	 wwogWIE7aZw8I+zHf2ZVYLiTgPi1Sw13mpqTikZF2HKAUC4Mj9tfNbtz7xFVSGhZzX
	 R1sXc6idsRtUPzpAF/Ry6wO+4c7i+kAmAlAkHiiY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462986AbgJWLeZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Oct 2020 07:34:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:42148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S462985AbgJWLeY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 07:34:24 -0400
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF78720EDD;
        Fri, 23 Oct 2020 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603452864;
        bh=yitxDveLp7gb378cd6M1GqApDS4EOwZaZ6lGFlzXqqI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HfukXPPCI8BYXcw33DKfMyyUWbj+lWHR4Aumc1/9R1kRiVOwYZdTlUrXATexQc8ZY
         gKfgamMkM5dsYQDHncbbbHExJ8+jB+0HzYJhIz+8WGs5zgoE7nMxKe1YnY9j+iTdXY
         Fp4mCGMV/U7Ndd6acxj9fTwBv+ZQt5L4TmnMRBdg=
Subject: Re: [PATCH 1/2] soc: samsung: exynos-pmu: instantiate clkout driver
 as MFD
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20201001165646.32279-1-krzk@kernel.org>
 <20201001165646.32279-2-krzk@kernel.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <32d3faaf-1631-3ebe-6d73-fe565c39639d@kernel.org>
Date:   Fri, 23 Oct 2020 13:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001165646.32279-2-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 10/1/20 18:56, Krzysztof Kozlowski wrote:
> The Exynos clock output (clkout) driver uses same register address space
> (Power Management Unit address space) as Exynos PMU driver and same set
> of compatibles.  It was modeled as clock provider instantiated with
> CLK_OF_DECLARE_DRIVE().
> 
> This however brings ordering problems and lack of probe deferral,
> therefore clkout driver should be converted to a regular module and
> instantiated as a child of PMU driver to be able to use existing
> compatibles and address space.

It might have been cleaner to have the CLKOUT device as a PMU subnode in DT, 
then device instantiation would be already covered by devm_of_platform_populate().
But it gets a bit complicated to make such a change in a backward compatible way.

I have tested both patches on Trats2, where CLKOUT provides master clock for
the audio codec.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
 

> @@ -128,6 +134,11 @@ static int exynos_pmu_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, pmu_context);
>   
> +	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pmu_devs,
> +				   ARRAY_SIZE(exynos_pmu_devs), NULL, 0, NULL);
> +	if (ret)
> +		return ret;
> +
>   	if (devm_of_platform_populate(dev))
>   		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");


