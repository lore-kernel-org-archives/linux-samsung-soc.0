Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F414BFBC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Apr 2024 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712941650; cv=none; b=swHzKQWcDCVA7fppyUcyEVgUnD00PwhOvL6wrxeWHNeeltyKP1kbQ+DBMbqVXopPcz98gRdyJUCKNnApeu+DYAdXvz9xhF5NvmR9HGR7IaEFyGXLhRYOdamRFHHAmJwRju3MUBFSDvEbatuLslt9FAlzPMPvpu/CfweYgpgo4TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712941650; c=relaxed/simple;
	bh=5JFuYVePpmhoWdZk8WbeOoqlnSWSkoUYiXSyfRvyGWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ii7ELmMO6H5RwV8ZQYW66t8iJM0933uSE7mv1OQRG0gilmOzHuiFq3gljQalcCPSHmYbNR1YpLj1Fu8r6Pgz9RZIjF4ru0CJv5zq5WMugmb5hyrwPcsDNcN2AsCp/OVg8+0eYXGe9hQwHAMrYNMTQmv5mzahZ1lf77CM8VJ3dr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=TjDnn+YL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="TjDnn+YL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-434d85cdb05so5147741cf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Apr 2024 10:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712941648; x=1713546448; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ICZfIsGcQEVbd3Zt1qoYBnvko2GDh9Nz2dJVHbfGpSA=;
        b=TjDnn+YLc4Pkh/akCRL4/SqjYG7P8QtAKysCpTbW8BKrCh58n6xjndCzTQrFbHWqZe
         OVzj89ZGTc3+N2dTGLdSzwWPsZXQeznKMurGiBv4i/fgFNuMGFqSDVbmMObKeH7RRebc
         NrjYo16o6FCAlwz2HOgVJoJKnRZQm3OZ5CqtE2uHNqEG64NJEzIi3SL+c2iW77RoUIwO
         eKBkIUEv4B2BgQjStijlqQWZtcpbwpGDjMQeGwtQAO23uAcSsqnP6nYP0rPJbOuNkTvd
         EIUwBn4o6Pz5hN/8RGiAUOtkcgfE/hLtdet7qZ/Vy5309XMhHtt2bnWVQ54xb9bQvrAU
         PnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941648; x=1713546448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICZfIsGcQEVbd3Zt1qoYBnvko2GDh9Nz2dJVHbfGpSA=;
        b=TWVcsXeOl7WwaA+D30dlpTDpVjhf4KSh3zO1c8oYzwmMMKTa2+rcdhfxsXQHG0Ze6e
         LUZ3Ck2GYIbXWrR9OfBT2OnIkPBxDtf/PYxEgBUaa3R8dcQbwMD6wbVN1P/vA63bIwZu
         1IIBKKk6fhQGdsLk2xLcd78L3WCwbTvl5TXHd9452bhQwYAguBITdrV5kn0RwszsvgE9
         T++9Csn6uV7DT+GWvkG/g0KAaGjkERc9ySm2yiP+X3Bw8NrO16hRMnCNOimq7q9fdg8c
         Q6qtc1TY8XV9GZJF0StrZQb1Zi1iOHPmxIS0yAnqIHNROetKR4zR8sOISse0qD8Q6/gk
         Nxkw==
X-Forwarded-Encrypted: i=1; AJvYcCXywgVwFAKGmETiqYAtT86FeVqWPlUuzAtQMn/w565xR5J5GsmuWYg/odCY/DDB2fjXyAKNDdMzJvCqS4gvD+AZUV5PAOWF8iQ5toIW2/cCunU=
X-Gm-Message-State: AOJu0YyyfF5z01vy3UDEmkr0Gv4Bxg2vr4fhkQ0apmR6vX6/mJi2/agV
	AllPWRvkGLWaqNs19ajcVhsd5OUkzpzg2CVeTScqjlIZB6v9ZmGjMfIaKHAaOsFNCNXoOfBT/XY
	U5l+WDiz2NIIfLijvcyY6g8DsoDmcNyIJoFzUlg==
X-Google-Smtp-Source: AGHT+IEXzcV5Ah/di4pWjeRuzI8bp8L5qdlySBiHU1tn4/tN30fitecIDCoiEvXNx6whVxsKgO+qRvqVW4OxECf95F8=
X-Received: by 2002:a05:622a:606:b0:434:89af:bd3b with SMTP id
 z6-20020a05622a060600b0043489afbd3bmr3794375qta.40.1712941648259; Fri, 12 Apr
 2024 10:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com> <ZhkIhtTCWg6bgl1o@8bytes.org>
In-Reply-To: <ZhkIhtTCWg6bgl1o@8bytes.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 12 Apr 2024 13:06:52 -0400
Message-ID: <CA+CK2bCjXGTP7ie=rFtXrmRaWxn_6VmfZb5BXR13z9a3scfETg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] IOMMU memory observability
To: Joerg Roedel <joro@8bytes.org>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
	krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com, 
	bagasdotme@gmail.com, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"

> Some problems with this:
>
>   1. I get DKIM failures when downloading this patch-set with b4, can
>      you please send them via a mailserver with working DKIM?

I was in the process of migrating from google domains to a different
registrar, but I think now the issue is resolved. I will verify it.

>   2. They don't apply to v6.9-rc3. Please rebase to that version and
>      are-send.

I will.

Thanks,
Pasha
