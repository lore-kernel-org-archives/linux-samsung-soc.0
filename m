Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53219E97A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 00:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760315159; cv=none; b=XM/Aaw6uJqnKAgfOsCjtSh1ETlSSTDVWLGXN2Oc53/F//UUqcnrRKzL+I4se+wNd4yTJG46n0NQkkWfLRFKpjonhiVQ+aY2bE3jLq06noNl2/4oELjqE7bsELWgfEZDzhY0iE++VWYLQJrD3059WVkajnZfHe/tnJnUnNp287A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760315159; c=relaxed/simple;
	bh=uMZY/eb58MXXTq9fdevinx3WkPol2Jn5dURLFB+Namw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sPeW9vW8VmREpExeBmESX6hZDLeXi/doutaT8DjvqD2XkbvIPp0rb2f8oCzDT9Xa2DACc9tWOhxNIr4UQtDxBLY3dflkZo3MAqUBImN6cCfFB6gIRbzT8Q8ULSMVurHpgJ6YtFzN9UCvIBP0bFzJ92SwS3pneZ3PlZq2LV14Rn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SMcxfFgR; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SMcxfFgR"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b47174b335bso221102a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 17:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760315157; x=1760919957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79KifPwGGK4mB0WoW1yjJ4Alo2Qr3NmP9KvDMNbO2zU=;
        b=SMcxfFgR4pV3qvN4vJehWICzVqR6GlQVUjohZvqjdr3Fx5YXhnjcG5cUUPqO5Lkg0l
         QlgnlIJDVdkLsrY1GzQhIo8xRj2+Bz3/lFBifSB6y/ULWqAlCnuPH75ZP69YXpGCmmp3
         6aWSMcg11i65QbR3icP/yql7oO51t3GYzpp4MviGrSf/Bw+F4RI9gNlhEu1+OlcD+bOO
         RYU5AkDqVhOAlQtUVrA0gWs7dFUbpfBFPC28CKqoUy4YB5V1b80kramGaoxd2hN5O9nI
         ENX30s1PSZNd3SilwgU0GuZVJ8VQHtZqAuot+e2mvZtwNx94jbzTOFgQ9Ysb8NvdeMSG
         Durw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760315157; x=1760919957;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79KifPwGGK4mB0WoW1yjJ4Alo2Qr3NmP9KvDMNbO2zU=;
        b=EqSuan9rHV0tLUMYLv0hHW51m4MyN/kJQrCNG0hTnlmISJRPu/ywYXHsEodhzad5gS
         aA3QOMY6YP19zHO2/c8sMrN1TlkN9FoX08mruyjNRbdoRrc6BW9KJdJg5Z3Pe25xDK9n
         J63PlNCS3DzZzgDgpmBuGDWOjK009RsTuv7bGUpl/5rr7EaAXE768jpqK4aPwIv90fwG
         XLEdYe9ZgHwAoDEFTK01uo6Oq36eg3WtBqlmFx1ZSImBLyD/QY3FHUeKIIkF+25BMjfw
         kiifuQalM0OOG77j1iyAFxZiXQqaKyu8glt3MPU89jQbbgCBoDNbIeFYXL3qq8LQnE6s
         dVmA==
X-Forwarded-Encrypted: i=1; AJvYcCX17lcWZbeBM+Nc1o2UDHYast2kqGCHsoYD06D/3dLW6VwYrOfHLJv1FWDFew8Eq1mwvtWxZ6y9KL/ZUmAKhi19JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnEmJMcSKKBccZsZV3IfwFP9pf+L0MJen8L0sTx055ZYdQCyNJ
	zYAFb04d71WFKkPW+KEm7yqEVBFmv6JnxedtRAj5V7uy/uRTon6XzHdq71TtXIrD0gc=
X-Gm-Gg: ASbGnctFA9ylb3hEYClpohsAb9Q7ztn0IrlF7g7uS/pgEZE2ILCczBThxlnvtGoFcEq
	uKG9BsR6Uojg8IM2iBkKtwXBZg2ymj8ojtNlsEOxnJjKN1CWy5v8GFxWalaciJXuT2Cc2rWH2Rn
	jt1jsUJenRwDiokEzXA6BxABWzh0S+rn+Et+B7cj4hyMqcSwynHyq/yX5WMA1gJUHA9ac+v2ox1
	dc/aMHcJ+lsm8clafOKYB25KyRlQqJHkghm5mOudhy40YPtPKgcSphpFsAW2KtD9FZhIvb4DTsY
	LNy/GtOxuV4cqIrQj8ZAtCg4X5oEWtXbUbBb2imCTCpDnRGNbj8Jf8xVnxXx/EwHrSmZtoRC6QC
	PHp2swYbUjS+8VpYKvuUU3fGkqwO4J6gIstBffyGtNBIw/Y5rKDMCnxlRN/DLG4U3Cx7uh7Axyg
	jl+pxU0Q==
X-Google-Smtp-Source: AGHT+IG1iyXL4pN/qvD9XLmsJIck33wkHAeiVhxj8ffXxtDeckyVCZeHinEl84ADeFl2GumlvaBQKA==
X-Received: by 2002:a05:6a00:2295:b0:781:220c:d2c8 with SMTP id d2e1a72fcca58-79387146ba5mr12345789b3a.3.1760315156841;
        Sun, 12 Oct 2025 17:25:56 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm9624862b3a.38.2025.10.12.17.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:25:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-5-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-5-a40e77a73f16@disroot.org>
Subject: Re: (subset) [PATCH 5/7] arm64: dts: exynos7870-a2corelte: add
 bus-width to mmc0 node
Message-Id: <176031515137.11660.15560543530858079871.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 28 Sep 2025 22:13:56 +0530, Kaustabh Chakraborty wrote:
> Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
> assumes bus width to be 8 if not present in devicetree, so at least with
> respect to the Linux kernel, this doesn't introduce any functional
> changes. But other drivers referring to it may not. Either way, without
> the bus-width property the hardware description remains incomplete.
> 
> 
> [...]

Applied, thanks!

[5/7] arm64: dts: exynos7870-a2corelte: add bus-width to mmc0 node
      https://git.kernel.org/krzk/linux/c/5b33bce0bd31ca3ebc5e3a75b3053141540ec644

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

