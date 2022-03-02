Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC91C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Mar 2022 20:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243213AbiCBU0R (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Mar 2022 15:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234311AbiCBU0P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 15:26:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0CD4832A;
        Wed,  2 Mar 2022 12:25:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B55261778;
        Wed,  2 Mar 2022 20:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DB8C004E1;
        Wed,  2 Mar 2022 20:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1646252730;
        bh=exjlzcVcsuYcAXDhmIoCSR6BnbnM5w6RT4sg6IMh10o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yzB09auQ8CJzIa2M8e90yrYsqo+3EQuDCItOhpcEo+bglab9hWEnxok5jiAqV76sq
         IsfFBUhkL5j39mONIGiQAEV5U5biwXNWnD2lCns8gSenm76NFBLWi+UybJ7oE7ngxX
         0wH2mKHuLLGCcc86tZllJisQefggDsKLbVfzP0YM=
Date:   Wed, 2 Mar 2022 21:25:27 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: dt-bindings: samsung: convert to dtschema
Message-ID: <Yh/StzlTgbFvXIM1@kroah.com>
References: <20220302190938.6195-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302190938.6195-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Mar 02, 2022 at 08:09:36PM +0100, Krzysztof Kozlowski wrote:
> Hi Greg,
> 
> Could you pick these up?

Will do so, give me a few days...

thanks,

greg k-h
