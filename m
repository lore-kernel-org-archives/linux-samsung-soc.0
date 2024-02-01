Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E6626C8
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Feb 2024 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706803996; cv=none; b=BEWQyeVuDyPbmc9emWTdMb0DRpE1SZy6KvDbLzeiryh/2rcS53dkRf4acb0NHCSAL1YylFOS3pVUqTWwM/4Gxs85096M7CzfKu1Z8wojbEY5kHdyZMePPu/ri3jsG0B8cn0TLXKLCOLRWAicBf67N0SgDusAAQsj2F+NqOPXerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706803996; c=relaxed/simple;
	bh=4g4oeLkyvI9yPvW/99OZF63K5JP2Jb5d/COpANjZmkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9rE0Ldkot7pTjAGSdd8TwA67PaJMxKJM8KXsXQft3UyqKj69hA3UA9oxJFkRAB6uWjvwn1Ii4RyKV1xy/pZOGpzjlPsBlu0YDa2HGYxpY5ZYjONNdYCyoWM+AHDKp/oH6LKnHgrP7tf/srYYK37O1EZ1C9p/1VQmdX1nA6LSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FW2mTfxt; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FW2mTfxt"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3566c0309fso148616266b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 08:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706803992; x=1707408792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CMDfrriDlhVkmg2HgWoNsoiRK3PWpB1i2lPeAsE/bE=;
        b=FW2mTfxtvDISpS/GPN/Xhnqcl76YDGvy/SQWGx8fhrLjqctOYBeMnfdkaRtmGmZsCk
         MGRp6rXInj7aufcssm5kUnkv9iYC2Xb8rSG30CnBSiPg1whWPI9zcaz1mClaEB7qHf+p
         eJA4deQi2yPV4TlB0f2CabhFsedTFvE0VW2dKfoc/gbzV/uVnsHrgl3grJXbizJfTMNK
         /UXSKmD+jIcJ20zSZcJT0km8R0+ARL5BwSA7LHSRolkvQG9GUuDarWPobV9/HmiQ1pRC
         KF1G6SJQxcxw3cIBs8HTBnYIiwdHcjTDpSFn7YLDF6qq7JGNShzGuFaxGpcbXfE7NNfR
         hS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706803992; x=1707408792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CMDfrriDlhVkmg2HgWoNsoiRK3PWpB1i2lPeAsE/bE=;
        b=Kxm3cWYDjjwdDzDtfuQP/1zFlsAbvW50jcmunqMbhFtb4s9CkjSQd2oXj2O79tFRrg
         G0WX+nK6cCABIU8sZb91EJVbzd/JXTSCpnPRkt7WIH510DwtO+PFxpnVRupQ8ydV11v6
         SEen5ex2Zxsfxhi2UVPjzkM+bh3itacFPRwnZfgIaKs82iUfTgnQwHLR8mvvpyaQjUoc
         65am6XcW49oNN/z1vF9hVee4QZNwRtGEHxa4ZNJqeMNLUV8RKIvRqebDQwio4N5mOTIK
         yhrdnv5stv8pM/ndxHffGEF7TuJnw1pcm6KzX/RD3I0GJN11Ya2Zj+UBrFtjOFfBWYBm
         aEZA==
X-Gm-Message-State: AOJu0YxJWbUlG13vIC7/DoQhwVZF+GTaa4Uq8a2pFe2OLU6TOcFotGfb
	TAmVrThPEJLxN2eWq8a02NHqR4q2cHO4+woWVINLJsgGfy+gy+MYHyqePnjNRjA=
X-Google-Smtp-Source: AGHT+IHdhnIceSCTOOFDmasVqeqp04qrQ+ruz2Juam1HF6QeNdCiwayJH9TDcVmlf7fJYCUGU+WR7g==
X-Received: by 2002:a17:906:d7a2:b0:a36:896a:d0ad with SMTP id pk2-20020a170906d7a200b00a36896ad0admr3356237ejb.50.1706803991764;
        Thu, 01 Feb 2024 08:13:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXjINwzfuWnY/nH49tC4b4KBDHTEmXD3TmbEexeXcMw39YsbidjD2KFN+bI1ciR2XEuiRZOl0wVfrGZDAAdSn6jMRxKkNd43LfgV9PJXN3U8SsYRiTMLsv8TI40WZ0+Vx5ePOxjWVxbyJ5PgQz3rXXeMs5tGqsueDPLMS1OS1Sf8NOyW9cGD2Fw2LuuJ0wa6kv0PQs7Yec7wa2atcSoGBysFN0DIOiv+yUt0gblL1KdurK7hGK5DeY2pPMC4MNdcNYiXNtcW//PmmW3RJYr2Rx9YTuNujpFKMGAg67pW6QcVyVNGhJuFvCmMQ48D/pMZqD59WRcQ96yLBmAAO106hbpRR4OLplt520/44OKJGjTb48HBPUOd6O/Ihg26f2K68Y4EYMwU8iW36tStn8ijPMG6QQTet5ZW+5OGE4ccaLZi49fAPXgeLKjjtusJ1xJBuSl4ywIOEBtAcEDykA0EzCSTEJQc0rPR1mip0Lw6KskpgkTP4xTfc0I0khN14lXiFTjnpJ1PpBozzvtxjUn8Djqcy9MIr3PX8b95E/SPfwB6FPwjyEWGmDNFh/UENaaRWyhfR1jP57lNc7l0odxEQtmXt2xz0hitYZdZXQJOuvJ/JNF0bOru0IVWIVpPVDcrF27jIdCfJc+DR03cq6/fmOEuCoZdMMPgGSOFFrHTInVnDqVJkR27JzTJcSdPDBfyTAXFjzWCZAJ
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id hw18-20020a170907a0d200b00a3600d7c2fbsm3449288ejc.176.2024.02.01.08.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 08:13:11 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/7] dt-bindings: clock: google,gs101-clock: add PERIC1 clock management unit
Date: Thu,  1 Feb 2024 16:11:38 +0000
Message-ID: <20240201161258.1013664-3-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240201161258.1013664-1-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add dt-schema documentation and clock IDs for the Connectivity
Peripheral 1 (PERIC1) clock management unit.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---
v3: collect Reviewed-by: tags

v2: collect Reviewed-by: tags

Note for future reference: To ensure consistent naming throughout this
file, the IDs have been derived from the data sheet using the
following, with the expectation for all future additions to this file
to use the same:
    sed \
        -e 's|^PLL_LOCKTIME_PLL_\([^_]\+\)|CLK_FOUT_\1_PLL|' \
        \
        -e 's|^PLL_CON0_MUX_CLKCMU_\([^_]\+\)_|CLK_MOUT_\1_|' \
        -e 's|^PLL_CON0_PLL_\(.*\)|CLK_MOUT_PLL_\1|' \
        -e 's|^CLK_CON_MUX_MUX_CLK_\(.*\)|CLK_MOUT_\1|' \
        -e '/^PLL_CON[1-4]_[^_]\+_/d' \
        -e '/^[^_]\+_CMU_[^_]\+_CONTROLLER_OPTION/d' \
        -e '/^CLKOUT_CON_BLK_[^_]\+_CMU_[^_]\+_CLKOUT0/d' \
        \
        -e 's|_IPCLKPORT||' \
        -e 's|_RSTNSYNC||' \
        \
        -e 's|^CLK_CON_DIV_DIV_CLK_\([^_]\+\)_|CLK_DOUT_\1_|' \
        \
        -e 's|^CLK_CON_BUF_CLKBUF_\([^_]\+\)_|CLK_GOUT_\1_|' \
        -e 's|^CLK_CON_GAT_CLK_BLK_\([^_]\+\)_UID_|CLK_GOUT_\1_|' \
        -e 's|^CLK_GOUT_[^_]\+_[^_]\+_CMU_\([^_]\+\)_PCLK$|CLK_GOUT_\1_PCLK|' \
        -e 's|^CLK_CON_GAT_GOUT_BLK_\([^_]\+\)_UID_|CLK_GOUT_\1_|' \
        -e 's|^CLK_CON_GAT_CLK_\([^_]\+\)_\(.*\)|CLK_GOUT_\1_CLK_\1_\2|' \
        \
        -e '/^\(DMYQCH\|PCH\|QCH\|QUEUE\)_/d'
---
 .../bindings/clock/google,gs101-clock.yaml    |  9 ++--
 include/dt-bindings/clock/google,gs101.h      | 48 +++++++++++++++++++
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 03698cdecf7a..1d2bcea41c85 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -31,6 +31,7 @@ properties:
       - google,gs101-cmu-apm
       - google,gs101-cmu-misc
       - google,gs101-cmu-peric0
+      - google,gs101-cmu-peric1
 
   clocks:
     minItems: 1
@@ -93,15 +94,17 @@ allOf:
       properties:
         compatible:
           contains:
-            const: google,gs101-cmu-peric0
+            enum:
+              - google,gs101-cmu-peric0
+              - google,gs101-cmu-peric1
 
     then:
       properties:
         clocks:
           items:
             - description: External reference clock (24.576 MHz)
-            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
-            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0/1 bus clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0/1 IP clock (from CMU_TOP)
 
         clock-names:
           items:
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 64e6bdc6359c..3dac3577788a 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -470,4 +470,52 @@
 #define CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK		78
 #define CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK		79
 
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER			1
+#define CLK_MOUT_PERIC1_I3C_USER			2
+#define CLK_MOUT_PERIC1_USI0_USI_USER			3
+#define CLK_MOUT_PERIC1_USI10_USI_USER			4
+#define CLK_MOUT_PERIC1_USI11_USI_USER			5
+#define CLK_MOUT_PERIC1_USI12_USI_USER			6
+#define CLK_MOUT_PERIC1_USI13_USI_USER			7
+#define CLK_MOUT_PERIC1_USI9_USI_USER			8
+#define CLK_DOUT_PERIC1_I3C				9
+#define CLK_DOUT_PERIC1_USI0_USI			10
+#define CLK_DOUT_PERIC1_USI10_USI			11
+#define CLK_DOUT_PERIC1_USI11_USI			12
+#define CLK_DOUT_PERIC1_USI12_USI			13
+#define CLK_DOUT_PERIC1_USI13_USI			14
+#define CLK_DOUT_PERIC1_USI9_USI			15
+#define CLK_GOUT_PERIC1_IP				16
+#define CLK_GOUT_PERIC1_PCLK				17
+#define CLK_GOUT_PERIC1_CLK_PERIC1_I3C_CLK		18
+#define CLK_GOUT_PERIC1_CLK_PERIC1_OSCCLK_CLK		19
+#define CLK_GOUT_PERIC1_D_TZPC_PERIC1_PCLK		20
+#define CLK_GOUT_PERIC1_GPC_PERIC1_PCLK			21
+#define CLK_GOUT_PERIC1_GPIO_PERIC1_PCLK		22
+#define CLK_GOUT_PERIC1_LHM_AXI_P_PERIC1_I_CLK		23
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1		24
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2		25
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3		26
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4		27
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5		28
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6		29
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_8		30
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_1		31
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_15		32
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_2		33
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_3		34
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_4		35
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5		36
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_6		37
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_8		38
+#define CLK_GOUT_PERIC1_CLK_PERIC1_BUSP_CLK		39
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI0_USI_CLK		40
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI10_USI_CLK	41
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI11_USI_CLK	42
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI12_USI_CLK	43
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI13_USI_CLK	44
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
+#define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.43.0.594.gd9cf4e227d-goog

