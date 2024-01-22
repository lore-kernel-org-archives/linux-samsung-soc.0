Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC33266AB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920086; cv=none; b=Dv+SG8ByB5MZMtgWvy5npPsJZsviuSJ9P1JkvRvSNk2jtiCVL4P8BSRmX7jkgotuyBKNN2JDT57/+Rmdqrp2ZeRvf8BuASBDjyMkHMuQr4dJG2vZ6p95rc9poJWRgLvjmLZfyUBiwfoT4Dtc3KNEdSwB/4AExk3bNr6mjsBcfTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920086; c=relaxed/simple;
	bh=HZ0Hdg/F68IPYAxwGbTZxdDbtscFYuGai9J7k/bcoEo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XEr1aVGYg2yGUp7/cl9sYK7rZnnOHkPqhMcqNBM3Plh/zmknB4MDEsmEXVv7PpF1tmVwYGSU5/09jOfDEPNHtPVW0Dky6AZRi7+dGnW7NIaiP8EqQcsUzBWp3Vc2v+4TJD3O84lvXVSC7vrqy1LJFmAJICK1Uftwlc6yWCOqcFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8uwKABG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8uwKABG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e86a9fbd9so33517085e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 02:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705920082; x=1706524882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJBEU9hHJcfzWOiHAuwhZ3FGFs6n9fqS4Ii6C+nRlzU=;
        b=Z8uwKABGOicDo2gIUJJG6UDuqdfLX/HOwze7vvb5eBEh9LsyFpodxnrd1nk/Ct6akW
         /GEY8AZKC4isW9BjGtlwvzLZ7XIYTOqgASSht2nnuJ4kPhsW1mU+j+/z04VFHh6QdXW+
         2evjzBiP3SHkOHSB0ZNgllM509UD2qJy0ZLIZuXkUip/NpIMaJ9qJTfHDj3prZl0EW4t
         yR6FfPAxWAqOUuNfJZZ88JY6kXi0N4kEkuFqbGduj3+vy4w0J+qJQ9hfSGf4NKOlO8oi
         RmBmLknFf3DNVWF82HcmZ21Uec5JDkEuP8npkYzDK/rEOAkyKc/P6fKugmtN+LGttP/X
         FlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920082; x=1706524882;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJBEU9hHJcfzWOiHAuwhZ3FGFs6n9fqS4Ii6C+nRlzU=;
        b=vzDsOFfjitHlvb1ASN0U7DEepm9YCtnC8ITpU2VHigInKCcGoitFyubVy51g/tkQ5X
         dsJnm2S/rUMsmQISsA9NBHwelti7kTOikmsqN1MOcapBg1zLHmMnWDDWy1VLRME5bw7A
         XAp39KTA4blRkJXLqecPuYgFMtTlH8Zk8iGdfKd157RSOReGd6ULFtF/O+djx0LtSIaG
         fNV14YaM2Na7tFPAaS4QxsfAnMOQ/mPz9o7co2utgBaBBzyvfyZiLCRwyukPPN6Q7WrB
         SGYhx1YKD/Bjj3h3UgiHgqAY53JFizhZokqZuaOttYEV2ef/8J30tOhWBU6BBSQh5Oo8
         6fWg==
X-Gm-Message-State: AOJu0YyYDVyrcpEupOh6Qoo+n1VjIV/gLBDBculGcLd386/J3Qdv+zEi
	VzebZXteeJ0N1Sd/LQZpyvqOmv20owO6oBIDzLbvms4l0tgxQ3BEC0UUCZM3hVs=
X-Google-Smtp-Source: AGHT+IHIKMd1D6GufkmdDAUEkH6X9Zo/gAkdVkY6970R1/IWSOsKtCHbix6qN81ySf5gXV1iFmui+w==
X-Received: by 2002:a05:600c:4286:b0:40e:596a:985b with SMTP id v6-20020a05600c428600b0040e596a985bmr2207230wmc.160.1705920082126;
        Mon, 22 Jan 2024 02:41:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b0040e86fbd772sm20129483wmb.38.2024.01.22.02.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:41:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
 peter.griffin@linaro.org, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
 cw00.choi@samsung.com, semen.protsenko@linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
 kernel-team@android.com, willmcvicker@google.com
In-Reply-To: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
References: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
Subject: Re: [PATCH v2 0/3] GS101: rename cmu_misc clock-names
Message-Id: <170592008004.38238.17769921542052483911.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 11:41:20 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Tue, 09 Jan 2024 11:49:05 +0000, Tudor Ambarus wrote:
> Rename the cmu_misc clock-names to just "bus" and "sss" because
> naming is local to the module, so cmu_misc is implied. As the bindings
> and the device tree have not made a release yet (v6.8), comply with the
> renamed clocks in the device tree and the clock driver.
> 
> The patch set is expected to be queued through Krzysztof's tree as he
> was the one that queued all the previous gs101 patches.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: gs101: rename cmu_misc clock-names
      https://git.kernel.org/krzk/linux/c/1755c4b0372a2cf1e7124956b8cfebcb51083208
[2/3] arm64: dts: exynos: gs101: comply with the new cmu_misc clock names
      https://git.kernel.org/krzk/linux/c/80c86ff6800b857c8008cebe7b8d22a6e574e68d
[3/3] clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names
      https://git.kernel.org/krzk/linux/c/d76c762e7ee04af79e1c127422e0bbcb5f123018

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

