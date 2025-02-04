Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F068221639B;
	Tue,  4 Feb 2025 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690149; cv=none; b=NoqjfWhLmQ9qCT7q/0PpHaFaxRNuKD/6/UCRdAtjPQ2tiGaGGtSUhKx+U6X4vHvQti/c9DD8mxQudjB84VTvWHdeRIskQb3XLrW9yD1mly26CSHCiD9c6gbF8I7dQ+wm0j1u4qOCr6drYN3yTDSy1pZiLnFqplw2SAwHRDc68pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690149; c=relaxed/simple;
	bh=ZoF3Z9wfn8F9fYz69m+PqZ12wxV41mN3cRR/k8pzt3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJeN+Us/87QDSDvRAltA0GX0FHpPJjOWJQCov8QP84bfLNOUKCm7srgg2l8efMehT8xo/oGB6fZXM8HRp2pAQHCeUhziQS29oIYnCLiNllWQdpfWUo4EZXpvskPMbIf1IvNNhdsVXm81loOKlDU2DkJ6uJiSDJu/X5qy9DxdYOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSZOypH1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSZOypH1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab34a170526so929186466b.0;
        Tue, 04 Feb 2025 09:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690146; x=1739294946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1ZYlfQ5I0ElNygZ6hE0CR1HQzjz8E0f5rQWW+uT53Q=;
        b=MSZOypH1aEKv+NGgv1XfC5Y4z96aK2aYQ4X9WHIuf8A95Y+hZkKuX9auDtZoZ6Dkqa
         KBRvzxg6ia3oJrR5eegGeRtSkoVrqh087NMWlG3kRCqRpAu4EsPI4331SUqKjWBc7Ai5
         EAoJkvM0o01Ijo0+Exj6ilq9Km5b+atbE7aXUzhhTw87322zV7LBFA3S86YXUzmbTKxJ
         OwWxMuU3b7g6B/a+ynh2lqx7vodu3XDfrHp6s/pE7LbTyfGdcCwqnQUxv/Q4BdHYsxj8
         q5XQnMGXaWiLqUCA25sgcoySkhw05pJJ/eXm32oUWRcqLUSj7SkBZEXE1lZMbt57pQZn
         Mhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690146; x=1739294946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1ZYlfQ5I0ElNygZ6hE0CR1HQzjz8E0f5rQWW+uT53Q=;
        b=rBDAyNKDlaRHOKq1oyJqJitoGJxOcKrGFa+AvZBaPqoFq72tm3LvjFGWDzk7yD1pui
         SSKZETsDBZoxAoHyT6ib25Eg+0s9Ze4KaEjprJ1AIy7obe3QenuEgvKF4hQlogtgrSrf
         dS5hMZRsY/ITUICPZ4YdriOdz2bZ+99kIFrKMlMt/fqFOCYEVDd9v+ZECshSj9O242ne
         L1Y5cD6D6gRIH6kzErQgGSDVDlubVlIa+P0NPUFcVZ2+1xwXvbPwzHqHKnWFtds/H+BE
         yiAs46ibmaXo8vNnYFq2OkrpghrGM8ef456icvOP9/bf7OD2oRDhayQHKNAAliA4pTbe
         1Afw==
X-Forwarded-Encrypted: i=1; AJvYcCUF5N2l0u8dkSd7hvsD+4Su1tdnjoDDxSGs05ITBWEUkmGo8MnxjT/HJGoGw6NF3/l13zyC81EVToBpQTAUrqLSrOs=@vger.kernel.org, AJvYcCXS7Y1gxx3YSzrYTCAkFRS1g67STamwsVguOw/H+cLz6jDRrVD4pvsf6RTnBAWsAva0Bb+Hxb3bIfOqwqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXg4DPV+ErdwZRcfwuCdt8T7DDEkDnQ5oZycX4j4e8eRTVLqMl
	PRAMADDEC3yHhqkM7KabpakNMNEIIDB9tusMM4Cs/pcl5OV2BYD8
X-Gm-Gg: ASbGnct6F31CKIXIqFKrVejjgb6mGfvUXvSDxw4YogprdhI9tc9Iy5SUoxQ7kT1kdsn
	4NzGIYO/Q8nJEQ23Fvld3kqaRZxEKT3rhJO3Zobnvtw0d+0/rN8W+ocXtOWRWXt/wF2ddwqaVaY
	SA/3IYlQ1pNIlJPlTnqCpEp+dvZ5546ziAJx+YrczzLEzDsL2FhIAf/EJIUAsjtHgmIG5REvk1i
	Tkwxp6pEL+L2tYHHOSuyQPdVMuhF8KBflEx/7SmPZvDidRav2ZOcdQ8UcbET06i8J5rCBD6y+Aa
	V6+dPkQLOg5C/MoNx38nlD4dzFqMD1wSWrKscDpgkLGsXP6VdU3TAa9qpW7Y4rLSnu0=
X-Google-Smtp-Source: AGHT+IEpJOijiDcCjwtFF8cSqgFEaZCubHLE5XagVr3Cu6llzZV801QUD29OTEPZxbzLkYeWwSyXhg==
X-Received: by 2002:a17:907:60c9:b0:ab7:1cdb:c274 with SMTP id a640c23a62f3a-ab71cdbc2bamr1356827966b.39.1738690145967;
        Tue, 04 Feb 2025 09:29:05 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:05 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] soc: samsung: usi: add a routine for unconfiguring the ip
Date: Tue,  4 Feb 2025 19:28:01 +0200
Message-ID: <20250204172803.3425496-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
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
 drivers/soc/samsung/exynos-usi.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..85329d4e8 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -174,6 +174,30 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 	return 0;
 }
 
+static void exynos_usi_unconfigure(void *data)
+{
+	struct exynos_usi *usi = data;
+	u32 val;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(usi->data->num_clks, usi->clks);
+	if (ret)
+		return;
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
+
+	clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
+}
+
 static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
 {
 	int ret;
@@ -255,6 +279,10 @@ static int exynos_usi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(&pdev->dev, exynos_usi_unconfigure, usi);
+	if (ret)
+		return ret;
+
 	/* Make it possible to embed protocol nodes into USI np */
 	return of_platform_populate(np, NULL, NULL, dev);
 }
-- 
2.43.0

