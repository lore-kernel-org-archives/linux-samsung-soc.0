Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5386C6369E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:23:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4AC5221F8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:23:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730970AbgKPQXg convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:23:36 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36409 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730325AbgKPQXf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 11:23:35 -0500
Received: by mail-wr1-f65.google.com with SMTP id j7so19321201wrp.3;
        Mon, 16 Nov 2020 08:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=h3BshH6L7XJvuyddIjRDiozXSmAQKzYMX8zoCseqeGo=;
        b=YVugy/D9EPX30Ch6n87hog2sJQbbfyZtU+vvrE0SSAdKH13o5qn93OT+fmjyac5SJo
         Uh612M4tM/Oo5TNFHfW9555aZwsJgBQn7M8oOZNV+A7jKrfMgD7ftUMcp8NUtFC9fdQb
         qAG7SXbzIJT9GmwbecAk26g5t3AfeAznw6DKtxW2eT4DbHLEpZ1nW/wwUuM5PpAzGnPO
         GurVcCo+PRxYJRrKfdNKCvZTF4aegIZeD9+kE1/6D2SGrVYP4gQlzySvganlZKPEcHbL
         7u6To6yr5sY8YKYOj3mNebJOiRihKVioUMiZsIrt5gTJpnDla9pft1N40ybnjiDvQYKk
         IKYg==
X-Gm-Message-State: AOAM531X44vLSTKg7ZPdGI2bNZn31viQZtvVFuvkqNsz5VLPwUBgKIXb
        rOo5XzwEjop/WuAp0GQdUUs=
X-Google-Smtp-Source: ABdhPJyOj23uwKYVSUyUx/u41DLbOO8iFTFFS3pRb6DqfCxoB/eJibsrdgaxUSucEwUAbyQ+6JRp6A==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr14912287wrq.256.1605543814177;
        Mon, 16 Nov 2020 08:23:34 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q7sm25892676wrg.95.2020.11.16.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 08:23:33 -0800 (PST)
Date:   Mon, 16 Nov 2020 17:23:31 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] ARM: defconfig: compile Atmel MXT touchscreeen as
 module
Message-ID: <20201116162331.GF25108@kozik-lap>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
 <20201113212525.13455-5-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201113212525.13455-5-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 13, 2020 at 10:25:25PM +0100, Martin Jücker wrote:
> The Atmel MXT touchscreen can load firmware and settings from the
> /lib/firmware directory, it makes sense to have it as a module to have
> more control over the loading process.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof

