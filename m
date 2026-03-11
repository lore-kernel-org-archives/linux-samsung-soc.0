Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBE31AA1D2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Mar 2026 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234085; cv=pass; b=CDXs1VARUqjnCwSA5LuOyD7TkeBToqVc2mgq81ImcCllRefinwtz8ysFHpJMzH5vwNB43Olz92wqD0PzvunZf1holziXOSBX4EScOyR1lsD+8cFQ5Pi1X7X/gs1EuEWyyYFiy//RuS6P0yJtfruKdOAahGXqX7tGxSNKWAaEf1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234085; c=relaxed/simple;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AevV22K16Rsi8mSTPIQ3klehHRxBkD+HrhkkdyB+5a0gJFeS2lyIHWUiOB5ZCqc6iQGt6pS3mOS2rPWHKIDrTNq1j9ezx8f5Pq8R3JHXaSv6QH0qsrRnuXnkIDf5dRS+OIvcSPvlcQzyYHyJM4AUOiicWgsi9YjB+mDkO7VFr1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B+GKw1pA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R71LJmsv; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B+GKw1pA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R71LJmsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773234083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	b=B+GKw1pA+dQl+hjnXRjRS98FG5AkSiwY+8OOm5a9Yyf7PmIuLg1XT6B5TuRS/B0Bu5x5CL
	Ti7dePdvkWxkZyP8t8I4z38rFc0e0zSZna8jI2Epu8KlHKbxMVgPYqbMGYZ2yo5000Cpnv
	1IVFavua0tsZnEiB6gTZrH5PlV+S6cU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27--mkiNKM8OKWtdXTjvK64PQ-1; Wed, 11 Mar 2026 09:01:17 -0400
X-MC-Unique: -mkiNKM8OKWtdXTjvK64PQ-1
X-Mimecast-MFC-AGG-ID: -mkiNKM8OKWtdXTjvK64PQ_1773234076
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b96f2608592so319345466b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Mar 2026 06:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773234076; cv=none;
        d=google.com; s=arc-20240605;
        b=Ze820mmKKHftwDxwXYKa2pUHZkVwf1r2yNWLP/P1ylcNXljGpmsKDy13eQ+XGPenLE
         8pXZVFXI0UdAs6O7I5sBFI+aDO0TRG6R59fcoOCk+X0WmwEmAffYLXezRNc/HwKxNJ4Q
         OUivtZuFpx8yUr9D7EOagVrPxpocv/YYxa1Rqq+R7sBtQdjWeQWX3ZAEgCBt89KllUCP
         Ln0ZWX+IR3RPqwMBiUpw5ibcJPeVHooyZvVWpKWIgJBOaec2W2W2WKduiK3VFMQD5vwR
         1AuqzjO9LdWbMWR3zSX94iQCXhvbOQTUgTQf4K8jdqeJd+//CfF4pFhnMrodXTv3Av37
         jclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        fh=/40j+KmIeI6YfJZCRQCJoS5+XXL1J/O+MlSTnkgacE8=;
        b=SgvBsb0x+lPhtmMKjhMl2ng4RojdQiVgTJpLGuievq/nfrvphbXS38JYkV5wCj48e3
         kMU2xMBFBIhFT75+Ej8VK3hHUgAOqQIJvPtUinGvgipDFZVnCT+42nAfYaSVBWM7K3di
         0PG6q6/nPFKLPe4VBxKv9kT95WQgKkKsvxb+L9+7CxIsRIaTxaPu2Wf3VpgAtPKxTdkk
         nEx/zcB9fWmRHdw5Xx1nwqA2fMa2dplBw8U/hq7FAqgNX9EEf8+uWH/pS86c0ZSqcmvi
         ZhQhH1nvRKTEO+ewGivlVsNFLbNabbTR7/sKCi/zI4wE7XVPH7KWaMj3Nxd0EDLx/anF
         88uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773234076; x=1773838876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=R71LJmsvDoGTZvb0JwLD4qFTsSwb4UVVFK3SuL7qvti11COXCeLaEOIzry8wYazr/y
         ikp00ZMOp1JHxB2Izfa/4nCOd35Q97UNuboTaNqFDr2lUNY6FlEgAyq+4g5lN13pHwJg
         7H7icD/Im1a+6ZPvyBXegMmCiz6vW6V8voJObK7xoHxzxBJxy/lt5ujguyC6yX3NBjZW
         nn0A9GEjlb8X4C5pbsPVVLwQxD5Daf6EmqljjqgsHM7lZd+BJ0rnIkQxmwllJNHtWsmC
         T6ALdhnd0ONm3ywBDnf2onV6Oj6K48tgm8GyRAL2S8ulnHLHBDnAIHhJmHVhOqtVwXKu
         6Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234076; x=1773838876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=ChC+tqEPW0xojV3agLvG+NHg7my8BqQNr40mW9ebUXFk1TAU9FN1cpbS6NPprSE4cY
         sp3lYVLCx11C2WO2VGyE8ph1EivHXCHnFEt5wLnmt7k/g2crp5dwYR296Wzg3f0TEngp
         PWNRDRLYs9y8d7z+vRDWKZ9iiyVC3cKacDxCfiqI+g17N+OXvqQikAyKbTUJ92dUwQ1E
         sUF2ZvuRwb96eCvXb3gTKKN8I2yt4BWHkjD8zHwDGSokhvip7nWLa3PW9OQ3mdQppPl2
         5CRVxquCaPWtmrk13FixOLCri/MaGKf5a3Q1Ctw7XlI/MlY4LzaXV/QZqlIgqcH4V0x6
         sHKg==
X-Forwarded-Encrypted: i=1; AJvYcCUdQJDwFplmti2WAdfPrDNhvaBxACtrq9iy51sIHfhhzZDDlph8NUOpBUbHpNsas/kwyEXdUOCHmG1hYDCjbkEzEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUDRbRnv0xzDxY3ZKyvR4Y4yV3Cs1sKXVnfF+pyH+RCYDphCUv
	tiWnfeXqJ8MagqzC3SUITLOFoUZusJkkHw3EWItxatXUAcUOCnGIRemDgQb9ym0o7SS0gRE6cjk
	I8tjg7cseSaxLVqFRd/zqD6COFJGMd7vzXr1WlCXkFirgdskN+kOHNm1U9ctPXBHct+KmGHfMRj
	p0/Y2FIBFhLkOjDCyo+b+7qS/hgrzzTjfUh3x+ocNaCXOmplA=
X-Gm-Gg: ATEYQzxLKjOOO1wZ5QzJhJT5wyn07mhF7zy2CmUIc2+jN6OP4Yr8c4nDO5C5evlaZze
	ySnYv/zV341McuJWxiWw/AwTtBTCiXgojxlRy2MzTwGs+aEyAXFl3/I1/4O1SHKBo5x2zDWLuIe
	gNF2d10BruqCpUuuP5RnopTtz5amWV2fD6SKaU7vsssONnM9gIAeMQ9667qub2926FSiN68dD9V
	QMldg==
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b972e6069a2mr143083566b.48.1773234075118;
        Wed, 11 Mar 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b972e6069a2mr143080266b.48.1773234074508; Wed, 11 Mar 2026
 06:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
In-Reply-To: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 11 Mar 2026 09:01:02 -0400
X-Gm-Features: AaiRm52EdqmkwN8CGi7SEvZrCO9M1f6Y7hYTKKNfjOzM3D3aXhP9MAnWBZaRjqI
Message-ID: <CABx5tqKC_KocCp+_uJ-t7AhJNa9MZOG=5Dry4UoZXzUvSryiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 3/9/26 4:38 PM, Brian Masney wrote:
> > Note this series depends on 3 previously-posted patches in this git pul=
l
> > to Stephen for v7.1.
> > https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
>
> There's no tags/clk-remove-deprecated-apis-v7.1 on
> https://github.com/masneyb/linux

It is here, unless I am missing something?

https://github.com/masneyb/linux/releases/tag/clk-remove-deprecated-apis-v7=
.1

Brian

