Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5990389DEC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772139293; cv=none; b=T70v8nKeSoX8q6bI6AYJh9slrPz16jIp3Wc8Sj9aR2jsbWNseYpRDCRc6OYZY/9OYeGBjBDM+OuOm44y+KgZYhncxuyzUqmpjA10+56eN5d/HoK9T+EopIvT11QF8onnPA5A1zg5P7Qms2EnLT9GTeeoDwwuxwByRTnE4cMzYnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772139293; c=relaxed/simple;
	bh=W/lGeetqBRqSuBkNTnqfwM14gP2spHPt8/oMSLOip4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tavg1kH0IHrqBUtW7XSzDXY445L9WB2jMXLL9Os8JrrFw+ddGkwlL8hIAcMenxef9hAU+8f75AB8o8KsS7bB+ppYEF26nQLUFQ2aP8bgh2Ynd44we6flOrW/GXAVBX0RttT7mBL/56NbNZ8TIUl8V3OfpWVPTb6oowROZOitIGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgsTs7KJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkOpDigR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgsTs7KJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkOpDigR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QJ27fb949161
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qZAO66lhl31RaxHnxMRQo1D7pwjnF5E7KYF
	cBVHwnVA=; b=TgsTs7KJkL/7JbqO89tD0WnuqtfnhI1pJrSff/RGccOEBoEBycB
	Ku/XMWo4Mv1jZJt03PP6ONhZsAUf8E7I9NlK+tVMfxpy7GJX8px1+zYQiKhhZBDX
	KmOGp3Av7EIZ7wMR3o+x8lXe7HyogKFmxepN3ylM6Gv/JBv63XDFo5IPbYEJPcnK
	nNJLhMYx5MtAvhv2c4pI767OJLu7K+OZcFswAtT7GkIpHxGQ4sgyvg3SBETlkCO3
	pE/jnB9du1FhrcBrWuqXsGLapuJEmqzEreR63eANq6RuC28Syf8tuAo/cjQT9PA9
	h7Bwl6GPTU8PFTaNhQeppCg8RR6shcegZ9g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytrawb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:54:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506afabb8d3so203170561cf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 12:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772139291; x=1772744091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZAO66lhl31RaxHnxMRQo1D7pwjnF5E7KYFcBVHwnVA=;
        b=IkOpDigRzPfHjMDvpk9Sxr8HGa9BVTHHLjIFzzjClR3wseXI6Mh9Gkamni8zt/OzJB
         EDScW7l+KXh24BoJZtKMEU3ScMMQMrIp6v2DGr+Fj/TMXsYeYIYtuBBrQf8QXmot2sm2
         9yg2YAvKM7BIIvQEgiU3c5vNkZAzJhNRjBBG687VN7oO3X0G9BUdHr/RKFr0cmDINXFw
         6qB4OXBH++4TrdgdmC7rB48wAbo16Ry9kDuJWyV/jThyses4OTvKR3HHmuDgUNWFt9sc
         aV5UF2M1rUmQENDWbBIfM8qVon+mDLQ1Pvur5vsVSD3b3kNSIJb+o2qPrIuc8QVd+nd9
         cc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772139291; x=1772744091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZAO66lhl31RaxHnxMRQo1D7pwjnF5E7KYFcBVHwnVA=;
        b=dwuoMxZMjFuqcSO7qJpeEMspiN0p8HtMXPXzmhX/oPNy/WbJCZLV4gEHmtE663JDSt
         VE3W6OKTr0y+BTt41hEyfCpsDX4v6c9+k2EVzN4ax+LHU1JdIJ1Bc61XD42sxdDzix3x
         HMc019KHnP0AubgL4fQRVGLtjYBdvgwWlkRntlllhSUVQnWvvrjFoidz28ovSyDNiPBz
         IpxBk+EkbcKHtjKqlTOhgHbBahs1VeqVF9I+l9lTHVa7JtHggb7OlIg7Ufrqf97Lvy4L
         5C5GlxngAKy5vJqZ5tscG4pWxVitq2BZNKh4gDUNaZ0Sw76zLBs6tKO/5A9J0GdIL0KC
         vsXA==
X-Forwarded-Encrypted: i=1; AJvYcCVSu3gPddSKye2teambMlpF8rJ1Jr23OBJpdGEHHEXCDvb9hcgMhbK0hpUQcJM+6MFRMN8XX7bmOwVTUjHEPgLTrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkXR4NRQCrpJ+A169SMyWxF4kP7ElhaoU9sd20V0ltAApuXLZs
	H9jp64XouENosbSo6JZI1U/GVtMDNWYiB1Uzyu9LYzEbgRyNgL1AqJ48bXs7REHvjNxdkFRhMp5
	2OLn1Lf9K+ImBxGI6qZQPlxH5670V4MbfTU5NdbkqDtqQCFAO7mvBxuhQ8VRo3jqkej5EHkLogA
	==
X-Gm-Gg: ATEYQzxgw/qb/8qrVTEsekyXf8tlSdSUDBI2Qb4NquQISNxXEdHiNy45Fcoco5YGK4T
	WmDRReHQULocLYUY24JZ+/rs0AZIR8dNOHjGY1kcPlq3xR6HPOnIbSDcswwoHzlhdGdCH+FTMTL
	4g1z9v/8Tj8jfzC5xZXRA55w6fis7wMgnZ6AJZJ9mJ4zj+bBzxHX9yOP0xDZqpBmAjITwyw+NK1
	aYB8AAjrWSToxcdXdKKN0cJZ1NXw/Dn1/Sr7AGCzWPh9AKysiUfvtnRghMX41EIjE8e1B6iF2Zd
	D1uppxzJO/XpJqhdTPN6ppFhJXKxHsu3TraR3tdvI0bacqrnPshOW0C6fDyrn7bT2Zb9ClBHhZV
	ujjRaGJF8ig5KHffDwxanlePNh6n9Y1pg2ShrbQ==
X-Received: by 2002:a05:620a:3949:b0:8c7:1b49:bd5c with SMTP id af79cd13be357-8cbbf3fdf1bmr514893785a.37.1772139291009;
        Thu, 26 Feb 2026 12:54:51 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8c7:1b49:bd5c with SMTP id af79cd13be357-8cbbf3fdf1bmr514890185a.37.1772139290505;
        Thu, 26 Feb 2026 12:54:50 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4a121sm60248025e9.8.2026.02.26.12.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:54:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, GyoungBo Min <mingyoungbo@coasia.com>,
        Kyunghwan Kim <kenkim@coasia.com>, Ravi Patel <ravi.patel@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] clk: samsung: pll: Fix possible truncation in a9fraco recalc rate
Date: Thu, 26 Feb 2026 21:54:46 +0100
Message-ID: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=W/lGeetqBRqSuBkNTnqfwM14gP2spHPt8/oMSLOip4U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoLMVzwqcEzMmENjbnycrffk4ydA14/znWE7WM
 5+8k5s7gleJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCzFQAKCRDBN2bmhouD
 1wHVD/4nhxwpfpCu6weoHqEiTHxxSJh38YCcer7Ic843JZhhfPeLlStstrAY7vJD9zKd5WmW4g6
 BK2fSJKrGLxNQ4vY9vX22/ceXF33nYUFAI0ZfW9SiPcelXH9UXLM7iUxOIWQy+nwXh7dVfhb6ES
 I81S9I47BzC0UrMM8hNrz+mt/uWBqVFEwUwIZsTGcB8KLPqodTHsYOtNe+sNbNAXCOVdFDa7Qsm
 mM9TSN7k4LiNCt7niQ9nzbSqXcOwCEr06zAmS5FweqF2ppklBoUu86aozV5KeHNOOBpF44rXdoL
 Lhp3vhvwFuBgbMJKzIGpN2spyJV3L7FLqvVCweg0cDJXPmlne42xaFrlO/cOP0mGtZYIHFyKH3u
 yZ9+sC+cksSTesPwU0MGPhRTCsJUSK34LMO0vS5kopmiXWOe02kjOx5XcTWGveMsaCIvB1i0EbR
 xweLFIt9i6UP5qcqORc9OxD9KP4gaeBy/9Llst3zz9zWcp8lj1kmLSLk0kxx9xQY7FtLrdF8Z0v
 VBSeFsumrM3Vx85LA3PM9Ec3g2OxqSxIsE6mLH5HcMbluFPizWEWQJKTp0nOdaN8GQ3xXGUNlYB
 7ZH55w6st8n99ORhGlwD0uFYxQNRRCp2orvCsgtNbnQztBUWNvvNGZnqpdwZbeu2c4pjkER4egW 5Lx3uilNN5TTB/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a0b31b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=TcISmBahSV9dqvZQcQ0A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wlyNQrdW1ivhk3_Non0LpqiOqhWf4xH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OSBTYWx0ZWRfX+qUvxMdolcme
 gCGL/V/rVtx2ezN3vr+AeB47m3LxMKbKXorafTzuUZpMIZe/Qm+YjeZ2O8VcZWDdQAsCXa4JgZq
 MAfwGTJKmLlcl45K+uuRtv0QkeYHwydY4Q+sOF+UZnXLX194TqPjdx0SlSiJGGlOh0mqMTrIxgN
 YUG1M0JoEuRl8Vn6AADn+mrUYclRQ+XPpRraA+MmIe1iNAB83pSOq0RUp1xDUGyvallpgTrHnjW
 FgAV0H2v/vmSOpXvjsavlOckQOLg0Er5cheGgvLM/OZE4xY7Q/PmOSErEBNvnwplYrlOv+X0YPV
 wD3O7vRWVfkirHLE5uDFpfDfMR5vfNzs6I4D7BOIRQVxWut6vcH8kT6rtrp3rYKyGNVpjciZXIv
 tN9vtjPLJXbJ0s7yNhxK0PXZcrdSeoK68wz0w0gDh4NwF/lqrWMverxRI3+IiYd7HIk2hyjI5Xe
 ccYonE0xj9im5iZF7+Q==
X-Proofpoint-GUID: wlyNQrdW1ivhk3_Non0LpqiOqhWf4xH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260189

samsung_a9fraco_recalc_rate(), unlike other functions in the unit, is
the first case dividing u64 by u64, thus it should rather use div64_u64
to avoid possible truncation.  Note that the original code did not
use remainder.

This fixes Coccinelle warning:

  clk-pll.c:1489:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602250053.wEU1hlpY-lkp@intel.com/
Fixes: f051dc5bc8e7 ("clk: samsung: Add clock PLL support for ARTPEC-9 SoC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/samsung/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 0d0494927e59..fdb84bcec912 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1485,7 +1485,7 @@ static unsigned long samsung_a9fraco_recalc_rate(struct clk_hw *hw,
 	/* fvco = fref * (M + K/2^24) / p * (S+1) */
 	fvco *= mdiv;
 	fvco = (fvco << 24) + kdiv;
-	do_div(fvco, ((pdiv * (sdiv + 1)) << 24));
+	fvco = div64_u64(fvco, ((pdiv * (sdiv + 1)) << 24));
 
 	return (unsigned long)fvco;
 }
-- 
2.51.0

