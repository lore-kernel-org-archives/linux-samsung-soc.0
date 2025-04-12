Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3951917C2;
	Sat, 12 Apr 2025 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744490002; cv=none; b=k4VXw3vrEKBl9myeTaCoUAty5bzWX3cCQvyUTwTocfeeNTBowLs2r+RHjMV9dWO4XKLsr0r31WpQh+0v66Dds2pMa1gbr1UbH2dvVyPOzthDxE0tOrghNb06EzpmYwKup6UlpGhtfsJjmMLRXN4b5aUBvwDzqkeequChTyIQwDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744490002; c=relaxed/simple;
	bh=xes39LYAHwQxrfuqn6xWQWSQdj1ElzFGkC+ee46OS3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BPNBIIIBfVpDljlmCcEx90zfJb7xg9YO5xhvI+Y/NE1EXiR5uvx1lACa8IpqKaomIbRoAGAxPKq1CXizBEVn9gS813hmVkbl6EKjSob2NQ853QN4vsdheMu8CYlVjiETDAw8X1kE+Kessg0NIMQ9xrB/Qwxlbf0zF53nVIpvvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m297MchQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m297MchQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2069196f8f.0;
        Sat, 12 Apr 2025 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489998; x=1745094798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84d8bHxH3SSdWFybl8KBWGlfmW6RpFgzxbE6mJ5HL88=;
        b=m297MchQVoitKi62oUfKcKGORd+lBniqoC2HrBJN9OqZtWCZwgEE0Y9SseimtUtfs+
         rNvsBF7+GZP6oZ3KYLB39WQQLsayhCGzXRh9pgwEfHGtWUNdovdM8DkC9WoPFJmChzIZ
         37wj6P+Quk4BliBIm26KV0qyunRT0+BQOnTT9wnAeLzNmfqCnUljEb18bSe0AI+lrtza
         fjBZqWzs2HnI07384QIgJaBQRKRbcFJKYhA+GHPS85hmQzeFfD5pc/k8Lq+4mjNXZ5zF
         96QUObsciZErrrxP3HFd2WCXiTnysm8ikXI6pPOvTjtPx5q4ngeCxO3pIx/PKKj0N2MN
         Rfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489998; x=1745094798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84d8bHxH3SSdWFybl8KBWGlfmW6RpFgzxbE6mJ5HL88=;
        b=wQgguXMQbrNAemg35geSju3ADG1mHpRhZ8VIbIZTv50i2uMc5uNcpyH51e2Wm1PBeU
         y3gGa8r4vbuaGVBZSZ5PlEVN5R8D7iAGX+Y9wfOcKVOjYgoLuUj5ysJYCu4Ez2KqAb/W
         Gj9pD+cj4KHGbhCxEkYKME5JN0/tlHLE/KJsLrs64Krj2v6eykhC58ECqRoA5Hv+Cqdz
         9e9Bz5N7wk9CjamUBzupDtbu/Yioz22zWgWpMM4ezct/pQlXF1sv2UsnUCugr1ZxZ0Gz
         uHW14L5OabSy9rJgxUiznleN+oIvuhEcRk236hsBPaDHo99cha5gDLYaINdVCoWW/7uE
         2WCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUibZTcBomzcr5U3rRsEQaZi4qe8+4AUN4r8kP5PP3M+PsqfaalM5a9yJNuVVdNwoSEWaO3ujSqVUnb@vger.kernel.org, AJvYcCWTAbQxTJ2+9OmaEywHxXSiciZI5URQS2XKlTgI4Z9RPQsH//vxr2deOm2vfM0SEQyQDeYQPUtHBDnR@vger.kernel.org, AJvYcCXiu0khcC58BtI1uELUW62cJTTaskjbgXJ13gPu00q+26ebzcd9H1RhxdI5IYFLB86a2sHzvZASGXSEZI99@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjMXSFMSUZwitU+MhHVbaI/cVuc0SyXUKpadcuKB4bm0ctsPN
	hSdc+heNKjY88+hXusrKd1vgOmpX2Gc3pniCiL8TMYN0HH84pf2HVz5BNA==
X-Gm-Gg: ASbGncswucAnNcwI7g73Gqw8Kyiyq8r8ZLC6PIu1K66YKFwXN6HS0CjKEkV1OPgTyrR
	dOPzLtpA5Kk1008EhbsQwpDkN3NMl+vBYdqFMRGmSV8ydC/aaHnhn7SSHnOAEF4l5RKSex5K0kg
	mjPmwr5f0nricREEVvS9xNIooJNM6eTBXsIwB61PvyH64kqbhaIqe4BCYXQZOThyEyRyWq+VBxZ
	QhpGJ3+zXv9KVJ9WOSpP+xlrAAix8qtwx9vM61K0jN0bHo2hKHpSjcJQeH+dyrBnv+v2cdxavB/
	DLx8bAvSMSJJtPAT8yws4cASORl860M1UMqDmTmyfdVks55F98yOa8gTGRwasDknhsZ9HvcilDn
	M1D2SFacZ1pU5MDzNHZnzM1d6J0M=
X-Google-Smtp-Source: AGHT+IFNyxGwDpnAe/YM2fiTQZXwhEFI2JvZ+QIPckE8pwsmskLv6jhORu73jTe1CCO3dtOinzRmeA==
X-Received: by 2002:a05:6000:4021:b0:391:98b:e5b3 with SMTP id ffacd0b85a97d-39e6e49f88emr6775905f8f.14.1744489998307;
        Sat, 12 Apr 2025 13:33:18 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm5941896f8f.76.2025.04.12.13.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:33:17 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Sat, 12 Apr 2025 23:33:11 +0300
Message-ID: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
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

Changes in v4:
- rebase on next

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

