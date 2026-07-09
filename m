Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D98287E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603784; cv=pass; b=QVvFpJJZPKqDcWI38jh9JmHU4pAkH5MuVQAucqDq/apiBUj27FMEUm+F4lfVjCAySI7/+4ye6iLswQKAu5xFGVfmhH/jJaJPiru0BlDMkF2cwYXZZi/ELjbYocFc3ztDcf8PmW4DfwGIPs3z6YqRbEmxourH7+6es1e8DkRKQH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603784; c=relaxed/simple;
	bh=p+tyeRHdcrJH/grqiasUdaqVBUFH1iUrR+0FMBQ5STw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ph/VWh+zZViLYHTSBzuiFiT+QLW/1mdQewip7pvyG1x0WvB8iTptYT2a4DGJCZXkKCya81LOT9ViEgZv8vy9PlKPK2hnsNxaWgtXdccw4uB9hZG1reePw+7iCRYE1FNlD7tOlTf+rKZXI6vUaBSAitxicMIKUau5HzGm2BLTzSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oK3giOff; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oK3giOff"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bd8efccd11so745088e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 06:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783603782; cv=none;
        d=google.com; s=arc-20260327;
        b=UsbXBDXo1+0iR46IHKgkn3BoqAQFHPURFGdzOSVJkw664Jfz5UvS3YtCtCWJN2/ply
         ueZ9lE953zQkXzGzBkpwJ32BuOb5YjrW/mCkFqZgbpeSgRmt5WCe380S8hlp/7Ve/4uf
         KW4N4P6Sw5x9q4d+yDPyYS4Dkbn0dFlPZuFaLLFgkW7EjKA+cK3uGNLEhiNWo3uL+iQd
         JRFUpqmdl4Pdxs0Zt0z9PPhWaDTbw56IMtzlni4Qf5tB549Mw1nsZC/Slr1FgPBJ/qnq
         64Ter2WU05JrJ64ou3PlbhgAtj49Ax2KSQAK5tHfwDhqk7gOklSsm0/6PkX5x9xnhsxm
         SsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        fh=ZqQuyeWjnh9to2zEhiX7I9DTX8td2NbKeEXgLeJfTsc=;
        b=K4fntEgOBMyzhsk81WwLoMGTRMPeUrF0PXcnphTPMc+UwateJCfMediYpuMgTwgARK
         kWw8rLyuMFNA1J4yjhN51bCj3Yj9ylEgK6GZSjXFDyIAhI5bHvis+ACEk51wrmZRPnTp
         wi6FNZhfYFR7GKQUYtB+vF8hqkj5FLP05R6gMzdRNj0sLQJinMlQWAU27Z/bjU/kgajU
         xVp5KIgPCO5IEVmOHU3d6+6N3Nq4sZoVn/HEYNTpwV/a78KryoxQwY5TczpS+Nz9J4Vn
         lo5bveMByCRf/dUybs/aXY29BzLeh40gYN5sPxkWKirLEuWsF3jGUTx9kEExT+84lNvK
         2cOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783603782; x=1784208582; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        b=oK3giOffX9tDTzr/3HkPrZ5xxahYKlNMmtUU4VGBUpXGyFtg6tnERotrSGsw24UvZo
         OwV/eOg6R4kz/W9DlnBaK+KMGkihWTtQ5GGvdwbiUMMhVthMU5zThXRXOX8Vd+rjOvm2
         WzNK1C2l9SQo0yZnlEmwpVK98QTgvJFphSMS68UsSoltT8AguzMrh+ZUZUamHIzp8njR
         y6UuGFR1EMhZmeaKvwk0OHNGPniZgVPNEO4BFpEAOner4Y+Wr2+RI6rPSYhgVyhDgeO5
         7CAYJIANqYsrgL3F6lM1VIJm8DaVtv391bScrSo0MPMz6TOYjqOFuJnoB+i1zl5EErzz
         yS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603782; x=1784208582;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        b=LoVa0dDOv5AM34wsbrOi/yNALesehpeu+A8tfps9F3cxSfcjs+uCvhK9uST0StNCsv
         6Qy25JDaclwNIMQvEMpgaM2Gs/kczr7rk40qYbhXcjOdFBm+N9IbdXHezzl5pyoKz3cy
         BuWfsLWHIagkRjDZPnzRLDlglgtg7vIzUCxq4zFF5j1HzpA8mN+yqriGIgGTnRQw4+3Z
         KZY1F8FdJAvfeJKhQk6ld3hkvcDBd93QWx36/1Tnx4q6xx4hKXTHkN3SSZwa+OrsAqMM
         pJMR+z/HEXCZPcAtj8F9LTuZJYQ6UNKtb6pP4U4VLVB4pSCLz8mLPdGSBS26GL/WblvN
         F2vw==
X-Forwarded-Encrypted: i=1; AHgh+RpKptA6/d9cDlQiLIMCySWGru7N1q/kvb/ElRyQVLSsyhVqUpqam1y+3Y3H52DtuhSI3UwmlUpbFELBct4a0Ff2WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrNv20r4ui0O81efEZLjx0EAndQgJX9YvGMTShMHbSXEp1Y9I
	z7rgQkOW17VUt+6ticHKzfZzXu9aL6q5TLAeRam2K1iKlGyJ/FM8K6OswiPAy/pM0rnwP29sJCt
	ziv/skF6LnEXuDUey/B9bOh8VyEx0o+t3wNkrYGmCIg==
X-Gm-Gg: AfdE7cnHRj7xa+otUsocY4dH94EJYvyPZH3Kop/eB64FKDA+WhjDIuS7JnS4R8Vbg23
	hUWdazFvIhdJLaJls3Ry1+aNmv49cKrp3zQrOj7fdhnDdkjRCbqbdNjQ5cUDt1llEohfThlKr7g
	2ybwwmsLnyDRTsED4GDqqT2/Prhh9MNaKhTyEaiMZpa2kT+itKlDsYxRHwnF+MG998YeIFY7TBS
	0Dbz3QifygL2BLMndE7vfGm5z62uAO6dUbN121TRDqQeLFDs4E8rDAQh3WmBO9Vk6zZnu7Jegdr
	MxEh50HI1rtKDKFk0T23VJotigIrZMA=
X-Received: by 2002:a05:6122:134f:b0:5bf:889f:e7da with SMTP id
 71dfb90a1353d-5bf8b2c347fmr1647495e0c.2.1783603781466; Thu, 09 Jul 2026
 06:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165418epcas5p1186eea5f8dc54d16a88b8298f6cfcf61@epcas5p1.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-5-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-5-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:29:26 +0100
X-Gm-Features: AUfX_mxliiRsSAvZCzqebmWMkvyd5ICueczJtcvNgbCxgBSP3Az_wOh3qvEDkwA
Message-ID: <CADrjBPoqcUs7YQtQMMRuagQMQGfLA7OE9M+Fe24DFJQusx0bGQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: pinctrl: samsung: Add
 exynos8855-wakeup-eint compatible
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add a dedicated compatible for the exynos8855-wakeup-eint node, which
> is compatible with Exynos7 implementation.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> index 2b88f25e80a6..802911e23aff 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> @@ -41,6 +41,7 @@ properties:
>                - samsung,exynos7870-wakeup-eint
>                - samsung,exynos7885-wakeup-eint
>                - samsung,exynos850-wakeup-eint
> +              - samsung,exynos8855-wakeup-eint
>                - samsung,exynos8890-wakeup-eint
>                - samsung,exynos8895-wakeup-eint
>            - const: samsung,exynos7-wakeup-eint
> --
> 2.34.1
>
