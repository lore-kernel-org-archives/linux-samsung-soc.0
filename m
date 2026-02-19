Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151A33F36D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500451; cv=none; b=DNImn5JN9ecKpkrLm0MsFk4lVhbatqlyAbSRkIIUFKuqIDFxLY7Xw5oJM2a2N1YMh0M5bk97WFGhQgCDogkkAlJ9JnALtf/tmRKzkHuUJGQ5hpAFzejoctKJsBmkIBIYcGETovj0CMoM/Wlx31YAoPRNXsX2fvpEVI5vM8LVyMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500451; c=relaxed/simple;
	bh=zCBD0xdOOxAVkq3+Kty451D4UNd0wOLSkX5sEdRZvAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dS218j1Dqf/0PkZfIb6g1elb1N+QS8R5mFxNLXeYUrECmEOR+8BUbEqJDsT56qQUy1aQNSuaahjAH0DwkSDiqouB/R2j+HXIMuRqWl5WyA8Om5J5+gFYpqkrlZmAvN5E217Ubplj8uVX1aeRdNUu7ArvF41kgUSRGV2fWB9+yQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhScXMMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaTUOKjx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhScXMMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaTUOKjx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J3KHu03150357
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=; b=XhScXMMZSM80so36
	WnyFaoXB0dFjX8C27H+MfBBRFv6j24aoOEvNWFPCGIhJAUYuQe/FGrATJIm2mD9I
	fQG4t3JrVfempIeNEDw6vjX2Z4seJ8sMZXcc6bdluC2PMI8Oho5KqhLN4LBfjA6U
	keFYEO3spxKKvEaUNxOmE3vvnw9Kzv5/ETO5/HET1+zSO1KaVcBswkjyaNqQo7e1
	jSNEeOifo+b+O4o2hHbNRvDvFwpuB6OdxSMZzkFQ8/hFbQeUUzcqrJUcQ677oEzs
	Ks+vr+ci7r//V+4h81K6zTTsoeajTEKPITs762bo3Qv0SoSGGoHdpevIlT/XqDUI
	6654ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e494r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4e37a796so527667385a.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500449; x=1772105249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=;
        b=YaTUOKjxPX0jsEPxQM2CFLJmaDxOWTgmQ4KR96vJFa4BD5HSzw/7aApKSY1syFHlHf
         wYd8pYE4vMNclvYaOOSS2ewqx6ADccdfD4hw5mmrhEyvOF1060fcyrUlF65+D43cIXVZ
         VaPb/crorSbuywnVod3J50GbAb+LWTQ8pOUCAuDrhlZuLtltdsr57QKE2Ttpp1vnwEYJ
         UtYCtaCuQ0MbAUsGQCcAL0iZoS4oDtQTVPFGYLG5lt9iEf6roxeYHt+ptOJBd2k7A37w
         t8h0BSdp85YfK6KiqjRd721olKvwJdx4y83OLdFLSu8SYH/cVi3PMb7ep6Tlc4ZiijI0
         ZKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500449; x=1772105249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=;
        b=tvWHV+VP5cqSXY6tKK7kueYptz+x8TkH+okmymPnQCJXbBLRGj/HcF7je9zibXdrls
         f0xzbt65VPdq/Yp16DxrRz+R1hHrJ875v6uKja/ALvZYCOVoERHCWwkYuTGIe7vLLUPs
         y7LyMcb9dHXdg0CJS5Tj2Py+bawp3nrYpCpWGc4LLAW6hcWBeO3eoCYL13kJPHV5nREf
         rwaKRnoSkBDBx7+fTLBd2/hYwT5ABo5xG1yMjtKcH+wG5AMM7aBA+39DjLbku3/+uXYd
         k/KgHBRTMywq5wymjUApz3RqM89zf6Cx4LP5pKvkmTD3kckzDJNbkrYqHbhsft81xXKZ
         Z+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUzwlyR8ZorafHIJVY2h10APNAdc+aYPoQBcA4SD1vUsLXo8GdrVdJeyvRHl+y7mHUHrIYgGmPPTvbRalWOqg+oug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvliWa6+IBryEwk2ahwRFsI0Be5Z5ECoE6+J8vHDMg9nC7FTJU
	0jJGXrpAW75zKFNVMtC2nPD9TkT1NgE/pJibQS3uIv/SUtRj/IefLXU4/Y6AjZmIJo4xjAsHaEj
	Cn+diAHNWagR7+GrxwyE3kkJb+DGs7cRFD3CYHCWxtTuC50F62uw7o0ROS80PeP9OUie0GQGEkw
	==
X-Gm-Gg: AZuq6aIT+eaDC+eonWjiUWVJ5PvGVwH52H9OJg3EtOTr041sYQfU2hTumqyk5YdFWRb
	Nx3l/Xi68keQwdmjWGXv9UgDz1CxNwBFNhfyiMl6b9sBFTKsqH2O5PJ1r/CrjO4OAU/GXFSuMJK
	5dptuvMg+UHezVf8S9kHTZFXkD+9xGwFt5XTlSgiXj4GR4hD/reW+2ADJAxLSA4sPLuc50zQin1
	/mzUZWsiitRN7T180DEg3DZg+xEaGkRnmejs1k99GF8VmJTwIaahQ6MLQ19jg+ljHt636R8zWt1
	DYDAytIREezzx52lDiOs2F+4h+BuMCwyXKX6wCAjBtxZmyRCrPG3ENsmwvIhBL4VGrbV9go3Gcz
	wihyDaewFJl44HyXWfd57pSNK1Z6aZdOi+j8NWU1dtxU/cw==
X-Received: by 2002:a05:620a:4050:b0:8ca:110b:38cc with SMTP id af79cd13be357-8cb79eaa527mr233566485a.27.1771500448600;
        Thu, 19 Feb 2026 03:27:28 -0800 (PST)
X-Received: by 2002:a05:620a:4050:b0:8ca:110b:38cc with SMTP id af79cd13be357-8cb79eaa527mr233563285a.27.1771500448054;
        Thu, 19 Feb 2026 03:27:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:27:12 +0100
Subject: [PATCH v2 3/3] firmware: exynos-acpm: Count acpm_xfer buffers with
 __counted_by_ptr
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-firmare-acpm-counted-v2-3-e1f7389237d3@oss.qualcomm.com>
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
In-Reply-To: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zCBD0xdOOxAVkq3+Kty451D4UNd0wOLSkX5sEdRZvAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOYR+uIJFtIIdp6LnUeRbEBpg7ukZrE/s5l0
 d3KGKa0XRGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzmAAKCRDBN2bmhouD
 1ysFD/46Y0DA3bcXwkxOFVHsKp7iSZnFhERCvqZl17T0vKZNNWjTABwQuIxbBPNoDj9ws99LD2v
 playnm935S92hlxRsUetG+gFNO/peGx14B57I4FLcjkJK6FZSifoOv1KcraTIramzWtaAhMD7Ij
 9ElzKIFPv+NbA/cIAIHe2JEJ94lUqge3z72ZQN8+LvPYs+1cbFvBA7uGr2W7jfQn6IhvdisVmhQ
 1K4db+SJ8LT7rt0kge1BC5SzzRUIKx4xs4xGATBfoW/IJCY8qLrkStwQVDdjYNKVBOReBPhdq7U
 q67HNBxfpEaABG9dSAzlENwpU8clUjaOjU5QTeC09Ye+VuvAL1K9XUiHRDZeCDlm9ixctMgsk4N
 RFNnP4CPtKRHja3Gqy1pY+lkS3z6k/RtqplMScyUpSOVuTMQTpwg59aVvYEwsBK3CzeGG04XPZ4
 okqpW4KEhEb1q/ucVUsRJIfpSOGE37BonoWlG+vy0Sf0qmjNbeEq0D4OMyLm9f1sSvsnc/E/+8P
 F/J/6x7P51kYFRh0Ba/AxMIXzVaKuobTj2lNksnz2wXje2fv4CjA/JrMWfv9tT274yYs3tlfYOp
 WQlK8coRaNm23oLWIKNJrHveXD4lNEaKJj+VSKpKwu68EqsSp42YXREkVYQjPcylVR+jNLst5yf
 GSAaRTlEzbfHHlQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6996f3a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=S5Eq-Qd902Z19Fn_UHYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX365LzRQ7ZguC
 ew3C8n6MLejvBm1S7eChKpURb5J2ahL7DlPqKnKucX7fKeOnuIFPIBRO9xW41YnVw0ehkyPMu6J
 Gwic7oUNjsy5njr6C5cZbgEUsPqk5zm8t1wSfVjku+d5chBQk9GzKPiBxWcWJ4ocFTISWw6ML7J
 K+/CvJfVv0m2F8bZLvHaVLiFDog32+zuHltjdKjs4gy4dscGwPsbTxQTNM78U66T6rlFANdE0Qf
 ojGGBZOuxh0wneRGiDrlix2G8WvMTsdMr7zCg5aae5xRBqzoo3spHBn9oAanx8qQ38hU4A7PPxi
 8vN3YW0GLImraOi4tBoc7DuMtev2IIs/mzYYNgd1JpON7kehAFxOnOQfznKi8b54aOAmP0iSiJb
 cefN63ROELky44Ek43b6iYp2F3jNyelppDIaZ4kLyMoOwt4eFcfe7jFo0+XvylPIuBugCXaNAwB
 ST1xs8EGloroVvMl9UQ==
X-Proofpoint-GUID: xVL-RO8PqS771OL9pJjJl6eBNGM77mR9
X-Proofpoint-ORIG-GUID: xVL-RO8PqS771OL9pJjJl6eBNGM77mR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105

Use __counted_by_ptr() attribute on the acpm_xfer buffers so UBSAN will
validate runtime that we do not pass over the buffer size, thus making
code safer.

Usage of __counted_by_ptr() (or actually __counted_by()) requires that
counter is initialized before counted array.

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
index 485fc77ad4b1..17e7be7757b3 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -25,12 +25,12 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
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

