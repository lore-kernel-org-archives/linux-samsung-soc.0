Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DE4394476
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772139295; cv=none; b=TbNC5QHiLd5t4bLN4eg8LJUohEN15s0PBpn91p+6hOtLz86XRIl/ex3HBYn0AIdignF/AGoAZrekRmAiMPe4qQ1jr0xdZtuG0nR5+1dbNRCB7HqRk0QmNCP4CXmzHO5M2nTXeZe+KheYFtzgP7Ee+im3KBfSFUgqU1RD9OW4uEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772139295; c=relaxed/simple;
	bh=m4qUT2DcN9o16RFl+wDC6vakDNliRu9mxMyCMFrfeOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRTehh2HLAqk4RsFoXdv64hTQjbBXFNMIgt21ALyRRdmQSUdgudOEVBJ0GpBIUiUFZXuGQvZoFK+t49kw9k1INQiY8eFqfulq3o9rblg9XJVyl32/lCLExbrFUbPHHCIxCqSh09kOHJZTYt43kbKPYmrXqGWc6K1KzJf8pKfLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arCW81zt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzLZQjJR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arCW81zt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzLZQjJR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEkfJ2608854
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NiVdBMKlsd0
	T91NmV2dMeXxvCyBTnTMnUqZzwzi27wQ=; b=arCW81ztO8XdguZ7sVZT2UTZBH8
	oKxkge09e147AErzu252TJpzxNo2cguCOhC9u/ZU0+wiZfLhuneXJxeWaL8okpB4
	QnMgI6KdPWdYs2CdMZmSFN4eOBnEfE8u7qyp6XDe7A2eMDxJfbpiDeu260veQwRf
	p+ffSLJ2VQJYz3FEYEKu9FhoIaJM2LLzCB+uOIboDbNeCzbHcWMNMDnjFWIfJVwy
	uMprCGzut9nJYxliVfwaOi5yi0OcWrBJu16E6SMhj/7/9vO+nFBRzd/bahU73jQr
	GXKCQGbs0xHJK85cJNGfrtmgDszp6FhjLk4d16678AE6SBbM/L7hhI4Rgng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7y8x7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:54:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506ab115571so70479761cf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772139293; x=1772744093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiVdBMKlsd0T91NmV2dMeXxvCyBTnTMnUqZzwzi27wQ=;
        b=KzLZQjJR1rX7EP3ic6G0PduXel1RWCjOvPKgx40VVJLxfb8dqCtZ8IjIPa3dVcaf/5
         /myPQueroZE/Dolh7giWjxadiePvRIx7mrpk1E5ueglltiwc+BXHmTTALNCZmQBNJhEi
         clliPLM7EiQIwA1tbVV1ufnXX3Wu2Pda6fKC9ZEsVWXW5ZAzfIuIfGqOipQu++tVJyWC
         vL58FFQCUDejQauFATWSXETW9MbO9DyIAAbo26bdZHroMbYVx7JkGn+yLAS0LKuKrBqo
         TZWwEzp3WS84wl5XECW57D2uRlQBxHpKTs7OuiWfSSTXkqNuT37e9MV/FHyDM5Oz2ZbW
         FoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772139293; x=1772744093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NiVdBMKlsd0T91NmV2dMeXxvCyBTnTMnUqZzwzi27wQ=;
        b=sGSz/5C/Mk8tBztb7QpITzndTXnNGsh8rjz+bKOvwAe01X3Knp2n5jVCgvV2u7U+qw
         mP7bQW62N8eu83lKQlRwJn1Dtj0Xr3b/x+gQKvGH0sxQ03l/Um7l7H1gFzXjuGbz9U1g
         b4hk4bw3mgXSR0Xmh1HL1zvH4uF4h91lHN5BA6HzNmnm5Cc3MmO9TJ8e1Ynb8lMCx3Zz
         KOZcVfq8uYImJb9S11lPvPNTEulKY19HG6pWV8waMcig7llCn349b5nOxg0Z+fHjgsUq
         8qyLnJS8b2caojWUVWl2hXKskK7tIfxApzacrImglaSP2tNxc5uSbpHWG25nG0mEM6s+
         mhug==
X-Forwarded-Encrypted: i=1; AJvYcCU0RygjZ1SxkNgQHZBj/scE6PWnbRsbJvch2eEs37myJMDrX/+gvuzqFBATo2ll1YO53XvHSvlGxol0/3tBIRfvtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFARwTSo8wvUAvVpZLlsjRWqb0iQbjAbMZQe9L5cb4mHifjprl
	FM9T0mwCUfwOet48Ss1miESLyWpV0zlwXWu9Fm7EW9giqPsy7+mcsH8C13MmYoPPfc82ZhfOOaW
	wPcaRN1JIvMCBC8ac/Pwk+s9Y5RTIYPtr9WvYubk+kQDeWy1IJmjCRY4yP0JRQzSW3yfd4iz9Bw
	XcbzLD/A==
X-Gm-Gg: ATEYQzzbIVCN2KPiFUymHQaqBylkYuC1oOng0IHqRnvrD3wmDxWV2/w49blzFeGBmfe
	GNewkWL5wTNSDBKwFC07HRnQZLlUW8M6UDx9W5gE32Manen+Sdmx5NOulFquyz62uyKNCV+pOAQ
	hxDd7kupaRHOkAXveK8xLC1gW5aMtUo0Sv5Zb7XCY5kRyEvYRz1+532jrw0ETPwe/jxKmcqp/dY
	ZswntDy3V1DVLYUfUUXmO3SrqC5cxPwnNmT5hcoD0oVXLRyJlQUr+fLK196N4LJN4waOFMWPojn
	XjIkHX+eLPT86Tad68HahJeS5GWCReEdw5qiPlvX1DlO/4WrhzPTzRyc8PMdeyt6DhLOeCpZB+s
	HxIAhyqSteIMuQ9IU/S/suSr1MP8LR5xWQjwKog==
X-Received: by 2002:a05:620a:489a:b0:8ca:4438:b8ed with SMTP id af79cd13be357-8cbc8e08b89mr50388785a.63.1772139292611;
        Thu, 26 Feb 2026 12:54:52 -0800 (PST)
X-Received: by 2002:a05:620a:489a:b0:8ca:4438:b8ed with SMTP id af79cd13be357-8cbc8e08b89mr50386885a.63.1772139292176;
        Thu, 26 Feb 2026 12:54:52 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4a121sm60248025e9.8.2026.02.26.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:54:51 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: samsung: Use %pe format to simplify
Date: Thu, 26 Feb 2026 21:54:47 +0100
Message-ID: <20260226205445.336839-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m4qUT2DcN9o16RFl+wDC6vakDNliRu9mxMyCMFrfeOQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoLMWPVamuOVoJEfriNBluk+cfq8Idwl3VDpnN
 GK8BwRStvyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCzFgAKCRDBN2bmhouD
 10a7D/49iXsP37Kn/qA5ewTJyjKGRptD2ATX/H4t2w9tRGCaUdY8qd4CM6VqBaPngK9irGYAYP2
 69Wppp4iFmMaiLekQEQ5zPS3BuHlxW2+ATKDIq9TN28EbuC87JURDH3Mp7Acx9StzG50b4r7vAD
 RhiquPenqlNxaMRusc+NbjQ94LNNJndOizSqWamBbruxtIZTwOm7mXEubtgqQAiNkMRhEeFV3xy
 +gelNyuHitXK/34C4ZxnPIRCoxwnguVgytGFflRNCWEmPV70XoNa1W/e1eNPLWm2z11c1jd84n1
 3I10LaIPl3/bnl/AXlMtU79cosODXNb66xbHXGh0ICpCWfOEmj9a2N3BY6maSGQjLHHFiAtPxYt
 MhI7F1AWPyD1f6qpQ1asugQcR6IvH/o14cYIRSpFLIb9HZ6J5SfFlN7U7j3T62meHZbOSiTFAA4
 R9mkfMxRfIBhj3mUx3Vg5IpqrwhZ5OHP2+ARN83rouo/OkQzg65d0p6sM6Ghr5MmrgHten9oqjB
 YZg963JSqt/inMisUJ30U3L0TNDUC5kdjUGCuURQ8zVvIb4jFJdkujlVWsjQExfWlIDnov8MKkj
 YJ23IlKrK2EXhsf0AEXWdb98RnHTrcGmzEs7wNuh/RI+OSBlvqSHKTGGGNbWZharnT1qhl/FqsP U5GMrFbU5/M+PXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GW5murOSn8E9nROuSVHnoIJ3YNv-ojzc
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a0b31d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PZc8IMUpVCTjZOrGUMYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: GW5murOSn8E9nROuSVHnoIJ3YNv-ojzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OSBTYWx0ZWRfX4evsMm/2wlC1
 vAhfXa2XNJ3qKSrdvwShMUSyfX0Cbe+eQygbtEickqdeO8mVj5IdF6Webn4AUL/rQsrQwOpZSpc
 3405DW27bXgY1F58lYrvjXS8lfkanEU4zNs21atujCjvKs03VVYaO7kyfm16LSnXwCiTC9UtzaB
 Fpl4KP1TXxELkOjjvofiKJROSkCL36ovoSfCE/kR086LZ1EP0PN+it7LTH8IUtX+gVy8Z8mvkKX
 UAY3J6Nv4xdm8WRDA2zOZdo734CEnlT3qN0cKFKuipZ4hiwDSm/IEdMG+tb8XrYla6mtZZDqQSs
 YlqZ/MV3WhOPQD6Kq0SxPZueMc1vx14t87MHVDX8QLFMAaO+8RJ3W9IQCszU23lkh1Lc1XRetws
 9eD3JrYeDrVeZk+mUJ79L4t6RtIjqoKqjl9jsmTM7+/BTm036vJbElFV2GixGBPPYHw7aMt7T3N
 BXZKHFaY6ha1b99BzYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260189

Make code printing pointer error value a bit simpler and fix coccinelle
suggestion:

  clk.c:363:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/samsung/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 94b2bccc7d02..9d182f8c5395 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -359,8 +359,8 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 				ctx->reg_base + list->offset, list->bit_idx,
 				list->gate_flags, &ctx->lock);
 		if (IS_ERR(clk_hw)) {
-			pr_err("%s: failed to register clock %s: %ld\n", __func__,
-				list->name, PTR_ERR(clk_hw));
+			pr_err("%s: failed to register clock %s: %pe\n", __func__,
+				list->name, clk_hw);
 			continue;
 		}
 
-- 
2.51.0

