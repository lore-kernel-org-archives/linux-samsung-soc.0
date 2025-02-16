Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3EA18DB22
	for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739703592; cv=none; b=oEHWGPgjjseqYACohjrCsgd/lSDVgnfq5MNzRUsGQVBmfXwrOk8jOo1gefrfkdm/Th2/s/PbvQ9C6QCmN9kDPCUvHcCJYWLehL2l08KqiX6lThtyUG/vvziHrzUEn1/ym1jUPskyyM7DlYH5d5gbWZS3jHE61NGzbQyHpfp4hnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739703592; c=relaxed/simple;
	bh=Tplj+Tt8O0+ujUEM8C8Kdrv030eW3cyPPKhRugB/xgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l80JnrF8oFbgdgjwIi03QEOroHSFmj7/gU80cGh55vCmNOz4eG9EmnjwJM/QppbceWJIJrxYmHpeX2KbfEAH4KP2MfZKwS6Nl7I7LjaaBQ6f5wbiRFdtfSMV+IdD906B0gAsw/+5/p0yyTWQongSiFYJwDojXtFjfRutrNi41oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BoKTQZBD; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoKTQZBD"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abad214f9c9so30133666b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2025 02:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739703588; x=1740308388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+isfF1av2MEN7dZuPePQNIg6D59LIEPS+5Xwxezxio=;
        b=BoKTQZBDP9UYQHGw7Mg8MdqRHEMUzhRChpjsKd8P4wOKmaoAgrXD4naVB0/xEvcL4n
         35oih7HNBJGUe7RHLcwdc58tl5QXFH3Pa0VCy3IIDyfJSBcqRw0tc+L2i5QoTCAr3Zgq
         iHQbQaAxaeXowXMh9Bgu/RR3wSIB3CSr0YH8PswEJK8FrJ8Bmu0Ber7jxOpHssxWxCeB
         2TsPXSSyswLjknZFJMPspWCg4LcZd8OjOJAHR2O79HccP2ubVSAxaKgPG46nkG/eWpdO
         JLge8CzJch4zV0zFuurzccPZFo1KW59wdyb/TEfROZJj3EH1yykfGubq+xyZlOiAcm8R
         QBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739703588; x=1740308388;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+isfF1av2MEN7dZuPePQNIg6D59LIEPS+5Xwxezxio=;
        b=RNA3sES4guLzTEeEzJc/qL35yg6cqgFbBCYIODn1ITNL4v0AjOBnxq+wW7nBJEjnKv
         AOXrARB7/QcJnUUrM/PhUCHXTdBxVXCTeSnA/bsUJATdKPnxRfxUbfyyoa8pc2T+SWIb
         cT+lbmKwx1PCoYVWAwT9tvj1FHL8HER0C3VSdp5pe0NM+xjKC3ZowmJnejo12T6dhI2L
         TCGqvIFfvzW9PnXj+jTzHAhWZrGbc8nmfKcJ1+KNo5wSWT7HuO0C0gySp8KkMWOcqIAq
         EI1JwyxCmQPtBJmTuD1qozVKKsfExLBu87hGRR+rql6DOwU9e1aOmSpbT0s+NvaLP0lD
         IJRw==
X-Forwarded-Encrypted: i=1; AJvYcCURBXBdjKEdP1sYv9NQdK2LkNqFAAL9Fz7GDMS7j5dNVU3xYoBPfug4h+wFIjAOUmrrjVuE668gSEpWJ4MIIm1nYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQE49fmaYwwlyZ0q3t7UEwAnohLOeMmu8uiyq4UhmmH49n50O
	Rs0npq5g939hd3t4E7bTDu/vadqiGvw0X1WH4HhFhIb5JMNSN4QRs7PMHW3YxTg=
X-Gm-Gg: ASbGncub+dfXiuTFyHMOBdw5ytlb78oUh+TQOPsUhrunTYwQ7Q3YybC0p9AGmNh1mpF
	nIB8Jzbjp7oiQXBCP0U1+Zc30kY0lfJySuv2ypF0rqCMRco3sn60VoS/yINyaMNp+Zj6jkgPWtJ
	la+Lc77IpFq55aNpduSG3xvpeBERxlxaxl+IWlOmDC/18pxA2ucR2n+AXx1T3aLlROXYt7GW8O8
	1EDuNvT/ssnbTQ/Cw5sFBJkuc6GnbHdpJY5YmnBRUeoAlaeNR3zoysPL9cM/gMH3UOp/k8K1ePT
	g0llWoC/vrn5IkCpIsM9apnO/cVaSNM=
X-Google-Smtp-Source: AGHT+IFXNLvXjNtIwPOLaCkCItusmH2cRIwO8DowYwkSiG5W1dJqPaqeLLtJQtE9GmDO3bjyfv9zLQ==
X-Received: by 2002:a17:907:d8b:b0:aa6:6792:8bce with SMTP id a640c23a62f3a-abb709319d6mr218340366b.3.1739703587756;
        Sun, 16 Feb 2025 02:59:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6f13b11esm310849266b.71.2025.02.16.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 02:59:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
Subject: Re: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
Message-Id: <173970358595.40124.3478053371340167838.b4-ty@linaro.org>
Date: Sun, 16 Feb 2025 11:59:45 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 07 Feb 2025 15:56:42 +0000, Tudor Ambarus wrote:
> Define SRAM, mailbox and ACPM protocol in device tree.
> Enable the mailbox and ACPM protocol in defconfig.
> 
> Bindings for google,gs101-acpm-ipc are proposed at:
> Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4
> 
> Changes in v4:
> - rebase on top of v6.14-rc1.
> - describe in the cover letter where are the ACPM bindings.
> - Link to v3: https://lore.kernel.org/r/20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: exynos: gs101: add SRAM node
      https://git.kernel.org/krzk/linux/c/48e7821b2690428a40d16567b2fd3784591f36b3
[2/4] arm64: dts: exynos: gs101: add AP to APM mailbox node
      https://git.kernel.org/krzk/linux/c/23159ccf60026f9c510bcc422f75b2a74af79f20
[3/4] arm64: dts: exynos: gs101: add ACPM protocol node
      https://git.kernel.org/krzk/linux/c/f64fdd3c592dfb45d9c2be4b2506230467ebd27a
[4/4] arm64: defconfig: enable ACPM protocol and Exynos mailbox
      https://git.kernel.org/krzk/linux/c/8ba2c48394d4f9291d2fa3e108bbb192ac0e5f32

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

