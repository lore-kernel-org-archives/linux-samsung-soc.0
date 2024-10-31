Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F819ADA2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730373530; cv=none; b=RXUHV0pscHCWunex9zZRQlgZ3C3pzIcwX/aWAFIBgALJp7VXP+rSdac6aXXcDLvuOEnqcMZrr66E3AlnN4BaIFfA5GeoOLSLp1lvNemGvKFQgEQDJJFSixFizbYnAzb5QDSlRmAPv1j8/QJ7JjXnqijVNJqe6FZr6yoERtjg4/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730373530; c=relaxed/simple;
	bh=P1m23rwMnx54MjRVtY546V3j5gxJtS/n0bt5NNfdIIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uG5coCtU4Z+/SOeRqlfzNLieANSWIAYKzju7WBro2XNc1usdMUM7QIRC3XzJqqEyakPLa8bBA2pHDxrGrKUmotiXaX3Jq+LEhnTSzx7PbjkkqZLPE3mHycaz+jxgoYsq3zYoXHP0p1dfYQ1iFrp7g0sJ/xC/xeD2Y894LWG/pBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uj8RLqMB; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj8RLqMB"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5e7ae4c504fso375168eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730373527; x=1730978327; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6tOVqDGIVkJ6VSlfAnQKasdgXF9e/3uyEUG7DpZuXhY=;
        b=Uj8RLqMBBtP4jTmovogATZJXH7b5FznTvEAuLO3kU03Pep561isNfkVkGWsp1oOqCQ
         RC+4rMettWCIp0zUjeGEun4UqyEp1TYgBRIbfhHRkisHnbtxBWbMgu0vzdU7syJI1L6I
         8EsfXgE8tmjK+IGKUhdrOhC6i0q/MaCJcCnxcD287E4gpCrs7/jSq1Bc+AU6Pl/8qDqB
         ZrQr9Dg7JGsfN7UjhrFIbvPPOv4FKTE5IaW1iOmgh+4Gldc6mLA/R4DERltqIvhkMCD+
         BIxhEr7QHnVZz72COQxW5e0bBtMVMidcTMwShm6mJWaxkZQgYLo9ADzbug5EamsezYNB
         p5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730373527; x=1730978327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tOVqDGIVkJ6VSlfAnQKasdgXF9e/3uyEUG7DpZuXhY=;
        b=eCHjktvJz7P21S9zB1P+vcQWyRrvoCawVDBoR1kf/fWUDLhxkyTFvDFNBoMSp249zT
         aF/kHRlI+TihaHhW6wNjszCpPzJMB/qKsOmLSdVGENyMsZ7E7mCsXVxagj90ijjLKdq0
         dTTv0JcWCLwMRvQmarkRUNtba7onYRPZHvv5JIRJhxYDlDvbKGpQFFCnXoVrO+8jsMEx
         0Zz9SPWxTBFqQKaRJHu/L9eUrDB297YlPJSHRw0Ap24zdYOZHcKc8I584A8FqBe4AlIn
         hrvb6+AKg9aPsUP4VsKxaGg+wYXF9vPC5FBIZ/0AyvtgRiDplqUi7krXdwwZlbczylXH
         VbHw==
X-Forwarded-Encrypted: i=1; AJvYcCV1kO5uw+ttmgyKVjeICyv2i93nEoqADLEgOGhXjmXTwWC/j/6rOM3OoLcpk8YxUSWr8Pc+rd8P/6ZvaRjeYEqR2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJBq0+VrTIJC/ZzgysZ5MosiRPAY511qNucEDbn0K1Ltir/QK
	qyyGisQNCpckbYqtZ42ly66+j2gFlNZbxrBSrEwG9/abNQeXYHC5XSiWNOOpsIOPFJWCcWEayro
	SmZq8MPtPE9i0WA/ltBRD6MwMT/aTpYfO1WKoXQ==
X-Google-Smtp-Source: AGHT+IFQY0jyd6E8l4ZVxaxh5x5SVk1SxFaa6tSUf7REkjjSQjNyJIZv7P8E7RYon6B3a5PLGcKeZNWF/nmdRTVbnGc=
X-Received: by 2002:a4a:a701:0:b0:5ec:5922:ddb with SMTP id
 006d021491bc7-5ec592219f4mr4806888eaf.2.1730373527001; Thu, 31 Oct 2024
 04:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-5-peter.griffin@linaro.org> <f5ac07e3-3fde-4ac8-8cfc-fb7918ffb2a7@linaro.org>
In-Reply-To: <f5ac07e3-3fde-4ac8-8cfc-fb7918ffb2a7@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 31 Oct 2024 11:18:36 +0000
Message-ID: <CADrjBPpYQQNdYya_95KXRYBrfSD91E-rfYcw6Q-ZNOgh5-4VJw@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] scsi: ufs: exynos: Add EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR
 check
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, avri.altman@wdc.com, bvanassche@acm.org, 
	krzk@kernel.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Wed, 30 Oct 2024 at 08:56, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 10/25/24 2:14 PM, Peter Griffin wrote:
> > The values calculated in exynos_ufs_specify_phy_time_attr() are only used
> > in exynos_ufs_config_phy_time_attr() and exynos_ufs_config_phy_cap_attr()
>
> all values set in exynos_ufs_specify_phy_time_attr() are used *only* in
> exynos_ufs_config_phy_time_attr(). Or did I miss something?

Yes you're right, I'll update the commit message.

>
> > if EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag is not set.
>
> yep, wonderful.
>
> >
> > Add a check for this flag to exynos_ufs_specify_phy_time_attr() and
> > return for platforms that don't set it.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/ufs/host/ufs-exynos.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> > index d685d3e93ea1..a1a2fdcb8a40 100644
> > --- a/drivers/ufs/host/ufs-exynos.c
> > +++ b/drivers/ufs/host/ufs-exynos.c
> > @@ -546,6 +546,9 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
> >       struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
> >       struct ufs_phy_time_cfg *t_cfg = &ufs->t_cfg;
> >
> > +     if (ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)
> > +             return;
> > +
> >       t_cfg->tx_linereset_p =
> >               exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_p_nsec);
> >       t_cfg->tx_linereset_n =
>
> tx_linereset_n, rx_hibern8_wait is set but not used anywhere. Can we
> remove it? Not related to this patch though.

Yes they can be removed if they are unused.

Peter
