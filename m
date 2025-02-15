Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746B11A8401;
	Sat, 15 Feb 2025 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622900; cv=none; b=tPB+VnNJaaAkQ2tsboMP3vPOpwUgHMXYhtDhxN6EamaNBeiPwPmBuvnKISNm3160hMYLYVp+YxIidvYJctiETJtj0+raoY1/KfANesFezzbFs0xxJ/Ux1DtUVntyF5Sv2fC4/pt4ND9EF4h0O54kBIsloDyXecstOTxvbzCou+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622900; c=relaxed/simple;
	bh=f0+fTG9za/9bbevKQFo+26uPRWzCeT9Jd5N2XbxKmfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7OWhQ8wtUN9ftjH0RhiVURIkc6WjVgCFqnJo0qgAp431J7eUaID8j1vODLdiy56A48UmHm9ZdICkyJ74jZXZdr3WdpBekwlgWCR9/4ZfMTFsrRAvtd+tI648+wUvWd2PdmR1LJQMvyWrUvAzdmOfOcmUlO5Km3nryCSWaHgrvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4u5hKr5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4u5hKr5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43978ae8d4fso782255e9.3;
        Sat, 15 Feb 2025 04:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622897; x=1740227697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKe4QYdGATEkp08y+n3JYFYApI5cWyhfV2vUJ+ZTwQQ=;
        b=j4u5hKr5FRDuBack6HM36oZ6JXg3ghr3h8em8mEjeNUMgwVloIePDeNXkfCKU7qGpt
         qnLeojO3LUAVp7ETLq3A2HpAObMz8rg/PMvbMwKqLZlo1gdN71dWJPflMfE6Fy0UciTu
         bAW8KQxAoU4prHN2Zw22cAicqpMfM1KAEtQQaY1aVFkMIOtDaNZVmhiXumvbqP1uJcVc
         XUMLlAT38PFNTQh/FcGmsV++5jVGtmtFV7IH6Yle4aIgjOvfq+N/2rOZwFlk9sIUbPN7
         f9tYdGSyX+PbWbvHOebOWl96GIajmV1ctyZLtm0AKGWwNiylApJ1SquocFM+aTlWFZ/r
         tizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622897; x=1740227697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKe4QYdGATEkp08y+n3JYFYApI5cWyhfV2vUJ+ZTwQQ=;
        b=ToiVHBsIvzjA0aCKRB1vG3bO6WENez2n0ob5oZFcyVE591cGCCu3WyiQF9alaMSikG
         ONso41CulldE0GBU8qnj/AZak8Ji49drhgZZ+BjjutV8kgPrEt2zH1zX53jLwfPRcDRh
         zS57m6CuKQ0giIJOKuEXQAj/jBibOnBIu+O5I1rxYDM8fNVHUHsPhDdR+2TcLQjESOl9
         wtg4EkCqHunx2ttiX41VNQgto4r1B73ASE51MABXszXDBGZ44769r8cRRE6DSM5X6zmS
         +KpsS7g5GnLhCQqozLKZOctlla/3TtmnVgOc8DnnBvy9Ri5zVCIpKXAdC2HVFC3MEUBe
         rJIw==
X-Forwarded-Encrypted: i=1; AJvYcCU71d4fVyqW1NQ3znjfNpwKKSOi3hAJ1jDOPz/IgSmJwRpIggYST4rSrHdcqodTbgltp05o+wSmHFeG0Mlbv7kZDAQ=@vger.kernel.org, AJvYcCUjZrgUzx6aJep4GM5X35bWY7HNE/WI187DtT+O/F9sX9RXYO5jn1CxgA4kjpisMUy5qABqn+PSAB27@vger.kernel.org, AJvYcCX9QsRvYXcWARTYz9RNeKIOxzFAoCIAFOgSPWuO2HHN6+uwghXpZgbIBtY//LcxAH7tzht80Koa6KU68LZ1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv+DHtf4gSGg0ZhHl2iqmR5MPi4Lzlz4vId+ZjJsM3OmDspjHe
	PKJp0SVziqlrakYQvvx7d+DQN+htzWkHjiwk20F33hj8sfX/jWiu
X-Gm-Gg: ASbGncuvVxJKP/04N6cv8ZTs1O0uTY+ey+/42YkV9lG25Jgcv94e4w6BWU8Vgxv5vt4
	Y3W7spX86u178piqtF3aVlO+9p4lfpIvtvi37tBBm2J7ZQ7EaIDMCOcpnZaPxkfq7AO+CNPDFGl
	WRT2STOw8B05+GBZUWz90a4QRPKfyzUHnXAUtYXg1mG/2KoWxckl0oIJknEzUmqzECyYuo7UYDv
	EHtpwBuhWloGbIcLZObM19XkgCRwrH6ppP6c4mwas4EwBxEopUOeUGlAym0dNt53OuQBiN1xASW
	y2RlTdQl2yq++Kl2VMyiouFluSGVMPaceAov2r02hZg/MEGVJA6a7kP+uFYSaph768I=
X-Google-Smtp-Source: AGHT+IFUBWZsXU82RxSy96RoGb0/0g4JAb4YfWMt6GwiDByMiJh3slbtaSZj/gS6aBzPWbV508Vxgg==
X-Received: by 2002:a05:600c:1c94:b0:439:685e:d4c8 with SMTP id 5b1f17b1804b1-4396e6fa130mr38307765e9.15.1739622896632;
        Sat, 15 Feb 2025 04:34:56 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439615e543asm70846685e9.0.2025.02.15.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:34:56 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Sat, 15 Feb 2025 14:34:51 +0200
Message-ID: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
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

Ivaylo Ivanov (2):
  dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
  usb: dwc3: exynos: add support for Exynos2200 variant

 .../bindings/usb/samsung,exynos-dwc3.yaml         | 15 +++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                    |  9 +++++++++
 2 files changed, 24 insertions(+)

-- 
2.43.0

