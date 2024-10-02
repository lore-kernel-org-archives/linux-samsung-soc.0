Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E7194C69
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855769; cv=none; b=KD7nAk8FAvu7aFNIABsHLOt1dl1X/5/BFnKDHEojN4qOeGZM/cU4r/bac9BpP9WEwiYhMjPJxib5/qdHwE1gMRc4DdLc4TRLTvCF1J1hqSVDlxrQK+c6I2GJEhNu9K8PhP5tIpm4N1VG0f7YM3660Dzl+SPxKbHZoK/XTywlspI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855769; c=relaxed/simple;
	bh=BdFqoh25/ziCt0rrHIy/OnM8VCmvKp+9NmDTPKC26f8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dy37fPV7yJsyEdL9tCIc/LCr9XIiwpVWcjTFNCNMmrFGdXi+XEsRkq7x9HU7cqnlxHvv/fZ//1lgpMfDDSIMlOiACEGUtGZXo5zZcoEgin2jiJ4MoonGrERlACH18MQwC6OPRsbfuq5rb5DN0+8tXMq3OSm2cgI+Wjz3dWqFQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QT+Pst90; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QT+Pst90"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cacd90ee4so9423875e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Oct 2024 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727855766; x=1728460566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAp4KqRCMKdoszZ3EhRlu0o7aNcIHhINgcixo0Grn+8=;
        b=QT+Pst90yhhIjf3kQxDnlM4qBANtjPjngRZHcZIfjF9t26H4Rud8jO90GvjZND0wlB
         1qhLPkyGtTj4FzblX9YIHZS1sFXq0vkYn/DqYihj+TXsnosu5o4x+Vjkf8fdytdMHk1i
         PaUfdBL5RDJIy20h0gVeBYaG/sN2Nn1NgBQszYhA+FyktL1m+rFe2JA66hbGr8OG7DKQ
         c+owYP+8yHYZhw70ZvOb088AItjszFELjDRDlTPVZq3nXsjn1Q4Nk6141Q9z99qWOPkg
         9fYsWx/PR8nnrGYu/2ORHGefyQpLDo5vPgl8CarHqrZmd4Gh6tN7y88JyIkDwjetCccB
         m0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855766; x=1728460566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAp4KqRCMKdoszZ3EhRlu0o7aNcIHhINgcixo0Grn+8=;
        b=w4Je7u3O71OuaOpfb0n0mvX3aXqCe2TGQR9NWjCXZF8BfEtQjE6p7JZTiGwEMn9cav
         R17JtJq3nbFAzL0wgeOSjEhZcIrVx096q54rarjdjThOpSAVdVasYRhrXN9cZ5FNcriJ
         lGrUcJT1gyEl2be/w0N2mdoRJ2j7mf87Jts1nbcolTNR5cYK2s+kNSHWtT7YNc5jBjCU
         JWmJZkLHKigdKNLvOCknzdvMpNOSe766ySJS54kPsFsTgcB+GVcWmwd1BM4O3xjF7TfB
         X2wN6jXBb5153bA3ZiKG4u/DRqK2E6S6pZY3ypcyaAvZDBV/qUqHb5B2GDGspigT6Fyt
         fS3w==
X-Forwarded-Encrypted: i=1; AJvYcCV5tmh5aOh4JEtbMM9TuXOqr8fjt1KdBkULRPWYwO7A6KTYtsEb0s6bvRt26Hob1D03Bs36dDwgm6rJmQ76ALBlsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7u60MwIzpm6wiNqpoTFP1xsONWWt7FcxcovjYSQiW/XQuuenr
	POxhViZvBEnBuj+pdn8SltgIc+4Gg3d4SgxkAUb+/qndevddUwcRzbkXkOA1DiE=
X-Google-Smtp-Source: AGHT+IGd/5hoWfDs8hU174pJPwnTiwCYFT2Js+t9A7qwtxi3HUASZxU/C1Zj23crYIjz4fXoGX8MrA==
X-Received: by 2002:a05:6000:184b:b0:37c:d515:7674 with SMTP id ffacd0b85a97d-37cfb9d65c8mr629639f8f.6.1727855765627;
        Wed, 02 Oct 2024 00:56:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a01f52csm11176545e9.37.2024.10.02.00.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:56:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
Date: Wed,  2 Oct 2024 09:55:54 +0200
Message-ID: <172785575196.22593.2005129736205573813.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920154508.1618410-7-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com> <20240920154508.1618410-7-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Sep 2024 18:45:04 +0300, Ivaylo Ivanov wrote:
> Add a dedicated compatible for exynos8895.
> 
> 

Applied, thanks!

[06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
        https://git.kernel.org/pinctrl/samsung/c/e2d58d1e1c61c1e1d4af400cc0ebcebf98efb49f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
