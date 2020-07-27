Return-Path: <SRS0=MOmf=BG=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C85C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jul 2020 17:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16165206E7
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jul 2020 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595870126;
	bh=mGnXttj4gMZac+rdPDPDq/EFfZE6Qz4mT/dMyd6hWBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lOa3fJ3Ikpc1//tnrRcF+CPO0hoo8+e8Jf8CGae/3MA4p1BXbzvvUzf8ErgmxiEkM
	 v+IoWHMXEzaBym2XmWf98mYPwdt85C9aBpfYqHKUcDzj7Tlk22iirjvNd/4j2IiIW1
	 C0KPGbbvsrXnmTCg2Q0KeKHzXbMDTkMVr0dtVJhQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730372AbgG0RPZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Jul 2020 13:15:25 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33893 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgG0RPZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jul 2020 13:15:25 -0400
Received: by mail-ed1-f68.google.com with SMTP id a8so12709132edy.1;
        Mon, 27 Jul 2020 10:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BliIrD6HFnaqfqEV1t4dYfV86GNI6DLmsozTcMQdAAM=;
        b=QomRHUKgXSarRZPK5qGTbvg3MOnxSeqpLfoE8OHuKD+jWoMrDv6AxXxlqm7TI81+7G
         VNLNNZ5r0QpgLBOQ8m2k444Oqy0o89Tc6/nzKHTelfbthVvK9uk9X0X624YY5r+4RmG0
         LGJMvlgNOAJbEBSep0O1anLwX6PQ54gtJWtZ14IWyMT+2Ew/L60guKpx6gTOUgGdhM8r
         kgRvy2BujGmVLsZg/IorNY2QZ3vCP6FQ+X/lEK36BlzekEh9uDF6P5r7ExJ2HSIli/sU
         5VMUQDYm2IY2DyeZB3cYI76calb2uhJQlGGoNn7W2SLB8dfQTQB+9HDAben9eUy84VLq
         ctWg==
X-Gm-Message-State: AOAM531OuA0b50HAPqiA2OekzMJtG/02yKSeoRW1ZCq/Rq4QEFscclDf
        lkYbpbwhVO6g+znp9WiazRM=
X-Google-Smtp-Source: ABdhPJxDv7/MPyfHpAwtt1qENlH8+RzlpaeCY0brayFCsvyKhCZ9X7tA1jP3eFubjrttJw5W34ce/Q==
X-Received: by 2002:a05:6402:1ca8:: with SMTP id cz8mr21617340edb.55.1595870123499;
        Mon, 27 Jul 2020 10:15:23 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id sd15sm7320776ejb.66.2020.07.27.10.15.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 10:15:22 -0700 (PDT)
Date:   Mon, 27 Jul 2020 19:15:20 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, simon@lineageos.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: samsung: Document DT bindings for Midas
 sound subsystem
Message-ID: <20200727171520.GB3507@kozik-lap>
References: <CGME20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e@eucas1p1.samsung.com>
 <20200727163027.9242-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200727163027.9242-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jul 27, 2020 at 06:30:25PM +0200, Sylwester Nawrocki wrote:
> This patch adds documentation of DT biding for the Midas sound complex.
> Partially based on the *txt version by Simon Shields <simon@lineageos.org>.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v2:
>  - fix wrong *-gpios entries in the example,
>  - mark sound-dai properties as required.
> ---
>  .../bindings/sound/samsung,midas-audio.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> new file mode 100644
> index 0000000..fb685e51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,midas-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Midas audio complex with WM1811 codec
> +
> +maintainers:
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: samsung,midas-audio
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.
> +
> +  cpu:
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

I think it is just a phandle, not an array?

> +        description: phandle to the I2S controller
> +    required:
> +      - sound-dai
> +
> +  codec:
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

The same.

Best regards,
Krzysztof
