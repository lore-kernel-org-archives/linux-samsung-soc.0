Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0933A6FA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154966; cv=none; b=MICMS7UTq16VAPIAHx2dmPQFt/0ziWJ1omYJTB/+KCjCO8RshVvU/nOXvWDZxwhmGJrNo8JSJ8mFcQm7yKKfrA9p7uJwk0YX7vRcaWA9WszDaJuGpOK0fXfJd1B2YaROevle0Z2NMZ4PMuInDAvQFDHPeQb5gYimgSTnafj8K80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154966; c=relaxed/simple;
	bh=Fmnj6mVvpbfLtwijoNhLAn9j7guM9pp4HVJeADMhGe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6XzSTTche4lqW3ZC8pJ8yja0zA6Tanh5RdJ+3/NIBLQm3wAt2nCjWuMcYAfXPR/H82c7473XDpwZ7fOfAegwBY5xgzyTxbaIVx7Q94MXbfc407t8Qcngh61PBlFn/14tCDDalF9uWNmzXLntconjQDuKnxdym05dAEM1jVhw9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dx6RAz2M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8Vfu7Ii; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dx6RAz2M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8Vfu7Ii"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBkQWM3992425
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KPYVk+CR22m/g5FBCc99SLHEDjfYAU2ih06ixsTGRk=; b=Dx6RAz2MmQbVOKoW
	UDi0K93jkktF0Nszi/pD8lDSsAqYLALDNIz8FwmlIXxBTLlZzeHqx4R7pTt7UhIG
	DWmkliMOf4jN/ZqpamEBz3dOcSS7LwJdW7a23TY7OZqHT94/fYay94YEaGDt2bCg
	eNWxmLyJm3NJOorIOvXcle/4rrXsHtln0vtt5DzVBlYaxJhYfeQsTUSftPurIdlQ
	CziXMC4GXW1tnfR43T+5Uy0uXJn9CEF2E3ohrI8zJzQ4kFYweHWwvMbLzqxPDzC/
	bJhfDsut1yCEbk0zbCdA4ouj3hRi0woR18qT0YgOSfXRgJG7elKeZhYay+WFtIgo
	uEmzCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2daw1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:36:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d60f037bso37809271cf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 06:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154962; x=1766759762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KPYVk+CR22m/g5FBCc99SLHEDjfYAU2ih06ixsTGRk=;
        b=T8Vfu7IiUP3ibsW/qX6/9AGiC5ZfqvdWjAd/zR1hsc0RJ5fKxme0nfpD5PTL6sYMxH
         seCw4S7CnHz0KJvuO3DDLyeUh4s6WPFLB1nVguaTUnG+bPV/LnkrcTXVpi7n3Wk8pN7j
         +J5oK/Ps1VLFdl0QraoehzUbUvScxcwhi/dlIjYLpDG60rrzpu1rH3LECKm9k723tf4V
         jFcmhGZwBviFfex6SXxSZN6biAiNz4BjDFozDKiabnbattVQMlEUahDlWg30WCPmVrQ9
         PpRfOlZkTlfFnypJbP3jnRdbiUzGPapGA8Vwb1kGhhkFFNeujPESiIIRcVhNUASjw1m1
         kgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154962; x=1766759762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6KPYVk+CR22m/g5FBCc99SLHEDjfYAU2ih06ixsTGRk=;
        b=Bp73UBPIJcMVHMjliEUXeL5g4RJj4t/uND+6QAJ+1EH2GEkun+Db//rJSIeYHY2OR1
         Qk2p6DoUJ0MTK6YwBnPQnZI5vLcXJ9bO9Op0Xb4o5k/c4yUtTCnX1Tcy3ukBOzRwpwLN
         f2AM62F809FUKDNqK5vj9rGcBc0zCoOiz1n11FMVwwEHjnrZtMteP9Z0aVOv5jdbwFDf
         qGErqLJZQXDurCfbt/MnQ4KxUoXNmHrq9gk+6mvkENp7wKbwBqUt0feuX/O/OYuHRzNZ
         dxj7QsIroqT6ocBru2LIW6uZhXGH1LMGkZGbk3NKSlBdY6vFuMMD0q6w1dGUjj7EN3RO
         3d6A==
X-Forwarded-Encrypted: i=1; AJvYcCX80iMRVfpbZ57ASo8eIDQPGkngBNfqUuJL4G6y9AziRJBgaU2Lb02YhoYcRK4dQZQSSYfhnM7wIThugtHVAakoRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxD72sm/9WRiXrS9s+yU5Kj2WmAYSsNcIUqCCshZ7CdHdStq5G
	9rIYO3o2vFm3swNjM8+20DfkegkafS6jFZb8MQ2zeRg2kolCCpQuoHG9+P7WU29A/CbKhbgq9pM
	LKKYNzVj9Tqs+v9gUJC0B6f5oHK7qfS/YxBFdD220kdy8ECF3B267PBH7nyZTLmULBC0nX7yatA
	==
X-Gm-Gg: AY/fxX5cpKYf+NwkH6QornyqBFA4xMCthWr1QMAmoM2SYCwoJx3LsYx8mZLJGXRlnLS
	tfYlJNBpHbGAAAO1JCP0L/nmL7EqM5dL+Fhlsq5Q5yNQAMUi4MNH6IKpgrQVm97Nyz60U97oPK2
	y4a9fhYSxQtrW3bxK0E42IZ2fr+C++kQxGUUR+S0dz4y/4tyUAcg9cVDqia+SlTzjyjEdyHztnP
	5h/OszxnuFXw22CYGoUfdv/OUi+OLVbpWqOLhvN2k7YFLK/7UeyoTHXe/mX8j60w4V7D9uAcNrg
	G7mk/tbaWkjPYihqHf9uj/f5BS8HOF6am8jLDsnjpnjuabxjNDS6SLvFP0Kmb+2OciDRAhZMvUi
	ke43gXUCvXxvYX3hmQ4ve0NO4dxnxUDOtklOS/JD/nTR5Of6bXZcqRA+RuGQz+/Emx3oa
X-Received: by 2002:a05:622a:5909:b0:4ee:2c3c:6e with SMTP id d75a77b69052e-4f4abd0cafbmr40586011cf.30.1766154962203;
        Fri, 19 Dec 2025 06:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf/8P/7gffTggqaLL7XA+UX+u7FNuz6BrjE8UubcGAq9Jn0DzHD2i139MD/SRvhbhO2DTJMw==
X-Received: by 2002:a05:622a:5909:b0:4ee:2c3c:6e with SMTP id d75a77b69052e-4f4abd0cafbmr40585381cf.30.1766154961735;
        Fri, 19 Dec 2025 06:36:01 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:36:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:31:53 +0100
Subject: [PATCH 4/5] iio: adc: rockchip: Simplify with dev_err_probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-iio-dev-err-probe-v1-4-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fmnj6mVvpbfLtwijoNhLAn9j7guM9pp4HVJeADMhGe0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLH1EFl2sCBthzt79pkShZZiMmOVlFkKcQCW
 mlR1bgxXBeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVixwAKCRDBN2bmhouD
 1yneEACQf/jyEI6/m6DrHaosqP0fY91Xp3YLGPZnm/1USifaPKrakFkvixtn0eSGYllX4PXMDgd
 duf5nq+PPq67Mbt2J6GvQ80K55z+C99pMr/xL1KxwOqk7vbu18uyryGnjYDo/O3ra1OFDJUCBL1
 xbEmsfWqd15AUJcY74qMPZW30zYCuLScdNNvhWpQvsURFVXzruPmXAUEA1LZDkD13KfhiF+4hd6
 0+cey9A7YbrHXZuLIjkq+EKDRu5c1HY7nFEXeRjZG/VdRpNHnnrZOYLeoSg89UD3d9zHAoAIlC6
 k2HwnIcyCIoM1VTZcC0v71LYPm9FtsIMbZ94VyqS7JIzAkn9JWACeavbmC8utEloLZ1sdxRA5fw
 j+nj7Ugdy0niu9678mY+/hCHp0pGpfxC4S5L2uAkyze9Be1VsT/nJ8+rY7+yrfcULh0awxpWvCY
 yq3qH+6xgGymoG7C/DWWg1p2Tc2UT5VXyB1wlUZ3Dy7rs1t6MPOoW0m6Y8GpIoqbxKl95Ot07Ql
 yxXnHOIsTgub0fbyrI3uwQNMn2b2HkGofj5xJHACHWk+TZRseG+oRZoNhk6gO/t5QSrT80IQCqV
 dapzjsOgJWWyp4u5wm7f/aXgCFoj+c/zRYy4LBpWkRFxP+7dqmmB8UObF1SIb2AyV0JQKEvlVEB
 VKH7vTQ/hvVYXJA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=694562d3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UodCGf9HWxkVo1034I8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfX82THuVH7XiVJ
 ty2Bu8p76fL0e4mDc1PIGNwy+KdLAMPAazGrLjvY15HSEA5qHi/Tj76v/7aQ/xPGxbjOIilCaR5
 bxQFYIkTPOYo5TEig2XXEWA/pGZg5pbVoHiSCgV8+UxSqGXhO0m2ASJGX2uLIIiDHvDMn1+1TXo
 Jrw6ESMT+drNW+WR/+Uit4AxhcuXapT9N1QQFXcgv4dJbqhI8UBFfoSAbuFi0cLChs1UBtF7/r5
 XI9G7q/uZYdVKdHpxxAi24RsdJhQRw5IruO5hDwt4LNYxAWJUjYR/OpUySzoXO5WqDE8sA9vYfA
 bTaFNLDCXqkv2l5qHNVph/lWYb38oxYPwimrOjcZ8PbcaMpmZB2upy4pWVwoqOuw/TdbWYuJvW/
 0mYUhL2j2SK+PKbB5RKvn1w9awbcRIDnZ0pM/ewaEsPnwVmxbcP7mthSkLh353gx3JdlT0Uidsu
 VoEYBd/+H9eHJN5nFgQ==
X-Proofpoint-GUID: kGR8mPh54sHTSM6oBJq7RYp9dhxZIAZi
X-Proofpoint-ORIG-GUID: kGR8mPh54sHTSM6oBJq7RYp9dhxZIAZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190122

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/rockchip_saradc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 6721da0ed7bb..263d80c5fc50 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -492,10 +492,9 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	 */
 	info->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								"saradc-apb");
-	if (IS_ERR(info->reset)) {
-		ret = PTR_ERR(info->reset);
-		return dev_err_probe(&pdev->dev, ret, "failed to get saradc-apb\n");
-	}
+	if (IS_ERR(info->reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->reset),
+				     "failed to get saradc-apb\n");
 
 	init_completion(&info->completion);
 
@@ -505,10 +504,8 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, rockchip_saradc_isr,
 			       0, dev_name(&pdev->dev), info);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed requesting irq %d\n", irq);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed requesting irq %d\n", irq);
 
 	info->vref = devm_regulator_get(&pdev->dev, "vref");
 	if (IS_ERR(info->vref))

-- 
2.51.0

