Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45598C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Jul 2022 13:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiGIN6J (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Jul 2022 09:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiGIN6I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Jul 2022 09:58:08 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Jul 2022 06:58:08 PDT
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174C5491FB
        for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Jul 2022 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
         message-id:subject:cc:to:from:date:from;
        bh=QDvYa9cFEorN1ILaq5p0/t/GBxoIQgB2tyKasIexqXs=;
        b=uHxHgDorQxChvH4gH2fuo2MNARVNejJimVx6FLSWFl/wA01O2eLtrgFIQbsYwJRP/im+6jA2ffGBX
         Ic+bJZAUf3QMQugASocmdQQCjGyHUgzIP78TPUjvQZJUMAAe1ob1xDGCTDIKLGogh9sdontAFn5NDf
         7l+K6QNVGW3WLl+jiCdyT4e6OzNo3zmnPTu9DR3zF95QERBperdvqKnQsP0/g79v3ffuLc8B/azhhi
         sytiEsNxMM2sDaCKU9BpcSscUqS82ls8KL7++GkaE+rrbjSCsTxlnJEnfigoDyWX3j0prPhyF1HdBc
         V2zLMM+RPs9L5/BI0R69GiCNpi+h7KQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
         message-id:subject:cc:to:from:date:from;
        bh=QDvYa9cFEorN1ILaq5p0/t/GBxoIQgB2tyKasIexqXs=;
        b=OJYGdGwmD39yIGuezDD0shzbCZ80kbR/J8mg/gZnpYSmcwSzAvbTO8P3kVlx4THYAdM1qwFICXjmS
         xWE8pO6Ag==
X-HalOne-Cookie: e9bc3fa241fdae21be51ef3314c024f593f38501
X-HalOne-ID: 03389c65-ff8f-11ec-823c-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 03389c65-ff8f-11ec-823c-d0431ea8bb10;
        Sat, 09 Jul 2022 13:57:04 +0000 (UTC)
Date:   Sat, 9 Jul 2022 15:57:02 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: simple: add support for
 Samsung LTL101AL01
Message-ID: <YsmJLhHBUGPHh7nL@ravnborg.org>
References: <20220516193709.10037-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516193709.10037-1-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Martin,

On Mon, May 16, 2022 at 09:37:07PM +0200, Martin Jücker wrote:
> Add the Samsung LTL101AL01 WXGA LCD panel to the list.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>

Applied to drm-misc (drm-misc-next).

	Sam
