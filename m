Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4331A55F
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690959; cv=none; b=C7EvKTutcoKWjW8OnzPAaukY79r+dAkXIuJwQmidYeszEQUaxm+vjnZu18FfiEKmsmxT0bGHuSdfiNMWMWQk//ef40QLdL8UFRVQCpSmho/I8iQmVy6e+fp/FIQ03IRFD/Ib8l2ySS1oBB5M2ICpXPHCYsAPCCi3A/zc3hIpzF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690959; c=relaxed/simple;
	bh=OVCWQJWSot2eG/7wK3qMzP+a9sG5lzn0vIz1M3MguJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGyEZpF4IE9JqQReDluhI2XDszzC4LAcJbZu+Hx4SHK/46BRq+i38zfFCdjxh4xEqjFmndj8pW163VqFNQaUfYFLR0nkJl86eXQMepgD7GQsFp57j9+Jeff+1dzC+JoGUpF7Sazk6DzLwa4EWhsdHXvszHuR530fMu67fc0NGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=md12x/t1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxhBYfYN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="md12x/t1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxhBYfYN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t18F3293770
	for <linux-samsung-soc@vger.kernel.org>; Tue, 6 Jan 2026 09:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=; b=md12x/t1PN6YwCIq
	knSl5/ZirmGXUDUYxz9rwecf2vzC6ok/22z68zzrnIRO8d3CfREkMk8AHsjtTe16
	fm5zOZONNblnsUA3A6ClL/YYd/dlprpBmcJQWGMdebMCQKOfTxnPsPkw1WGtUtEn
	25Cy/Y0WM+5PSNM7gOqHM/68nq+/Ahq2uNHHpvNYVu1yRi1kJgIvaRlzByGIHNhI
	yWXymJJwkAZabe4PzOq3sK70kSyL/F4Yy9O+j45NDXwN9lfQDycZBNPs5EnF4cIy
	F/ggKd8Oy7Wlmbl1q+GtGhAT4S9Ba4CuOcVn1uaeu3uLqAhiQoFQZfslJR94fe83
	AnkqrQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00dqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:15:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so20733601cf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690953; x=1768295753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=;
        b=hxhBYfYNfQX6WluhiozJ7KJyLInh6qrTiw3AYg8xqVOOEUdqkgk/Q8eQVY3bMZHZqO
         BlJi++9xeJ4Zp9clS8ULTSLdYOpqEaSIO+ZvMTVZ6s20yoHDafJendyFakb6RNWOS/aA
         PQ0QewOsl3HY72sshCjZnVrlmYJzZ6NQRo8n0T/5XghQJ4X7VMmcQogEKDodh+i4udZx
         t8zxnjuQU/pGEvvXX273mEfPBl2sdYApb2sAk5hh+8l1tHG+edbfHFEkyBmDX3oL+dEu
         36ASopsXiiwwJX7JtfDq3DJ20gWFMW4UfELXsNKn+LSet765LC59acu8WsbWD3+ibFZz
         J6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690953; x=1768295753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=;
        b=PKLUGYuMGphGst6OVWrgLqOatTNegGBI1m5hk/c0hfpcBe5qQBDS6TGpZVxJgvwJPR
         vXckXAVbQi2iKIULYqZy7xGE9dOKK90mfmScFeLYF2FL8Y/l440DFlFvEbiyfi8SKzKY
         8QKg8WLN4gjYZriiPPDJhmCxYGflwiolcyCIi+GWWGbbLpzkIl4SxYmvxpTG9zik2ysD
         cbLRLnI/lJaEplHTctOf/RUXHd1ch6hqvbJcjk7hovXLcBeerAIm2KZTTd38b3sHEPVj
         hI17rFgvY1mu5xJcbgXm8tupe0JhfnDbqSeW5xCyTwlvbS1CMOZzTDUScvvoQqDiKoaX
         UB0A==
X-Forwarded-Encrypted: i=1; AJvYcCVAb4LhNe58X3WoU4rYFzXSMPJyhsNxGVX24QXmEOocjK8roaHDWDvR8oQ25kz+q2z9c5csCE8zR2hqqSQtRHL+mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZAZZStxbjP+r2hxLfJMNbQj7sIW9Nkj/RNEPK0Lt5Xcftkcq
	dRrLfayQNCF3R+ZdOpQokXv+oNBPRvU3BhBzn+sRlAwKRmy9NtTK4u4YPnbimL36jZaoA5xjNbg
	kR5lESFxRVxka1wkj9JdDLrjP1hLmtQ/8N5Enxf6BIxDcTQxZhzRIBdDCXqYa14GnxWYmPek1FQ
	==
X-Gm-Gg: AY/fxX4iD+1LSWDp01X4M73wURUtUGdoJiW+6/36QCIAZrpE2KzrdAMZMhLYSVidcxw
	FGZRaY/XcPs0hiIZENpAW+S/k1kPqLth/838ebz3eFyhVEa3nW8rdMXqgKobPx7UouNB/hLPYGm
	Rclvpn9mRXQEOoqYri8Gu7PQY9055EcO14B40Fy+ZnjfRmF75AN4PnvrS4AWqF+hffsXZC/DYeK
	t0TYV2mo1irHmmTvnHeswfLpkUyD/A16okIVFQwe87evS9zIwg922wRxYP9jjOrcCagTuiQSQG8
	W3i9ZjupB/xwOJydEE0uZBjJWt+Z03o/Z+298Jm223rwzPAUlhLd5ApgFQpMbFEkBYJ4XcuJFTv
	VJf/v3WA9Uek2dvTRN+l3UV9ZNcimTreM/g==
X-Received: by 2002:a05:622a:1352:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4ffa77a96dbmr27455761cf.40.1767690953255;
        Tue, 06 Jan 2026 01:15:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+8LYz510+kg3a8iGMOOOC+oA8oVcMMGxgamtnTMDOaG+Cvx0GMuVV1Mcl3rlOA02I51oLgw==
X-Received: by 2002:a05:622a:1352:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4ffa77a96dbmr27455491cf.40.1767690952811;
        Tue, 06 Jan 2026 01:15:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:21 +0100
Subject: [PATCH v2 11/11] media: samsung: exynos4-is: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-11-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OVCWQJWSot2eG/7wK3qMzP+a9sG5lzn0vIz1M3MguJI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKpAxidBL7lQwtLhuqODev8GHN8RC2HoZMf7
 bdsRs21x4mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSqQAKCRDBN2bmhouD
 1w91D/0Q67fTH34HvAuxFNouYtVjUOjzwae5nuoLVKTUCyZ5NtaDt+Kt7GT+3EHjDDAq6Bm3lCd
 mktwbSzzfw9O8z1xPht/F3yzxfANcfUp3JvwOwNmccxd3X5XKYmfqYEXcnvpLXbv81MaT0h0DSR
 QEC7BCiUBIGF7I7usfi8AUMzbseiuYuRzQ9d3eD0YOL95Z6t0xbzEhdgQetdK//xWSdHK8fRBdM
 huIpYTKQZKy8Ke7fUvdK32hEZXrxBo/xvLK+2WuIFdMdeP5blnwsg3y0ooSQHEchB6FAdGQTEyP
 nhRn731UqnNBPfHVJCDz4QVavmcz1Yehq09UFl1TeKBJ/ZFYe2Kl5OT9k9n07Q7jzoAnKsI52Sw
 DLRdbLO06m1Nl2ltYduOTOm7WrAehvSE7y+LEv6aEj/nrlOZ+hTeKhu1Kl3M4z47e8dp8FqaBDP
 UNBEzOM5t16efbCp5/aMX4LOTYqxP4kTKmIjqYWmMwdmWR1yEc5Zg4qGKTKvxCzwMc9s3tyGvD2
 wQnmyp/rDvRwRLesC88p8kq0d+6KDbnMhOYU3DfOdPwowVCASXXheCLLfSHXKdYCfL8aVV7LcUf
 bd2oqkBXH3wTG3RIeXY/1HrkAy557dlcaZJQGT33UbdvAuEkJJ/r6ygKb78s9/lIWsR95FzwD8w
 jKKFHaH0UjoJaJA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX3Ejqr97l1Pbm
 +cYDBw3o0H9CNi0GCz/DLYZH5mhnAqqOcQe3OSbUghtVBjBIqcHWpf/u1Py0Tl5lhnFUnn359lk
 fZGZgaORaEVfkXLT/1oqvaChUKj/Aq2qkzwCysaqeEMVtlrI2lt3bv8ahgV/BzVAqUpXZVdctaH
 Jo5InfmyOOaRkcUot34FhyNfo4PQ5kIbfF7xuvkiWGXyWNStxQyavGcO1IQUazCdTS6M6xGiOQt
 BoR0/iazHsNQH6jQxU7l/+qrBvABLjAsFH9o63qtivwoy4CTjHXaOauPmNgYxShgYKSThOHe963
 K+P6TyOKNbzJpI5xRPGvvGsXUDFK2kfYmDRfh5Nkg9Pfqsh5xDKwIhv33P4Wix4T2MzSdiAE53q
 hvznXI7Rd9syRyKyPNAM0gfja5H2MmfWe4yjS0Q7T/VBUw+E1fsEtXW2jxKY/SSTk+vb5rgOs0c
 DUFti9UKKRiYPHt9xwA==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cd2cb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2mm1MoeH4kfNTzOWiPUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WnjgV3TpZia5cAbz6TO9rYfrhgAQQmSd
X-Proofpoint-GUID: WnjgV3TpZia5cAbz6TO9rYfrhgAQQmSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for_each_compatible_node_scoped() loop when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch and on:
https://lore.kernel.org/all/20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 14d84cc96831..b7d9bfedd590 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,21 +200,19 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
 	if (ret < 0)
 		return ret;
 
-	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
+	for_each_compatible_node_scoped(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
 		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
-			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(i2c_bus);
+			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM)
 				return ret;
-			}
+
 			index++;
 		}
 	}

-- 
2.51.0

