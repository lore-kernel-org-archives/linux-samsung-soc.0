Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D3730BB8C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072811; cv=none; b=acipeSJykHbGX0UgJLu86BTeeJk2jU09AHQCbUQ5rAgYHEO72ex0UA8wuu7krDdLNvemy80VHUGWq6cilFXSOFcENXNjUM+ysjBt14RFGZ1+N1PvmMCfSQNJ6KFIQ+Ls3keyReFqLYBmNRGIgn3Oa4YZGlOydbTnxoC2GOHouP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072811; c=relaxed/simple;
	bh=vAX0qIkhBcbpZf/oznc21YsjusKij9EY5BmIgI9Sr7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQs2rqkiwy3YA2xHLtqDehD6GRQb8W5pCVRXm0uHjioNQVEXK7DJzGnZ5gp1wEWReSP2gyD+UMcGgy260+dja5BGVsajr/IJ6A29yHn2BGVGBTSuutHjjPb4LN16vBpL2+TXYnt5JKNU1bYZsJmiJLJVwFio1+jCY0E/jxUeruE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKwtkAcZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4evi3KS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKwtkAcZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4evi3KS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61E9TafM1427184
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qfe4t1IfvFtaq6PrP7lrtAAdNePeCLs4FdSACzw0PJA=; b=bKwtkAcZTCk4Gg/t
	bzo8UnB5xe+NbsWSp4BDQ1914PmHPKwJybrR4h5fy+f8DcU7wKVuhWjR9wbmNttI
	Kq8gd+w2tDJ0KkIBwKOBXH84h1cEdfAJVT40/5o2RwLT7rmaX8veoDUeZxUEYczJ
	OY2RPgeAzWwbZYwS/MdMpn2KPp4uQa6xTubCQ2rIUD93Sv+Gh4ErHn+qldbYHSI8
	sOh/rshlUQJjb95WimsLt1WpUKhTv/WBS/zbIeXBW4qkXKIUd/4Lcf3mGpv36duo
	BmHmhvlb51zivyytAlEW7T+9+zY389E7W+FOzuottrD5ArSeLFF+dATlRA876c7R
	3nyqKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caedp90fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:40:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso724874585a.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 04:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771072807; x=1771677607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qfe4t1IfvFtaq6PrP7lrtAAdNePeCLs4FdSACzw0PJA=;
        b=N4evi3KSvBFyU1gH4nksyeTtSScytBEIwhal3opnRwTemaRYLbJgDajFbiaMqcDKki
         bqHz7KOH7syrglz5PnGa5Qw4+ZkjN9+MHTtXDdbSqxHIumcaaoAPstgLw010LjpRD273
         wda/3tKCNYJzb1hjVExPIxTtDfZCiUX35v55FQP0hCbMv1yAlGWH7WLrP9LhWEXBoim2
         45ZEOV61CciVhQGItbjdyQ6+77V6TzR8JFkd3tV73zj2j+DwyM03loBCJLdoEbnLhymx
         /U8/QMoisgcWpURsMpRoHDyoYvvySBB/iPYy5sveaDXABIjenQqgdxYYrTiYv02MW6ZT
         moZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072807; x=1771677607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qfe4t1IfvFtaq6PrP7lrtAAdNePeCLs4FdSACzw0PJA=;
        b=uC+q/B4VsHG+QYB7ZMWYzSPX+wAMgNuL2nLuUNSXnfv5A8OjpbNSZsAIb3ajnR+xaQ
         zV8E+ezd9+I+WAa7ug8cscRJKyGK5ziH1J4aRAIxzE58zwXgWjpLgmKZq0SdkiL3wZlD
         nG9tFx+9aX2nV8b4RvAVkSPfzc183V2nOaUd3heCaCKahqp6eu4AgkqZRrE1gpsB7BPI
         ix6ApyT2IC09c3NrNnAfSnMKRsnhUm0w1O5QkF0w4ikw1u/kgovyOsKWX09YeB2Xz1jh
         CfWznji7v+GvVzTOAQEpWEEVtswOUL540e6TOvqVsm8/4+0q10C9JLjOf4EKkDC8HFvP
         3nYw==
X-Forwarded-Encrypted: i=1; AJvYcCXtVcy7Zu1+6nAZwsQcSRgNkqkdYkuEYdVv8wLoYEG/KWdrPz1gmLNqWA5Ebx0rcZrnutVqKTxHkqrmjAS7MutlMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Mcy+EZNQsxz9UKzmQF+pHkW3R1WDZa5AunRXRGMWYHIK3MAM
	psr8Jdde6EpQeTAW/CbT8Fr+5lF0upAmvbe7O3+FSV4SCDEdUtO/8ClWxe+SLrDR34etXd097Do
	KgTewsUs49b68c0ECEQTpkVMw0XbExiirpjaOIMqAYzaAJZ/kdlu8h6NaV8S/1frfSyNkvCUmZm
	JamyCaRA==
X-Gm-Gg: AZuq6aIIj79O/npr36VfaY/lW4PwH4x9QiUiSjzfo5gbSuDtz0qPe8Rq+iXOZEeMJKv
	hSLJHJnm6TyWQjSBEwdiXNHRZUD3vzo9at5ULOKEfhCAI+aQY2DaY4gE40gAoi7JlVr+1lvcx+Z
	ea8N9TQ0qLOBlZUI/WaIeRnnSGjFHCsZnv8Nu5dVCE/AMBA0uaVy/WASgvO2KGG+9MurLfQpcY2
	INpM74kToNf0XKdqrrLURmotVOeR3cyvQM/n/AlLJ8fDQMCR8Zx+lQz5mIhGn84avTVnbCThfyh
	KJlN72tQn2JWil2uI+KuCg85qmsQAsi3ik1JzeXpOU6FZ90iam3ih17J+SDaFVTOOqCn/ekJKyH
	4ULAoXCbpuJxB8bCD021+6S7UzMri/qYuOXEfEuA0u8oexg==
X-Received: by 2002:a05:620a:2903:b0:8c6:a539:55d7 with SMTP id af79cd13be357-8cb4c00c94emr346485185a.55.1771072806822;
        Sat, 14 Feb 2026 04:40:06 -0800 (PST)
X-Received: by 2002:a05:620a:2903:b0:8c6:a539:55d7 with SMTP id af79cd13be357-8cb4c00c94emr346474185a.55.1771072804086;
        Sat, 14 Feb 2026 04:40:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm13644215f8f.3.2026.02.14.04.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:40:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 13:39:42 +0100
Subject: [PATCH RFT 3/3] firmware: exynos-acpm: Count acpm_xfer buffers
 with __counted_by_ptr
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-firmare-acpm-counted-v1-3-32af5735470e@oss.qualcomm.com>
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
In-Reply-To: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vAX0qIkhBcbpZf/oznc21YsjusKij9EY5BmIgI9Sr7s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkG0c/JRXcJY9Sc07saFg8+mEauct0i5cEA9pB
 pN1qP2vzj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZBtHAAKCRDBN2bmhouD
 1z96EACbWxdW5F32wYbd0rmoZMRy4j/Wn7g4wHkVHbOV7LkRawfegVoTDDp6gimOSqT2X1dUfUS
 kOeR/Wu+/gucDSpJFkauHlYuyopevHBV5pPc4H3ZejnfkaO49GnBxi/MdHNDtspXYLc8ICrCJrz
 150dtU/RDT+aC8OCJd1yqorStz34XjChvudY8SSrSyFtfDL0jjGw3q8Y6S6g8LHhq9uSOIOCyxV
 MP8h66ge/AWsbtKw50xSWT1j7SOsaenT/rZAu4jlZLXf7uv0oNqxs6riNKP11pUce25bsNsIPOO
 5HmMBpDobHXrbUJxnzehI3rsQZy1L8zZ6WtgR+pbi0KLg+3Hc0vrZxVqIRd5LJeFym0f6JRO8Kx
 xKi57yWYjIWsp0zzcMMw2jqYOsVnsrd6G7JrEfX2qOZumcj3BqTHzYrZX2plwgEuNVItsvBX+1w
 NBAlEAMFa6xHAcdfTLPKDEwTBNdUdywvkk21TPPPRfWm4tzVpHvD+UI//TRcsj6MkdMTu7yk7ai
 4RcDWfhQ0Eg5UxvEDGDnODNyuKGZxHQRdjFakqLm/oaaLSEoRQNC7BJE5vRolniL0aVOLDo7Igf
 d8P5YdI+AJO1MAOHwA2HUB1pfCsEFgdta3kwuthJAOSf0rimyzJzPUzqesCcLbjQ7Dp3iAltBWm
 7xpZ3UeXzmjldTw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEwMiBTYWx0ZWRfX62xzZZ3lBg98
 B3jj8kS1UrG5+Jl1OCZuS2RS8pCfXWfjna91FrlKv4JI0uXlD0o21fUtB+LAZetJfz/apoKCODj
 +W+QYAO2M6geTuqwdfA6ohEFxkQoGXngvedTdvblgD4rxJb7depaQG+/NMgR/7s6Qdw13qBVj0V
 9wHAiP9d7s6jSTNhdvJK7i1x7jPkKkRvAOwOCmcKdcPmhHpP06h55r/OgCyi/Ff78BT0pgqYii0
 KKgwN/xFaqZ6JoorcyiyfCyYMDJkr+lgQbxpa+tLQM885oSfm5W7BYASboTe1imZmQILUmYbmdD
 a8bvyUBTH3JY6Kf0vFKAXJEeV51+Oxiwjeu2c4f8OakpV7ZvycMFwWifKYgVxSpF4MR4Iu6wbKp
 Bsb2UtObhFAI+YEAUMzHqQezbKqSHwM+J+2ixncBT5Dwr2M/bNkB7ovxy86CWR8DDKt6WGNMDQo
 h7saxn+ipVbEvDJG6WA==
X-Authority-Analysis: v=2.4 cv=eK8eTXp1 c=1 sm=1 tr=0 ts=69906d27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=S5Eq-Qd902Z19Fn_UHYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: WcyH8dz3kMHwrQr3Anxm4kgbpW0AVnbh
X-Proofpoint-GUID: WcyH8dz3kMHwrQr3Anxm4kgbpW0AVnbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_01,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602140102

Use __counted_by_ptr() attribute on the acpm_xfer buffers so UBSAN will
validate runtime that we do not pass over the buffer size, thus making
code safer.

Usage of __counted_by_ptr() (or actually __counted_by()) requires that
counter is initialized before counted array.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

__counted_by_ptr() actually maps to __counted_by() for clang v20.
Alternatively we could introduce new __sized_by(), already supported by
clang v20, but it is not available for GCC, AFAIU.

RFT, testing would need clang=20+ with COMNFIG_UBSAN and
CONFIG_UBSAN_BOUNDS enabled.
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c | 4 ++--
 drivers/firmware/samsung/exynos-acpm.h      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 55ec6ad9d87e..a4864973f65d 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -24,12 +24,12 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 			       unsigned int acpm_chan_id, bool response)
 {
 	xfer->acpm_chan_id = acpm_chan_id;
-	xfer->txd = cmd;
 	xfer->txcnt = cmdlen;
+	xfer->txd = cmd;
 
 	if (response) {
-		xfer->rxd = cmd;
 		xfer->rxcnt = cmdlen;
+		xfer->rxd = cmd;
 	}
 }
 
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 422fbcac7284..8392fcb91f45 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -8,8 +8,8 @@
 #define __EXYNOS_ACPM_H__
 
 struct acpm_xfer {
-	const u32 *txd;
-	u32 *rxd;
+	const u32 *txd __counted_by_ptr(txcnt);
+	u32 *rxd __counted_by_ptr(rxcnt);
 	size_t txcnt;
 	size_t rxcnt;
 	unsigned int acpm_chan_id;

-- 
2.51.0

