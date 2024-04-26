Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EE3142E68
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714126197; cv=none; b=O1/6J91abc50CsyNWJqHftNbjsQfj7AqYaSKAftnXbXrGB8Y8f1lhR6nNYixV7OgiNSAaqr66tTWNDiD6Y5kDWGNe0bsz6+AzUvopHMO4cl1+eIFL2jUStUIC1crrd40W0mnx9M1PyeCobtrbjaBlMHKkObbb/L7xwAUN0hHQR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714126197; c=relaxed/simple;
	bh=E2spRI7PbCirbH2m7G8+Y/fvI8R84R/W4WJUamXU9pw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AUpfxqLbpp3UC/blb6RU7G4DWcVQ3AYrjU6kcGYJPfyFEgiiIr3jQhMlcMor4KqzDzH5bfLQrVBEagIjgmGVk4FIiYh+BcsGfn+Q6TXuKBzB5NGu9KIiVii3LcK0gpziWEgKaxOPSweqX/SnEcp3zSj03J2jpQkS91SdwLeueRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPfqnhJG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPfqnhJG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41b79450f78so5206465e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714126194; x=1714730994; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E2spRI7PbCirbH2m7G8+Y/fvI8R84R/W4WJUamXU9pw=;
        b=FPfqnhJG1VTTWLVNc+0nGuVZQAuo8Oiy2X3BdjLj4M0ulNXaNFJ15Oyliik1atHOEi
         aNHO9w4IEquZDvjg0h9bJI93XXJUUGtFBsswgvdd4MNIw4ei5q3Xfr4n00O92XidC6UW
         sUxcrJKwAibddd8hCgGi7qXDRW+eepYLvxqxoRRwfjPHRUl+hkN9b9z8k/EN4+IkYPhr
         fSJ6TNvFYldJW51B+TdgrQcqwT2hLWuUMKsddaioEpu36669nSHTrGCPFG9nMlTgKap+
         DXf0TWO2dMU0bYxo993F3HyQDGGkuL/e/e1rOFu7Js4l4Rok1Nk8/CXAFYP18/Cx1wxX
         qUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126194; x=1714730994;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2spRI7PbCirbH2m7G8+Y/fvI8R84R/W4WJUamXU9pw=;
        b=wysbypzWyCfA8G29UbltKvESvcQdZ9V2/nKqVgF1+ze8rdLJfSjdaUDeOOS0wQpEaV
         /WeuO8egKK6mgFNhaRN+cZ8QMWCT4kHTKsrs5duns11bifwzNAlyXAzKRg/1llDoE2po
         WFL2QMFGCbSVszF8iMQKPeCem1qgtZ2cdz48rnItuHO8MN1+NdzVmDM6Ar2kqQpd3CIl
         8wv6d9PIjFw3r5tydRWRLVofNrVfPgnikKERW44i4R6QNVY15id1xsTS4DprDl3iNTza
         RYq4ZyZwxd7KAxD+10iSarcsochTO8rredF3sZz0etOx2vlPg3aquYPk8IISQuVVG1SQ
         p9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYiAa6dv9LFkLtid15G9SuM14ZXXRexVDCjKJnStpMVCAwkeqyvGDKqD3MshsYycluiIjk1SkjYRYzfMrJOvpMCNOcc5lRHFHSouUYSKWp90Q=
X-Gm-Message-State: AOJu0YxfbuVPX14zP1zyR9rguCvdI+Ftvwy1V6vEzyB8F0+2aJ4ZZJpa
	kWaQNEgSwdjWx4zL3NjgKuxENTxP+tjhtAeRQLgU/cGO1G1FrSxloqKIO79DOMk=
X-Google-Smtp-Source: AGHT+IFRnwNNKXBZjV+Cwrmrc+VfzmRCGNSCdK4TtlDzJm1Haw409IyA6ZAy8usn71YFgNMeRsuU/Q==
X-Received: by 2002:a05:600c:470a:b0:41b:8b3b:7a3e with SMTP id v10-20020a05600c470a00b0041b8b3b7a3emr1575369wmo.22.1714126194449;
        Fri, 26 Apr 2024 03:09:54 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0041a0f3d996bsm20655600wmq.47.2024.04.26.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:09:54 -0700 (PDT)
Message-ID: <a9cce8beb999c3dcab73b66efeea64c7d9f05bb9.camel@linaro.org>
Subject: Re: [PATCH v2 5/5] clk: samsung: gs101: add support for cmu_hsi2
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 26 Apr 2024 11:09:52 +0100
In-Reply-To: <20240426-hsi0-gs101-v2-5-2157da8b63e3@linaro.org>
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
	 <20240426-hsi0-gs101-v2-5-2157da8b63e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-04-26 at 11:03 +0100, Andr=C3=A9 Draszik wrote:
> From: Peter Griffin <peter.griffin@linaro.org>
>=20
> CMU_HSI2 is the clock management unit used for the hsi2 block.
> HSI stands for High Speed Interface and as such it generates
> clocks for PCIe, UFS and MMC card.
>=20
> This patch adds support for the muxes, dividers, and gates in
> cmu_hsi2.
>=20
> The following clocks are marked CLK_IS_CRITICAL as disabling
> them results in an immediate system hang.
> CLK_GOUT_HSI2_HSI2_CMU_HSI2_PCLK
> CLK_GOUT_HSI2_LHM_AXI_P_HSI2_I_CLK
>=20
> The following clocks are marked CLK_IGNORE_UNUSED as they are
> needed for UFS to be functional.
> CLK_GOUT_HSI2_SSMT_HSI2_ACLK
> CLK_GOUT_HSI2_SSMT_HSI2_PCLK
> CLK_GOUT_HSI2_LHS_ACEL_D_HSI2_I_CLK
> CLK_GOUT_HSI2_SYSMMU_HSI2_CLK_S2
> CLK_GOUT_HSI2_XIU_D_HSI2_ACLK
> CLK_GOUT_HSI2_XIU_P_HSI2_ACLK
>=20
> CLK_GOUT_HSI2_GPIO_HSI2_PCLK is marked CLK_IGNORE_UNUSED until
> the exynos pinctrl clock patches land then it can be removed.
>=20
> Some clocks in this unit have very long names. To help with this
> the clock name mangling strategy was updated to include removing
> the following sub-strings.
> - G4X2_DWC_PCIE_CTL_
> - G4X1_DWC_PCIE_CTL_
> - PCIE_SUB_CTRL_
> - INST_0_
> - LN05LPE_
> - TM_WRAPPER_
> - SF_
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> [AD: resolve merge conflicts]
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

