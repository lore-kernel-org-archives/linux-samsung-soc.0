Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5BF1EEA31
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757849389; cv=none; b=AH8QJqPzdhamRZJCvb/TTZNf6aPme5z+uUM9Q+vSakrZVOnw/AUomBxv1BAxNXfhTp/xQXbnex1ENFMtdxh8V3ssZR6+wKyDj15uIMjcmM6AkBnQZm54KLUPK/hs+qWYYJnd0f2Iy1LAL2qZzc88C3TEN8bZlZR2R43ix0lijlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757849389; c=relaxed/simple;
	bh=xuFUrF1BkPaf8V6YIQBV/bE6ge9X1wiG25AtdgcH77w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3N2uzXxYjF6+wrb9HSH61jhUFntbhN+5p67emdVuqQoxbUljr+gp1kf1T0beuVbZGmRx1/30nFjO+MVEWPv6m7lyIOvF3hGzBVrr+Cfe9WkPJ/ghW1zVo2CwrNd47i/WNZXLXL4BBs960cwfYQg1Zv7ZBwseezva/Qi459lEV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSMsimik; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSMsimik"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3df2f4aedc7so2145230f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757849386; x=1758454186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJlWH2NF0uAVXDd2hOjwwBf+YceXcdwvPtJB2tgstmQ=;
        b=MSMsimik3nAQbfJi3WCobT1zr7ptWR9ato7h0yPAy5yQQZuXiwAje9HtkIMbyVrebF
         LtSzDIOQFpB+LrIrxtQI3K9PsRKw9KfJJxI6jAspQjiDIOlCIGWAJXVo1nbgEFyMe1y6
         Ww4CUOJKJa/oCyixGsWfb9wr75yftsgtDr0oBzESdJeIDl5i4DhSGBVw2EPkp9+vcxR1
         hvyWfPdDrQb+pU5ppwaYSLJDQ9rn0fTajq82MpqSuL1qqG3KKKCUoBuYOQs103FhWadu
         y8w0JWMrB8Z/ao1mvMfmINZH4yF+OARw9TowkUX5njWkAVJlovTiD3T+CmSvYbwOLuj4
         y5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757849386; x=1758454186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJlWH2NF0uAVXDd2hOjwwBf+YceXcdwvPtJB2tgstmQ=;
        b=NvorN5CXo05mMm7W0yNPE3ED76Fr7MOlr0MDQK98m5VN93XxtUgNvkFk3wK4lAW8AZ
         a8JNWlbF8eeaWOjcdS3NZ6B218+qgvDF/1C7rs3yXSd/lup5LkVde9CAypSnZajJbinF
         Tp6Upx79UDetD/bwHPF1u8lRbPXGlSag4z6Hqr+XiIUWJTTBBVdYkZc8sCvFusXyzGzn
         U4EMXzMSjbUk8/8K9D1hxN9JEycwFDo7IMZQhAClM8Pw7VaTl/r5op3a1xWfU2irkrt2
         WnovJohwbqX8gIFnGIWjgzTYnsG9IbIi82SY8XQUohgzHITeeNFzUFBIgLnrpuC1nJ7Z
         3k2A==
X-Gm-Message-State: AOJu0Yw6vQWT8gIMd49heGmNqDVMb3YSq2WwaHeBr+88iw347/6Zzp14
	iyXus8VY7P/TAyPK5rvss8TvJWLwd675H44xlW+/OhEdk3+ukeJ5ypqN2WC9bA==
X-Gm-Gg: ASbGncsPIA+5r4Ou0sM/X7lpq1x7quTrvbP04pTe0vhJmzEI/ZfPlOKrcvO8oUHyKiT
	kizQpndh9I/Sr7uuKpemVsLnoCcfG/KLgp2yd1Tw/SjfY0eVUPsHl9kmJdf8W0n6ErM8PYdP+o5
	tp5lAubz16xZljErJn80/G5zDIxnbJnUDEKsXuRn0J+vtRCXfXAxQSQbxjeZvJir5do6h/2qJUM
	fhXjj13+fbRYaFO7aXvflzBTy8tgUJDI5AXFyEqJ1gf0YEeH9auwE3NioYXX0c/UZGjdWHbiL1i
	3OAm1Q5jE54X8GfwVwv2/3rkCLJEJHGcLIsE3rijlV3X1hInsFKwD1BMtGocXQHS0oZMBKAelZE
	evIy4bX4Q7ReQA8hiziscRxgTSQXzkkK24JV5mdhn1PQWCYLFhq/pIj1UJreiKpp5iVWvRriq2g
	==
X-Google-Smtp-Source: AGHT+IHKyE6+dfEzUKtwMYtSktS2t1k/dj5Sb6gy+vyqw/6+wKWpZmtEJ/3gYkOAFEAedDqhzO7M7g==
X-Received: by 2002:a05:6000:2210:b0:3c7:308e:4dff with SMTP id ffacd0b85a97d-3e765a3e492mr6682868f8f.57.1757849386158;
        Sun, 14 Sep 2025 04:29:46 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8346defd3sm6591268f8f.1.2025.09.14.04.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:29:45 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] soc: samsung: add chipid and pmu support for exynos8890
Date: Sun, 14 Sep 2025 14:29:39 +0300
Message-ID: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset documents the pmu and chipid and adds support for chipid on
exynos8890.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
  dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid
    compatible
  soc: samsung: exynos-chipid: add exynos8890 SoC support

 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 1 +
 drivers/soc/samsung/exynos-chipid.c                              | 1 +
 3 files changed, 3 insertions(+)

-- 
2.43.0

