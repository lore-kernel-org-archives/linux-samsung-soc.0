Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0B2522B8;
	Fri, 25 Apr 2025 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587719; cv=none; b=rq91cVFJ7QnliqNljRpABLo4mLEKesl5m42iMJiTQ/qchtHiJ2RC2h3QknGCYmEyj5r0UoUi7E4rmr54IWtkDKUe0vFWp4P25FcxEHofeaYXJxPLCKVhhW/0MEtV7qDKD0hp88oB65iDrSgG0GEZXcS/ZIgTQORj/gGioE1boMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587719; c=relaxed/simple;
	bh=c8GlAax2t1WRUHlIvrL0lNNzECalFd5Qcvrpl6HUwQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnecLlnFWzBTW/FaAd8MpwSqpjFRkT/XpSJoBHUlJ7LXwd+IGn/9BxenxDAfi+RMGhwzBo/+sLsLUrbVWmOjw9gk3Iz2IVrPq89F5c8PJm1yzo8dyLcxDu4ot6tw135SsAKFgnXgP2OcnBFd36cK9XxzRjoIgQZUiwUF70jq/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkV5/CTL; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkV5/CTL"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30863b48553so3061803a91.0;
        Fri, 25 Apr 2025 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587717; x=1746192517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFjEH3qP0dLTK5ihHzovZcinv2fwnPAf5xRz9u95KUM=;
        b=fkV5/CTLXQQ10hyvk9A5EEMLZ9mv7CP9qBkQlK+hAgpileWQq1R3bposICzYM+sqJv
         4CyjJXV3UuzWTH2F6ZzUacBMiuXLzhKAc7TIJ9SAYaa8SIF6J0YnSyPNzia8z9GVYLWn
         tNQNXIAsNPOHMJ3ELMDLfL7fHBhXYrnDBFwwa1DZkEHxNmIxBv/HVnijVoFBTk6SdZT3
         7N/U47yGOXsbhGNrOjYDOPXAnd7M579ZvA9t5LdzLU8erEMJ3vm5Rh9SdibMM6g0ZU6B
         J631VTcjYsFkXIwkXiKoSjJEPbGDqcg2+Wt0+Zk9s8H2WadYEVnennfKpo8VdZRDoIUq
         PY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587717; x=1746192517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFjEH3qP0dLTK5ihHzovZcinv2fwnPAf5xRz9u95KUM=;
        b=E3s07Kr7dSPsgrUX6os9v00BgQXhsdDzxlvJOAlxjO068cVkZqKldTyLFBC7EbcWoY
         bcFkD572NPPR+tgdKLeLlJ9Xp1uell3rs0dB4LGjpTWzW52KLkw7qGmBE8W3UX3lv0Ju
         U+u2iisIflLLF2qW2SHPSTVLMtQmsuTC7+qOD4mMv/x6DNc8z5oNxqFwVWEurV12x65V
         R2ByYI1iyzf5WOUcUjXE+S+jXaByqx2qX06xAAuUsYLs9w8KMkj001GkIPHUNCMR2/5Q
         kqLVEBdiy/nWbc2o1S2gEbWayzsgRXtfGlSDSpCr9tIpL4RwndSjN4pMx4kgdwXJr178
         Aerg==
X-Forwarded-Encrypted: i=1; AJvYcCU8PAXXB0PHwEZXcZizaOGRO+XsHehBHltkvlruYNnApls4Ut6LTnGN69KvbmFecLDatUU5k9geRlX4bqSA@vger.kernel.org, AJvYcCWKMam7J/+PmAnhZHA4fs0zFTYbVU7lmEkL1yh72rbR4gtTg8EtHJx1uK1B7mhgkOwZ1gXvLXmAIYUul1eSvHAzKKA=@vger.kernel.org, AJvYcCX3SyvsMm57Os4NWo+fpCdOBz4yX3qa8Kn+Rj1BYQdE6qsHIJswJ9uqH9Wci7xnd+ZUrkVWTvsakEIA@vger.kernel.org, AJvYcCXYxJ0XUSiFwBS9rd/mF2a6zSOXe2VHud0GD7UHg6G5Xm82S8N8sPzxFLrzpI+pUu1N15SOgBokecAF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3YDhLAULvA7YMJaQbOqbhIxy9MpXoBDbbvVtSi3zkD5biRnH
	mYtwTAzsVdVZMRYNdHBK62hvIMQPUL6mdbHXlLQScyRLuD4N8bqe
X-Gm-Gg: ASbGncungjSS78JBym6zxfmOajCdQxbw9206i/8tu5jhR+is54ueRAkmcjs0z9yRult
	cykOk7Efwl63NB4GHl9/BGVUuy5C9F5bqsy51SAwKZygx4BOBgPpjuMOQ+7iMC6Mdw436Ufd5jO
	j5YOhCf+RPZwHTP7Mn7+vlwOcjVG3T8RkXrrr8GuMEQl6GsCQMQ5H8Cj7TMWtB0DJd/QXOi2hPY
	IwyAmiTiDHAcK+hzZl8eXR/Hs3UmRXS213AEBDjnNRO26XDOvAeeGG0QxwQ4riCxuQu2Yh/jrdt
	QHBGuLNdHFQskxASYJXATV1UoHL5OWwdtG6kPFWLZ8MZc8RK5JW4cg==
X-Google-Smtp-Source: AGHT+IGj9lR9tmU8eyR40XzFeimkdT87ngl3tdqW47D7njs1AnBF+aef9o+xkSHHj9j97MED9tFceA==
X-Received: by 2002:a17:90b:1809:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-309f8a07690mr3104746a91.12.1745587716944;
        Fri, 25 Apr 2025 06:28:36 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:36 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 06/10] ARM: dts: exynos: Update proper regulator states for suspend-to-mem for Exynos4412 p4node
Date: Fri, 25 Apr 2025 18:56:26 +0530
Message-ID: <20250425132727.5160-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX77686 PMCI is able to power down and up key core supplies and other
voltage rails via PWRREQ signal to enter / exit (deep) sleep mode.
PWRREQ status is ignored during initial power up and down processes.
All programming must be done before the AP enterns the sleep mode by
pulling PWRREQ low since the AP does not have programming capability
in (deep) sleep mode.

Update few regulator node with support suspend-to-mem node to regulator.
dropped suspend-to-mem as MAX77686 do not support these.

Regulators which can be turned off during system suspend:
     -LDOn   :       2, 6-8, 10-12, 14-16,
     -BUCKn  :       1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/samsung/exynos4412-p4note.dtsi   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index ad0abe8d9e30..d0ecb1c6a922 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -448,6 +448,10 @@ ldo1_reg: LDO1 {
 			ldo2_reg: LDO2 {
 				regulator-name = "ldo2";
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			/* WM8994 audio */
@@ -457,10 +461,6 @@ ldo3_reg: LDO3 {
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-				};
 			};
 
 			ldo4_reg: LDO4 {
@@ -472,20 +472,24 @@ ldo5_reg: LDO5 {
 				regulator-name = "VCC_1.8V_IO";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
 			};
 
 			ldo6_reg: LDO6 {
 				regulator-name = "ldo6";
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo7_reg: LDO7 {
 				regulator-name = "ldo7";
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			/* CSI IP block */
@@ -506,10 +510,6 @@ ldo9_reg: LDO9 {
 				regulator-name = "VLED_IC_1.9V";
 				regulator-min-microvolt = <1950000>;
 				regulator-max-microvolt = <1950000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
 			};
 
 			/* CSI IP block */
-- 
2.49.0

