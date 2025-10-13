Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6E820DD42
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317318; cv=none; b=iaFCKxCPqdLLEw64gxyPXNrZtP+MPcg2SvOk23uYnICL6LHDqg1e8QJvgaS3YzwxTmH9JjIDAeseUT++zog51BKAXa1mp9HFchQAsDKD80tpjXo/4dlPlpcJGKdkG+hShJnvDmKZczcrNr/NY84cbgVEJax+9QOqTdizgyBhPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317318; c=relaxed/simple;
	bh=PslsRqEzoLUH7pRkVHXqIh8BJWHmrAu7uexd7fti8CM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=up02wgIrB1R7pEAGe7640zyy0WQ+RIyVK554K/3ayJV8qLuTxHMN20JtyhBjB8ZYSLfpRNLV6ZY8jx/4xk/E/7DBM6tBC/5cTuOdLDSnG6HbdHL8u+N9DPkoiHYmxItNEl7/yBRLxzm0L+Jvbng4GhD8jKkor9Sy7Db/KDBewoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7xiXVKY; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7xiXVKY"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2eb5c9c9so105673b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317316; x=1760922116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TEQtBfUYYndvsc8G1MAwUYtk9BHiNm9VJYBElay+b0=;
        b=J7xiXVKYs9he+Fv7oGxRmRoyc/hOYnP7tWPI7wTXMJJfBkZz6dF6e0j01Bb6PLsXNf
         m81QIZbrfn1THHBfPQpdOFM/hwPu1Khk+s518reatYGOTVzTOHo/f8wXGoEXyz8+Wxhu
         2EVgUoqQ1GqQH/SaOITSWe0T+p0XxhJFqpoIFQFVT+FmIKDwTOLjik7OzrSHSkPYNh/3
         pgzHAMkJclFMR3ud6KzxTIHrEcPxZFwuH0uCEuj0cLoJuhYT2PnVUyXlZF/ROhx+XNDg
         Wd78oj/VKL05bC0l3FGciKrotulNmmO+G1nm4tWaDz3fgbPJ7YwOgE7BuGjKT7O7NmwS
         NSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317316; x=1760922116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TEQtBfUYYndvsc8G1MAwUYtk9BHiNm9VJYBElay+b0=;
        b=rI4T/ajKOvv/Bb+gQf8Xd9PWQUNB+wsI38PlITbDRojqThzZd2pboRfGPVFxHyB5hd
         qzK0PJt8HiN1Q7GArf8SRBQzk7Ewe8XrnJdPIHQyVJ2zy0U+zMvCGugPzjpCID7GaAz8
         CkzgYo5KOAl+NAph3oMaVk9bYRiR82Q5ArjT+J3F96CmxkuY+ukeeiO463pmnfm5Shq8
         o9aMACjqVvgN2SS9HNNvYBBn+WkqUsiEO/gFu37qvG8TJrq5ofBvhGYxve3S8QUMUfb1
         Xw91b2Ax395FtLJSD3Vx4lk4R3g4ZkzBIMjYqXXGDt2rU06m1uYFbn1KE6hFsHSyqvgd
         jxpA==
X-Gm-Message-State: AOJu0Yx0HZS2SZNxSNEVrhJsIaDFnnIdw3qHEkv0vjpt+xTZPMhNYF63
	DJhTbctB3srcsU1o7k9GoiWxqJvlsgKM669pLCoIZlLlEnsf2OAFIJ/nggOr+kDQGSo=
X-Gm-Gg: ASbGncsLyurhMB9QGkrHtKsJS5SRDsZOivk2ZgOJ9rge7aVoNrDyDK5ino6N0SBZAyL
	+eIXXLJy2lMz/Fg+JILqrrrUlGneWR+cxnC26oomnt6cGTefaQCCqDFITytKP/PadHartFr3VCb
	x8ALNRH22uTo/o6Nn6OdGg8pcO8gnJoNDGgcLgz2ryeOQtv0afgVkSAcgQspbSGFBv3kd7dR22w
	PjOizYvgOMRvuvxhV+z/ZYjnA1tCtssaEWNZgzE1Mll1YWF45cRdI0T3EXEnnUKbXi5Y2cMpUSM
	yKQmQCT6PC9Bpmey+VjSnBDbxV4I/KkN8LhdzIR0k896cWNMDo3r2bgNscaacvZznDIbbHTk/FH
	Q2LtCEWrE2cgoI0IfiMHSKMnRi5ltNAnKn58hCJqRZS/qJ4c42arRGBfqf/ZvBAIGJJ3BG30=
X-Google-Smtp-Source: AGHT+IE0pV2SdSy2BtqzzreV56Z2CBh5fAGnmk9U/0caCiZx4MMe4ASrcDCjjfJh9mw5C6vsUpzf3w==
X-Received: by 2002:a05:6a00:2295:b0:781:220c:d2c8 with SMTP id d2e1a72fcca58-79387146ba5mr12386110b3a.3.1760317316323;
        Sun, 12 Oct 2025 18:01:56 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250915095401.3699849-4-raghav.s@samsung.com>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc@epcas5p2.samsung.com>
 <20250915095401.3699849-4-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynosautov920: add
 CMU_M2M clock DT nodes
Message-Id: <176031731074.32330.13412044019926403871.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 15 Sep 2025 15:24:01 +0530, Raghav Sharma wrote:
> Add required dt node for CMU_M2M block, which provides
> clocks for M2M IP
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
      https://git.kernel.org/krzk/linux/c/7b0ccabb873de4b4dec3214b2a0ee3c32c326101

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

