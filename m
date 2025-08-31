Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AAB235057;
	Sun, 31 Aug 2025 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756642399; cv=none; b=FLGtRbhHBqo9qYqeFsq82xb5mqNS9DLi8izfUH7Jxc8xUngN6GeHz4v3huTReG5zvgkwm5q6Bx1onbFRbkwkOIoXrkj1d2F237YDZAGYDujgE9bBADzr6OG2Qnc8rvtBJZxKuDDZqeitG3+JZJ/Or/SIE/oimXCJ+3UsPvzm0oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756642399; c=relaxed/simple;
	bh=Pu/jnxs8vnoSEdVAdFl2BrrhE0Ef1+tymfgD1ZqCFYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UP2hk/b0TGj2nIo4EBB8ceTx9SVlUyAHOxBGA5uDbV8OC3cKor8KKFg+mpPITWqauuI5xxMQsLEQJax3ilYKfVqlIVdpcsKkCZyGqVYsii58ccDdmRTE/trQoRZWKVg3RFo84SRcMgV0gaGHyqO4FXUpjlXGfa/6GLSlin0w0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rz3f+lo6; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rz3f+lo6"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7fdddb25854so159594585a.3;
        Sun, 31 Aug 2025 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756642397; x=1757247197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDmfIIxvbccs+VTC9JbCAL+D/6aBtsGaiV5H5qK73Vc=;
        b=Rz3f+lo6x4NvsgV3nRzRpwb+KmAKJiLhGnzyaD/DJIOFHhbxAfLetUJJ8CPos6osJN
         y4WyCFe8jcCUYetGfrfFN4jpok3jPyaxdw0EwhN19YUF8weKIKAwpnMujWz7VF+21Rte
         aNWzLHh9mVxkcitXfxm8MmDRejfMtvDfnnV0TF0n0eIiLUahgrbWSXJI+MVTnEMMU+xo
         zMtrFkYM/arMO3hrQZe1glkTqSWM2o1rQIglOYxgkOLNdPJeQS2HrT/+pvXaq8c/gue9
         8t7UKh50SPWPTMXTvLAXt92rsriL00M22ykWSyfWaeB/PqtsqctYeZNGOkCJfo36rZ6N
         Vmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642397; x=1757247197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDmfIIxvbccs+VTC9JbCAL+D/6aBtsGaiV5H5qK73Vc=;
        b=gmXfNZ3gsBcKRnH3o9/Re67ywKBaRs7hQxFTm9OLqBCehSUToRetuSVamO5hpmfvde
         OWcnnQA+ZurBMdS9Ozkgp4qysRg6hyGSnvN5kTKtrpOqVxfag+xvLkZ2EyRMzhNIyJCc
         3CQXwjMV/D/6O0Qr5/9kCbykPk4+mSmGNwVg5+Ad27p1rVSLb+i0BeePZ9XR2inkRFde
         g1VGdBTNHbuJ5RwJQqSz+DTSHD/mTRelCFf1bJ/6zoYg/l53L5isc3KbV2VcpZl5Xm6O
         7eBMXopD20PKZ1SJih8gJSVhhO/m7sFgfeH5iFGQSZUXpZi6pwLq0r/pL5HP3CtCCmdE
         7CzA==
X-Forwarded-Encrypted: i=1; AJvYcCUEJeTVcv+fdXd4caEcI6Ygd9UuVKRg+SPBherXDl3TU5Hv+8Tp1lv7SJtqhfoJzDnXx56Wdhk6GHlV@vger.kernel.org, AJvYcCV+q+1UhmL415nBvxvI99pCU9w4wdCJEvalY9A+jeJJDgURugbJtaU9SCGYltAqfD9vGnCINpk0O5Z4@vger.kernel.org, AJvYcCWLpR6wWJbtd21uRO2nNHbzbF2oHosFA5kBQX7EIcggwJy1pSAL7Qv6bWNUjp2vmtc5oMWmKbpRA/fKhBjK@vger.kernel.org
X-Gm-Message-State: AOJu0YzKfC6WwOcXq8RDJmi7dRWFAhNecY4KSbnH+b4IynxhxImSqdhq
	dSo1cAERWC8z1eWgxpQ/TxO0Nv3yq4Wa2eZJ1mijqPecgORRijmjqdK/
X-Gm-Gg: ASbGncu6YcuiroP1kTQeKU/JuXMRVphmcKDLcxCc0Rnn5kwxR6UCaO6n72ZGI85Ff7q
	Nfd8heeHzXG9LOz00207FtbviAilj2HboVV7htYmLNInc9+u/hf8Un49iuhF4weP427lMMkEzxF
	L5wbUAPcB2AYj6/5fk2DNXq5ki8epjLCU5T6TaXHl5yQbWrCwDZIjCmVq7+j7LqEyGGjlJwZKo7
	MHPhbS7Paqg15R+ODUDIzjmcDu3zh/BZBOYS/RRVZMON00b2a8VsVlGfAq7XLvqlF6Owq+2KoNC
	ssJEOHf6qPUZakNeTvR8oLFCCRbwfobfyRnXvVMVEkcbBMcnLqidY/WZrR42vYGrz/rCNhHyFPf
	pc7fxTUmCyFIM/RNPhVNvZg9zfAm6omE=
X-Google-Smtp-Source: AGHT+IEfAh2UbkwIQ39wtorHVguSuFgrNsM8OO8yQro++Hj3XAfs/mNEBkj0O/3oJVq6SgUMzK0njw==
X-Received: by 2002:a05:620a:17a8:b0:801:3834:f643 with SMTP id af79cd13be357-8013834f6c4mr197407185a.57.1756642397105;
        Sun, 31 Aug 2025 05:13:17 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb289f518sm21163776d6.56.2025.08.31.05.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:13:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 12:13:15 +0000
Subject: [PATCH v2 2/3] clk: samsung: exynos990: Add LHS_ACEL gate clock
 for HSI0 and update CLK_NR_TOP
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v2-2-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756642395; l=1601;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=Pu/jnxs8vnoSEdVAdFl2BrrhE0Ef1+tymfgD1ZqCFYw=;
 b=zy4l1QKfCVLor0PXgeTtwdg6HleS57KspRKQ3hEkCQh3sSRZ3FxdOdhzXAlNXihshzq9NUphb
 hT0ddS/LwMiD3UzURxrl/9WIm5dZC3ETlNQpi+dOY9F9XKE1z3XG1Zi
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add the LHS_ACEL gate clock to the HSI0 clock controller. This clock is
critical for USB functionality and mark it as critical to keep it enabled.

Update CLK_NR_TOP to include the new clock.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 91736b15c4b4a0759419517f7b04dd0a8f38a289..7884354d612c54039289fa9b80ad08f34b9b7029 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -18,7 +18,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP (CLK_DOUT_CMU_CLK_CMUREF + 1)
-#define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
+#define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
@@ -1332,6 +1332,10 @@ static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
 	     "gout_hsi0_xiu_d_hsi0_aclk", "mout_hsi0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_D_HSI0_IPCLKPORT_ACLK,
 	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK,
+	     "gout_hsi0_lhs_acel_d_hsi0_clk", "mout_hsi0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHS_ACEL_D_HSI0_IPCLKPORT_I_CLK,
+	     21, CLK_IS_CRITICAL, 0),
 };
 
 static const struct samsung_cmu_info hsi0_cmu_info __initconst = {

-- 
2.50.1

