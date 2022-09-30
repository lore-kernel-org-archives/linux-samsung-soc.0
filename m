Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87EAC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Sep 2022 11:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiI3Lwm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbiI3LwT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 07:52:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E844FAE3;
        Fri, 30 Sep 2022 04:52:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3CBBCB8279B;
        Fri, 30 Sep 2022 11:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883F3C433D6;
        Fri, 30 Sep 2022 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664538723;
        bh=9qg9NEDijFHKMEjh1dAItgKANrvXJtfxR8DxdB7QJGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lHGWSwtVMU97kR0kdkuHVwvLy4EYw3lTkbwQF8hg/9u+2ihaqpEQ3437yAhHaVegW
         uPvyr8+oCXVhVaRqWuJfqFFYqAPx/jfXRUpUhnOZPICvSmGvSmUbDm3w7X6Y7X/8ZC
         hfxztL+c7rxSdYz16rrZj5Q0as9mnT65olrtHwEc=
Date:   Fri, 30 Sep 2022 13:52:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: host: ehci-exynos: switch to using gpiod API
Message-ID: <YzbYYae9VYUXTj+P@kroah.com>
References: <20220927220504.3744878-1-dmitry.torokhov@gmail.com>
 <20220927220504.3744878-2-dmitry.torokhov@gmail.com>
 <0a4c346f-52fc-1cde-e6d6-84b7bd0e1090@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a4c346f-52fc-1cde-e6d6-84b7bd0e1090@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 28, 2022 at 08:55:53AM +0200, Krzysztof Kozlowski wrote:
> On 28/09/2022 00:05, Dmitry Torokhov wrote:
> > This patch switches the driver from using legacy gpio API to the newer
> > gpiod API.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> 
> Greg,
> I'll take the DTS change via Samsung SoC tree.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Ok, thanks!

greg k-h
