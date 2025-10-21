Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA08351FBE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074835; cv=none; b=GpR4ets+DTaBDgcaKw+x92HuIq04RQxs4xRuImOe2uePssg9UIqdTapP62S6kf8fhoWOGJ7RdrMm8jg4rbuYQaV6oMG4LYsBGCDbCMxyMegypVc8sknBLhwYdgNw87K8/bz/EBzu1+pN4DUmr87HG7yZuoSR+A3wBqPmu+piMwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074835; c=relaxed/simple;
	bh=80lKMAyCvwagR5exBQfzbE8bJPhC05JQJ4q2PDAq1Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f5Tp3Clv5CCOnVOft4tVVlSSd1HaeuFZwRGxjUqcu9B+fi/vKNCZFPodbbbSeGTJz/l2j3038U+SNl92VT98wiTxWWc+Ygesz0YTtT9FqqcdkZZyJ8nxAvj8nzxVKZpCYiFpnu6VCZ66+3Vi2qXGNUZ8K8rMku32X/P7wPs0CAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOoe/dQO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOoe/dQO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426da8090b0so712364f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074830; x=1761679630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5/SqlA3X/ZkVhbqceO5ccBn+9e7HcyK50UX+eusqGE=;
        b=sOoe/dQOi1vedCzQnCcKxUCDdZiKcemRWrNDPq7LUBVYGMz4kBCumvHqA0IMi3IZIG
         wAxXCAxmeIoBRzRmc/sbw2BKbiByqz/3smmLq24lskpjsf9e9jc/HyB1eU8FPdTiY2K4
         PuTJUBLrNtov0qKXUSvBwGKGZIRETxr7jNESYv91xec1cP5tUz0jBBUnI5oCJVVBgk9W
         eEcZSxv/eoxH8zgYKHDbDmV/38DrlFhziaccDlNf+jKP8kAL/vU9N877uvCPnQPARlPC
         ByJcwneih89fRUxzT/FqEXzBR+jUGJ3l5n4XDEbGx5sNgvGCJVOKaB5terYi6LA7RbB6
         PR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074830; x=1761679630;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5/SqlA3X/ZkVhbqceO5ccBn+9e7HcyK50UX+eusqGE=;
        b=hkttbYSPJ0+2kQTeP1/xSMwyhnIjc4+VHg69f43a/hNILs7O3u4Hs9j95voy0vcobU
         PEwtftkKZCojBOJEiVGFTbeRTgrx4ecDUyLo0hlSLkEWFtG2VJ3Ak23ImvKzMjlVW8qp
         UBJKqoR29WKLgy6KhymXk+KfHoHiMe+kQaN5MR/VimPBrX3dFsZawJlkEeSrtd4w8uz3
         mzzfF5jZNi2w9Cg2CyJWkQH97TEaTIeweybuShc+HvXrl+JAYO5B3FvAp1Vbg/9kTOYW
         kPuYNbvpkjm9DMts0icP2QlYFESWdqlbLdAUKXAJoH5dPPo4YUs05oYc4j3QxFCQZqfF
         c/yw==
X-Forwarded-Encrypted: i=1; AJvYcCWOxRsfCly3te11yRYRMfgnn9NyJhcn11wbxGlf9+3qazQGvA1lV2JETb1s1JJb4FKddvP3gyJWtUg6V6TQ2pO/lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRvLIUOxF9GK/MmHI4jmEyxBu/RS7NaHff0sMoio5bko0lkaic
	z97AeS2C2o/Rcr5pLiBs+g5var+pdlj/g/npVHn9D37r1EeNwMg77V0hkmZxZO1x1lc=
X-Gm-Gg: ASbGncvW4bgI3E21lrVn/7Y2bSU4+RkLcFM96uSwVI2o6iIv8KRgt2ODojmj2k9gvju
	sy6YGYCv6aVkcNgr60J2hlC7PgjKmgut9SXeB2el05o5UM1s/DpKauMVbuvf2DxlKw7EKtiQNkU
	T62STqBZAge12Dbp2uXlV75JCrauLb6JUs6DTeTFX2/k6ngOSOiT3NbcKGX53jOJSjVSrDmgh+W
	SIPx+3W7VqszZJbylpTWAFFkQPcsYTuQBJgCIYLDoErnIrHJntwuyc6jhCql8Rs24YVrkcCK+n1
	QMJ60SI1/3oXOJYlkfaC4f1E07tXLIzM3OZn43Oq26jyj0E2m/WfcWzRSrolULpMwgHANWxoZYy
	yQNclUiHTsuSCucQtxopTDOSp2+RAJHpbAcaHa3zowz3QGzQrhCh0NEhXlt2F+sMFEXcurK604w
	jpcLAJALk2tPTJhpxgbBQVIwPDV7I=
X-Google-Smtp-Source: AGHT+IGAOoUW0XD9+qwwI+PbL9VG+MrdXs4rR2dEuVGyu8dEGa1T5rx/ZK+RB3yRzWux75q9C21zPw==
X-Received: by 2002:a05:600c:3b9d:b0:46e:5cb5:8ca2 with SMTP id 5b1f17b1804b1-474942bf7b2mr23336545e9.2.1761074830178;
        Tue, 21 Oct 2025 12:27:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 4/9] arm64: dts: exynos: gs101: fix clock
 module unit reg sizes
Message-Id: <176107482865.33931.12362645662957210185.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 21:51:33 +0100, Peter Griffin wrote:
> The memory map lists each clock module unit as having a size of
> 0x10000. Additionally there are some undocumented registers in this region
> that need to be used for automatic clock gating mode. Some of those
> registers also need to be saved/restored on suspend & resume.
> 
> 

Applied, thanks!

[4/9] arm64: dts: exynos: gs101: fix clock module unit reg sizes
      https://git.kernel.org/krzk/linux/c/ddb2a16804d005a96e8b5ffc0925e2f5bff65767

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

