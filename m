Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9BB221290;
	Sat, 12 Apr 2025 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744490004; cv=none; b=WzLemww/mCvipuFIl9CIFLrulyF5MXaXmXHeOehhvmQIXu7zmsqu75NOVwJKwyE6GACySJAOnjQTLpvpRpaMKpO46yLk5de3H5LPQdw4b/14JznFobLx+MNUQUQdg/anN1dqUs81uHwuxTqP1E68H5HiMWFlyNlacG/0frlvgro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744490004; c=relaxed/simple;
	bh=7dCg5tzUQj/4mVhPpQnuYyPbXZOifNhDVZSE5I8JtdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdQCLbgW8YVOrmuB8UQkQhXGveRVCguoF1XJ7hILGlM5Qmt+ZmCEgvoC6ORS9Vzyh/Fc1M3vzkWmC3k90FmVesSR8NoxQNpQKG4WohXyHHYQL8Q6VXkeel/rDXxFgB2y15fdeh8f4jO+i0k4Qr3S4JlbmGR/AP8gg57yRjYBoRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VExILugT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VExILugT"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc0b5so2337739f8f.3;
        Sat, 12 Apr 2025 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744490001; x=1745094801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KGnOL6zOW5X0ya7fBxl7f8BKxT9nw74oMzFAvnhYmo=;
        b=VExILugTM++2fkAoATkCPpuf9mHUXweBZ+2B7v1+Ln7oLd8acviCbUh/qXSZdzKg3K
         CTBoE4wvE9/oeJ0vvpaFhSP38fcXzLeWWAcm5FIViMvUB9tc+w4izawnCzZHzOJKBybU
         zDBoB4Hl297tPqwNcqPE4lgQKP7cdcFQvi5itBwoLmtXNJ8ETOOr0qy+CKP8gqM0LbgX
         Wu0clb6uQbS5kIF209DYOd7IsuxiNNRoH813b0A5VuC5+cehCpDSNkRBEV3zfPJjHqMZ
         C+AriOP0yz18v5NUScZzYwWQq2Zlt78CJDGnQ+SHDO44quaoyPcaPKuKOWug/cIDiknV
         lThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744490001; x=1745094801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KGnOL6zOW5X0ya7fBxl7f8BKxT9nw74oMzFAvnhYmo=;
        b=dt//n9j/CoJLOKCebpTXgMgFOsw3PLgDIHg++BjIlHNW5swbsNLaTCWI0mimlUbEnf
         m1jPBlkgB+DTnlh2UfIXBCia7rW76riT1ve5rBLYBZ0T2PojfPBpMJCCfVJwGhgVuJR9
         TeR473mE8PMaqqGA7zYACSkkNQ4wXAnoCwR5DVm0ovgE2r2vHsIVvQ2vIC6iDAEvGKsj
         lSHAiHf99MQL7NT7MkgEmoe9i7DuiuNv6GRhXTmdVTsCFQ/59nHT88zz56EPDg5xZZSn
         WA19fPRy8RIOyNrOpbOQSIPidQwDNqPwZ7CQkS8AQRNYdc1Sp7UtBzQ8Klje57S1kofY
         j9oA==
X-Forwarded-Encrypted: i=1; AJvYcCWCro2+GiWDxuPClRWS+zM8+6wnNtLR3tBLluCHsABexKpW6heWvFW9I9dgFteXE9rKQM+/fiJt+nNj@vger.kernel.org, AJvYcCWGs9/5Ub5ume43TtZm2l/F11jc27Y0hXfdiN9Fr3JWT6974F42k5QcK83zw2RyGM/fLPwdtihV4HMDtEqk@vger.kernel.org, AJvYcCWw8sYG+383h/YpW7BPRSz3Gzm3YZh4JkrvOF60r1BpQSrECIVlxdEqPkktln9t0ukfCd49cabXxY3B@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZGGT9Zr6I2EvBAPjQQT3VKrj5gx/l3vsFAll60dIGnMGFSFq
	2rIItu+OJABfaCvjfkOlk77xtA+VL+NBJQg5kfy9r9WkqYnsXgtY4GYuig==
X-Gm-Gg: ASbGncu06QYmf8E8DalRKdmaVcSgVsEkzyKciF/HGGc9o/f/ttu/SYsW+F10gsm7kx0
	KzQ2VcGqtyPQ6wFHDe0OMKk3CA0vBpRdL4N3ErVI7O+MOQkmDHZdl/FqHfIqclqxQ9aqnxcqdvT
	qEY4hct6wWuMm6kB2dIJrEFHJf4S7hng04bJT25DXn3N4X3DxaS+Pk2lVfJS9RSFbMMNt3TwTCZ
	uhpM7xare8tJqLi1Q099kJt3LwkOP3K2bAUgUeff8TTfGscWkQn81WlPp/WYydp6MmVpc92+LFM
	Xzxv5W06HK7u/Cf4CsPmuQ8Kru60im70SqUlC+297Mo8mto2/lEtvEaPv5A6xBPRmj66PYK3MOO
	euKsjRsAeK4C23sjY
X-Google-Smtp-Source: AGHT+IG5LOI1pesFPQmRAVlPiYfeXozU198XAF8Q6TGdiddjdZMVjob+wqLzV6mTW9QqbhDA2VY/iA==
X-Received: by 2002:a5d:5f53:0:b0:390:e7c1:59c4 with SMTP id ffacd0b85a97d-39ea5206aeemr5751863f8f.13.1744490001327;
        Sat, 12 Apr 2025 13:33:21 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm5941896f8f.76.2025.04.12.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:33:20 -0700 (PDT)
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
Subject: [PATCH v4 2/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Sat, 12 Apr 2025 23:33:13 +0300
Message-ID: <20250412203313.738429-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Exynos2200 compatible string and associated driver data. This SoC
requires a Link interface AXI clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index de686b9e6..20abc6a4e 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -145,6 +145,12 @@ static void dwc3_exynos_remove(struct platform_device *pdev)
 	regulator_disable(exynos->vdd10);
 }
 
+static const struct dwc3_exynos_driverdata exynos2200_drvdata = {
+	.clk_names = { "link_aclk" },
+	.num_clks = 1,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
 	.clk_names = { "usbdrd30" },
 	.num_clks = 1,
@@ -183,6 +189,9 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
+		.compatible = "samsung,exynos2200-dwusb3",
+		.data = &exynos2200_drvdata,
+	}, {
 		.compatible = "samsung,exynos5250-dwusb3",
 		.data = &exynos5250_drvdata,
 	}, {
-- 
2.43.0

