Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1A326D75;
	Wed, 20 Aug 2025 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701964; cv=none; b=g2WTUuyzvWkrNVOt8+Fnh8mdPbsJwBJdkYYpFvoJFlQsHuB1ZFdJk/Bz4xaiXOfHteSw5CUv7tJBSiFfa5iM6CgSm3D5gPZXkDIJ6yfP4bUT/rXhBGYjDiCPvv2W6g6Prh6C6YLxIlMvu7m4Dyjv55WGUqN0tsy4qXpTLWaMu8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701964; c=relaxed/simple;
	bh=IZSjRet90Z7ssCuwoIO31SUnba8YT9zfKUtMi4mD8fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQxDF6CEicZ+35f/WmFFQp0dezAakc3rQ85JPjmatnLu++Y6tt7RYVlYrsNNMg9L54F7a8djXyOFzTv6sLWPjo8TNsJklsxoRG5+WzIuYrN6RDfN4h2IK5bIBTo/qxZDVb7KIvBSI+I4v6RTfis2fRDC0yrFKqr/e5IAe6Jk2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3A72h2W; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3A72h2W"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so9217b3a.2;
        Wed, 20 Aug 2025 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701962; x=1756306762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KkOOM0vdlCAI+wIK/wdqoZizl1s5oNfkaIbRaWdhzk=;
        b=A3A72h2W7TePTgYj6Y/eHbrORq75fqPivW/oH9hy90kHwHSZHx6ORzCgOfF6BFvQmK
         NK35qVzAbXZaGDGFXeAtA11pC9/Vl36ql8KT8l1zEsb3e/9oQNdyFJxeVmxp9Inaluio
         YdN3FuBdHCd9XQ6vhA5NLHgWych3NPVm/9Y6Pllu2nR4dmT9xYYwoa9mjGRVBenuXX3I
         MB7NpzgtKlIaG6hH4d3elRCGPcD/FxXROZI3S/XoNXDZ//4puuxPInFMDMJg4IqjhLzm
         5sOzZJk6aUYIE80wqF9vZP8BF3NCQ2WQo093wRXBU8nc4qnw33E17Dm2RdGdiWyCE/Nw
         LrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701962; x=1756306762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KkOOM0vdlCAI+wIK/wdqoZizl1s5oNfkaIbRaWdhzk=;
        b=JffMTFcKuU2QeqQhbjEQvl4VdSJ6BM+f02xVrFn3t3aZjNKzxsSxYYA3Swqx0bfJZ1
         2Rw/Zyt0VrXLms6PjOtm9cu8lvtQbijqPPdZ9H98gngs5gUExw/ledYNzeZDp3B9+bMg
         vX/AU3U4nT/FNrwQKXKPZTMO4CVpWq7+Crcj+AXxsNi8Rrcem9APHfnmAsJs/HvtviKq
         mhScAiuJZa3TMBdBTYs+wOjWEWPihL0lhR1/TwQs2fki0gDMw/IlW5dA99amiXl8OlUC
         c/vAV/+W0Z6k8zipMDnhCi5KeSyrK5fd2qo5EsRcrV1oKbsnSCN7hxav+QEoUZsaUDAE
         EW7w==
X-Forwarded-Encrypted: i=1; AJvYcCW39mX2une97ymzJBJW0I2zylnqd84oGarjgxFYhx4XS5RRXNBR4YGjkbJtN/OFvtwh44BI6w1IukLA@vger.kernel.org, AJvYcCXKel/9uOkVmxyHXQabeX42jgmFML2ru+BBeNocGBoptu2ip6wFONxGcCHo9neLr3EMOAzrTYNmVenM@vger.kernel.org, AJvYcCXLZ+wWDtLZvqmm+lsvicfb8pcGZqZkI7vkyn5j4xslc4vn9O20wHaJu3JmukQxNPj1HxFtTPzPz2VJrc4F@vger.kernel.org
X-Gm-Message-State: AOJu0YxqV8jakK08TmkEwbgPvPS2nEnA3Xu3RL2CextevvO5ulARnP9O
	ILuS+wE8pxhYUvhA4BOH88i6b2ZefZ8vO1IWDQx/LVAZZjRiu1JMiaHr
X-Gm-Gg: ASbGnctVw3PSBKboL2/eA5owM+mm/QKvzFfXLOQlasc/DG0ZoZng1O26SZ11ZalGuvn
	r/Jf8Xi/LEEKEIpZEoT6Ljcr5kYZD6GLU/HqXr8BqWxdZdjpUCIzLkaBmy4jA+T/ELmSagPQXIW
	v1+vtgwNH1leD49nuHEGHsR9Q+WPWdiIsQiEZy9jEYDav0rUX7uSywwCIioYv1lB4I4w8o5jbSn
	iyaF70eemDwiadioyvzl+hf7/2yqVTJcNyXjsuHxQLtQAlS2j9paW1lq8QwTt/nPQPfFBlyGI5s
	jT3SfMf1AwFkz+3yIu0aVzpk45I8X61N6LYWBqeuCnRGCznZsGBrw6DsWcdoOYfWo198QWY0GcD
	KScl9eZXbM0EadQX6J2QjEf6ZiDqmCcVBy0j5GVdu+vXUPeE=
X-Google-Smtp-Source: AGHT+IHXYambFF29Q0hwxvIFjh2f7tUM4xwJo63XfQ75yoaWfpIRIjajUj3MhVEp+rCx6yKdCppBHA==
X-Received: by 2002:a17:902:ec88:b0:240:1f19:d35c with SMTP id d9443c01a7336-245ef24ca4dmr40333355ad.39.1755701961611;
        Wed, 20 Aug 2025 07:59:21 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e257809esm2606455a91.24.2025.08.20.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:59:21 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 20 Aug 2025 09:57:23 -0500
Subject: [PATCH v2 2/3] dt-bindings: clock: exynos990: Reorder IDs clocks
 and extend
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-2-v2-2-bd45e196d4c4@gmail.com>
References: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
In-Reply-To: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755701949; l=15686;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=IZSjRet90Z7ssCuwoIO31SUnba8YT9zfKUtMi4mD8fU=;
 b=x6cUqoRJVYtcSDd3AOy/F15Vh44kENMLu2Vn8aNkxN0+P9p2d7Dmbld8rDq6D/wH0G8VPwtEw
 UH2lYdkuxfzAaYrRjfEZD6yqdVnFHfekm6I731z28g0xpPibclkYEwg
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

