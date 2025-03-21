Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4578F44;
	Fri, 21 Mar 2025 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568490; cv=none; b=MEgM6oMa5k8MI4/9aA3St59YvCarGrb3lINEY8dpJ8bu7SQwyZTH7aBbsKKxKmNNOjLTL7021uFGJR+iS7E8r+ResZBTKh/4GlkFmXj1BszU3g5bFwUspFqeYDtUjHM05Gvj7pxazDNxf/BH9DaqY+0E81b1e7/GArc3W4x5JG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568490; c=relaxed/simple;
	bh=t3fDjgF3ceIQsaADOh2IiEkthEMpZFM/HyWawVv7I6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dsbn2zWEyVIelwTAJHSdQBYUgb69+Ol4Zp2/mLtT5Ia/igMV9Slk/Ou/DvlFOMUZ6jMlEdcOE7uCxWyUpk1aL1fOTKS4yF1nfztZ70my7dV16pBBIkLQ6HlSxZUyI00FEPbBurKGTCcb+VvemF2vVe+xRqs2hGf88gwqTyP0qbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbnFS9Dy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbnFS9Dy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390cf7458f5so1546114f8f.2;
        Fri, 21 Mar 2025 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568487; x=1743173287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwi3wAIpyCTSApBj4aSaPLa/2MoFwC9M++68JcsFwCQ=;
        b=YbnFS9DyqL3UVcg0L+4c98binUIsm4IpmlVXo21o9M6Er9rF/TdM3lQ/S3LhLzR5mz
         qwB7yyVOcbSBFc+8hA9R0AUW4czQHxSR2U+mq9eGCgYuWne2r3RjfSe8ffSbu55F7TOu
         BLO5EcDTs+TNbGEzNcdU2KhzvZoVe5q2XrkOnV8PpvmS4RyJBOHWj+WSgLkLeA8NZBrE
         vHUsXKxcBZe81CS13j0ExSy2ZP+0DkU1TtbTlYMP4z7t1ynzm6xW1uGAGv0M6YAc9fX3
         id4PsM0mzzVIzn0XhutfkYohSfC0R77AHHTEsxqSEtcAgt25FlF7Cm8IidqqwDNpbrvm
         KHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568487; x=1743173287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwi3wAIpyCTSApBj4aSaPLa/2MoFwC9M++68JcsFwCQ=;
        b=jckYM+Gf/Rqv4pwJZdWP8S+fTvThgTGPBvUCiUa2xG10GHEyRpLIkOWYTYilXxeu7L
         VwPMT22bcnV2xc2pwJp92eImVr8EnNVzFLc3OsM/WFnJgG5BnjHDgV2P7c1vsAvDqprB
         8OSC6hbGg2XjQS0tBjczXf1rhlxkayTTcQ5Re3QpbCD8JoTP0afdXdidem8jPTTmJEvc
         zqs5fhBSHTDWC86JkdzzaXQEkBa+h7GMjNEfc0zzPoLGh9RGngxShCdA6ObBfd6ToyAr
         gdh0eScKNn4iEEHFHiPBXtQZpF7qUr+XjSPWSrdgJvRStegSvKv0RbcQeRoqWhh8WqN1
         Ab/A==
X-Forwarded-Encrypted: i=1; AJvYcCUbfaYcsibndJuVfAHC/gnOhwvEMhZbToBIrsz8CR6TEpqWB+vqtyaHz/qZrk3zzbEOiygZ8lKVMAVOtGE=@vger.kernel.org, AJvYcCVSZVEiQIqeALG6NDoM38YFo3Hvp4fT1+S/qrZ3HY33wHugcJbCmIRzzuOeb00dAx5Jm49mnSZcwFtn@vger.kernel.org, AJvYcCWV8NSkdNCTgyyDPeKH1MOE2tijvLYV4g6me19AkaIAdMz2uATx6NWLjTPFoCdaYmrktWkXkCOc9juzbFy1vJGdJ0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PZd4GkR/zKgoR4HX0QDoCLvdykwbAp4nxigmuP1Jtm6KMHHu
	HgXjToelnZZVdBOoCYhHawdCDdeZVawHtMTLvo1IV7BM7ZJ6AeT6Ar0QsQ==
X-Gm-Gg: ASbGnct7/yhzsANGiynNVXMw2GQXV5FUaSYgy8Q0pIPTOR1JvkPaeMIA+oVAbQ9P+be
	iiUV7ba+Y3s/CQeHuMZ4oNjR8y1UysQgGDFCaqhEYp6aZZAdpYpu8p+CP+OCjzRb18Ql1Z3LToQ
	xw47b0f7PQEoYGKY1K83Z6nXct46V3lB5LZ8DlWoolfcnoG/nh1ufAtDUT+F9lhHcGp9I7f5v7/
	o5uKIAXLLd1fazDc0sJEhNO6jLpSQj19Wl8D/aaTP38YY7NFu98JPE/YCrLwzqhOQFqVEIDiCX/
	l7ZCDmEShIQiOTkeTVzJ90WQAIF1sKKvgRnSoJypawGlAihNN00tpyiTWRMEGSvNm3SOx0rjR4Z
	U5aiE6MKexTUc16HI5dcumHkbjdd5Zvg=
X-Google-Smtp-Source: AGHT+IG9ozHnjVC76ueR/+PL/g8GBD50uBvVPNeNxV965xi/LKWBDRHMHz2jEIzfTLpWAF7nbTflmg==
X-Received: by 2002:a05:6000:1f8d:b0:390:ee34:228b with SMTP id ffacd0b85a97d-3997f910522mr2973972f8f.24.1742568487046;
        Fri, 21 Mar 2025 07:48:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm2533851f8f.45.2025.03.21.07.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:48:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 0/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Fri, 21 Mar 2025 16:48:01 +0200
Message-ID: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for the Exynos 2200 to the exynos-dwc3 glue
code. It takes one clock - the link_aclk, and the dwc3 refclk is passed
to the dwc3 subnode, as with gs101.

Best regards,
Ivaylo

Changes in v3:
- fix partial r-b tag from the dt bindings commit message

Changes in v2:
- add sob and r-b tags
- drop minitems from binding patch

Ivaylo Ivanov (2):
  dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
  usb: dwc3: exynos: add support for Exynos2200 variant

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.43.0

