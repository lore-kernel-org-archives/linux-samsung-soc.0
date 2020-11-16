Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9643C63699
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F5722265
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731834AbgKPQRk convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:17:40 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35001 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731748AbgKPQRj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 11:17:39 -0500
Received: by mail-wm1-f67.google.com with SMTP id w24so24123564wmi.0;
        Mon, 16 Nov 2020 08:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=syCUWm5hqByqHX8vlUGfO+wYcc7hKrFWVqtwY3F2bGI=;
        b=eD2vE4i+gIaoOV2H0MZOcYl3vS2zo23RRQTMVP+bwOAMr5jM7/k2qW0bzLsgzggZ1N
         23BI+lUxCXv8y/ooPXPQLiy1/+ApBfWNgpZ5UZfum5UcuH2eRQj/AB0ynqntZo5+lZVR
         IQvRfwUmI8O9euH/yWKxhjm6xffVUn5y3nmh3GMMJge/hOIx9LT7o53uKlXaQExx+h+V
         BjVwnodvgy3Jzgptfgt1c/s7jsInURrqdSXMbehgDGkQCYy2Y02behN54O2Bp0eZy8i6
         VlOvLoXI6ioloVSa+BzwiJZNTFxlJZMsqgbX3bElHcrpvv1vufNu8LerBtbiPvUVUic2
         qqtg==
X-Gm-Message-State: AOAM530Akq+OnmAApAzWxD4oig1hhcvbg/bMFkeD/1JVwE9P+zjAKCFb
        GwEvXDa4V06VZ8qLI9G15EY=
X-Google-Smtp-Source: ABdhPJxVMW7nF8KL+GjRnblALmNmM2kOkXBaiFuXWcqSZF0+DJHfpgGpWjSXlIm8gL80m2+8ek51PA==
X-Received: by 2002:a1c:8145:: with SMTP id c66mr8151880wmd.71.1605543457222;
        Mon, 16 Nov 2020 08:17:37 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id a18sm19623057wmm.22.2020.11.16.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 08:17:36 -0800 (PST)
Date:   Mon, 16 Nov 2020 17:17:34 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: samsung: document bindings for
 p4note family boards
Message-ID: <20201116161734.GC25108@kozik-lap>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
 <20201113212525.13455-2-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201113212525.13455-2-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 13, 2020 at 10:25:22PM +0100, Martin Jücker wrote:
> Document the GT-N8010/GT-N8013 device binding and the p4note common
> binding that it is based on.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml   | 8 ++++++++
>  1 file changed, 8 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

