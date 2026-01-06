Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42725319601
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690955; cv=none; b=DfCZV6FuLy4/4KeejVfJ+RIuDEgZXj9UOXbuMZ8SlAEA/0EiYp5KZBPYdCMGYgr1y9ZyTPRowHfX/L3VTSwB2C5jm0WUenZYveVByqJtdtBG12xUWS146feA9F5q5HFHdWHFm0heSyQ5NBvkDpp2PKKJy6qvldvr1+fScVCeYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690955; c=relaxed/simple;
	bh=RWbJ5gkWN0OLPo1CmXSTtNWlFLnR+bKkf7s5Nqxc6fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k44pQiKYSt7/cmOu38D2PmlCveHlW9PgebX7/D0z5bFXT6Sif323GYiDihBkrnRzpSBK5oj4ETEoj7gq6ezaFK9nG0nGde7gpZliTm6inyormf2NpPW6d/up7JIKZ2bMyrB6TDsQZ8HWwoUSDO9VSW2B9nyPNWwygxHlaeV1v8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBigHb7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYF3S4Bm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBigHb7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYF3S4Bm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q6fb2429813
	for <linux-samsung-soc@vger.kernel.org>; Tue, 6 Jan 2026 09:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=; b=TBigHb7HA0b+swLJ
	OxUCdr7MQEGhSL/eiW+KHB2Gwxt6Z7XFfaMKxdRs4m6fILI39Pe2EfmyxUj8SvzC
	mn0JWowm85b3wmMiYsEL/A73S5/npoav2ydHWAjDAUuLwF95xgEnRv32uu9K6HH1
	dYxhcMXcY/IH66LJV48tVrAtvQXecbSxEBM6GfOOWnF680HECm6ugyEeKbzo0k8u
	KKH9L5bTETMgZg9gQZQyF8kiftS7ktBPqiw/3Ckdz3994DuSscuvX15EAd0QMb+1
	gy1DnIBANUZdVQFMWsRje80AeGASDTNcB2IznoRH8/FbwP/m9+KRoqPaxc+oQBP+
	mfH31Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7399vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:15:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so22268281cf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690951; x=1768295751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=;
        b=NYF3S4Bm//O/J+B0mmvA4snbwE0UO3TSkt+ct7PcmlIjNGAjn3qLehJWPIr4cMYcr3
         PjOj98Rcj6B8MP3SXW5OcVJ8P2bXd/a6gAGKV0zQWk0F3GUvussKhUAmub9HA3Ca+Tzs
         g3p+xxcZVSrSXylhyXh+OzEor7md/axFnucVbx7th43iSapuAWQIwfmEErV4KRFEAGBf
         yt0xvm5RrNXOskFKe3LpM4qOG7jDPof2mXeSVzM0VZEYxaCL72aco6y5hyCqQxJAFUj+
         mVhnJcO9NiRKqtTFVndg4ohpurXlU26EXUBhmV2mnlSBCDqQarCbyZ+qi5ogKJF2HYCN
         uAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690951; x=1768295751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A5WPI40gVqR0fdkwizIfzBG4ci5WY3UJA42a8INrrfw=;
        b=poSlDnlI4fgHZWRJc0iiC/OZjMUVD2N5SFAuj44shzKyNkayJtaySRGHgRc5sJqgEA
         FdO9rP+umj+Lg0hgwwSJbME0FpLidYIhQy15qDyk8mgmYmq4xYO2QsJ/KsIs0QLIgjk0
         o0rnJiC9CRRlIWqv34Gd/3LXDURkQNHhBv6AyEUOLjeSh9oV6Mc/12Td0yFHwdAOhaPH
         ruRt+jB+38H7+Ty79rZ4w7WR8cP9DtLBputDxr1IwM1U46CyNwGmdVUp1ili5SsxRMy7
         nsn367WtetuTlFM86EPzxRAboOXrb3607X5jRjrEZw+xaCsr3EC5aOvyREbZcc0j5Swn
         t1DA==
X-Forwarded-Encrypted: i=1; AJvYcCUtYYLGrBsYv5snilMTfdMT9K1XKhK1wvXCPr2bmJmQwyrtZrcIqym0HhJjzcsoublF1gvOFZg3TghdrisE0FIV4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6exBvq/4bNDBv5ifewBehiVTxt4lAXtddeEzvgEgSLUUY9JNk
	JWEI/pcZWkx2+z/y5/3/pil50tL5yf8BW1H6xq4r5WEI1+GEgUaXue6wNPf3xd9z7twL6i9P91r
	ApMf/NaqVcMruzCObMopPKb3iKjrlUnvr98D2lXvjGWsO+GBkE1SkcqRUDVNfsayNkzfxf2JeWw
	==
X-Gm-Gg: AY/fxX6qxx6BactMgBufawSSgmC+5NJOnqNneEv9nP/vWt1hlyZOSNgi8rjoQzEvuEF
	YL2ezRSnlFzP6rOAlWZPodASTEiE9eqSfCoaLAfL5eME9a4bJfGsZrR8jUaY/HT6EuGR0oLxUAR
	i3cV4R7F5d0d8seOBafxIFHQRI2Xbf5pTCPg/RWNbCxscUxzwAEtlpJUIlbunlJZ/EWKwwEQ3Mc
	TvTT56U94rAyKa7AkCF69pbAWA/fnN7fv+9h6lTe7X5ID2eg+rwVzzJYpPFa9pra5TYT0OiICv+
	NBxWnQ3OwDCkBFmP3DZpZFX7f8yLhqBLNLSd4tOCATG4xDvc6dyDl0a94Tdn59WHEq9JJD7JclZ
	XAtQgA3sR5IpwAKKrF1xBq7VpeUjHH+w2ZA==
X-Received: by 2002:a05:622a:19a9:b0:4f1:ccdd:ffde with SMTP id d75a77b69052e-4ffa76d781emr30075841cf.21.1767690950805;
        Tue, 06 Jan 2026 01:15:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED0yXdejrInhQWfg8U8+hux1ngnPj2hziLJwfqueQbki/e7O1IcaCCccjXHoHtCmrGoHBH/Q==
X-Received: by 2002:a05:622a:19a9:b0:4f1:ccdd:ffde with SMTP id d75a77b69052e-4ffa76d781emr30075331cf.21.1767690950323;
        Tue, 06 Jan 2026 01:15:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:20 +0100
Subject: [PATCH v2 10/11] cpufreq: s5pv210: Simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-10-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RWbJ5gkWN0OLPo1CmXSTtNWlFLnR+bKkf7s5Nqxc6fE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKp+sqAl0I7tpPvQ0QoODdWoHdFuCs4P/o2c
 XwCiIfJHRWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSqQAKCRDBN2bmhouD
 19ItD/oCirgHS49BrQVuTANSy+USONC7WjMfttsLhr/qpAi+dABPoAbX7tiDE9BWLrCMNJWtXhr
 WUgR6AnMlgzm9F2/gkTT27iFuoZZEyMvLZO3NX2xVTVIomZOyv7t1GnS5lzdSDOXL32kzcCfLM7
 K0xRYFbcUCLfqU85D+h0b+hio3mdH5KlqTMMNmHS8mUiJ+GiJOllMUYGWnLoHvFU9XtsWZ/5yCw
 PI/k7qaWs0RYtNNNBV4TfwZo0lBw8EHhjjcxVCW53Xs2rlMDqnSVvMKsooBHf1y/LuVkkHeQEPv
 ihnLx2yuDDaESOfUHTIgMN6aSbfGYityfEi/Lcj9yDg/m4rZfmoJbDh/qOH6vPIXa2Nl7HOSENi
 TCylIT/IZ9uCFy56zMxiu9aJe0m9B5B/a3TW0WOCIIb1sKCjLEKkch2r4IElHv0lk64eu5DsQXq
 qmLiPtOPcaebkfdI5Vg20bIx5CJY6jNt/xz38MgQ1x7sCR33Nd4/6nDWRzWSuk3LT/MFQwoyDb7
 +MBy/+Dvpe6yy2VkApOWSgIm/l87ifREXwWQFJcBQLUBe04JTa3GKajCijaOdi5zBuIztTWUTs8
 n1wWmO5JmCNDvVxnwaaIuZCuYhskPTYuhPn3gUBUn0kzh8fkj88SW6etdR2OophLLX7k5AnTDiK
 +LN5YHgFW2T5bAQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cd2c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8YWg2ve-cigzn2S1SOoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HTfW-MWD7UIu0EHy3YdOZByw8b3lE0GP
X-Proofpoint-GUID: HTfW-MWD7UIu0EHy3YdOZByw8b3lE0GP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX/5U7D5RJ3tir
 ZqE9sjP/XBuRHqlW4B6IPMlIrrqnyV/4Vb4k/xcZTelHRosA24WURYX1Incbgo7xQvK3igHm1g8
 LaxS58BNDhI74S3v8Nrj3G+y0UAeMzv6ceIgVW5PFmNEfvAFyzqIPPGkvzyARDGwdbqqu5/TLvu
 5s/1t+VDH/D3edkJvC23GOwFpWKbApM5Q1nZehpppAsqxeS38ZlefmdOOaD2L+3KVKKvkwwu9R/
 ORKhMSw3J8/+2zb+spfIxtRKffk7tZYG+I7fsAw+rEw27NVIPYl2jvvOX5Lo13exI/790hUTI+p
 1MEh7iBQD2vvLYZLauZXXNR/XS7T8R5/yGJpVLVMvHjnRh768+P6QKtZRxbyBnaTrS8a5v1DqIn
 3WHvDrZPqvFw0LCFzd0kdIFbY5tT5rOx9pUbcMh/t1uNkaWYGhOFDRLkPZ+7WolXFtxADVrerRZ
 PkWc2af6XnAnpH5Gb0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.  Note that there is another part of code using "np"
variable, so scoped loop should not shadow it.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index ba8a1c96427a..e64e84e1ee79 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		goto err_clock;
 	}
 
-	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
-		id = of_alias_get_id(np, "dmc");
+	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
+		id = of_alias_get_id(dmc, "dmc");
 		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
-			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
-			of_node_put(np);
+			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
 			result = id;
 			goto err_clk_base;
 		}
 
-		dmc_base[id] = of_iomap(np, 0);
+		dmc_base[id] = of_iomap(dmc, 0);
 		if (!dmc_base[id]) {
 			dev_err(dev, "failed to map dmc%d registers\n", id);
-			of_node_put(np);
 			result = -EFAULT;
 			goto err_dmc;
 		}

-- 
2.51.0

