Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA012874F8
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909482; cv=none; b=fqmmqH/ao19ANK5XJywe6eDiwcUtFUxMfjhKiLRvU3rNFy+AXTmSNQx6lJCKFJSmDHwLOx99uDklNbLN10JbYpo9E0LbyQmJqjHBXunsrgDz+hAwkDjoNuz2DKt6NHPg/VGYysImx2eCafPkjOZxu5+953VzmZ9INfqnCIE4Voc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909482; c=relaxed/simple;
	bh=boXlFe+neX+rbXfuMW2IbPpgXk7Xd+Trui4cXXc1XHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ivnZmUexwqOPtkJ3Id8Ejt6evhTYODQvCPbeo85S3vK5vLBlTUGnRnfNsfDNkr/LD3NGoDvBKKOCRdQnNURtnPn6Xnv/wtIpWcHniGrQil+pyUWAK3GTOkYJVpQhtQyTUpYDzE7m9TBgWUYjdmWOuIP1QqEgYRjzhRTtamGGBbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GowLDbcu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GowLDbcu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso46410545e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Sep 2025 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756909479; x=1757514279; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11JUQ5ev+7cUmEafuoYU8OrU4sJAEkKk/NLhU0bkFyo=;
        b=GowLDbcuCW8V88vjNmnsasQ4ROJT3JBVTVpij+GyHOm7/c7XaC51PiLJ3BCpxsmziJ
         VCwev1FZJKPZUcFkDBp3brW4XTNS/gsFq0tf1VF373KW96Wl63Fq+Us2jirXB0/O5UTh
         akIXpbBXuB3pK/vmc+uy5eMCKyzEH8pbiqeBLkAspFj1ueO5Idk5x5t2q1ofpJu/zo/s
         g9jj7j/cmldpiustFWTX+oUsKhFghX/3f49LsUai3v6JJLUH6hu4kT13lLv0uB4O5SWX
         6DAaw7o1p1no5mRLxXN0eV0HbdrvxpXfdA6DONvA/hzQCQcJMhezzcrlgwt7XS/uk1TP
         L5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909479; x=1757514279;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11JUQ5ev+7cUmEafuoYU8OrU4sJAEkKk/NLhU0bkFyo=;
        b=EDl6E4kwcAfQH26wOErRY7r8E8LIzm7MEZXGHkPmzfvuTuhuh+vuoLmbmjP0mNK05K
         aozG5N7E0zLMnW86z3DYV+tgCL8Yi/Zw1SA5Wh9LrCfeFds7EJgjofBnKBu/w/wMuMjp
         uaVTor/bBxcvPg6Xwpycuh/TvQm+9m0S8bZAOmYqqhmcrOQic/ZSgvziVcRgBNOZd4o7
         DlMmWLsuppzIFfwo51ftgyUDQzDZ8hqdHD4AuyJMjH2Vvg/B1UnjGl5YZSUVVUbDSUWu
         Z8T6cUNb/d8FqkFWpcpkG4hABUj2+cr2Goy9/8SR+lwph6qdf3aGqWpToLQLVrJm0ofR
         HEBg==
X-Forwarded-Encrypted: i=1; AJvYcCV8A8mIB9rVRr4A4qOIL0wqg0QDpt9D1t+1XHhQYT3b2ouC/w950cP8mWtoB0azRLS1JXAOuOUgda06TD1TbXqDZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGN/2CG6EkOrQZpg9J3ieQxF1Yl+VflXt3wAYumSes6oJnLjIW
	OBhCfiejNgI+ntgmHty20Li0kT5OFgTqk7RcKT2E+q53TugzfUsR4snAdgYZ/JnV+Fz3Wjz2t4k
	4WrMNRN4=
X-Gm-Gg: ASbGncuWcPPfQZFWtLyaE8Ximi6JwT9zlMk8IkJiUJtZkSiNmMnmNu0+8NWFHI7iWD4
	Fwgn9u0M8WSCkgh6bFe94xhc+sz1iXWPQiEE7oN2kYYEkJnuMsjUcAN4NeSPhBnq8CAZ4HPpYKp
	9rUH1aWrdDj8RuXYLIaXIdJFXGvgfH0aArxl4CWq/D62skprEl8U9VgO7A2zgAh/ZEhXPfC26z4
	cDN3IZ8p89d1ExnwDKFfiKHyr1XBcMm+5UlWOpnyT0FUnMtHwwZRsUics+xfzbu7XsJh+d0HYtk
	oemU2Q4bzQCXR8s1/pd8Isyot2J4ovb5i8jTW08vUfqylYU9eIOQ4n0USs+lNMWMdY00JgHWX5A
	9RytCD5ZEDZomnCmoQdepBemgRLVxpkdnt6wTByuq9KlRWRoU9ToyZ+qe0kF1bDvgxaz1izWxg7
	rg7g==
X-Google-Smtp-Source: AGHT+IHO7lF68sZSzRU3Ji9xQ8Bg+5ordTX8h7glVlsP3LEnejSEX9Agz2jxEBMCAJA/KkoY5VsH0g==
X-Received: by 2002:a05:600c:4588:b0:45b:86ee:4181 with SMTP id 5b1f17b1804b1-45b86ee4497mr127647825e9.22.1756909478846;
        Wed, 03 Sep 2025 07:24:38 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm3996035f8f.33.2025.09.03.07.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:24:38 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/3] arm64: dts: exynos: gs101: add cpufreq support
Date: Wed, 03 Sep 2025 14:24:34 +0000
Message-Id: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJPuGgC/3XMSw6CMBSF4a2Qjq1pL0VaR+7DOKAP4CZKSUsaD
 eneLYzUxOE5yfevJLqALpJztZLgEkb0Uxn1oSJm7KbBUbRlE2DQMMkV7cz8oDb1kdqFspM2rRL
 aGmNJIXNwPT733PVW9ohx8eG11xPf3j+hxCmjwtVSq0YwacTljlMX/NGHgWylBB8a2h8NRTtuQ
 SpmOehvnXN+AxSdEN3nAAAA
X-Change-ID: 20250819-acpm-dvfs-dt-06bc794bdccd
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756909477; l=1514;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=boXlFe+neX+rbXfuMW2IbPpgXk7Xd+Trui4cXXc1XHI=;
 b=L9P2BH3epk84RCrBmVx2GaIRgBviB5UvLL4K9afDUGFWG1bnkaX/YQ0iUz/gTH10jTAwgbS/K
 uCXKN6hqgpUCSs2U83YiZnWujnFKvoXNO7QtM+1u4yl4QYXFHL9A9cv
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define the CPU clocks and OPPs.

Patch #2 has a dependency on the ACPM clock bindings sent at:
https://lore.kernel.org/linux-samsung-soc/20250903-acpm-clk-v3-1-65ecd42d88c7@linaro.org/

The following error will be seen without the bindings patch:
arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
   10 | #include <dt-bindings/clock/google,gs101-acpm.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v3:
- the ACPM clock bindings were moved to their own file, update the
  references accordingly.
- Link to v2: https://lore.kernel.org/r/20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org

Changes in v2:
- acpm node becomes a clock provider.
- reword commit message, extend cover letter with info about dependency
  on a bindings patch.
- Link to v1: https://lore.kernel.org/r/20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org

---
Tudor Ambarus (3):
      arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 285 +++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-dvfs-dt-06bc794bdccd

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

