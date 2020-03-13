Return-Path: <SRS0=8CFD=46=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B98C10DCE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Mar 2020 08:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97C0B20724
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Mar 2020 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584088188;
	bh=nPkjhRlGn3/QFGlNtF8R0gwKJufqY0bmep/HG1GCvYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LIAzB/vx/NR4ITW9aYo8+TN8nOJctP1HncX+ARqzo4i4Q8BkDmv9zLfXRva8bwk+K
	 hKR/QP3kONfHTYHpxnnnGDdWsSXYP7WL+oa6Z/PlZxr51E4rFOBvN5T/Y7ehiZAzOF
	 JU2sPCKiNTsxMDmCGNrbbcd3q9Pav13HL3lnhARU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgCMI3p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Mar 2020 04:29:45 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38304 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgCMI3p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Mar 2020 04:29:45 -0400
Received: by mail-ed1-f67.google.com with SMTP id h5so10892560edn.5;
        Fri, 13 Mar 2020 01:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rn0gcyx6GxxQcRaqlCHT4v4uNwnWkXjytoiFfyP58zE=;
        b=sp9Ae66gud6Mpn8OubuXwObnsX3ioBavEWf98fOFJzSifsDvMMfTAEhRsfrIKCrB5S
         EvPJuVS/cfgrcRg6tyjyJDBkwynFjLJlfxfWaFMP4KW7Gb82F+YV/BEtYiTiFOKG0hyR
         l1bgOMP6w+TNdhnatXNFZAW/ZCzJGY1udpuMVHtKYMKcjacIEvOuOiTjwjNAdR/s0Ef4
         PD2ll/a9r7hKjvkV+7kPbTPygfkbTG2FV7hkc7hKd6S111wFZ6kjF6CJ5zOmPQ+cZr2x
         SpLQ1E6foAmF2NAYQAGiYt689kwqwsbLlZNYuW+HHtid/tHVeenxOHeoMjtC7BfXXgTX
         DXNw==
X-Gm-Message-State: ANhLgQ2a36GXWh7/Mr5Y+DGVYTSkM+j4y9P74qW91EHUVSt+rjFyRWyP
        q2kBnIb0YNH4v2yr5prR24Q=
X-Google-Smtp-Source: ADFU+vv4w/B2tIP4ZNexQetJ7DqtBBVkc+MfyuEZQrVPiWjDli5bZ4ZKT55RJiuDDBmhlGBoX8nTxA==
X-Received: by 2002:a17:906:b80f:: with SMTP id dv15mr10653207ejb.28.1584088180143;
        Fri, 13 Mar 2020 01:29:40 -0700 (PDT)
Received: from pi3 ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id n10sm442215edf.3.2020.03.13.01.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 01:29:39 -0700 (PDT)
Date:   Fri, 13 Mar 2020 09:29:37 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stenkin Evgeniy <stenkinevgeniy@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm/samsung: Add compatible string for
 the Galaxy S2
Message-ID: <20200313082937.GA7416@pi3>
References: <20200312153411.13535-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200312153411.13535-1-paul@crapouillou.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 12, 2020 at 04:34:10PM +0100, Paul Cercueil wrote:
> Add compatible string for the Samsung Galaxy S2 (i9100 version), which
> is an Exynos 4210 based device.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 63acd57c4799..e2b19caac795 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -55,6 +55,7 @@ properties:
>                - samsung,smdkv310                # Samsung SMDKV310 eval
>                - samsung,trats                   # Samsung Tizen Reference
>                - samsung,universal_c210          # Samsung C210
> +              - samsung,i9100                   # Samsung Galaxy S2

Put it in alphabetical order please so with this change:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

(Optionally I can take it through samsung-soc tree)

Best regards,
Krzysztof
