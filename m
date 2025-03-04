Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A371FECCE
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086621; cv=none; b=GfxavJoDmvqPQ2CfV2Bw0K1ge9XeM5+M48cOtls3WVk8C5OBKUVDmM7TDBa+BmrmySTXAYG0bWVbq/uJoCQSiThC/iytOsxhf+XUow8DtQL7WKqrW0Qt/RpH6I5LLO40lzTRviVO4OJkVY0/WykXBl2G8I9WwBickofcws0U8iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086621; c=relaxed/simple;
	bh=orq1R91M8c7dbpXtuEOgzh42cNSPrB9DSV2M6evhgEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIs3QwXxhJCrlNldwZoS1QaLqyECXS/EkUnyxhMsMXKdgUpHjjaI51K/hvR+73hhrDtJqLMyTIaVloW02T/MOMFWfYjvfp+QArZHLe86oA+omXTkF3sC1ic3qJpizUP4fVVlmw6suqKWZ7hg/8VU9uvufqw1CeT43T2kuKXtYM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uu6G7HoH; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uu6G7HoH"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5fcd665af4eso1349363eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 03:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741086617; x=1741691417; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQbFhcoDrZBPCIQTDm/+1b8V56ThPOVb0NP4CFpNh3Q=;
        b=uu6G7HoHasu8+ttQ9ueKU8i7O5rmNcpOYtwegexQ3L64JgPnqq9YXgC8cgsz8+7XyN
         y3WfH3fX6SsQ/C9OhgLpINNvNNypB1ALO6K8lMyDAvXrcMCiArDJ9OCHZV95GQlNdbNV
         MxPfHKNVWxPmkoNDvZ/jDXPCUIGVbwZ5XfR4buQUu6HasdRFYOQgiCej68SaRYjLThly
         5FOQtyqxOkyWTmCc2Y685E2NccJ+QzdgrHGQcRdg8qnaQQVQ2lz06MtfybjwRePnVxwV
         xp1CRzY3j3WypR/vNzyJPWxOjJAu+RoGFpJKCK6Csj9lnBld4FJiC8oDi5Ep7SR6re5o
         ZxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741086617; x=1741691417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQbFhcoDrZBPCIQTDm/+1b8V56ThPOVb0NP4CFpNh3Q=;
        b=VMYRbTzBvFLdFzmBqBrMe5mTDSCUJreSiXrNFf1jhE1IzjQ29mqia2NW/ZGqDBWI6F
         qp7V8xR0ZpdhT9yYO0jwBmkaI6UpSJa14t7OFGMLBRa0djFCuOzXOhnhEENNNkTN2GvI
         7urhuOR7/csF0S616E3hKoVew0tSZmshAFAuaXKMzzvGApqv6A+GYf6utmLh0Tpn95fE
         RiEnSRUHvz8QBsygXQsaa7IZAQKzddraZKlUMuRiA68HVXsDb1TxIwlHROhdy8yayMCc
         5D1knWofXdOInzGVU2odcrQ4IXCi0oMKc1uvTnHYsYZ/TvP05IEBptgbL0gm3sDlqk9w
         ot0w==
X-Forwarded-Encrypted: i=1; AJvYcCXmzzMr8h2ICkjHVTUPgRMlP9YX/LMUdx95mBc9s7Y4lfIPbyji4/CgHml5/giDO53NgqiZh4NnppsC3P+MMULfHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDg+Rp1Ap0Zr5XSG+qEvcWA5vXGY+Og05hjGaJKsBf2uRABU6B
	zKqKyxc7cg7wBwntq/ITMpst6HHj/FfZBSEz9zCz2hpYR1SdYl4alx7YjYaYjD+lEnilXg5Im5K
	LpNOHrXts+dqf75ACvCwla2eDXuX2HI39hH4Psw==
X-Gm-Gg: ASbGncvtBJTSkNftRhzJzjGcfOb5F64Gp+3RNsRnpIrJsJ2LkwX6dAgcuFDjeTvEFB3
	yym4PDJMMgEokPABefTxkjNw1DLJE8GyFUFSLBVPBIIYQL+zKejLMv7yPAXX25kNrdALtXRxZfl
	85iY38NF224diN0ZGpwTi9OBjfRqo=
X-Google-Smtp-Source: AGHT+IEINRiNLM5nuBLFCz1du/UfXjBpJa2EipBY+f1wkfnUA0YwZBo+sl10akF+u4qE0h1ovmH6xsuQeboW1BoOyFs=
X-Received: by 2002:a05:6820:260d:b0:5fd:c5f:3937 with SMTP id
 006d021491bc7-5feb34b8657mr9224249eaf.1.1741086617654; Tue, 04 Mar 2025
 03:10:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-6-peter.griffin@linaro.org> <51ec6f40-c62a-418b-a538-082e3ad887cb@acm.org>
In-Reply-To: <51ec6f40-c62a-418b-a538-082e3ad887cb@acm.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Mar 2025 11:10:06 +0000
X-Gm-Features: AQ5f1Jqwsn9oJaTqNHIYgxQUuylO7zocGAli9flyfTI1wTMKlEft2huZY8mFVSM
Message-ID: <CADrjBPqw-kt+4fLfJCziAJrtcV4gVM9Gubtq=7Xb8sgxq-i8uQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] scsi: ufs: exynos: Move phy calls to .exit() callback
To: Bart Van Assche <bvanassche@acm.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, krzk@kernel.org, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, ebiggers@kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Bart,

Thanks for your review feedback!

On Fri, 28 Feb 2025 at 19:20, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/26/25 2:04 PM, Peter Griffin wrote:
> > +static void exynos_ufs_exit(struct ufs_hba *hba)
> > +{
> > +     struct exynos_ufs *ufs = ufshcd_get_variant(hba);
> > +
> > +     phy_power_off(ufs->phy);
> > +     phy_exit(ufs->phy);
> > +}
> > +
> > +
>
> For future patches, please follow the convention that is used elsewhere
> in the kernel and separate functions with a single blank line instead of
> two.

That was an oversight on my part, will fix.

Thanks,

Peter
