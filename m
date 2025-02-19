Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC74F1C68B6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959157; cv=none; b=XhQ7lveeemiGSYx/kWOX7qGsmYbzb+5h496svlW2dV0DHQzgK87W5gFRpKrwWPpG3lakny67pSrtdnD2N4Ex1cpuPVgJY96f7FwRDR2O2u4QVqAwzr+i0OfDoZMTnLFoWqpZakm63Bxu3JDLtJJtdWhXQY5DLbwFSZbRh6zvqPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959157; c=relaxed/simple;
	bh=FhaKrLYYFvH6JlBWj6iAfNEu2nFL5Z0xJ5LSfPsqzcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbAZPiBpC7NINtKFKDPqtJfmW9Yh+OkDkSA5wlxbjLC7BRto9okCpW+ncn6pejV3f3xTC5e1J0CEfww/fYupBx+p5wh6KJatdVkdk95iBOmc48ASmF35gEhGOkwNvkH3vcfvH3owHNPAsmuVaZONWFqaAPG79n4Kunr+1EoYL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BpO64UFb; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BpO64UFb"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f89aa7a101so2562022eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 01:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739959155; x=1740563955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D4ZmBE3k4+dA0yLJE7EIrqUujBLBu3hVMfqxrFcWbfY=;
        b=BpO64UFbnjMRx/6L+nVqHYe3AfCiBG/5l4cnEQnM4+m5xCL36iZhaHtesV0BFFcRZE
         eSe8BnKRU6XwSQn1RGrRP99GXHUFDTrtFctEWeXKrgg+z3OTX63/eyiW6QxdUom9BSbe
         crXNgu7biaetcx+KlOGV9D9REfl0kqBqB+t+f5FbsjtzTt0VBfYr2XSeMeSSEMBknPG1
         WGVrFaDcezkQZcZ04I4APN2LJNiRTM7jbM7xc02VJnD8fExC3JenpQsVRcP2JWEZskbA
         QcGMinX9JXpkibAlP4S4JNM+vM/GlRpKbkqdAIVq2J2S29vo99zjS2AbRkhWkfH9M44f
         4JMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739959155; x=1740563955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4ZmBE3k4+dA0yLJE7EIrqUujBLBu3hVMfqxrFcWbfY=;
        b=Ir/gW3eYbIGnMaHIUAQVaKasO09+MMCEPR87pi8bylBTlYovWIpet335OraIXA6GyZ
         wyEOq6ewRh4/Dls1bES+JNqgIOhh83OIQlrwQo3+J+XR2tRepXFIrgtSxkHR0+CSOuny
         AcxbKFflivXlVhg02hg3nu2aDzaEG5dupyg5JPu4bt7IGq6m9g9DxIZbfrq3ANsc3p0r
         sQRdSPUvUe50Rh6FR8/69T7TDuZ+IpZo1wqlvsL7zqBo4QMpD7CUOLfzDVHz3LuGrv83
         K2VJSx2UlFBoJug6yxJngoOvvjuakjx+q2c694szM9sryW94tkBFd62Rs4pyInGylfF2
         iFBw==
X-Forwarded-Encrypted: i=1; AJvYcCWFQ+ERtDQ8ZV/AsLVuf2G3a/cex7wudcPY0UvLIynXg6W7gf2bEf+YRl+JvYHEFeKJi8eQNXN99UqFor/0XXbcLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmf1jq9mRfxHKG993kPhjc31Zt8yP6SYyjr8fr85M4rOMPtrQ
	5GK9uv6uTAjQIgTtrxkVURtXCc4jjzT3Sm2iotDma5E1SIDzaKux54T/5KM7oXfLJKXw+IywH3P
	xXbWKm/YworjFA3Ki/ELY8YufdH1jL7KAgsKKpA==
X-Gm-Gg: ASbGncscElOv33XRL5hQ8PMHGb1I00H4RTPF96pa2gvsCoMTaUtsHlqJwHu50Z+zsvB
	99LmL/Rl8h89AuP5jFFcRXdRQAI/uh+cpM6i0P3lEp9uFYXbEg3hsNhIt/TOEcgUpMVhtlJize5
	Q=
X-Google-Smtp-Source: AGHT+IFxGDj5iXV1hVx+bDjQHTZUVRM73dPTifEk8a7TEg/x0Tcm1arIcMDlwwFyHGQfiRO96zZV23RSVt9oTTe+p/Y=
X-Received: by 2002:a4a:ee1a:0:b0:5fc:dd26:a087 with SMTP id
 006d021491bc7-5fcdd26a30cmr8214839eaf.5.1739959154922; Wed, 19 Feb 2025
 01:59:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Feb 2025 09:59:02 +0000
X-Gm-Features: AWEUYZny13PhyIgLlHGS6LqU655W9VTKBSuguA9ge6dMXGv73qgyazJplG-xt5w
Message-ID: <CADrjBPrg4eV+fT9XsuMTwG3WprPq5Qqre9+XTwYURCp_==6diw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to lower-case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 08:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
