Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0FC2BE634;
	Tue, 19 Aug 2025 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755641997; cv=none; b=PBIe/nMjDh0dHznW8C69PWYB/dJGLLsVAnhGYX/QFkVsi/RaumDatgHc/tMdF/6tc80sOMmYkFMiavuzvmcY+Tea7JR9K7vp0NTTtUw0x30fqMtamltrkdaZvA1q551OvbUHFlHtsYIpnl0nVc/Grl7U5WYTPcWaYwuu6srj+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755641997; c=relaxed/simple;
	bh=IZSjRet90Z7ssCuwoIO31SUnba8YT9zfKUtMi4mD8fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYByatebrNYn/3TvkCgvUMlfFHIKI/ZQKOOEs+nRGc+gVj2kYq03XbNTH7v/ll3fr87LhPrkNgJxpxXhdFbCtsDoIcP1Xvzt8DRiJdn8siz3bD9KSSffG5+CvhVm3hyY/yDPaMJvp5WSrRF/mH6z0EF0ZkDGNNCaL5HCd/nBoZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YU24Au1S; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YU24Au1S"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2ebe86ecso6722773b3a.3;
        Tue, 19 Aug 2025 15:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755641995; x=1756246795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KkOOM0vdlCAI+wIK/wdqoZizl1s5oNfkaIbRaWdhzk=;
        b=YU24Au1SwgN3D0N3wMSqO8VmaIZClSb+EjUKUv1Q4+JpMd88sZz+/BZqJhV9R58tM7
         aIA63GkcFiTpTwZqa+dNUca857s4YifhC6gKXMlpGkLnafcr7t8KxOe3RSj8OrL5t/4n
         oCvayfcCv0LX1GncLK3k0cHOieEWkhAnv7DqGXTfoK1cILzl/LH1tzKqbF6ok9fTLPEP
         bHaQhyJtTfPFcsr5TPJVU6CFbjI9XnskicFm4MzfgMfc4png4peNaWGDLwD0mViqd3ZH
         bnS8pI4CB6ET/qel3BU33ZvaL4732EleERaJt1lsLRwMKF+pyLGZD0uQ4daoNgImGU7v
         8zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755641995; x=1756246795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KkOOM0vdlCAI+wIK/wdqoZizl1s5oNfkaIbRaWdhzk=;
        b=QJTMZdSYd15hzLc2JM6HpoZpLEYLjnQZRkgeIiLlxYgeU8BvPpHS4vbbmZd7eMyTLm
         7EkqHtLMu6SHjrdGexYRy/P3WTnsuORPSNAKzUrjYAIyCbDKLadFAZd0qW+qo4uz5qH4
         nHqeGQYxtNBeZdeSPjRemsHKoh9oZSDq1KRfw+hhensun+hkQLiYx2RhjEE8iJW2ah2J
         CUUleASU0ZiOcy3/7D7fwElaC526eYROXrCp0/fBZmpcObY+dJBcTrl2YREK4Y0NdEL6
         gd2X0J+mFsNQ7FRypQVnchyENlDscCBFr84LFEYdcfgolysRD9eUex/CyJ7R16CvR6Qk
         vi+w==
X-Forwarded-Encrypted: i=1; AJvYcCUYA6CivU6TlSQb04FwnYvO4raWp9iMx3oZ7rgD2ljzdLJaK8dZenwFZQ36SHa5YBNAVLfjYvm+coejzft9@vger.kernel.org, AJvYcCWuDckzQ9k4zE7AX+xruC8wKQpbm1u1Ww0R+5qgyUcsXx0icocv8dAgRqgrB3Yl5U7rywXhLYj6daM1@vger.kernel.org, AJvYcCXowggEx4U8sxhw5ANbc5iYM2wolcqyRSZpr4DZOGRXcQHdiZrSCiLs+cL/wVUg31tAuGn/By6yqStf@vger.kernel.org
X-Gm-Message-State: AOJu0YwXmnp2cPJmqqxg4z/Nmg5c8s1EIRfIC4xqlQJULcepSgp0ZaYM
	lh+raPBWnOT2VOc158UCLF5V5pyhTAGrajm6Ykc112OOoFcYbm5+/wUG
X-Gm-Gg: ASbGncvulscjelURtlXaRpkkOWu26pU48HKLXi8MK3Q0bjc7gKmnhF45mBbeSrzteQZ
	7xyXxjfZzhtFK5yLAdgB0e4JBO30sb6S9rWUPsXg+pctgOwTQKIfeXI+jLBjfNDXmHch4pJ2teL
	vIfkaBU1jGbUQSsHNWy+pnOfb62WLlj4gc3EN6T9pf3ebLeraIsRAcL1WEIPhvZyPwg3aKxHMqX
	XPmCZV5eRT1ONkR9J/lt+oO96Ee8QHS/vZT3NF+yIFSlTQgJ5bkaghuOcxs8lAgB53LbtDKZXJ4
	q7ovF8UWR3tzG99Sv6hHpqdjDlxQpl3Zz5hntBeG96hcbr/kuFgy9+SlOvMEty8YrdT9JKfXs2Z
	bjr5Utcsp9d1L32oods9iDOGran7j5eU7wYn2Zj634/vKL0U=
X-Google-Smtp-Source: AGHT+IF9v2AvvuFPQMdP0lvVa5n8RIYqG+ESMAJ0YZ7ovr4Osfp4R2DX0zeaK2DGQvf9Zp7Xs062YQ==
X-Received: by 2002:a05:6a00:2e23:b0:76e:2eff:7ae9 with SMTP id d2e1a72fcca58-76e8dbaf7e8mr905265b3a.12.1755641994766;
        Tue, 19 Aug 2025 15:19:54 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f76b5sm3431545b3a.59.2025.08.19.15.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 15:19:54 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Tue, 19 Aug 2025 17:19:37 -0500
Subject: [PATCH 2/3] dt-bindings: clock: exynos990: Reorder IDs clocks and
 extend
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-2-v1-2-e84b47b859ce@gmail.com>
References: <20250819-2-v1-0-e84b47b859ce@gmail.com>
In-Reply-To: <20250819-2-v1-0-e84b47b859ce@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755641982; l=15686;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=IZSjRet90Z7ssCuwoIO31SUnba8YT9zfKUtMi4mD8fU=;
 b=SDqrPlwJZ7aAlvq5vK4lIV5uYIPkibEN5Ah4t0t268uziiwhD9ld9H7LpXSANhuRcODa9E016
 4fty8msP7R8D0+T+xuDQaAdio4zvlp3/SGaa3AnJYy6xH/rcX6OksLT
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Reorganize CMU_TOP clock definitions
and add missing clock definitions for DPU and CMUREF.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 402 ++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 203 insertions(+), 199 deletions(-)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2822f1c8e5086a2fc0bda783ca224812..b384e271bf276a375f67659fc84e53350ea73c0e 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -9,205 +9,209 @@
 #define _DT_BINDINGS_CLOCK_EXYNOS_990_H
 
 /* CMU_TOP */
-#define CLK_FOUT_SHARED0_PLL		1
-#define CLK_FOUT_SHARED1_PLL		2
-#define CLK_FOUT_SHARED2_PLL		3
-#define CLK_FOUT_SHARED3_PLL		4
-#define CLK_FOUT_SHARED4_PLL		5
-#define CLK_FOUT_G3D_PLL		6
-#define CLK_FOUT_MMC_PLL		7
-#define CLK_MOUT_PLL_SHARED0		8
-#define CLK_MOUT_PLL_SHARED1		9
-#define CLK_MOUT_PLL_SHARED2		10
-#define CLK_MOUT_PLL_SHARED3		11
-#define CLK_MOUT_PLL_SHARED4		12
-#define CLK_MOUT_PLL_MMC		13
-#define CLK_MOUT_PLL_G3D		14
-#define CLK_MOUT_CMU_APM_BUS		15
-#define CLK_MOUT_CMU_AUD_CPU		16
-#define CLK_MOUT_CMU_BUS0_BUS		17
-#define CLK_MOUT_CMU_BUS1_BUS		18
-#define CLK_MOUT_CMU_BUS1_SSS		19
-#define CLK_MOUT_CMU_CIS_CLK0		20
-#define CLK_MOUT_CMU_CIS_CLK1		21
-#define CLK_MOUT_CMU_CIS_CLK2		22
-#define CLK_MOUT_CMU_CIS_CLK3		23
-#define CLK_MOUT_CMU_CIS_CLK4		24
-#define CLK_MOUT_CMU_CIS_CLK5		25
-#define CLK_MOUT_CMU_CMU_BOOST		26
-#define CLK_MOUT_CMU_CORE_BUS		27
-#define CLK_MOUT_CMU_CPUCL0_DBG_BUS	28
-#define CLK_MOUT_CMU_CPUCL0_SWITCH	29
-#define CLK_MOUT_CMU_CPUCL1_SWITCH	30
-#define CLK_MOUT_CMU_CPUCL2_BUSP	31
-#define CLK_MOUT_CMU_CPUCL2_SWITCH	32
-#define CLK_MOUT_CMU_CSIS_BUS		33
-#define CLK_MOUT_CMU_CSIS_OIS_MCU	34
-#define CLK_MOUT_CMU_DNC_BUS		35
-#define CLK_MOUT_CMU_DNC_BUSM		36
-#define CLK_MOUT_CMU_DNS_BUS		37
-#define CLK_MOUT_CMU_DPU		38
-#define CLK_MOUT_CMU_DPU_ALT		39
-#define CLK_MOUT_CMU_DSP_BUS		40
-#define CLK_MOUT_CMU_G2D_G2D		41
-#define CLK_MOUT_CMU_G2D_MSCL		42
-#define CLK_MOUT_CMU_HPM		43
-#define CLK_MOUT_CMU_HSI0_BUS		44
-#define CLK_MOUT_CMU_HSI0_DPGTC		45
-#define CLK_MOUT_CMU_HSI0_USB31DRD	46
-#define CLK_MOUT_CMU_HSI0_USBDP_DEBUG	47
-#define CLK_MOUT_CMU_HSI1_BUS		48
-#define CLK_MOUT_CMU_HSI1_MMC_CARD	49
-#define CLK_MOUT_CMU_HSI1_PCIE		50
-#define CLK_MOUT_CMU_HSI1_UFS_CARD	51
-#define CLK_MOUT_CMU_HSI1_UFS_EMBD	52
-#define CLK_MOUT_CMU_HSI2_BUS		53
-#define CLK_MOUT_CMU_HSI2_PCIE		54
-#define CLK_MOUT_CMU_IPP_BUS		55
-#define CLK_MOUT_CMU_ITP_BUS		56
-#define CLK_MOUT_CMU_MCSC_BUS		57
-#define CLK_MOUT_CMU_MCSC_GDC		58
-#define CLK_MOUT_CMU_CMU_BOOST_CPU	59
-#define CLK_MOUT_CMU_MFC0_MFC0		60
-#define CLK_MOUT_CMU_MFC0_WFD		61
-#define CLK_MOUT_CMU_MIF_BUSP		62
-#define CLK_MOUT_CMU_MIF_SWITCH		63
-#define CLK_MOUT_CMU_NPU_BUS		64
-#define CLK_MOUT_CMU_PERIC0_BUS		65
-#define CLK_MOUT_CMU_PERIC0_IP		66
-#define CLK_MOUT_CMU_PERIC1_BUS		67
-#define CLK_MOUT_CMU_PERIC1_IP		68
-#define CLK_MOUT_CMU_PERIS_BUS		69
-#define CLK_MOUT_CMU_SSP_BUS		70
-#define CLK_MOUT_CMU_TNR_BUS		71
-#define CLK_MOUT_CMU_VRA_BUS		72
-#define CLK_DOUT_CMU_APM_BUS		73
-#define CLK_DOUT_CMU_AUD_CPU		74
-#define CLK_DOUT_CMU_BUS0_BUS		75
-#define CLK_DOUT_CMU_BUS1_BUS		76
-#define CLK_DOUT_CMU_BUS1_SSS		77
-#define CLK_DOUT_CMU_CIS_CLK0		78
-#define CLK_DOUT_CMU_CIS_CLK1		79
-#define CLK_DOUT_CMU_CIS_CLK2		80
-#define CLK_DOUT_CMU_CIS_CLK3		81
-#define CLK_DOUT_CMU_CIS_CLK4		82
-#define CLK_DOUT_CMU_CIS_CLK5		83
-#define CLK_DOUT_CMU_CMU_BOOST		84
-#define CLK_DOUT_CMU_CORE_BUS		85
-#define CLK_DOUT_CMU_CPUCL0_DBG_BUS	86
-#define CLK_DOUT_CMU_CPUCL0_SWITCH	87
-#define CLK_DOUT_CMU_CPUCL1_SWITCH	88
-#define CLK_DOUT_CMU_CPUCL2_BUSP	89
-#define CLK_DOUT_CMU_CPUCL2_SWITCH	90
-#define CLK_DOUT_CMU_CSIS_BUS		91
-#define CLK_DOUT_CMU_CSIS_OIS_MCU	92
-#define CLK_DOUT_CMU_DNC_BUS		93
-#define CLK_DOUT_CMU_DNC_BUSM		94
-#define CLK_DOUT_CMU_DNS_BUS		95
-#define CLK_DOUT_CMU_DSP_BUS		96
-#define CLK_DOUT_CMU_G2D_G2D		97
-#define CLK_DOUT_CMU_G2D_MSCL		98
-#define CLK_DOUT_CMU_G3D_SWITCH		99
-#define CLK_DOUT_CMU_HPM		100
-#define CLK_DOUT_CMU_HSI0_BUS		101
-#define CLK_DOUT_CMU_HSI0_DPGTC		102
-#define CLK_DOUT_CMU_HSI0_USB31DRD	103
-#define CLK_DOUT_CMU_HSI0_USBDP_DEBUG	104
-#define CLK_DOUT_CMU_HSI1_BUS		105
-#define CLK_DOUT_CMU_HSI1_MMC_CARD	106
-#define CLK_DOUT_CMU_HSI1_PCIE		107
-#define CLK_DOUT_CMU_HSI1_UFS_CARD	108
-#define CLK_DOUT_CMU_HSI1_UFS_EMBD	109
-#define CLK_DOUT_CMU_HSI2_BUS		110
-#define CLK_DOUT_CMU_HSI2_PCIE		111
-#define CLK_DOUT_CMU_IPP_BUS		112
-#define CLK_DOUT_CMU_ITP_BUS		113
-#define CLK_DOUT_CMU_MCSC_BUS		114
-#define CLK_DOUT_CMU_MCSC_GDC		115
-#define CLK_DOUT_CMU_CMU_BOOST_CPU	116
-#define CLK_DOUT_CMU_MFC0_MFC0		117
-#define CLK_DOUT_CMU_MFC0_WFD		118
-#define CLK_DOUT_CMU_MIF_BUSP		119
-#define CLK_DOUT_CMU_NPU_BUS		120
-#define CLK_DOUT_CMU_OTP		121
-#define CLK_DOUT_CMU_PERIC0_BUS		122
-#define CLK_DOUT_CMU_PERIC0_IP		123
-#define CLK_DOUT_CMU_PERIC1_BUS		124
-#define CLK_DOUT_CMU_PERIC1_IP		125
-#define CLK_DOUT_CMU_PERIS_BUS		126
-#define CLK_DOUT_CMU_SSP_BUS		127
-#define CLK_DOUT_CMU_TNR_BUS		128
-#define CLK_DOUT_CMU_VRA_BUS		129
-#define CLK_DOUT_CMU_DPU		130
-#define CLK_DOUT_CMU_DPU_ALT		131
-#define CLK_DOUT_CMU_SHARED0_DIV2	132
-#define CLK_DOUT_CMU_SHARED0_DIV3	133
-#define CLK_DOUT_CMU_SHARED0_DIV4	134
-#define CLK_DOUT_CMU_SHARED1_DIV2	135
-#define CLK_DOUT_CMU_SHARED1_DIV3	136
-#define CLK_DOUT_CMU_SHARED1_DIV4	137
-#define CLK_DOUT_CMU_SHARED2_DIV2	138
-#define CLK_DOUT_CMU_SHARED4_DIV2	139
-#define CLK_DOUT_CMU_SHARED4_DIV3	140
-#define CLK_DOUT_CMU_SHARED4_DIV4	141
-#define CLK_GOUT_CMU_G3D_BUS		142
-#define CLK_GOUT_CMU_MIF_SWITCH		143
-#define CLK_GOUT_CMU_APM_BUS		144
-#define CLK_GOUT_CMU_AUD_CPU		145
-#define CLK_GOUT_CMU_BUS0_BUS		146
-#define CLK_GOUT_CMU_BUS1_BUS		147
-#define CLK_GOUT_CMU_BUS1_SSS		148
-#define CLK_GOUT_CMU_CIS_CLK0		149
-#define CLK_GOUT_CMU_CIS_CLK1		150
-#define CLK_GOUT_CMU_CIS_CLK2		151
-#define CLK_GOUT_CMU_CIS_CLK3		152
-#define CLK_GOUT_CMU_CIS_CLK4		153
-#define CLK_GOUT_CMU_CIS_CLK5		154
-#define CLK_GOUT_CMU_CORE_BUS		155
-#define CLK_GOUT_CMU_CPUCL0_DBG_BUS	156
-#define CLK_GOUT_CMU_CPUCL0_SWITCH	157
-#define CLK_GOUT_CMU_CPUCL1_SWITCH	158
-#define CLK_GOUT_CMU_CPUCL2_BUSP	159
-#define CLK_GOUT_CMU_CPUCL2_SWITCH	160
-#define CLK_GOUT_CMU_CSIS_BUS		161
-#define CLK_GOUT_CMU_CSIS_OIS_MCU	162
-#define CLK_GOUT_CMU_DNC_BUS		163
-#define CLK_GOUT_CMU_DNC_BUSM		164
-#define CLK_GOUT_CMU_DNS_BUS		165
-#define CLK_GOUT_CMU_DPU		166
-#define CLK_GOUT_CMU_DPU_BUS		167
-#define CLK_GOUT_CMU_DSP_BUS		168
-#define CLK_GOUT_CMU_G2D_G2D		169
-#define CLK_GOUT_CMU_G2D_MSCL		170
-#define CLK_GOUT_CMU_G3D_SWITCH		171
-#define CLK_GOUT_CMU_HPM		172
-#define CLK_GOUT_CMU_HSI0_BUS		173
-#define CLK_GOUT_CMU_HSI0_DPGTC		174
-#define CLK_GOUT_CMU_HSI0_USB31DRD	175
-#define CLK_GOUT_CMU_HSI0_USBDP_DEBUG	176
-#define CLK_GOUT_CMU_HSI1_BUS		177
-#define CLK_GOUT_CMU_HSI1_MMC_CARD	178
-#define CLK_GOUT_CMU_HSI1_PCIE		179
-#define CLK_GOUT_CMU_HSI1_UFS_CARD	180
-#define CLK_GOUT_CMU_HSI1_UFS_EMBD	181
-#define CLK_GOUT_CMU_HSI2_BUS		182
-#define CLK_GOUT_CMU_HSI2_PCIE		183
-#define CLK_GOUT_CMU_IPP_BUS		184
-#define CLK_GOUT_CMU_ITP_BUS		185
-#define CLK_GOUT_CMU_MCSC_BUS		186
-#define CLK_GOUT_CMU_MCSC_GDC		187
-#define CLK_GOUT_CMU_MFC0_MFC0		188
-#define CLK_GOUT_CMU_MFC0_WFD		189
-#define CLK_GOUT_CMU_MIF_BUSP		190
-#define CLK_GOUT_CMU_NPU_BUS		191
-#define CLK_GOUT_CMU_PERIC0_BUS		192
-#define CLK_GOUT_CMU_PERIC0_IP		193
-#define CLK_GOUT_CMU_PERIC1_BUS		194
-#define CLK_GOUT_CMU_PERIC1_IP		195
-#define CLK_GOUT_CMU_PERIS_BUS		196
-#define CLK_GOUT_CMU_SSP_BUS		197
-#define CLK_GOUT_CMU_TNR_BUS		198
-#define CLK_GOUT_CMU_VRA_BUS		199
+#define CLK_FOUT_G3D_PLL		1
+#define CLK_FOUT_MMC_PLL		2
+#define CLK_FOUT_SHARED0_PLL		3
+#define CLK_FOUT_SHARED1_PLL		4
+#define CLK_FOUT_SHARED2_PLL		5
+#define CLK_FOUT_SHARED3_PLL		6
+#define CLK_FOUT_SHARED4_PLL		7
+#define CLK_MOUT_PLL_G3D		8
+#define CLK_MOUT_PLL_MMC		9
+#define CLK_MOUT_PLL_SHARED0		10
+#define CLK_MOUT_PLL_SHARED1		11
+#define CLK_MOUT_PLL_SHARED2		12
+#define CLK_MOUT_PLL_SHARED3		13
+#define CLK_MOUT_PLL_SHARED4		14
+#define CLK_MOUT_CMU_DPU_BUS		15
+#define CLK_MOUT_CMU_APM_BUS		16
+#define CLK_MOUT_CMU_AUD_CPU		17
+#define CLK_MOUT_CMU_BUS0_BUS		18
+#define CLK_MOUT_CMU_BUS1_BUS		19
+#define CLK_MOUT_CMU_BUS1_SSS		20
+#define CLK_MOUT_CMU_CIS_CLK0		21
+#define CLK_MOUT_CMU_CIS_CLK1		22
+#define CLK_MOUT_CMU_CIS_CLK2		23
+#define CLK_MOUT_CMU_CIS_CLK3		24
+#define CLK_MOUT_CMU_CIS_CLK4		25
+#define CLK_MOUT_CMU_CIS_CLK5		26
+#define CLK_MOUT_CMU_CMU_BOOST		27
+#define CLK_MOUT_CMU_CORE_BUS		28
+#define CLK_MOUT_CMU_CPUCL0_DBG_BUS	29
+#define CLK_MOUT_CMU_CPUCL0_SWITCH	30
+#define CLK_MOUT_CMU_CPUCL1_SWITCH	31
+#define CLK_MOUT_CMU_CPUCL2_BUSP	32
+#define CLK_MOUT_CMU_CPUCL2_SWITCH	33
+#define CLK_MOUT_CMU_CSIS_BUS		34
+#define CLK_MOUT_CMU_CSIS_OIS_MCU	35
+#define CLK_MOUT_CMU_DNC_BUS		36
+#define CLK_MOUT_CMU_DNC_BUSM		37
+#define CLK_MOUT_CMU_DNS_BUS		38
+#define CLK_MOUT_CMU_DPU		39
+#define CLK_MOUT_CMU_DPU_ALT		40
+#define CLK_MOUT_CMU_DSP_BUS		41
+#define CLK_MOUT_CMU_G2D_G2D		42
+#define CLK_MOUT_CMU_G2D_MSCL		43
+#define CLK_MOUT_CMU_HPM		44
+#define CLK_MOUT_CMU_HSI0_BUS		45
+#define CLK_MOUT_CMU_HSI0_DPGTC		46
+#define CLK_MOUT_CMU_HSI0_USB31DRD	47
+#define CLK_MOUT_CMU_HSI0_USBDP_DEBUG	48
+#define CLK_MOUT_CMU_HSI1_BUS		49
+#define CLK_MOUT_CMU_HSI1_MMC_CARD	50
+#define CLK_MOUT_CMU_HSI1_PCIE		51
+#define CLK_MOUT_CMU_HSI1_UFS_CARD	52
+#define CLK_MOUT_CMU_HSI1_UFS_EMBD	53
+#define CLK_MOUT_CMU_HSI2_BUS		54
+#define CLK_MOUT_CMU_HSI2_PCIE		55
+#define CLK_MOUT_CMU_IPP_BUS		56
+#define CLK_MOUT_CMU_ITP_BUS		57
+#define CLK_MOUT_CMU_MCSC_BUS		58
+#define CLK_MOUT_CMU_MCSC_GDC		59
+#define CLK_MOUT_CMU_CMU_BOOST_CPU	60
+#define CLK_MOUT_CMU_MFC0_MFC0		61
+#define CLK_MOUT_CMU_MFC0_WFD		62
+#define CLK_MOUT_CMU_MIF_BUSP		63
+#define CLK_MOUT_CMU_MIF_SWITCH		64
+#define CLK_MOUT_CMU_NPU_BUS		65
+#define CLK_MOUT_CMU_PERIC0_BUS		66
+#define CLK_MOUT_CMU_PERIC0_IP		67
+#define CLK_MOUT_CMU_PERIC1_BUS		68
+#define CLK_MOUT_CMU_PERIC1_IP		69
+#define CLK_MOUT_CMU_PERIS_BUS		70
+#define CLK_MOUT_CMU_SSP_BUS		71
+#define CLK_MOUT_CMU_TNR_BUS		72
+#define CLK_MOUT_CMU_VRA_BUS		73
+#define CLK_MOUT_CMU_CMUREF		74
+#define CLK_MOUT_CMU_CLK_CMUREF		75
+#define CLK_DOUT_CMU_APM_BUS		76
+#define CLK_DOUT_CMU_AUD_CPU		77
+#define CLK_DOUT_CMU_BUS0_BUS		78
+#define CLK_DOUT_CMU_BUS1_BUS		79
+#define CLK_DOUT_CMU_BUS1_SSS		80
+#define CLK_DOUT_CMU_CIS_CLK0		81
+#define CLK_DOUT_CMU_CIS_CLK1		82
+#define CLK_DOUT_CMU_CIS_CLK2		83
+#define CLK_DOUT_CMU_CIS_CLK3		84
+#define CLK_DOUT_CMU_CIS_CLK4		85
+#define CLK_DOUT_CMU_CIS_CLK5		86
+#define CLK_DOUT_CMU_CMU_BOOST		87
+#define CLK_DOUT_CMU_CORE_BUS		88
+#define CLK_DOUT_CMU_CPUCL0_DBG_BUS	89
+#define CLK_DOUT_CMU_CPUCL0_SWITCH	90
+#define CLK_DOUT_CMU_CPUCL1_SWITCH	91
+#define CLK_DOUT_CMU_CPUCL2_BUSP	92
+#define CLK_DOUT_CMU_CPUCL2_SWITCH	93
+#define CLK_DOUT_CMU_CSIS_BUS		94
+#define CLK_DOUT_CMU_CSIS_OIS_MCU	95
+#define CLK_DOUT_CMU_DNC_BUS		96
+#define CLK_DOUT_CMU_DNC_BUSM		97
+#define CLK_DOUT_CMU_DNS_BUS		98
+#define CLK_DOUT_CMU_DSP_BUS		99
+#define CLK_DOUT_CMU_G2D_G2D		100
+#define CLK_DOUT_CMU_G2D_MSCL		101
+#define CLK_DOUT_CMU_G3D_SWITCH		102
+#define CLK_DOUT_CMU_HPM		103
+#define CLK_DOUT_CMU_HSI0_BUS		104
+#define CLK_DOUT_CMU_HSI0_DPGTC		105
+#define CLK_DOUT_CMU_HSI0_USB31DRD	106
+#define CLK_DOUT_CMU_HSI0_USBDP_DEBUG	107
+#define CLK_DOUT_CMU_HSI1_BUS		108
+#define CLK_DOUT_CMU_HSI1_MMC_CARD	109
+#define CLK_DOUT_CMU_HSI1_PCIE		110
+#define CLK_DOUT_CMU_HSI1_UFS_CARD	111
+#define CLK_DOUT_CMU_HSI1_UFS_EMBD	112
+#define CLK_DOUT_CMU_HSI2_BUS		113
+#define CLK_DOUT_CMU_HSI2_PCIE		114
+#define CLK_DOUT_CMU_IPP_BUS		115
+#define CLK_DOUT_CMU_ITP_BUS		116
+#define CLK_DOUT_CMU_MCSC_BUS		117
+#define CLK_DOUT_CMU_MCSC_GDC		118
+#define CLK_DOUT_CMU_CMU_BOOST_CPU	119
+#define CLK_DOUT_CMU_MFC0_MFC0		120
+#define CLK_DOUT_CMU_MFC0_WFD		121
+#define CLK_DOUT_CMU_MIF_BUSP		122
+#define CLK_DOUT_CMU_NPU_BUS		123
+#define CLK_DOUT_CMU_OTP		124
+#define CLK_DOUT_CMU_PERIC0_BUS		125
+#define CLK_DOUT_CMU_PERIC0_IP		126
+#define CLK_DOUT_CMU_PERIC1_BUS		127
+#define CLK_DOUT_CMU_PERIC1_IP		128
+#define CLK_DOUT_CMU_PERIS_BUS		129
+#define CLK_DOUT_CMU_SSP_BUS		130
+#define CLK_DOUT_CMU_TNR_BUS		131
+#define CLK_DOUT_CMU_VRA_BUS		132
+#define CLK_DOUT_CMU_DPU		133
+#define CLK_DOUT_CMU_DPU_ALT		134
+#define CLK_DOUT_CMU_CLK_CMUREF		135
+#define CLK_DOUT_CMU_SHARED0_DIV2	136
+#define CLK_DOUT_CMU_SHARED0_DIV3	137
+#define CLK_DOUT_CMU_SHARED0_DIV4	138
+#define CLK_DOUT_CMU_SHARED1_DIV2	139
+#define CLK_DOUT_CMU_SHARED1_DIV3	140
+#define CLK_DOUT_CMU_SHARED1_DIV4	141
+#define CLK_DOUT_CMU_SHARED2_DIV2	142
+#define CLK_DOUT_CMU_SHARED4_DIV2	145
+#define CLK_DOUT_CMU_SHARED4_DIV3	146
+#define CLK_DOUT_CMU_SHARED4_DIV4	147
+#define CLK_GOUT_CMU_G3D_BUS		148
+#define CLK_GOUT_CMU_MIF_SWITCH		149
+#define CLK_GOUT_CMU_APM_BUS		150
+#define CLK_GOUT_CMU_AUD_CPU		151
+#define CLK_GOUT_CMU_BUS0_BUS		152
+#define CLK_GOUT_CMU_BUS1_BUS		153
+#define CLK_GOUT_CMU_BUS1_SSS		154
+#define CLK_GOUT_CMU_CIS_CLK0		155
+#define CLK_GOUT_CMU_CIS_CLK1		156
+#define CLK_GOUT_CMU_CIS_CLK2		157
+#define CLK_GOUT_CMU_CIS_CLK3		158
+#define CLK_GOUT_CMU_CIS_CLK4		159
+#define CLK_GOUT_CMU_CIS_CLK5		160
+#define CLK_GOUT_CMU_CORE_BUS		161
+#define CLK_GOUT_CMU_CPUCL0_DBG_BUS	162
+#define CLK_GOUT_CMU_CPUCL0_SWITCH	163
+#define CLK_GOUT_CMU_CPUCL1_SWITCH	164
+#define CLK_GOUT_CMU_CPUCL2_BUSP	165
+#define CLK_GOUT_CMU_CPUCL2_SWITCH	166
+#define CLK_GOUT_CMU_CSIS_BUS		167
+#define CLK_GOUT_CMU_CSIS_OIS_MCU	168
+#define CLK_GOUT_CMU_DNC_BUS		169
+#define CLK_GOUT_CMU_DNC_BUSM		170
+#define CLK_GOUT_CMU_DNS_BUS		171
+#define CLK_GOUT_CMU_DPU		172
+#define CLK_GOUT_CMU_DPU_BUS		173
+#define CLK_GOUT_CMU_DSP_BUS		174
+#define CLK_GOUT_CMU_G2D_G2D		175
+#define CLK_GOUT_CMU_G2D_MSCL		176
+#define CLK_GOUT_CMU_G3D_SWITCH		177
+#define CLK_GOUT_CMU_HPM		178
+#define CLK_GOUT_CMU_HSI0_BUS		179
+#define CLK_GOUT_CMU_HSI0_DPGTC		180
+#define CLK_GOUT_CMU_HSI0_USB31DRD	181
+#define CLK_GOUT_CMU_HSI0_USBDP_DEBUG	182
+#define CLK_GOUT_CMU_HSI1_BUS		183
+#define CLK_GOUT_CMU_HSI1_MMC_CARD	184
+#define CLK_GOUT_CMU_HSI1_PCIE		185
+#define CLK_GOUT_CMU_HSI1_UFS_CARD	186
+#define CLK_GOUT_CMU_HSI1_UFS_EMBD	187
+#define CLK_GOUT_CMU_HSI2_BUS		188
+#define CLK_GOUT_CMU_HSI2_PCIE		189
+#define CLK_GOUT_CMU_IPP_BUS		190
+#define CLK_GOUT_CMU_ITP_BUS		191
+#define CLK_GOUT_CMU_MCSC_BUS		192
+#define CLK_GOUT_CMU_MCSC_GDC		193
+#define CLK_GOUT_CMU_MFC0_MFC0		194
+#define CLK_GOUT_CMU_MFC0_WFD		195
+#define CLK_GOUT_CMU_MIF_BUSP		196
+#define CLK_GOUT_CMU_NPU_BUS		197
+#define CLK_GOUT_CMU_PERIC0_BUS		198
+#define CLK_GOUT_CMU_PERIC0_IP		199
+#define CLK_GOUT_CMU_PERIC1_BUS		200
+#define CLK_GOUT_CMU_PERIC1_IP		201
+#define CLK_GOUT_CMU_PERIS_BUS		202
+#define CLK_GOUT_CMU_SSP_BUS		203
+#define CLK_GOUT_CMU_TNR_BUS		204
+#define CLK_GOUT_CMU_VRA_BUS		205
 
 /* CMU_HSI0 */
 #define CLK_MOUT_HSI0_BUS_USER				1

-- 
2.49.0

