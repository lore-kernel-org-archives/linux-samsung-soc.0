Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840734A3D8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915372; cv=none; b=oShKhwqbwS3F+Fo8r+SjuQNhF3VYXd4ZEX1JHu06LvKpXlHiKrQ4kKvgktG5uOPZBY1MHLs8d8B+D8as/7sVOOf4YisIpO+HkdBEbnehOp4iFYyajsnMUXn3LGdutLzmLFFIRb7Vbejqrpai+zvzFlazpm7b73PeEqjHxphS/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915372; c=relaxed/simple;
	bh=2b2RMRAbQHJoSplfNlNFCrm413eCNhV1Uu0eYavspbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5Z0kahKe6FKk5LK8CsiEfsdQG2gB+VdVLPo3ONZHem+hGxOOse2PdIAbFzP4KXXImbrW1E4X8dP3NA5uCbQU9tyXSj5SNiexkGbeBPEENn+kgwLmVtRW+ohTpbT4uW+6YWkhQi0PwnaGAq4N64J/18f8UeAe/DqrZBokQpwKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV203SNC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV203SNC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so17862945e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915368; x=1762520168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itYhsB6fPdpzra7msCKHByUBTLvmx3RYWl3MrAXGf0w=;
        b=hV203SNCoqGVtfoMSp/Pz4x50UyUpYWd989qiWmNNiHOXZZjEjBxysdXydfd/0OKLI
         PxXiW34dqJxl5xJlqg0yZDOqAyrPf0/ICQ7efOUpdJ8kGuzybSE/aQqEc7REPdsSr1T+
         M/wvdEseoqyqTb7CvwzqyufhZH54wYguJkK6Tq/LgeUucpIUxhLAfG0Q8Zv3B1ILESeU
         L2CqNu0yKg0/nbKvDJBhBG3MMpf6TEKUlDzIlndIIUcIHij1VFw8FnS+Kpy44IzIuq+k
         DN4lk0MqTmPNywUtGSQPos310Q6nlONJQFOeh1lFUbLSaPTPDNOHu6aYat5EmgTtN62C
         80cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915368; x=1762520168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itYhsB6fPdpzra7msCKHByUBTLvmx3RYWl3MrAXGf0w=;
        b=PoIybWZRw1BqT7gr3CmlMAk04k881LPTMDPZajtcYmCgvaPl/AADw4lZIS/QykQvCe
         qq29Co96yYxfBD3iOPQNpbLJXDXOABJSO3DQoOHLtUIc3cQMXNUZKGwJyWVRmPkCbcCT
         UKsfj9I0Cd56OyI3tWFbovXehIFtfgC4M8myusIXGX1pIRyMhq+Z82fMdjpMlasvG2cX
         hT1LnerE4xa/zuqv0kipyO0zryoPBvV90MqJTEx1EzoPGcfT3i4fyMRx+E4lJNIG+a5l
         qozBGmgqEOwwEJfsNdbGsnsmElvNDvzzKk8NmIlXrnQXrah9WvCObeYkrEeFBMS/b3gE
         aX8w==
X-Forwarded-Encrypted: i=1; AJvYcCW95VD0N8gsWbABJidDYZjhLRSm1uTzK5W7K+ocfRYFv5nClz1ICekV27ZxjmeId245CjXIg09HOuYJ0NsVP9YseA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1JheAfdh3/xDINfymcgXgLz1veAnnHi3u5A4qqCeG7AXkMY9r
	etJD8W+QiklJUwJkmRwlpZx4MOeBDwNMtvG8WueQL0wWP80no/KgZCRA3RIj0u/qb/0=
X-Gm-Gg: ASbGncuK3urC5dBVZMVZ919goZntx4CXauEy+uXIEEemuxvo3mo5F96H3EVUckKXPo3
	LKqaunDIkn4HRedkJxv14P8B+7wno8+q3MOd1VNjyh6AYchIE+TZ7pQVM77qupz6tPYCkAstBC5
	u7+UNqMeH/E3zcrjueyFSAFq4JkNsXaHnogFMu78m9M+NcI4M3v/+s+gjnAwj95I3wljTqBnl/j
	okqAyQSJAnc851zdgHU8WbGC4NHFXBLh1Ps0w0/WDzByiZmohOsFTx177p2Gi5Bmug4xqfJip5M
	vcPamGtyQoV6Gn6Gx9zYHZCtHab4lXOKDtloNlGhBDlYzL12QaOdOAr4CSg0sRnTmBpb4yazso1
	4w1L/gkzMqFDgr6nj/I7rhFNdI+Q2rV1WNYtqSKkOdqIIMWFL9d0OqIjGn1+P92eTTwvgIhtSMO
	OoJ1e1QYVmh4ZoEDCy3EggdZsc9PIqiGYxv6FjFJ0j0O/SS4rMFoWbGaMFsDMBNjw=
X-Google-Smtp-Source: AGHT+IHji7cnPXAM99TSnbeTgigh5KRVC5HbAljjx4ZpeP0cWM3VaZ+C9Ae0FF2SW0ZbMs1zBgOQJw==
X-Received: by 2002:a05:600c:3b26:b0:477:19b7:d3c0 with SMTP id 5b1f17b1804b1-477307dbbdemr33249365e9.2.1761915368337;
        Fri, 31 Oct 2025 05:56:08 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:05 +0000
Subject: [PATCH 06/11] soc: samsung: exynos-chipid: make asv_init opt-in
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-6-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=2276;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=2b2RMRAbQHJoSplfNlNFCrm413eCNhV1Uu0eYavspbw=;
 b=Y7M8VEUe8Ma3wIFBHexvsVQYqz1qW9K3xn6HQU8oL0V54u5FhpPmhqkF0rW372bcl2eRdsAb/
 mahZ6Jb2R/0AW1hOGjVtZBKdJz6HTZeH+NKyzbFB+XoMLLo+kDS0/zg
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Current ASV handling is tightly coupled with a specific Product ID
(0xe5422000) - only one from the list of Product IDs defined in
the soc_ids[] array.

Since the implementation is highly specific, make te asv_init opt-in.

Note that the exynos850_chipid_data was intentionally filled with
.asv_init = true to not add any change in functionality, even if ASV
bails out early for these chips. We can follow up with a patch to
remove the ASV init for these chips, or better, to update them to use
the nvmem API that GS101 will use, as I suspect they reference OTP
controller registers too.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 7b1951f28e8d4958ab941af91dab4b0183ceda5f..5678bc85c4d93547e446caade64a0b650d06a332 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -39,6 +39,7 @@ struct exynos_chipid_variant {
 	unsigned int rev_reg;		/* revision register offset */
 	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
 	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
+	bool asv_init;
 };
 
 static const struct exynos_soc_id {
@@ -163,9 +164,11 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(dev, exynos_chipid->regmap);
-	if (ret)
-		goto err;
+	if (data->asv_init) {
+		ret = exynos_asv_init(dev, exynos_chipid->regmap);
+		if (ret)
+			goto err;
+	}
 
 	platform_set_drvdata(pdev, soc_dev);
 
@@ -193,6 +196,7 @@ static const struct exynos_chipid_variant exynos4210_chipid_data = {
 	.rev_reg	= 0x0,
 	.main_rev_shift	= 4,
 	.sub_rev_shift	= 0,
+	.asv_init	= true,
 };
 
 static const struct exynos_chipid_variant exynos850_chipid_data = {
@@ -200,6 +204,7 @@ static const struct exynos_chipid_variant exynos850_chipid_data = {
 	.rev_reg	= 0x10,
 	.main_rev_shift	= 20,
 	.sub_rev_shift	= 16,
+	.asv_init	= true,
 };
 
 static const struct of_device_id exynos_chipid_of_device_ids[] = {

-- 
2.51.1.930.gacf6e81ea2-goog

