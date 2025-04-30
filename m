Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B961D95A3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998125; cv=none; b=cyFuFFa9i55gyYiA638rUaIfXZ8u845dfsrzv9RW4qw0FU2ZwJ6hFLvmZSFQmQwCjIQFK46Z3F4ETLaWY2rWqGyKlEw5akRqanPOvCq+go/yLwHbWUAp5Zs5tNsHFYAx1/FlTYuXezO6Mje3G4B9FwysThuGJXQVDCrzA0POmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998125; c=relaxed/simple;
	bh=e53RMc/o+t8G5olvYD6O3vocPg/yw7s63mJC5mGlYpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iowRKfWB+fYmskWL2VgFnNJSCVmz0SwvKtl0E6KIQaOi2DHADS1ypamwb9qxLrgaH2JCLcES6R3QsKWFdVCib7UAqAtCUQXx9iAJD2cTmzCvevJSOh731QHp9qXtRpDLNyDwEq4UI+ZSvvxSee4RtRj3tDqL++5C8pKLXVjDHGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIzUx+jy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIzUx+jy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso4950905e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998122; x=1746602922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2GjBdyaKCtW3zYRYh1auVT0QVvykzGugn0sug1VEl0=;
        b=EIzUx+jySSqbuv8FRZBacpgvY6f31S4d7OtYZxxn7zg9u7aLTVDAqGCeWL4/92G5eB
         hU9cJVPHpft18eQslGTKyftmHFklemQWXzDBbwJRYGnOk56YXU0aMRS6OxPMKoFM6ZDx
         uUp4aB3B0qc2mUkdcp5E49d8KFiLL6SmyNR/DQRHSPegYM9rp+1Y69ibegsz85DodEcW
         X7Uu1QEvxeSCxuSwl8KIKqaugCsNknXye7iRqHhE/dW23sQb0avaXsEQueG0DUW3VlnM
         el/KNF2CqVJ0heDHP+Qe/aeQ++EwU9Hbeynw6AfUt/hUn8g8/M1xDnxnndGbXT559YHp
         4a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998122; x=1746602922;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2GjBdyaKCtW3zYRYh1auVT0QVvykzGugn0sug1VEl0=;
        b=ezST7hpq8rntZEIRx2rD0A7yOoTQPus5BJt15+RJrvr05WA8btoOWvdhWtJg8GyhWa
         u96TqFRjM7npo4c80FApqSWY3uI0H3q/cADPsBLGE8MTwkOj9aVOOW1XUG521/v1K2GA
         4RyrXorLqX8xEs4WbwiHULbAbg2+vhjc08cLuygLPi1WD9G+JIv/u9j7OsjN8mYw5TGn
         89SrK+/wy8rodOXXL1ZMwOZ3gF5t2jFukZmmyGH1qG+01DpPXua770rNgpWvWqsvTJYs
         Zcv8zEaXKNKsgCwDK2ov4ueUOgBG294RYV5xIBdGJDwWANySOqqXJt5L9nTd6ASCg3wD
         DEhg==
X-Gm-Message-State: AOJu0YwV8ZxByFZ1MGAnCTXuBV39m32eLxUe4WjxZ8bI/nQYhGoh4jpa
	9Qor+lt22wM8pUinKv7mLfproOS2a9/3RxvwUKdx7TqL3h71qYGr2xt6sZP2yTM=
X-Gm-Gg: ASbGncubnPAd0bZwsaW873znTJnEn5dNmrZxh1MSJE1GFe7KCAhnL4zIw0saziqWQqR
	phVLuiT0azlYBVfRjL8QffORmEYvKan3W0+jm09RgWqKeNfQrMkxIdVl5BA8hiKLN2BcIhU8hIs
	XDNBb338cNSeMJiYtk1wd0qau6JZSxaLo37bx6+D6W2TNlk+o21YN885hcc2SxMrAvilrbPFsup
	FTPtJT/1KGNYNnp33gq86UPae0snYxKJOH4MOwK5V+PkIiyaOgL/nTNLmbxX6Der0L4ApvhjANC
	RW9K4+gM6e+HVSeLpvEXCF7IW9kaOoDR5L5qtrbKvy42RcD6CiBom9EQVSE=
X-Google-Smtp-Source: AGHT+IGwTtEZNxfD7gnxZYy8bdkJG1uCnoJXegRtohIUB9oy12vNvD806a9awgtKzyXNxJJUksNc/A==
X-Received: by 2002:a05:600c:46c5:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-441b2dea5cbmr3804325e9.4.1745998122329;
        Wed, 30 Apr 2025 00:28:42 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-4-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20@epcas2p1.samsung.com>
 <20250428113517.426987-4-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 3/4] clk: samsung: exynosautov920: Fix
 incorrect CLKS_NR_CPUCL0 definition
Message-Id: <174599812090.45412.3776257923926441199.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 20:35:16 +0900, Shin Son wrote:
> The CLKS_NR_CPUCL0 macro was incorrectly defined based on a wrong clock ID.
> It mistakenly referenced CLK_DOUT_CLUSTER0_PERIPHCLK, which corresponds to
> a cluster peripheral clock, not the last clock ID for CPUCL0 as intended.
> 
> This patch corrects the definition to use CLK_DOUT_CPUCL0_NOCP + 1,
> properly matching the last clock ID for CPUCL0 as intended.
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition
      https://git.kernel.org/krzk/linux/c/f00aef8e2ee0b642abdb91682bec5af38532faf7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

