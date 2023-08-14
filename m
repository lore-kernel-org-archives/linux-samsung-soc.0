Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD89C41513
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Aug 2023 20:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjHNUyJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbjHNUxm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 16:53:42 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44B4C3;
        Mon, 14 Aug 2023 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=0c42Rh8URF+7/wY+si+N31nQijMDe4WdLz8gnVGOvSI=; b=IgKJa8ZH+DQGfujq2qDtlZRROT
        or6JwXvQIFntfD6UeCI5ezNrHtxyh+40va5MdYC/JDsohxMgLuYNF5uGb/fkkqjypgeprjEy6THkG
        vMxJClyQTMscvBObKESsCr1ANNqxRe1MtZsr+PNGCaPoLkWxa4AxN4tqp2X11leLQ8w8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qVeZ6-0045cV-Mz; Mon, 14 Aug 2023 22:53:28 +0200
Date:   Mon, 14 Aug 2023 22:53:28 +0200
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
        Jayati Sahu <jayati.sahu@samsung.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: fsd: Add Ethernet support for PERIC
 Block of FSD SoC
Message-ID: <ec90ca79-89a5-4741-a3b7-886fc1bd14d1@lunn.ch>
References: <20230814112539.70453-1-sriranjani.p@samsung.com>
 <CGME20230814112625epcas5p1e1d488a590bfc10d4e2a06dcff166037@epcas5p1.samsung.com>
 <20230814112539.70453-5-sriranjani.p@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814112539.70453-5-sriranjani.p@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> +&ethernet_1 {
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <1000>;
> +		full-duplex;
> +	};
> +};

So the exact same comments i made for patch 3/4 apply here.

   Andrew
