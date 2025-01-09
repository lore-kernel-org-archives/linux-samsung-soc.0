Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0B21507E;
	Thu,  9 Jan 2025 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413446; cv=none; b=M4TK/+31gEv5T6hof9lg6SE9oTXQb75NMdisxb6HUiTyrQS6/WWwKElnDGIWhrVB1m9Z4+PmgJaFYHkfLok5wssG4+ZqPWxeR+eZ3D9HaoF59F5djLE13Q5pM/hDiUmaDED1MIWbvQMOHYGh2ltRehYJLdug8JESmnOEnYti3r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413446; c=relaxed/simple;
	bh=GS1jmQ4tHCWjOzhL4edbvh0LliB33FGIfeF8EGqZjcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjcBBNi67ttckvoCpJrKzcrTFBFiGpkH+svkEsfZiSFrgnVF2TKFpVrnhKO7kJ4d+Iir2Jx1ofE0TmENtaXmBx3swDmA2LegDLrYmMkMNxv3VJR4XdmL/dZ8DVLKFLkoIb72c1yntDSXzFKl8vsDQ53Ii5Id7fMTs+OtVIClR5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSLVmVBJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSLVmVBJ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso638850f8f.2;
        Thu, 09 Jan 2025 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413443; x=1737018243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGvZ+f1Zyma1bBzTOIhQdIYYMP/e8EzANI82dsN3dLw=;
        b=iSLVmVBJkPYCqjvNg/QKCk6dcd8gGIQmlMWWfJpbrH5hxY0VMhvM+WTZv708/NwLz3
         4tCpXR0zbBSoT0FogTDpcKLeejn442h4uBUW6p+hFsx5Uiggs1vbRS9CBe58Ttti3ArX
         JLgGcLDlg6w/MgM9qwf5jI1vlNG5K7Ytyc0f9C0bMv5FNqSUnceJ02ft89DSEO/c5cu0
         3+QjUQeoglJxMBkkOQHmQEJqeO2wY++TkqY7e6f/JuzuG443kYLyC3nrCV+0zUBMa7x0
         RXLoFSY2sKRz3XSye44+6LOHNOBJ9sJB3GktAoS+00Cec098+3M19J1oSJ6FBiV+60OQ
         MULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413443; x=1737018243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGvZ+f1Zyma1bBzTOIhQdIYYMP/e8EzANI82dsN3dLw=;
        b=chAHAq84nCdzTCYYffAh6NTGqziktGB5BnpQibBKMVJEFqdQvNg4kEqzIQrkrQIKb7
         QnBtxYoWul/NL/VCiV9WuvDnQIZ0w7HmCKPILTMcXLLBKFEMA0hCJ5OXH1eNzBCg0mOf
         mPmCXPOs6PUE0OqJs3i7yAgYj7iXa6RI74txvX73f/4XtkDjw6NUfgQ9I3YXqK97uMov
         klXre+RJtiQOtkZCWnvg/muRz1Zwav4wBL3ewjR/sWc+4ZkV8OMH0R0RPc1DKP/YCUU8
         gy5LImpsfcb0hVhTdzYD58m1cwGqp452o+jrLY2lt4XRntKTSNrKP35Pd6laWYqcngWI
         FTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAJAJZst9uRCl3NqBYSx2XCaea6w1H2XnmcWXBbiuZdfCjj4lK2NzwCF42vHop6Y96KhcwovUSyYHW+I7gGo6LobM=@vger.kernel.org, AJvYcCWzgrObvn2k2uVt0waTgX0TsbPM95tiFVlGKhH/VGvwwrCn7BD5KEbxOOfzI5FWYwYyJKJg0r28+h7xzXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh0SU5VST0RfoTIKttQFWc9OWbwjwoVXrFfsOV7Pii9oI6z3+S
	fuVSn3p3KIM8HtdyV6/4QEUEfAzxuZTPz73msQvbo89Y8bTq3+SP/qAqzg==
X-Gm-Gg: ASbGnctr3NcxYIKHi+aq0r/qtg0T67IbyMIW2J9UrNFWwHqTuhxsMnarfo6ghGqKysJ
	HKWPcT4rWl7cq/EcW3HyGgs/cPTZidQ0eJHiRQeHTXeexfWyquWk0Qn/kt9plFdr6HOKUnUf9zo
	7mrJsu8EGCeGHUj6BcV+LbpocEgBshj/Rs0N5zDnOANoH/jegeNKLC2YMWZOcKQKR2huUhnAeIH
	KKC8rKSpZCyZeDmHfm7e45m0hBuxLYSoUnB+VygRigUmMoDD3IDDriVOFly4Y6q81S3TGRzmcl+
	PHH0X9yhIe1hmAVrQdQ=
X-Google-Smtp-Source: AGHT+IG+S1p+g9llpREUzQnFzEQznCPzgiIz8QVHak3a3fJsQBKY3XpKOsmNBaUFThwuDVvhWCgyDg==
X-Received: by 2002:adf:9796:0:b0:38a:88f8:aabb with SMTP id ffacd0b85a97d-38a88f8acdbmr3467553f8f.55.1736413442625;
        Thu, 09 Jan 2025 01:04:02 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:04:01 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] soc: samsung: usi: add a routine for unconfiguring the ip
Date: Thu,  9 Jan 2025 11:03:23 +0200
Message-ID: <20250109090325.595475-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a devm_add_action_or_reset() routine for unconfiguring the USI IP
block whenever the device gets removed.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..4b84f481b 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -174,6 +174,23 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 	return 0;
 }
 
+static void exynos_usi_unconfigure(void *data)
+{
+	struct exynos_usi *usi = data;
+	u32 val;
+
+	/* Make sure that we've stopped providing the clock to USI IP */
+	val = readl(usi->regs + USI_OPTION);
+	val &= ~USI_OPTION_CLKREQ_ON;
+	val |= ~USI_OPTION_CLKSTOP_ON;
+	writel(val, usi->regs + USI_OPTION);
+
+	/* Set USI block state to reset */
+	val = readl(usi->regs + USI_CON);
+	val |= USI_CON_RESET;
+	writel(val, usi->regs + USI_CON);
+}
+
 static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
 {
 	int ret;
@@ -251,6 +268,10 @@ static int exynos_usi_probe(struct platform_device *pdev)
 			return PTR_ERR(usi->regs);
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, exynos_usi_unconfigure, usi);
+	if (ret)
+		return ret;
+
 	ret = exynos_usi_configure(usi);
 	if (ret)
 		return ret;
-- 
2.43.0

