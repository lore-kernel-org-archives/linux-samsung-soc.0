Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142EE2D9EE7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943361; cv=none; b=r0eBcWkVoWtWxURPbuWq/1rdll/9I0uYpvPcsyP3BW4A4TvCsYDwpZFJRBgi5qcbrSqqcGTl8vG74AYMk2Xn9RzEYOBGtSxc1wuTlS48xkOeMoTA4f2hAsC/xMSSQg1jYY89RVeNXj6F4ykoJdxBm8mJErmHaxEOEb/tkcGaPi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943361; c=relaxed/simple;
	bh=Guy/Wn6qWPXOWpR+qBL2zJhf1WK3pLxtBayRj8tlDZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oFvwx/DkeT15xyRPnnJYHFwCenLanTrBOiONNB0dgo5+X3i/NoSx8FVNLziJo2MaEALROemhhbeB//Yi5Ov4N5gWnvGgRNMdcvFL+s31D1fo6p5FcLIJpUvobb1wzGgoMq/tjS0LXOojyY0TF9BTYzh/sZcY9xFVMJ8Fb0YxPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4voWSlj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4voWSlj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b43a3b1ae1fso105158366b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Oct 2025 23:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943357; x=1761548157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnPFmndDgQ5IwJj7APl0bxqe2uCJD2IB3khq/qdk9Cc=;
        b=V4voWSljIe0l0Fu9YOB3FvMObA0AxXsL4rhAbhIZwmtwfLUiBfJMdQ+qAJA9niCnfv
         +93flgq35FPdkFWiTp1p3UKdnCjEBr7JuRCkq+C9/YbrBoIzWZfPON9HQb3lDpkTaKa9
         8g6kMKSF4q6id2Xa8sgnR2X+ZzhawhRgpeVGdPxW1+fGlxch6BUGhmw5b0KYsJZKMq1B
         oeKowRa9Be7mZTFZfRcIqea5wZXjAZmC46BOy123Sw/IWxJHgHGD9fAg1HVGmjzayzid
         HpBxBh+yCtBcW+2IAIxkyi1dJq/8SIwT+q+B9wPPesRd+IslvZyAMC+bhc8XYxsMBmaC
         75FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943357; x=1761548157;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnPFmndDgQ5IwJj7APl0bxqe2uCJD2IB3khq/qdk9Cc=;
        b=d997wHVYjStcfFBMekSTN5yci1S4jNNBMGHfiXLz2Y/nTif0+cDUkofjoeFXf4lf8E
         iqeqHvaLsuLOuzKtPvkPbFP/8OqZ9crkRl94tr66hlFM1xEANReI2RJzaM/ofMBPYhUl
         /OYqGXL4XN9k0nXF8i0j0JgrHOk+etpvWJgLP115UDL6/zOkcwq0i2zyrTHqPAu7MWzf
         KhV/kcW73NCFzw74rFVbhJBXZeaxczSl+bFQ/JHHm9nWnLj9Rs7tlL2///JFjpZEHSJO
         8SGrAFiQ0i1HzujSmbj8aKpyXBk3nNliQk3DBU9qJfvxC3iNpYHK5B6Fl8Y+DcwL86P4
         ziCg==
X-Forwarded-Encrypted: i=1; AJvYcCVhPH+G3PRsSiQ0qdszmn0nYvLUbKaM8CScvW73lOXNFQUqmaOze8E++cTSWbI9AEITPabUmoNMeVLln8COp80MMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpgqmBI7hMBLERg9KQ+I5vCcM2/LRFXEp2SFYusVLEb/RPv9r1
	Btiz/s74DI98ih7hAjajIB25OjIjTzfaL1jQ21e2dQiWlRq9WoDWTy7Ew51IeVef2aE=
X-Gm-Gg: ASbGnctPPxjSn63blIsoTdJ0owEB/ERIlWwpn9u+mEg87Q3EiPaorZsW+0KGhvnj9Vg
	rvGpVJOqmuL4R/ad16eirN/nKiQH7sEkDsygfLOScc13ozh3jlUZd4Yw1nIObmHxXBxQlMN11Me
	Pzwp0awn7c3YCVsqNpu+kllVGXpmS2lrT998LyZLb8oXXr24fUCKYFlDxe4ppbaaZZx5KxCF4YG
	/OWNKfu4x5ssWqcGkA0aX5B6xm/KQeVumYIHATfAXviZAF8XTnbV6TVH3A8IBwEiG4R6ZJcce55
	TfhCEiBg01PyVknGZ4aSoIZJkMRRgjcmn0C7TQ6qI8C30haT8lm95roJUGw4BSss2LR2TFNZqH1
	fXYnxmdwjDyU0KcM6jZ/xOctamTbyJEwFkuoZAnm2lAZVJSFXNjx4gfKb9aTBEeeVKqMWpfa3tk
	IRXuQAjx6zBaC5KdYe
X-Google-Smtp-Source: AGHT+IGM6LazFp2mSfgZ9xBnbGP6M9hpAAYO7X9ryVeCtJlSZaxmstc5s6rhO0igzS0nmtIalIlyNg==
X-Received: by 2002:a17:906:7312:b0:b3f:331a:a98c with SMTP id a640c23a62f3a-b6472c64be8mr763154366b.4.1760943357324;
        Sun, 19 Oct 2025 23:55:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock
 driver
Message-Id: <176094335539.18498.16396321408282036378.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:34 +0000, Tudor Ambarus wrote:
> Add the Exynos ACPM clock driver. It provides support for clocks that
> are controlled by firmware that implements the ACPM interface.
> 
> 

Applied, thanks!

[4/6] clk: samsung: add Exynos ACPM clock driver
      https://git.kernel.org/krzk/linux/c/40498a74205371400a5b0088acb886ac47a523aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

