Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E379747DD5C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808161; cv=pass; b=Rlf7LB9P3Y4HV8+5lAJ12GT41TmUNbaF8mZis31g703MDEv+V0kd8VMAQ0YqI3+57lILnLhnz8kzJLGYqLceCVu+mgKPpRJUgkPpqyS7BQKTJgyB6h5YhppGv9rMZUb+um1ovJU86pGJbR9+QOzxFUY39FW+661entNgUtAAS/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808161; c=relaxed/simple;
	bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1mP9Cn+PMzrCcQexBTPc0IL8/bpOohpNsqCfTiodC/HyqTikKFN2ejFurtu/u4UcFsOFtu4ClNeC/eAxEPVltIcrf7bBDAqTgFGQnFExO14OIXtXng9MyWyLAPa00hzUjxnhaNCD/a2jrRbv310S3ZIOnicq+PxKi3JENt4gX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v+AyHx9W; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+AyHx9W"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso933275a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 05:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784808146; cv=none;
        d=google.com; s=arc-20260327;
        b=Y5oCA60xXlc0WMslMCe+blD9li2lDkNlK8uBY644EuC7ItvdJei3iXK0cHgv3z0pC4
         DHoj6lhIPjBArvUFad4SdkT2m1jfs8p5n6OSSyvpqp4wJ/Mw9Tcw5Bp/CrFaXoPrNo0E
         PnCGToG6beQ7EcD4xv0nVwwgnja4MSh0T11qv3X5KoeAVdAyY8f/kFO4Oauw9n6Xh5mz
         DRByIL1PMZ9CNPAot09HiIGUdn8DHcpt8uKjH/GWehvdTElxRyi3QIXBDFtNnaFc7qVs
         D1zlLvdLlFqfaJBzWO6E5aG0E2/V1QyWU+SvZHW01AON48lQhaPAzhFtUTYvufXekK5Z
         Bsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        fh=rlFf+O9Ymn6i9JStU810F8H9cKfDGGpqMkZSQth3fSE=;
        b=Hz7raLbbHQ8Fa0IruuuPXKpD10qX8cklypIFdr1uRPvLAz2UlwWE+yC/6EKIinQqBh
         EKL2Pc9N96605MMVr5YJBWpq32tBXmEKdfBIHMWjW5vWIzE2W3IleEmsehaRKHoyc4Qa
         bn5ccWkJH4vxX9e0iTYL4ooGSFVgWbgMUMfbwrQZmUBrkT5EMk8Mm1D88Wm+gtzSC5cu
         FPmuYDdguv8DeD5zCfrjKXbHiw1guTb9mwLNc7Fhn/GgKKVS2bNd5PP9ejTuOnpCGhvC
         68Zgu6ztFJk10HWvrmDbL8IkmHKAQHAmvNeTJDb9vR7TXCQ9e2WKh4TjqnHe7IHR0r15
         Ehvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784808146; x=1785412946; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        b=v+AyHx9WSDmiTYs5ZMYZcSIOJhG9HHngHhft25qdCmJnS9LNVI39tdQOJQreSXqB1j
         5VGsuYMRGQTWCpVhiZyw64xcOcxFgkHo5p/RYVVYU3c8hgOjnBigCiWuz2cqSg1KHc4Q
         SmPrVi8Mwnmq9/o07WPSWVLZpfrAItCjFodr9vtCc8CTECGumd1L2wU459np45EEUadk
         2go9EF73CGn/GV3V64TcnAsSn2c4MbnHx8OLTtRp/pcwmZcNpXCBqRk8PL3XN2kSLr+m
         7rDdE+YsioHMWh0JwvS3rwK0DHxdyYSkmmhVRC8jGO/TZ+MeQS0N0+W0s0TsxTLKplmt
         OqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808146; x=1785412946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        b=RuHq3mTMjclXsuY3hGuD9kV7E71OtX9GdlnHyVp9glNy+WXLRASQ67PrcgRGdlL7S8
         GFDUdMFITUFMqoPZqqfzCj1Rbuj4MhYTmBGcnVyG/tx1dtx4aouA467VERA8akclcZe3
         sGZ4O+DRKlOk/Po0d1e9IbKoUzc6uwjvBEho2gzQ1GDWBZ2fOwxg/L6SK3efYS4Uy4qJ
         D9j77sIHday3FlOx+rHg6OkIzE5XoCjQngt1OCK3nnYtd1xkO6S8dKmJT1rqH69/7f54
         JoUULmdzjjb9ukUGTi3QnAz1lRZruZ+A1G5gyQQ5WVdzNScAti5Vno5MLqecjDmsJgM6
         bAgg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8yiL9iB0dd6PCywOA7FiuQ6SmfjUOmEJvrdVIxhrI26rRNGcv+6U9cDwxOkUWu7+U323DyuLB/jZ5ICbB4M8bvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1IHP23IPe/epKjI4YyAJD7z792+UnOYMTBApreiyMRCKb2I5
	OEkSuJP3x+OVAs3q1vgk/S3ECoq8CYlrAcNvyyjszNX7c522FX2bDBhh2q0kwjqc95voLoyuRIM
	Q+yCCfZkLLPv19IpPiS7+fMTyggv40g094ESfSFq2OA==
X-Gm-Gg: AR+sD12Va2tWWRUQqYkN0ViX8U2Ke/Picrg4fWb5IFW92n3fZY8Nm1wnVcAg52P7NlC
	iDxbwSWPYsgVlFnszKvmLxwVwtdOrQtNQpqWQzUoPNupobuOjeQVY4tWx3yfuvn12AqXWRKmgNx
	uE6WIppwQimDXtcG7dBCH0kYan+U89XiveZlKvhkUAkPLuHxrkeFDSNIYk0dUvir6PrDGZWUkhL
	JKhDa/NqnRNtBOMlhzpwCqYZ7wVYDUlohw9yUYiGMwVo30+uUeOh/F2gRbRqIJNAPOEXAU09Um8
	VtPCSq8o7ykbFbO+f9ok
X-Received: by 2002:a05:6402:3241:b0:698:a9de:16e4 with SMTP id
 4fb4d7f45d1cf-69f6bf1f611mr861984a12.20.1784808146288; Thu, 23 Jul 2026
 05:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro> <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
In-Reply-To: <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 23 Jul 2026 13:02:13 +0100
X-Gm-Features: AUfX_mx4AjbYjM6fZT-ntJeRozz1HqK4uJ3kqrvaInoQuZ9gHqexg1gg38S2Mz0
Message-ID: <CADrjBPqSc8kuC7AUg34CKrVSbRWjO7i90Bff0b0P7nOc+m=PCQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
To: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 21:44, Alexandru Chimac <alex@chimac.ro> wrote:
>
> Add bindings for SYSREG nodes (required for ACG), compatible with the
> standard syscon driver.
>
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
