Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55219C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C660207E8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603738558;
	bh=fWQKTjawaDDOP4+ITIGjJ18B1P6XFbYpmqk3fHMahfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IYDb+Em0xv60C5Mg6ktG4fXZxNJpF1unuJEQawzM7acu6fOq0TM0eLTT6w8hyW+Hq
	 Ks+esUHduc6e9MmHtIDfAJjg2U2MvUwUo+e1mdsi+dyIq0oiCHaJoLnd5rXhAHiESG
	 SBOd5IrYI/pc48RfmlVUj100ipJ4vE83jWBngbTM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782921AbgJZSz5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:55:57 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:37422 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782687AbgJZSz4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:55:56 -0400
Received: by mail-ej1-f65.google.com with SMTP id p9so15215582eji.4;
        Mon, 26 Oct 2020 11:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sRHnsY17GiEFV7UpPNjfs4X+DxzUvuiP8n7tMVHTxAU=;
        b=aOgrpdaaBvyV2h9QUeS8LR4pUWbyL3UEJ4tgUWJY5t0nyQk3kwwwcfOpw20Ne7ofbp
         SAx3boel876xzJPBWADTntLYC/UXfyw3i6om5uTluf7L31zDD/ERFurBb6/T+w0HDwwl
         UjsoxvjU0QWUx+CRqCHGcXWGU4PaEwf+LOJsJ19TA4HFr+eqhf8pF4e8B9T0dasu462c
         YopMq6sGwGWnWD6jUiI/XDjX6CVwWxNh95u9u3fZLlQ5YlyPCOaCf/62p3BCVEjsUan2
         3TXDMpOrfreZb5ZSKqKIgGpsbhS8Lz9MibdRAKWdis8EE0+mhcsyomD7R9MXqZZG2w6G
         9oaA==
X-Gm-Message-State: AOAM533L6TsVDfZla/QYISOnEmmH1njyAtzvh9O1E5aUnkAkS/0ZIBrx
        2qGGkM13y94CbC+nJcsv0HQ=
X-Google-Smtp-Source: ABdhPJw1pY7cyTF9i9iCOzl611xDaKyrPiePQ5R+MECLxLg2XZzh+L34yiFS5gCBxpSZbVzYKC31ng==
X-Received: by 2002:a17:906:318f:: with SMTP id 15mr16381033ejy.180.1603738554089;
        Mon, 26 Oct 2020 11:55:54 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id k22sm5685900edr.12.2020.10.26.11.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:55:52 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:55:50 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 04/29] arm: dts: exynos: Correct DWC USB3 compatible
 string
Message-ID: <20201026185550.GA170936@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-5-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:34PM +0300, Serge Semin wrote:
> Syonpsys IP cores are supposed to be defined with "snps" vendor-prefix.
> Use it instead of the deprecated "synopsys" one.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 2 +-

Thanks, applied.

Best regards,
Krzysztof

