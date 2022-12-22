Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D925C001B2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Dec 2022 19:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235888AbiLVTfO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 22 Dec 2022 14:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235837AbiLVTey (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Dec 2022 14:34:54 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16A430567;
        Thu, 22 Dec 2022 11:34:07 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so1650610otk.8;
        Thu, 22 Dec 2022 11:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWNJdOIyPtnMcBMmOCjYRTOB2Nr98MKKR7cn2xvEWSg=;
        b=qgc9MW6WdmHhTnH5/GsgTxy2WNHEb57ssMHkyD97ve2DFmWzjVlA8hT9P1sImaGH1u
         APvzbXJrkyu+G3v2B7yGal2qxf44h/YE4thvnKvV7Y43Q1kh0onDnR3oidzArbb4ng4S
         P98fLc8qQ7b12rXW1bLaiJp6H+sM442z231ZVsAMouOBXySLSb74KZ5KOMGI7mdKI8SX
         n/jDTpoSqgs723akwZzwioEdmHJE4oznHhYME45EQLPTwfQJV7FukmVf4aub5i46TWip
         yRykTQLuEyOgu/wr5fbawdBw1qP9FLBOcVeUZZsHtEKU01g2/myRpIq+EQQlglyWaK3e
         HFcA==
X-Gm-Message-State: AFqh2kqCsdbBSXQbmvaVTXE7x0JQYbHKpFtClYXAllqxMRhZ26Ql94D5
        /hpOY9AeKn4gkVf3G0jydQ==
X-Google-Smtp-Source: AMrXdXtxaghkOVQHe3AHMVz+5/vqZ37iknCqFjTCKG0OidUpJkMAaQRBm426028lPeiYNZzv8rdcFQ==
X-Received: by 2002:a9d:196:0:b0:66e:98f2:edd with SMTP id e22-20020a9d0196000000b0066e98f20eddmr3738313ote.6.1671737647018;
        Thu, 22 Dec 2022 11:34:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a16-20020a0568300b9000b00670763270fcsm699449otv.71.2022.12.22.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 11:34:06 -0800 (PST)
Received: (nullmailer pid 1949007 invoked by uid 1000);
        Thu, 22 Dec 2022 19:34:05 -0000
Date:   Thu, 22 Dec 2022 13:34:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        daniel@ffwll.ch, inki.dae@samsung.com,
        linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sw0312.kim@samsung.com,
        dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
        Laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        kyungmin.park@samsung.com, hjc@rock-chips.com,
        alim.akhtar@samsung.com, neil.armstrong@linaro.org,
        linux-kernel@vger.kernel.org, heiko@sntech.de, airlied@gmail.com,
        jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
        andrzej.hajda@intel.com, linus.walleij@linaro.org,
        philippe.cornu@foss.st.com, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, jonas@kwiboo.se
Subject: Re: [PATCH v6 05/17] dt-bindings: display: rockchip: convert
 dw_mipi_dsi_rockchip.txt to yaml
Message-ID: <167173764506.1948954.2963463914057934898.robh@kernel.org>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <d6dc8453-4807-0a5d-15bf-6dcf80dcd0fe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6dc8453-4807-0a5d-15bf-6dcf80dcd0fe@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Thu, 22 Dec 2022 15:26:28 +0100, Johan Jonker wrote:
> Convert dw_mipi_dsi_rockchip.txt to yaml.
> 
> Changed:
>   file name
>   requirements
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V6:
>   Remove clock-master property
>   Fix $ref
> ---
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt |  94 ----------
>  .../rockchip/rockchip,dw-mipi-dsi.yaml        | 166 ++++++++++++++++++
>  2 files changed, 166 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
