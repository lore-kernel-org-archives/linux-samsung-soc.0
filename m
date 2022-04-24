Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8D6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 24 Apr 2022 11:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbiDXLIR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 24 Apr 2022 07:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239233AbiDXLIP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 07:08:15 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39808DE81
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 04:05:14 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id el3so10547032edb.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 04:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=i3bzLXI1nPc6qnp+fJ/Y8JQuZOmz2WnQ50REGcifuQE=;
        b=fktCNBHVwOkQtKwUpgNr7U7sdXzn/1WHjy7Pb1IbWPjWPMg6cK6ZSaalolnJqphKCM
         TQ+xXzWwvzTWco7YPuTRty3w/aU5E1DrrOK8zVCvniWHnjA6eRkpl3BoAeIB+EL/uwOt
         sTNk9mFGhbO/WaOFBJ3od6uKmeiyozLj5qPjqoqrDt3LIDqwKr3aktW6/jm5TEx7TDnP
         tOOiX8Ppeei348Vm3DtH0vtZx+SDOyzEsx2rEc2o57n3mwlOe+qMKMiLUjgNCwDBvB3P
         KqpwRWthCZTtWaYBNVB5DGmECMxCZhfkUOvZt6txWxj8JiLdictYmJOPd9NUSMs492Hd
         sedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i3bzLXI1nPc6qnp+fJ/Y8JQuZOmz2WnQ50REGcifuQE=;
        b=v/pMarO2SxQwAUP8C8FBfcmuoAA6t30O4bYx246OpaiHfExHUsMmAI4iOxS/LY11qx
         M0xuGT9lVYSwVG98fkGzENFGNcXFu/q3zuYzEAc6Amzm7pBzJGk48N1bY6L70xZ7zZtd
         r0kdefcB/DqUm1imsRN33Fs4AoKxXAAmTy9Zc8dcPERTNZ2o4bl3Q8FJi9/SdNpx9ctz
         59f4VALLw1Cez4x8KV0684lmEmIZv1kFzBejYkX+Je0T5Ag4hm4eedOlcouGAGl9VrG5
         QT8hK/OnJiBBMpfVuEr8GZgdR6R7Ey+5MpzCk04QzRNOPFF90/QILW/tichoX9si71b0
         NPug==
X-Gm-Message-State: AOAM532MaZXB0r4XrRpwAxsKWMiLJ0sxZu1cQmaiqEQIj8hmIFa0NdTk
        hLe2g5mdAzReHo00GrEFGrfH2Q==
X-Google-Smtp-Source: ABdhPJzTPP2YKCLb4GDm/DMwStVfH7hElz7rAfr0+p1PaloFrGNvze8BVtmRrAqyLpXYWqw5GKcCuw==
X-Received: by 2002:a05:6402:3551:b0:423:f55d:46ab with SMTP id f17-20020a056402355100b00423f55d46abmr13965288edd.384.1650798312764;
        Sun, 24 Apr 2022 04:05:12 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hf3-20020a1709072c4300b006f392c2bf71sm189778ejc.175.2022.04.24.04.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 04:05:12 -0700 (PDT)
Message-ID: <b6109c94-d4c4-6694-90bd-54f5c4fb9383@linaro.org>
Date:   Sun, 24 Apr 2022 13:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/5] mtd: onenand: samsung: Unify resource order for
 controller variants
Content-Language: en-US
To:     Jonathan Bakker <xc-racer2@live.ca>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
References: <20220423034524.366612-1-xc-racer2@live.ca>
 <20220423034622.366696-1-xc-racer2@live.ca>
 <CY4PR04MB05679F5FFE8317D557933CB3CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB05679F5FFE8317D557933CB3CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/04/2022 05:46, Jonathan Bakker wrote:
> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Before this patch, the order of memory resources requested by the driver
> was controller base as first and OneNAND chip base as second for
> S3C64xx/S5PC100 variant and the opposite for S5PC110/S5PV210 variant.
> 
> To make this more consistent, this patch swaps the order of resources
> for the latter and updates platform code accordingly. As a nice side
> effect there is a slight reduction in line count of probe function.
> 
> This will make the transition to DT-based probing much easier.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/mtd/nand/onenand/onenand_samsung.c | 48 ++++++++++------------
>  1 file changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
> index 924f5ddc9505..a3ef4add865a 100644
> --- a/drivers/mtd/nand/onenand/onenand_samsung.c
> +++ b/drivers/mtd/nand/onenand/onenand_samsung.c
> @@ -123,14 +123,13 @@ struct s3c_onenand {
>  	struct mtd_info	*mtd;
>  	struct platform_device	*pdev;
>  	enum soc_type	type;
> -	void __iomem	*base;
> -	void __iomem	*ahb_addr;
> +	void __iomem	*ctrl_base;
> +	void __iomem	*chip_base;
>  	int		bootram_command;
>  	void		*page_buf;
>  	void		*oob_buf;
>  	unsigned int	(*mem_addr)(int fba, int fpa, int fsa);
>  	unsigned int	(*cmd_map)(unsigned int type, unsigned int val);
> -	void __iomem	*dma_addr;
>  	unsigned long	phys_base;
>  	struct completion	complete;
>  };
> @@ -144,22 +143,22 @@ static struct s3c_onenand *onenand;
>  
>  static inline int s3c_read_reg(int offset)
>  {
> -	return readl(onenand->base + offset);
> +	return readl(onenand->ctrl_base + offset);
>  }
>  
>  static inline void s3c_write_reg(int value, int offset)
>  {
> -	writel(value, onenand->base + offset);
> +	writel(value, onenand->ctrl_base + offset);
>  }
>  
>  static inline int s3c_read_cmd(unsigned int cmd)
>  {
> -	return readl(onenand->ahb_addr + cmd);
> +	return readl(onenand->chip_base + cmd);
>  }
>  
>  static inline void s3c_write_cmd(int value, unsigned int cmd)
>  {
> -	writel(value, onenand->ahb_addr + cmd);
> +	writel(value, onenand->chip_base + cmd);
>  }
>  
>  #ifdef SAMSUNG_DEBUG
> @@ -517,7 +516,7 @@ static int (*s5pc110_dma_ops)(dma_addr_t dst, dma_addr_t src, size_t count, int
>  
>  static int s5pc110_dma_poll(dma_addr_t dst, dma_addr_t src, size_t count, int direction)
>  {
> -	void __iomem *base = onenand->dma_addr;
> +	void __iomem *base = onenand->ctrl_base;
>  	int status;
>  	unsigned long timeout;
>  
> @@ -561,7 +560,7 @@ static int s5pc110_dma_poll(dma_addr_t dst, dma_addr_t src, size_t count, int di
>  
>  static irqreturn_t s5pc110_onenand_irq(int irq, void *data)
>  {
> -	void __iomem *base = onenand->dma_addr;
> +	void __iomem *base = onenand->ctrl_base;

This is confusing a bit. Before dma_addr was IORESOURCE_MEM no. 1, now
it is no. 0, so it's reversed for S5P. However DTS is not updated, so
what's there? What does the DTS follow here?

Best regards,
Krzysztof
