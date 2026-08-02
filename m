Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD9A2EC09B
	for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Aug 2026 05:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785649665; cv=pass; b=cl+dr62mjpOWeAIffGwuAocIWJKuBczT7Jp57E5fOsO5T1t8D++UW+peZoYFu327o6TvyLBmBDqAn9A9pPxuD5GP/U72Mzlrzr3FB864DNM5EfC06czQWWCCwBDz7+DvOnP7vU4qaRRSghKgeiN8SOUtE+rdpfbY06jOw6l/XYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785649665; c=relaxed/simple;
	bh=A3EKmqxDfDj9NzHYNFgi5ziJ7Vts/80fa0UITXIfN2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWB7pBfiT8jvgv5qYmlisFK0T/RHmQlG5Qqoq+s0/riI7R+DoG+HpgIF475uc+y/T7QFDMnvYCmmYiegyphxyC7IcW2Cz4Y9pBduES3uFPa13/S+f77Xyn5h80m/9SQUGuUBMWbHRFJWoiHRCKb9tH6dCTAwkdojommsW2UBnCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuMsNX+w; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuMsNX+w"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso884931e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 22:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785649663; cv=none;
        d=google.com; s=arc-20260327;
        b=lJaV+MylAEDISUK/g+bkODCJSmU6FHIu40SRCthhsYaC5ecwP8K6efUFH7RC2PbwWh
         3jcZcQIiX73uqwKdqx26BFX3IChwprZ/fE1e30NWX8wqnRdPvA7I2Gn2hrrLfrXki3q5
         A5hs//yQnbUE1pJ++A+wybeVxwiVLzuVvaIqylPD36iVc349qHppcwytD7nCXRz63Qwx
         Q1tz+c+jR+pFrAEd0oQPY4IsXm9PKhvFjoRA1PWQF8cMRxadwRYg+6mhQ2s5/HEAhE5U
         1cU/56GPECRx9lumUin5ub9g78epT0Y3POwJcnMTnoTz9L3MkvtFdZxyEEU8i5XBx7ij
         XlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pzUc3cu7eYXLZesTw+qzStppD+6/bSKMRwSOeVVbqx4=;
        fh=E9Ge8NmM1j88JilT2XgaA7szs2EwCQgfmka2p6HswH0=;
        b=sJJZjer79o1zm7ZJdX858Xt0CU0MZIqZJh/6Y+NQurPJolIwE0KrvmZW1wsV3NbTeo
         VGzQIcmT0K0xbm5gY9yu8weYa5fuT43rwuI3r4P3pirKU1GHKWJMQL3ojFnUWJk0HRT3
         eKsJL/9NqIHgX2EB8TBEdov3rSQHzZDIHI+NaaRq/s+M8bd77EFSK7+W+q4cn8NfuovH
         UGXIGQobF9wTKiN2xGF4BXxNFhDOGtGEpxUgWA3GOzeWLcjal9o4AKSjXHNNGHmfwg02
         8QYqEaEA/LC+QYyfiU+jpxplst7uU/zhFkoi9ipqoXvckq5MZm4ekAsZTfvQrnnzWvTg
         OCAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785649663; x=1786254463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pzUc3cu7eYXLZesTw+qzStppD+6/bSKMRwSOeVVbqx4=;
        b=OuMsNX+w0tZoiodpb7uQYn7mnZeYfa2Kqetutnj6ALM7h6XJ35PpkJBYNAtnWLVDFR
         ns7fr3TslQ9U2OHVEaJ3Jjj8tQPOMIqwC3Zo3UWscd70VDAznLfee3XjAscXNPzUZX53
         GrO9T+QExrO4WYJCtxGm22m/sS8pxsbm/hs2mRZbHUuMj8jbzYQGJbqAplvXFeb2oi1r
         ipaaPlWLSeac2n5NGSli0TxWkne75PqZg/ddHhZOMkz8acBzwbkjG0wTmUQ91rVl50Cu
         YSMJgrpirLFKChiZUlysLu3SLkPfHV6KbBpzuLw4RAGZiokDvm8K7AFsO/ibEfVMr2X0
         vh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785649663; x=1786254463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzUc3cu7eYXLZesTw+qzStppD+6/bSKMRwSOeVVbqx4=;
        b=O3RuCIUTfZ6figeJpUyDFbHN0ZN/h8w1ZOwhbysOy9DtrI2CZARvbbHa97A5AsCkgO
         Pzz49wRarwz1kmRHRgVMALqSY++8/AD2xBSqyDZd5ctipZu9s7BdBaerGsaurCWGu7KL
         b25FzjHyoqe8UeJ/V5N5ddDrDHP2A8Rcg5We5CYv22ua8f9HFVyXxHN7t5YOgVxbxWE7
         alTH5Im/8nldcdFDWtZ2/nemZegJOY2+o3+lkFYJU+HmGDYt38Q4/q4SKSDt1ZvvhpBF
         bvYVFLtE3kbPdWrmc+/fzPEGqtAOLwhBLhXYhZTLZtU+jUBnS+nO5ESSYQEfX2GLvKp/
         ZHpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxFhw33AZnEHj4vEM85zO7wLYamKRh/OdY70lj+BpKZ5cBfqM/RUwxBsA0jTPh494h9v+zXZhlDk0ZOYJ/rzCDHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk7RmjaLawxRGTFZeoEr3wBFVWxtwGOdW8YlDWZsLunWQf75er
	+PlLl0D1SioSrUi5lPonnSUzLdGNxhhgZeu1GLRqxJ/Rsd1Vey9tBIrfaBFbYBkm+8slgSFd5yF
	vhMjfuWGV/eA1/lBqWTMRxhqGF/Z5rmU=
X-Gm-Gg: AR+sD13CwKXzMAmtSzsRkDwM6mFh5+Jikgg3jJAX/LXr9IPtHDtH7QjBOS2VYfGKH8K
	40TyU1bYjB80Qo8a+ctG+Encn0C6z+PLqFvToXgOrXUmfeo8KIvdpgQgkbtGvButjXpmd4MzQ1H
	YYgXaLYKVcwmhdMJb23MkiE8aecJqeSxrCNN38mZCqzApk36JYGiPORfFiwR+1Ew/KgH75PzEha
	oHrL2IpjlV+hNilq9J0AYOVHYJTFNf+yiOvtBmL5gPCWUGTPNjG2JOr9apooHF6dDuEtRoeG4ZS
	5DNEBfvmd6DfxPdAR8MBX7tSkCzZbylc5a+Lbx6Ij2gcmsXyp9IMMnRGWDxat24+dZRi+VWZCyk
	LmmCnO5DwZQ==
X-Received: by 2002:a05:6102:6899:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-75b2375d6eemr3857526137.11.1785649662796; Sat, 01 Aug 2026
 22:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
 <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com> <CAJpoHp48cXPLrwvANAt_-D-jE=DcSyodAL=p36kQw3cGtQW_fw@mail.gmail.com>
In-Reply-To: <CAJpoHp48cXPLrwvANAt_-D-jE=DcSyodAL=p36kQw3cGtQW_fw@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 2 Aug 2026 14:47:05 +0900
X-Gm-Features: AUfX_mymp3gbWIvEFlOpn_puCcmLWjZUNex9N8Qxwa40WVIlIo2zevDdW66QGDA
Message-ID: <CAAQKjZM5cY8V_YaZzgF734Brabz=zwRkp2k-+b9CbqS2_Xvi2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos devices
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Diogo,

Thanks for the patch. The conversion itself looks correct.

Two small things to fix:

1. exynos_hdmi.c: double blank line

> +static const struct drm_encoder_funcs exynos_hdmi_encoder_funcs =3D {
> +   .destroy =3D drm_encoder_cleanup,
> +};
> +
> +
>  static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_=
funcs =3D {

Please drop one of the blank lines. The other four files are fine,
only exynos_hdmi.c has this.

2. exynos_drm_dsi.c: header include order

> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -13,7 +13,7 @@
>  #include <drm/bridge/samsung-dsim.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_encoder.h>

Here the new include was put in place of the removed one, which breaks
the alphabetical ordering. In the other four files you added
<drm/drm_encoder.h> at the correct sorted position, so please do the
same here:

 #include <drm/bridge/samsung-dsim.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>

Both are trivial, so no need to resend - I will fix them up myself
while applying the patch.

Thanks,
Inki Dae

2026=EB=85=84 7=EC=9B=94 5=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 4:54, Di=
ogo Silva <diogompaissilva@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Inki,
>
> > It looks like you may have forgotten to post the v2 patch. Could you
> > please check?
>
> I think they are here:
> https://lore.kernel.org/all/20260623-exynos-drm-simple-v2-1-a8d59678b7d2@=
gmail.com/
> https://lore.kernel.org/all/20260623-exynos-drm-simple-v2-2-a8d59678b7d2@=
gmail.com/
>
> If I did something wrong tell me and I will re-send them.
>
> Thanks,
> Diogo
