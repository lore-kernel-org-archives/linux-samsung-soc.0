Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304287E573
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Apr 2024 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713521369; cv=none; b=MozCYdXsA9orCj4LIcCK7rfzWuxFsQb36nBaGYUADdfWLxvBQ0iVqyjV+x9hytlPvhcIKy6svQlNKuHlo8n2wxKhFgFHhY2r6qihRraI+qVUtU118HAvC1anA/9OM+riD81OwOi+P7W7sULo6PJWguMvjwcunZ2qLQQe8gDfePA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713521369; c=relaxed/simple;
	bh=bXJMXZ68DgUOW1zy7tUTKJEKi+m85eA9cqt47G2kTmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NyPmMJ3Xqrbm9+pFycSnh2e98VNgbCkQnCxQuC0CqdOOyzZY/1fpUkrQG5DN/AgX/y1DrzHw0lhxzP/IL5rYFDSXrt/Bv8DmtnmT6A4uO5i2hnXJe4ZyXwenDDiCW7ktcwZzlw+uj/CXTo1MsFhc9aBWU1FHie2l+q5rQGoXkVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZSZwILu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZSZwILu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-343d1003106so1337784f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Apr 2024 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713521366; x=1714126166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDdtreEIc+pN1pyeh91rfo/1psHMMuNAA8V0eM8Sv8I=;
        b=gZSZwILuInxuL9Nipk/KQCO7Mw6MyU5cv4RgbybEM7Z3inW0P9wtj0P8LyK746peKo
         lRXVuiUJvxQwrfZ90+axEiAJrqQKMEaiaEnlJMxB3HV8xlgFSXMwp8OJQcMcg5Dbp0Wa
         IVu/RwvYvlMfqXEPoJn6xeFxg9KIpDWzatiFHilolHFeA4pjqLrMlepwSlUJkSkwOFGt
         3iDFXEj3TbVIJJFO+qpyHcDRQJM3JEQdy7hOGM+XuH7iu0hOeIt18B0lehjB5tbcvhmE
         Trt+bS7FWH5/p549MZZA78WboZ8X/go2OH7qlSvkA71y9mJJgHPgOmlOXieKXy1+sa/T
         jfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521366; x=1714126166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDdtreEIc+pN1pyeh91rfo/1psHMMuNAA8V0eM8Sv8I=;
        b=KZsvtcuQiSlSeQvaaN5JY93IRzUDPYP29O7z6Nks02BYjb+3tZzNwJz19r5cQ1Z8XC
         1KbIBT4kdW896SkhuMNmu/TpmIpmHEhVMKBAsyLOzD/ViN9G2JEf8Uzj2V3MyfHfgIDX
         oRcyjrlNO++Bv2HqnVtp85jh+MN/fDv19ak4H735BrWP+gvtsq5SSRISHz9aJzmYeR2u
         l3aQMt7uM8JAjtViZ+YL5g3VUVe5neuR5vwNjmWjxUFC8C/kH/H4wp5jKKk3BEeZ7zhD
         q4WeZ1fUF4LzhkMEyM/uv4n2r/AYPcwE1ex6WQEB9fywhFloFElExJYHX0DWhCYSxl8H
         AlUA==
X-Forwarded-Encrypted: i=1; AJvYcCXohjWPVqy8pCkmVGerPc+WeFwHfDs5R3siQ30XTPVNgkd/v011+gPZ2LZ4Jb33ost20jDE92+NMK77kl/SklFdvS+6M23AXMAn5kOB+CaDRR0=
X-Gm-Message-State: AOJu0YypYcXcoyXXsPsqP0UZWvMvLUG2247ABM7o0oM8W/kRNLPT8NSh
	PH98JgFnWjoBOmMdPl4l7+dYeyy58OFwySOYHxyGIlNWoLmHuLskzPGSnslzXOM=
X-Google-Smtp-Source: AGHT+IHRURSzCXJcKnyxbgA1qGZn8zl0c7bkl9QVzrrsd7uo4yKg7LtdHME2l7ZWITA9DG007nuCvg==
X-Received: by 2002:adf:f28e:0:b0:343:751e:8ef7 with SMTP id k14-20020adff28e000000b00343751e8ef7mr1312440wro.51.1713521366511;
        Fri, 19 Apr 2024 03:09:26 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4061773wrm.75.2024.04.19.03.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 03:09:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	semen.protsenko@linaro.org,
	andre.draszik@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 2/2] clk: samsung: gs101: propagate PERIC1 USI SPI clock rate
Date: Fri, 19 Apr 2024 10:09:15 +0000
Message-ID: <20240419100915.2168573-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240419100915.2168573-1-tudor.ambarus@linaro.org>
References: <20240419100915.2168573-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When SPI transfer is being prepared, the spi-s3c64xx driver will call
clk_set_rate() to change the rate of SPI source clock (IPCLK). But IPCLK
is a gate (leaf) clock, so it must propagate the rate change up the
clock tree, so that corresponding MUX/DIV clocks can actually change
their values. Add CLK_SET_RATE_PARENT flag to corresponding clocks for
all USI instances in GS101 PERIC1: USI{0, 9, 10, 11, 12, 13}. This change
involves the following clocks:

PERIC1 USI*:

    Clock                              Div range    MUX Selection
    -------------------------------------------------------------------
    gout_peric1_peric1_top0_ipclk_*    -            -
    dout_peric1_usi*_usi               /1..16       -
    mout_peric1_usi*_usi_user          -            {24.5 MHz, 400 MHz}

With input clock of 400 MHz this scheme provides the following IPCLK
rate range, for each USI block:

    PERIC1 USI*:       1.5 MHz ... 400 MHz

Accounting for internal /4 divider in SPI blocks, and because the max
SPI frequency is limited at 50 MHz, it gives us next SPI SCK rates:

    PERIC1 USI_SPI*:   384 KHz ... 49.9 MHz

Which shall be fine for the applications of the SPI bus.

Note that with this we allow the reparenting of the MUX_USIx clocks to
OSCCLK. Each instance of the USI IP has its own MUX_USI clock, thus the
reparenting of a MUX_USI clock corresponds to a single instance of the
USI IP. The datasheet mentions OSCCLK just in the low-power mode
context, but the downstream driver reparents too the MUX_USI clocks to
OSCCLK. Follow the downstream driver and do the same.

Fixes: 2999e786d7e9 ("clk: samsung: gs101: add support for cmu_peric1")
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 90 ++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 76d4d0fa1168..bd3c1b02715b 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -3239,47 +3239,53 @@ static const struct samsung_mux_clock peric1_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIC1_I3C_USER,
 	    "mout_peric1_i3c_user", mout_peric1_nonbususer_p,
 	    PLL_CON0_MUX_CLKCMU_PERIC1_I3C_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC1_USI0_USI_USER,
-	    "mout_peric1_usi0_usi_user", mout_peric1_nonbususer_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC1_USI0_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC1_USI10_USI_USER,
-	    "mout_peric1_usi10_usi_user", mout_peric1_nonbususer_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC1_USI11_USI_USER,
-	    "mout_peric1_usi11_usi_user", mout_peric1_nonbususer_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC1_USI12_USI_USER,
-	    "mout_peric1_usi12_usi_user", mout_peric1_nonbususer_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC1_USI13_USI_USER,
-	    "mout_peric1_usi13_usi_user", mout_peric1_nonbususer_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC1_USI13_USI_USER, 4, 1),
-	MUX(CLK_MOUT_PERIC1_USI9_USI_USER,
-	    "mout_peric1_usi9_usi_user", mout_peric1_nonbususer_p,
-	    PLL_CON0_MUX_CLKCMU_PERIC1_USI9_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI0_USI_USER,
+	     "mout_peric1_usi0_usi_user", mout_peric1_nonbususer_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC1_USI0_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI10_USI_USER,
+	     "mout_peric1_usi10_usi_user", mout_peric1_nonbususer_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI11_USI_USER,
+	     "mout_peric1_usi11_usi_user", mout_peric1_nonbususer_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI12_USI_USER,
+	     "mout_peric1_usi12_usi_user", mout_peric1_nonbususer_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI13_USI_USER,
+	     "mout_peric1_usi13_usi_user", mout_peric1_nonbususer_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC1_USI13_USI_USER, 4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI9_USI_USER,
+	     "mout_peric1_usi9_usi_user", mout_peric1_nonbususer_p,
+	     PLL_CON0_MUX_CLKCMU_PERIC1_USI9_USI_USER, 4, 1),
 };
 
 static const struct samsung_div_clock peric1_div_clks[] __initconst = {
 	DIV(CLK_DOUT_PERIC1_I3C, "dout_peric1_i3c", "mout_peric1_i3c_user",
 	    CLK_CON_DIV_DIV_CLK_PERIC1_I3C, 0, 4),
-	DIV(CLK_DOUT_PERIC1_USI0_USI,
-	    "dout_peric1_usi0_usi", "mout_peric1_usi0_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI0_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC1_USI10_USI,
-	    "dout_peric1_usi10_usi", "mout_peric1_usi10_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC1_USI11_USI,
-	    "dout_peric1_usi11_usi", "mout_peric1_usi11_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC1_USI12_USI,
-	    "dout_peric1_usi12_usi", "mout_peric1_usi12_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC1_USI13_USI,
-	    "dout_peric1_usi13_usi", "mout_peric1_usi13_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI13_USI, 0, 4),
-	DIV(CLK_DOUT_PERIC1_USI9_USI,
-	    "dout_peric1_usi9_usi", "mout_peric1_usi9_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI9_USI, 0, 4),
+	DIV_F(CLK_DOUT_PERIC1_USI0_USI,
+	      "dout_peric1_usi0_usi", "mout_peric1_usi0_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI0_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI10_USI,
+	      "dout_peric1_usi10_usi", "mout_peric1_usi10_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI11_USI,
+	      "dout_peric1_usi11_usi", "mout_peric1_usi11_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI12_USI,
+	      "dout_peric1_usi12_usi", "mout_peric1_usi12_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI13_USI,
+	      "dout_peric1_usi13_usi", "mout_peric1_usi13_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI13_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI9_USI,
+	      "dout_peric1_usi9_usi", "mout_peric1_usi9_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI9_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
 };
 
 static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
@@ -3314,27 +3320,27 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1,
 	     "gout_peric1_peric1_top0_ipclk_1", "dout_peric1_usi0_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_1,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2,
 	     "gout_peric1_peric1_top0_ipclk_2", "dout_peric1_usi9_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_2,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3,
 	     "gout_peric1_peric1_top0_ipclk_3", "dout_peric1_usi10_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_3,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4,
 	     "gout_peric1_peric1_top0_ipclk_4", "dout_peric1_usi11_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_4,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5,
 	     "gout_peric1_peric1_top0_ipclk_5", "dout_peric1_usi12_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_5,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6,
 	     "gout_peric1_peric1_top0_ipclk_6", "dout_peric1_usi13_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_6,
-	     21, 0, 0),
+	     21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_8,
 	     "gout_peric1_peric1_top0_ipclk_8", "dout_peric1_i3c",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_8,
-- 
2.44.0.769.g3c40516874-goog

