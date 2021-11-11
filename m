Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E40C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 23:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C00361268
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 23:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbhKKXvT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Nov 2021 18:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhKKXvS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 18:51:18 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2483CC061766
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 15:48:29 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id v23so9009545iom.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 15:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0JJWVJalP8CdFuuTjj01mh7dvetDFFkhbScBxvOmImE=;
        b=eSPxiY6MEyQX62rXAkb0w5NNZxOWa7d9ff+SnhlWhS0oTPRJBa2CcaipLWPc0J0gKP
         l053mItULP8bYA7RJDTqKIuh/aUAXRYJq7/ITIAGvRYRnTF+9kbGLe7DBD/rhP/0a1Em
         gAQFu3Lzm+26xVXYz2R/xCLPJIf1sko7Ns7Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0JJWVJalP8CdFuuTjj01mh7dvetDFFkhbScBxvOmImE=;
        b=vilyDR6E67rrCxld92ECaiyHL4xzIkCZzG06Ecq1w03wFEDSdN0uAvtzHOicAKg2p+
         GHPTp510lUPEL1AGYVHpOSCCrh+5C7LNIYTA6opYfKh2TPcpluOkqYXRIFcQtxnMF6Q6
         mPc8vVpZpn16WNR7yLArvR5rMSLG7BK7uNXwgsTvJVAsPmmB0grPBGFmaggs9soBD1AQ
         2RG02dCH2Sy7OCM55ljQeYzDo077Q9mVWiW70DF56mUvYRWAFGdnuYoqVByCj8W8ydb8
         nghP99Y6db4jPhH7WI+l/5sX7kGzLWJvLQJ8bii9eTuQQJygOclsL9EwLEHBDgDBCQlu
         ltbg==
X-Gm-Message-State: AOAM530mC1R3JYgBKRh9DO22DSLeAlmTsg0UgB2TanX1YfsKiHLv+std
        RnzM9FU3ZfRSPo6z2Q09EAWinZbKUwLy7w==
X-Google-Smtp-Source: ABdhPJzXVhWzyxFb4ReXKZYqCY/lUAdW4uv9yfJiyME0cyeEyISXSLUmKvAkMyjlAzc3v3SHV7hcgw==
X-Received: by 2002:a02:9f87:: with SMTP id a7mr8458392jam.136.1636674508555;
        Thu, 11 Nov 2021 15:48:28 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id n14sm2921669ilm.18.2021.11.11.15.48.28
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 15:48:28 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id r8so9047453iog.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 15:48:28 -0800 (PST)
X-Received: by 2002:a05:6e02:1a67:: with SMTP id w7mr6255484ilv.165.1636674497968;
 Thu, 11 Nov 2021 15:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20210813195228.2003500-1-mka@chromium.org> <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
In-Reply-To: <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 11 Nov 2021 15:48:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UFUFqojhws0MBqrq41gU9ww1h-T+OjzebFKVwzeC+LYQ@mail.gmail.com>
Message-ID: <CAD=FV=UFUFqojhws0MBqrq41gU9ww1h-T+OjzebFKVwzeC+LYQ@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] usb: Specify dependencies on USB_XHCI_PLATFORM
 with 'depends on'
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Fri, Aug 13, 2021 at 12:52 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
>  config USB_DWC3
>         tristate "DesignWare USB3 DRD Core Support"
> -       depends on (USB || USB_GADGET) && HAS_DMA
> -       select USB_XHCI_PLATFORM if USB_XHCI_HCD
> +       depends on ((USB && USB_XHCI_PLATFORM) || USB_GADGET) && HAS_DMA

Technically you don't need the "USB &&", right? Since
USB_XHCI_PLATFORM is defined in 'usb/host/Kconfig' and that's only
even included if USB is defined. So it can be just:

depends on (USB_XHCI_PLATFORM || USB_GADGET) && HAS_DMA

That's not terribly important, though, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
