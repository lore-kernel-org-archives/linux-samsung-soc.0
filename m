Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45F1C84AB;
	Sat, 15 Feb 2025 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739618854; cv=none; b=Vf5Kby0RlfrOKCfs4ONeAMtTDBYkT7CsVJZVZYNIH/xRYQ5XJM9Jcy8D+LWESfQDX8abLZO8gh3gDp9s384r/LGU70iwQS/HAv6VIs3C3orCBlirWi743Bxxg+CnUG0SgpHWVoJQ0otVA21K8mqmtYAdPYWq4D1ZKgXwcyaXoYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739618854; c=relaxed/simple;
	bh=z+xM18OleGA+5ueD7UggFmdimFCDHSF8tAGHutwYlSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bD6ECDDN0L0xulPEQyuN00C/kSoP7CYeXK8tCEvBobN+/pBfd/0FR0En9bR0QBLvFnWOn52l6QsZk/z9EFMi0JDib2KY24/SYRdvhvujdibwSXwNS3cqXy/9SUEDCn77/YERStitj4YzzifMXNGVWzqNli0iAeKNO7WMpTh2j9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hqk1Uo6g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hqk1Uo6g"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2456848f8f.0;
        Sat, 15 Feb 2025 03:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618851; x=1740223651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQN/bMgjVGfwRUkyGr0NCKJga9lw/it44spHsjm1iCc=;
        b=Hqk1Uo6gnXrktGaVquyYykeN4uid4HgLDaO8cp3CU4JZ1i8VM5Trymhq8l9ZNkV8hB
         ZU1Py7AEDIClKNj6WM/PBIq2X8hhCp12bhxTPWNpot+LLeArcP9oGexSBGs3g3EE94Zn
         cOMjz9gpaFIqShUSSUNfa+dMWKPLutMq1B5ppATbGehJ/e5FkPo2TTPsPbkFn/VBNfWx
         3Q8abL/AXcwqSNU/4KT0sQ9X7PBgEq5rh8GRKb07e+2F1VuarV6XlbqU2vsUfilV51ox
         s7uW1vnTEKVSGQjNlB8mOmMNlyRWcTXvGi5RnvSrnmEn0L+cwJLj2/OfWuhlmaEmYlqj
         H6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618851; x=1740223651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQN/bMgjVGfwRUkyGr0NCKJga9lw/it44spHsjm1iCc=;
        b=QOYnxi5A2IikJltOb9F1dPfTOTXOliJYwsa+7LuOpfXuirJDJ3HVarTbZkLZ390jxk
         nVlMDNFcP4L8Nv+eOdnC/KKVywQtUcOT4S1d4sCy7Ud3n3pDUbrk3kVX4lLJGe50IJUj
         zJYDukH2Xm11ILADbOjwKZU3pmm9KFKUVdjcHwPJJDuns4N0TRBAJGVvWsBedRxvgQO3
         4tvzP/qFlbGtsmIEKZ8olEcm6sHW/b9ALmd6C1U7fIg/ZLw8fd8rqVklSc6E/Ve3SL6u
         WbzjrElA9us2/Bw0LAmWNqOsDpm5nzIa4gwGoHjQTvt0LwEqP/HTO3N+Li6MphVOJEAc
         WbOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvApjg3TpfMwuJnIObpJ3sVZjJnN/pJtYeo6wIIEBFkgLuFbLrLvja89IelwlhCeDQnt7XmEfCt6mi@vger.kernel.org, AJvYcCXJdwmFrJckey2707WfGhXc0+VvIGmMLnNK8OSSZNroMLXqmrYaCnJHn3FjOEC414kKKP65MQECQyZCfihj@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ3Ft2PI3pjO8xAW8Vw1vJbntcCl/MtZGxPRgtOppbOWRQW+8u
	33VKbSRRj0v4NxWCxQ5lGU0Z7UJUgBYG2Z3y5SfTlixVFhL37+vM
X-Gm-Gg: ASbGncvy4puSUP5d4yISN2tqrq8htgAotF1OWwyH5OZsbe8curWQ6MbwC4t95sBNQSd
	81r1LMTroYah8TyIaLEz6aywFLZeUscBzCFO6IptSV+z1vYkqgB1rXGcczYJXmdVezkLDep5Fw5
	4bmk7udVmkGlevEqrRSx3PxdkBsTzg83mvrPYsmcDGfRMjnBb3ZAnqjyXjpQXE0Sdg5lDviwY9e
	qIurgvm5GwpGNtuVGlaBgqX8oJyhMllcOIPvQs5MLm0OQ2rZ7w142ax+t1U6sbLCIjnD58S1iCC
	z8RuzQCUJrBN59ryBu6WVwPhbpmjwGSZYO5QSv5+IqcsCJsoiQ8F5aRIFgb7JuLJm0g=
X-Google-Smtp-Source: AGHT+IFg4nTLIznOmcCMhlH+TnSI8qUzjkBmAfYef1pfpNZSAHDfsvS8VTnrtO0ZfrE4sW8fKQtgEA==
X-Received: by 2002:a05:6000:1fa2:b0:38d:c74f:4234 with SMTP id ffacd0b85a97d-38f33c312dfmr2410960f8f.29.1739618850817;
        Sat, 15 Feb 2025 03:27:30 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:29 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] soc: samsung: exynos-chipid: add exynos2200 SoC support
Date: Sat, 15 Feb 2025 13:27:16 +0200
Message-ID: <20250215112716.159110-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EXYNOS2200 information to soc_ids tables. This SoC product id
is "0xE9925000".

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index e37dde1fb..855bd2a75 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -56,6 +56,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
 	/* Compatible with: samsung,exynos850-chipid */
+	{ "EXYNOS2200", 0xE9925000 },
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
-- 
2.43.0

