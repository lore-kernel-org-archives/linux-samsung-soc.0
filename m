Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365C12B7C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706270512; cv=none; b=p1YIktm9MJFWlhHG4V8E6vstBge6zB8vmNL7mrhZYLRoSE3o8/WDWIj1glWj64nNGM6VGJhmUy9ibxsfOXwsTRMPPPUjtInuJLiffM4HpQzft40+5Mt24hiMjNYeUjjsBzGe26GiN+li5NLFwpkS/OhQdS//LjSSC/h6vRYyqfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706270512; c=relaxed/simple;
	bh=kShe0DR8dUkgLXM5V6sGEm+PEs6rP3fBIoBIPjAcbZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqCJyqQF8oi87f1stOmeCpHhKFnebLCUJ4MV21YNgbmJiAqPdvIsT1LlMRGrz5KE0zyKGoEJVrUZW2Xymz75q9WzIVq++U9Th0JS0JKqncPu538jxZN9FY3p7aXUHB0CG66Fen6V5gEkwZ7K2br1UORk8GxvoqqYa2OWlqXIP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMljS02p; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMljS02p"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3394dc2ae23so417074f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 04:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706270508; x=1706875308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+Pi2YmSmh0tvF2dcIDzb/GRIdLqeCZP6pnn7Oxmq98=;
        b=PMljS02prBnMtZudnzEXUH0bZR0Bb7Gwu/CA8vZM/YNcavFFe9cFGFAiViUigrHwZP
         r2xZBTy7FZ3vbwrr5wsSr8y03kiiQmaH1nPlaPJDNCJPM7/sq0+Jct0LuUbA0Tx+zNy3
         kncPfMcBvUNVj80vSDE8ZxTQLNZumIvhrAAx2ceelj8PEJHTmnB/9wElsh/4MABSF4TU
         RoxVGSZjOo6kt+jjbaD675FnZaND9IRRx7nYnR6bvz+fXhulkydH14CFdmCERbCBxmKI
         UFD81Dsrh4sOYoBVma/ikE1BH0Lz/PW7lmKzL05+0K3FPO1BmBP2k9WXXH4dKR19P2MX
         RCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706270508; x=1706875308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+Pi2YmSmh0tvF2dcIDzb/GRIdLqeCZP6pnn7Oxmq98=;
        b=e4mCFN20uFshTlLdFTnTumbfp4EIgIgS98YtKmUpzVkruJQKO8FSS0CnTrkQsV03Ew
         ooR0hYm0/ZpheYK9BtwNG7zEbWsl2gwIxgrLvNR5J1M/C0aF0MVgj/5Zarxy+xtWKUfV
         fbXdt1iyHX32L70txapWVwPWtUxupijywUI3lWn+p6BrtSlqjY/oXziLhZlM8W8fbm6a
         nYdwIhRb/3e+VyxzH109d+8rF45/Bq60sXfQ27h/++rjRtmkGnaIGhY/ICQP9eQxp6V5
         ilFzAokVRx5xbctop2gF7ZxYhudWoa7v7eg/5YfyZwCX63XaK1x78nPFCZGIjbYuqfWd
         2t5Q==
X-Gm-Message-State: AOJu0YwVVWVPmlWleY8QY8rkZA3nZRDpDWiw4DJzLEDxd1lKhsE4NKJo
	bOeEkJwdIBBcd0EzWbOZjpbqQ2eZFCyGkKKqmHTkBV1XGKomuCk8teD3WdQqIx8=
X-Google-Smtp-Source: AGHT+IEmxXOASS0axvOu7+6RVFmpWTwW27YnOeCzd/HHx1xonmd2dr/AtGzOQl4fXJuA7S8D2VezUA==
X-Received: by 2002:a5d:6e87:0:b0:337:6d95:da5d with SMTP id k7-20020a5d6e87000000b003376d95da5dmr647325wrz.90.1706270508701;
        Fri, 26 Jan 2024 04:01:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ch21-20020a170906c2d500b00a317346a353sm554207ejb.123.2024.01.26.04.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 04:01:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	peter.griffin@linaro.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: samsung: exynos-sysreg: gs101-peric0 requires a clock
Date: Fri, 26 Jan 2024 13:01:45 +0100
Message-Id: <170627049274.55566.6787133378915980124.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126115517.1751971-1-andre.draszik@linaro.org>
References: <20240126115517.1751971-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Jan 2024 11:55:16 +0000, André Draszik wrote:
> ... otherwise it won't be accessible.
> 
> Update the schema to make this obvious.
> 
> 

Applied, thanks!

[1/2] dt-bindings: samsung: exynos-sysreg: gs101-peric0 requires a clock
      https://git.kernel.org/krzk/linux/c/38c9ce091a4bd0ff272438131424e98ea0e3906d
[2/2] arm64: dts: exynos: gs101: sysreg_peric0 needs a clock
      https://git.kernel.org/krzk/linux/c/ca487bc2776e6b2465fcddb0a0fc121c0ff7b118

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
