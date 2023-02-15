Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632E7C6379F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Feb 2023 20:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjBOUvo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Feb 2023 15:51:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjBOUvI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 15:51:08 -0500
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A574614F;
        Wed, 15 Feb 2023 12:48:15 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id be34so970113oib.10;
        Wed, 15 Feb 2023 12:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVfBA4LnCPREqejS6Gc9UmviOgv+gM6rPfkxR0HLA4s=;
        b=8MzvWLuvEYDTn885ufdr6JgkZsFJDVL++yds3D9bkKbijAKB3YCMTFyRUTOjaYEJcc
         CJeM3ExS3coA26ftJMYm48tolvqaq3yC+6ULRJVa4/G8OG3TDHqZlR7XlHhxmV84DbPL
         eLCvkU9fx+NWsSM8UIQNW2lVL7ajBD+Ybcqjp09ssZq+bRtXAhDct6Bqpi4odZPK7Zje
         KRuOcA/Dy+JZiDIm7QeFCGTFEVXkp8ThkHcb16QWyM5rg+MgkNpnTcXBmQJ4371nRgG1
         ARTB0gPPW9vD5jb2xiVbzNVFKlkSW+ipwphNwdjV29O1MOnMx08u5IQJ25Osn/863/Xc
         5ltg==
X-Gm-Message-State: AO0yUKU4XRhzppz2quAsLYyJs38sIZfPlyKrPEQWrQJfPOP4GiuL5Pie
        S1gKY5zGO7J6mF/9rbqH7Q==
X-Google-Smtp-Source: AK7set+yKVtWvoHEMXvuuAWzQdTzXzzWLl1V6XIvh46saR85Ag544X0I3AmsbdxPyuhDEFawPgTBiA==
X-Received: by 2002:a05:6808:120a:b0:36e:ce03:ac1e with SMTP id a10-20020a056808120a00b0036ece03ac1emr315675oil.27.1676494043989;
        Wed, 15 Feb 2023 12:47:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b7-20020aca3407000000b003785fa67bf8sm7736702oia.1.2023.02.15.12.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 12:47:23 -0800 (PST)
Received: (nullmailer pid 526474 invoked by uid 1000);
        Wed, 15 Feb 2023 20:47:22 -0000
Date:   Wed, 15 Feb 2023 14:47:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/7] media: dt-bindings: i2c: samsung,s5k5baf: convert
 to dtschema
Message-ID: <167649404253.526422.5865755847572555798.robh@kernel.org>
References: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
 <20230214104508.51955-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214104508.51955-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 14 Feb 2023 11:45:03 +0100, Krzysztof Kozlowski wrote:
> Convert the Samsung S5K5BAF image sensor bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/i2c/samsung,s5k5baf.yaml   | 101 ++++++++++++++++++
>  .../bindings/media/samsung-s5k5baf.txt        |  58 ----------
>  2 files changed, 101 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

