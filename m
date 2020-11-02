Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BF3C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 18:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D031520874
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 18:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604342849;
	bh=Cw71lcyt5LCRO/VcNQPg4FLj8OfjtAuZ2+KjTjzra7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jfmoa733Hb8Bg8vhEuZvDzKSBLwlwwpOFSGJ+vG7qYwesO6PXL1ixtYwJbVr9mMH6
	 zAI780qGAnTkdeuHg0K4UiIeEti4MQoxZ+D0clURuT8BNs88g1zSUaiAQTM2OyhzB5
	 HE5RCvdE8cSgqPmge3fG5yeNl2XvXxpEV4EFXO6Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgKBSr3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 13:47:29 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:39664 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgKBSr3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 13:47:29 -0500
Received: by mail-wr1-f52.google.com with SMTP id y12so15813580wrp.6;
        Mon, 02 Nov 2020 10:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dg9EShpcKxlJPUbHT3kMYzrq5qz/PbL6jzwabolFfdE=;
        b=Q/CL0Bna3yDS4ec/bnOLBVuysYvFtYmZZ6KIdJKr0+FyPSEnUMRcJcfvJujm6KHUHI
         8Uighjhj5WHpR6Tfvno6+ACkAkBq161GqXHn8GeNADxn17AMqJu65iMkhuZ54lwzDvw0
         Z+GX5a2A1C5S0Yv7anaNjeL33e1eMF3DHofbkR6FDZiM/KNSOiJOXRcSvZePFh1RSwNP
         PkojqDO93PJYnm3cxQxaMy5TnLY/Yc3hbPUTkvM6SDl1NjWtG9TSOAnRoVxVJJbyJI3J
         FvYkZ++w+mRhvZELUNNC8ggejMUkZkhAkclFyo3tQtqAJJ1kGHjCZFnmqRQootahhnTN
         cRCg==
X-Gm-Message-State: AOAM532BPkEgqrovYcfvzbD19UjVhqmIB4CgF73SjhghvEqL1BzHy/0D
        vGFYJCrH4u9KN/z8LB2IDFI=
X-Google-Smtp-Source: ABdhPJx5OKI4gIWQavh/Pw9YDmD4VTnBOTxroFyG0YjMx+yynudJQufTDn1TfqH6w2QLdcroPqiNuA==
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr21286309wrw.120.1604342847708;
        Mon, 02 Nov 2020 10:47:27 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y206sm362603wmd.34.2020.11.02.10.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 10:47:26 -0800 (PST)
Date:   Mon, 2 Nov 2020 19:47:24 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     trix@redhat.com
Cc:     kgene@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: samsung: remove unneeded semicolon
Message-ID: <20201102184724.GA13405@kozik-lap>
References: <20201101152844.2290728-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201101152844.2290728-1-trix@redhat.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Nov 01, 2020 at 07:28:44AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A semicolon is not needed after a switch statement.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/soc/samsung/exynos5422-asv.c | 2 +-

Thanks, applied.

Best regards,
Krzysztof

