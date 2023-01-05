Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E73C3DA7D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Jan 2023 18:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbjAESIl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Jan 2023 13:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235631AbjAESIH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2023 13:08:07 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DA654DA6
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Jan 2023 10:06:46 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id g20so17668132pfb.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jan 2023 10:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mc/7VUEGk3DXTVO68IbWilfesz8TNRLC/2uUgWIo0Cw=;
        b=knT2sBXM8+bseyvKS+AxxxUDHFN6rXGYXAs0bxnAmUGBXUxEwpfGvuTKnVAOESkp6q
         pAREYRJ15r1aRkMTWXU1RtT0HpDRvvfE15l1Ja39oe3aOa/L1YEN5pZVRVM8RBtpevd5
         oZQzH0PS1SZiIQUm6/NVHO6IqxabFqds1/opr6L5KHjgcJRdRk4CO3HZmORDlhF7OgKg
         aPYsEh0QcEIa1Cen7jvhaanxyZxKEyAYuhcWF3+F5YFLq5vvSXNrFdK2qG6lMffF8MLi
         I9r6Xml9yh/3Y/sXC3hz9n/BxxGC9mnYsZPiLrJDjlVcRdw6FkG9ogIXqvBoO9Ngx5WV
         zyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mc/7VUEGk3DXTVO68IbWilfesz8TNRLC/2uUgWIo0Cw=;
        b=zD6/ekPwwzUUFimOj7P69hDnTJfA8H5s62pXE8V87F9eerRK3CC7l/uUkV4dRCKQ1v
         RSE3zc/XT7KXazJeU0YNTpxhsVH6lF534xeHxfBkQ3+fuj4tC6knloNfDH7IUB8VkRbd
         2lvO+8pDrY2mfNHW/uqYUvvMcYmcQixyPnaKeKlSXBbvMLyX0CStKsSn86WkVDdiPoN/
         Bb0odyoZeRKaH61srhU3nyBi/kDEuzTz89yniMpCmkr5JI1gyRpjDbT95odXLJEEWrIB
         RdeS94jfjSZZZT+dT5hBImv1dPJ4rx6Ad9yKBdiPGYRcEw0P+udya10FK47jrqtqQhyP
         LjRw==
X-Gm-Message-State: AFqh2kpU1u6JonfCNpr7XMrIVGuh9npXRwTsoH30aRbeNCQRrA/3w+XG
        JDY78dEeKH++Be2Zmt6aUO5b/jUyVysvS+HprcKlg0HyxZ/3Fg==
X-Google-Smtp-Source: AMrXdXvo69j9YoPEoO2lldH79hHn+c58oW4FRh9Wp+zEyjV9ZZP+lufBeNlYfqep7QRkeVVzM/Ex1QTu1p1SvtAO16g=
X-Received: by 2002:a05:6a00:a1a:b0:580:8b92:ecff with SMTP id
 p26-20020a056a000a1a00b005808b92ecffmr3298706pfh.4.1672942006019; Thu, 05 Jan
 2023 10:06:46 -0800 (PST)
MIME-Version: 1.0
References: <20230104095702.2591122-1-yangyingliang@huawei.com>
In-Reply-To: <20230104095702.2591122-1-yangyingliang@huawei.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 5 Jan 2023 12:06:34 -0600
Message-ID: <CAPLW+4=eE=YXSSEMRPJ2g_FK68PO2h9By-FGZOtDG4jyFWLq2w@mail.gmail.com>
Subject: Re: [PATCH] iommu/exynos: fix error handling in exynos_iommu_init()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        m.szyprowski@samsung.com, jroedel@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 4 Jan 2023 at 03:38, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> If platform_driver_register() fails, it don't need unregister and call
> kmem_cache_free() to free the memory allocated before calling register.
>
> Fixes: bbc4d205d93f ("iommu/exynos: Fix driver initialization sequence")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/iommu/exynos-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index b0cde2211987..c1d579c24740 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -1446,7 +1446,7 @@ static int __init exynos_iommu_init(void)
>
>         return 0;
>  err_reg_driver:
> -       platform_driver_unregister(&exynos_sysmmu_driver);
> +       kmem_cache_free(lv2table_kmem_cache, zero_lv2_table);
>  err_zero_lv2:
>         kmem_cache_destroy(lv2table_kmem_cache);
>         return ret;
> --
> 2.25.1
>
