Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12953365
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 May 2025 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746131681; cv=none; b=IYadfSJKkBm1Uxy6SrNMjrDu+stqNkPy0Z4v2E/YlytakCtFJJbeuGIlUliFR2J53dFKa15xkR71fXGtJ0xFEfxK7JUJUWF7BFJsUiZDqZSyMCB99mZlnv/1ug8xeyhk3wNCPL+iJcZQl2pFp3HbjHW42jHbfAX/acOstDh2o84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746131681; c=relaxed/simple;
	bh=8pF1wWpVwTMd7z0FTKQe8nYgw+2TdAxHhQ+Tcw3TpA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbHEkikwxMtjTuWPRg/etB91dRoYtfsMRKm7uMYFYJAWBR5+y4lxBWNH1LeyA34OvFjfEpyPeQ+MjI0pNliEqiCJ+pHUtXIR/EyTdVrFn/YzmcubEAUdHpgFao+s3vIKHNMNpVZxn0z/MuDiCIwGgryfcD1NRtQkm0wtdCzdcns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=suVW45fC; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="suVW45fC"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-603f54a6cb5so874651eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2025 13:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746131678; x=1746736478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s2/TuQL3kQKm2Ps4XEUaXLRCzG1Av6dinL8AdUC/eeo=;
        b=suVW45fC2QAOMX2j/ERCAKJ4AkCkIlmTD19KOe9xxQduwjhLEWOOrSmugompilQfyL
         mYToKXYBINzSUwB7suMoA9wwgAzCTejNCKdtbnHdJ7kbOVCDmugy6FxMD2uQmhYpz+dI
         yk6u+MUYxZ5WRc4svO+JX91J92X9c6NZw6bEpCNrfpgU6B6oi7mARNe83mbg1mehSiuz
         ydoU9mzIV0JCRtUud89C51cN5zEajESLmRUi1ZDqwJJZxczWjvZ26h1kl9N5VRK25X4P
         pWtSeIo8Wk+V+CT7q1acuD4fl/30T7Urtbq+qkMLcCkj4yNA/hgbrXUIqf873o26/puG
         UGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746131678; x=1746736478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2/TuQL3kQKm2Ps4XEUaXLRCzG1Av6dinL8AdUC/eeo=;
        b=PspzvuPcULhAbkD5h9VhRjagEDdCUtG3Jsrm2jzGGSlVOLNXSwlEVKNfF44GzaQu6q
         rfyjjhHezC5tnrlDWDzSCzN0oSSDek/F1R/IKtGaPTuwJSbWN+RkbJycdut+PwU7Gij/
         x/MLQsSs5kA4ADEvuh9vZXZPIQqjTigoCrfgJTZOSNW7NcH9YbyB4HTcsW4GoOzkTJ+z
         C1pBg53YLrDR2xWDHNReOYrG5CWIy2TTxPNnrNjOmMy6X1JumxifQTtrSXZdxW57lGLV
         g38nqI3r2/gDg9GeLH/nlmxLtlDp8IQkuhXR7s98C88NJ4hdNoQsgE2AGOvK3uQ/ZMcq
         r23w==
X-Forwarded-Encrypted: i=1; AJvYcCW7wnTzV3oeY8y2DUAZ9kc5ETbaU80byXT2/S/a6THvwzZFelYdFK4N6fAWz4/19Dz43lwiFgKG4EjE+oOFgNYL2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAl8mzCtPb4mxvEoufNepAROCTAYBtUNScy5X0Lt5TgnRRWgvF
	vL2EipwKdrZzJM00j+99mF9v/7RVJ2HF52sXyIwoca0tfGZOodGDn3YKzCKQkGdARZFOuwRIzE4
	ZsGnKwRquaEbjb2DtfUXl6LE8gyLNfI4vt7ZsMw==
X-Gm-Gg: ASbGncshq6CBSgGbit2UxgBeLz+PfxxpbOHVfIeqHsddhuIS1gqQrDtHtS4wrIuFdj8
	hHmrEuJqhU5pQHYLsWrhPPgdOvQvaisUkl/Abq8FbOy+GKHovpWdA6bBDoxPgWcrqOoQFd7SHrG
	KJnq9IzkS+iMFIX6yHhsZNew==
X-Google-Smtp-Source: AGHT+IF6bq7NXLJi5546fpk08Q9+VHouk/Ivf8VOZeleLm+nJv5PjsAxN/cnoxBRn6+mutu/ZCv+/Az9E+zhUFk9998=
X-Received: by 2002:a05:6871:7419:b0:2d4:d820:6d82 with SMTP id
 586e51a60fabf-2dab3313467mr143467fac.26.1746131678613; Thu, 01 May 2025
 13:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
 <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-5-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-5-1bcc44fb1d55@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 1 May 2025 21:34:27 +0100
X-Gm-Features: ATxdqUG_Q1uY69qq7IbymtjMCwucexqjDWrXAetFETrm0a0bcDxzCmS7-g07qNE
Message-ID: <CADrjBPrRmQKvuTMZXAF+gVgMzkDs1=9LkwrW7CHGVEYG8c8bsg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] soc: samsung: exynos-pmu: enable CPU hotplug
 support for gs101
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi folks,

[..]

> +
> +       regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
> +       regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
> +                    reg & mask);

I just spotted a typo here in this patch, it should be
GS101_GRP1_INTR_BID_CLEAR. I'll send an updated version.

Peter.
