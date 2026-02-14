Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F47130C63B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072813; cv=none; b=OaojgpS4FZUjyWip02ZMpqcDLwT9Edt/aSMWsV8rD2hvkh4yN/H9OIRAmhisfP628fHX5dbHKXdZr0+Md4WTM36tRp5aRrczo+25IRmjEGDol2Gdcyr+OcC8F2EmSItKu43b0xPeZ36KOC8VapmcSlXct2JynFiWMFWFSBYQzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072813; c=relaxed/simple;
	bh=7feOF3Elx5oK8syt/T37E03ztwOdUNRtuaEPtI7X4x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vGip2NPDSoxG1PO3i9eNENwN7LFlq60diZ2hDs2lvmW4E/RvmtB2M57o93VmIw4oQCsDvCWeNs2bICWwHcSwp3qNofFOZceUAm3qpcKDPZIYb7Vqpb1T/sCMGP/Zju/vdXpZ1gHOrYzGL19Jr1MJ8zKFzL8b9N5FekMKqW+uH2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ai2jgxSK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PatBry9W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ai2jgxSK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PatBry9W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61E9S67m1957824
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ChNQ0sN5/DiYoC6u1SEgcPiH2YqmBHOxmwxzvZzWz8=; b=Ai2jgxSKwmRCG6r8
	DW/fxS+YPGAouZGxpiQO/NZLMVYFsZjjTfKUvwhpb4i1v9NAi2/8odqFMFlBSWGZ
	jfBVf+/0gDoersUXBs6kCfzrmxnGFh2vm/Tn/p4wyKuNcHoXx8sUxArgzGJw2ANT
	326lP+MKVjF1QG56xENQ8OFRWaEO7BpwXBj56zhIPPRq0sV+6Sc42zxh1h4wN4h/
	1UJbOBbYbMWBeFh5QHHupxzmiMmMrJj3Y4jFyDb6qJkMnn9JXy4LKoJUCrMWqQVv
	6Ei4kiLPhp/R/pDzb4dqcBuiS7K3N/LaogASUzkj3QuZNLGkhSQ9Boo3O0w7VdO0
	jpiC3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah930ps3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:40:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-503810dba87so126211091cf.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 04:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771072803; x=1771677603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ChNQ0sN5/DiYoC6u1SEgcPiH2YqmBHOxmwxzvZzWz8=;
        b=PatBry9WfucGJtuznBCEk1cg5LN9Yg90bYhivNZwFBdavEh9uM6HH1+x2B0c5H68z7
         ekRAXZKgNYpjlT2pC0QFUzQOH965mBFrM6lyhoEIhAKJ5ggnxYHt6iPCRK8Bdk0OsrU+
         3VJUIdzD6SyktJdzA2pYL+HzJkz/MbxDf4ItHsFJZteENZetpf95IfAxLWxWedIWJngc
         jlcpm7nqFjSTcDpiYn15PkhQp/4Lg/df83AjtTbAo+owtDxjmqcfEOyff0JXoA5JFV2a
         +jXPsaQqUh4XLDIPpfaOgH85yl4LSjwr9D+JQerMJ3vm6JJb7VVcMFmRHdWTHhZ02oH+
         PF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072803; x=1771677603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ChNQ0sN5/DiYoC6u1SEgcPiH2YqmBHOxmwxzvZzWz8=;
        b=X418wPOKibaFbwuRhonaEbMp3mg0zNucQpVp7cpR6nsVKU1KYnyzSvSI0AsNE9rGWO
         YUck36634Ul1SOcZZ77PLiWih1iuzJUGW9JORlGJNUVztCQjAxs8PWY4xzhpqdehp0ac
         2V7nAK6m1zzFKD4RpQ/PVL1VqPPJHNR2/afT25dqPch5cHq4eoNkYLJ3c9j3mPrLP1Sj
         SWjNht2McSrpzv9Ouo1xTUAqNyu2oUWWEJu4+za46WOYzNuycmaI3om+boBy9bAP+nIM
         6yThGwsvFVMorA+BwSdxtz9IXYo9x4msjOGYTAQXqJdwwD8f/w27dejVndNuXXYXxSfj
         az/A==
X-Forwarded-Encrypted: i=1; AJvYcCUP9iThC0b2btiBOGun2P1/Tp0b1LBz3DsI+nXrAqllIEVZFlpCxaRbsrGd8HZHzYJ/ojg0YyGuAruetGnTkQeMBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Y+W49AeqMkKojZ1q6+AP3hmezGfoyFnwRePk2dxpU6JkcpZl
	HPOcSq6et/mMVApyiDzzsf3A9mUlbVI1sKOZnfk08+mTkw8YoNsbl128kpRbN0uxbZAG35au0nU
	yhNIzc/oxwL2ueHtKl+zyHCkClqLLJuacNNjIhEsQYH3Pl/YNICr7D53iRf4NjO+6hRRh2YZn8i
	DYWd4xxw==
X-Gm-Gg: AZuq6aIACI4S0g+vHT0VNhdgTxDwrsm8gyygpNDEg+x8129XRoGG5cKiIVM9V0JbUEQ
	yr31VWE/SZ0JUjTeQem5RSMRQWfrpi1AB+4ItTsTKvRozwd5GTLmYcnv6mHQhEQ0pJRsHpuQ8SC
	aQeAtP3cCPPfFDO01KXQtqJT9SFdyk/Y68j0LzqCDt0rOhoSC4HlJY9g12+vlapxtvzcgybWVVE
	MSJCiHpDngPEJIRLIsvP0s5YGB5eBv86u4bm5jZvowevczN3+Imtbtip28dXHAUJGkhsVbc4IF4
	+K7gOfPk9RomdXVE0+/oI2NmtDtKuLT+QomJKHcodamT6KiZNtEl9y/zVolBF4r40PSc9mIF9y4
	3xTxbUipQynOnF19LeaT3FN6r3tMbdcpQHtBbL9aISGoRAw==
X-Received: by 2002:a05:620a:471f:b0:8ca:2cf9:8197 with SMTP id af79cd13be357-8cb4c01475amr339892285a.47.1771072802782;
        Sat, 14 Feb 2026 04:40:02 -0800 (PST)
X-Received: by 2002:a05:620a:471f:b0:8ca:2cf9:8197 with SMTP id af79cd13be357-8cb4c01475amr339889085a.47.1771072802231;
        Sat, 14 Feb 2026 04:40:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm13644215f8f.3.2026.02.14.04.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:40:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 13:39:41 +0100
Subject: [PATCH RFT 2/3] firmware: exynos-acpm: Count number of commands in
 acpm_xfer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6706;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7feOF3Elx5oK8syt/T37E03ztwOdUNRtuaEPtI7X4x0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkG0b6OQvxeirc2xuqsfeyQEzVUkBzADwwpMdt
 WS9g5qUQbaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZBtGwAKCRDBN2bmhouD
 18GJD/9TaH0D1uNgkwpVn6l0/zxtSfyRi2kkO6reLHLEwbL6l3EAhGf2aqRrMDKDyh7UQQgRgB9
 RY7fSQAvdAydKnS3ovDFWBxPG6ZU7CjdtwBhZTE4Fet85+ea1bEpUodQRU0CRHNAIZ3nYhaDyIM
 OoDGk8VNryGEJ4nPBM0yiMNcOrQ0oatdASHxa+yzniGTpQWN8vdyVM5ktYa0I7k+hIZ9lx6+3SJ
 myQ1+r+0bseAVdIhbjSIAWzPnAPgUG7/2LBafX4VYyc5eJ5jUOIj5ilSt/h2w7Glb8JzB79PRGj
 QiopKUag358Y7yIoyKEgy/J2SQnasD5H7ldXjMN1Oucs739Gd99S3A2H26zUI95mG8qDLM7H+jq
 8M5cU3k9Qw+1Kr8OLrA/naH/r76e9m7LuKIr9dumQG+J9oC7UL7Z0HFHOMSYHQmoUP5h/eJPDLn
 tyqAPkS+u0cOZtEgwBs57KtOkzUAMf2+NJ+85nY21Lc2/W1ghBQfO97rXGx0+Ok8OdYTw2a370l
 4cCuvLueN6PVEW0DDhQiPp7rtDKD28Fd0pVKvXhGSq8DwZ3Gh5/Fi2el7yJLiGmdC1JfY1AAS34
 RCcDuTeSRlCKzA9jdJhtxx6nkFahFqT4F2ORhmEDpGMsNrK8XeWgYt+D/YKeON9gloCbQATdY0/
 R10iR4/b42Ku3/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: IuL8G2PRKwQlH-5jnjz8Gj1IzvUATBoj
X-Authority-Analysis: v=2.4 cv=IdiKmGqa c=1 sm=1 tr=0 ts=69906d24 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=1M7bLk_J3U762fdM4B4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEwMiBTYWx0ZWRfX6l0nEvI+E+ex
 +DiXLYzPpBlRoWVjaqK9jeJpqsSd9O9be+0A1iqNXA9XCwVWsZg0wAaMUTzviPHcbWdQXX7qrxL
 kUYvzBIeB38A+o08qS2XwAEQQCPg7T7Hax11Obn2eYU+NXuoJkxgd0CJqHoCvNn7sD+l6EFlcYE
 8fa9P1QWsPMbSGG0oZl/hGLjZdF1Z7coFT+wyUJltuL3NaAcJs+FZHDISDTkePsssqvQGPCTAzQ
 264v8sDpnVpVVnwLoTe6p7DBzoCYRVl2VNnqLQ71SoIcAixOPrSS1HbNznZTunxiyzVQwIa0MV8
 AMUPpTiAigj1/wnQKXD6uZwGDk3t4wl2EBOuao4mtNYqnfNuwFoq//r+Hyz2VcLhgVe28ekOPOO
 fq4HvxwJIBjuIMGKc7ZUZnZS7UbjWiPrnCGvNtPDYutODBytOvs24KJEbLBLjgaZ9+9l+VwY9hd
 SNnGJG/wDmUN3tKooJQ==
X-Proofpoint-ORIG-GUID: IuL8G2PRKwQlH-5jnjz8Gj1IzvUATBoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_01,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602140102

Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
so could mean length of the buffer or length of commands, and these are
not the same since each command is u32.  Rename these to rxcnt and
txcnt, and change their usage to count the number of commands in each
buffer.

This will have a benafit of allowing to use __counted_by_ptr later.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c |  8 ++++----
 drivers/firmware/samsung/exynos-acpm-pmic.c | 14 +++++++-------
 drivers/firmware/samsung/exynos-acpm.c      | 12 +++++++-----
 drivers/firmware/samsung/exynos-acpm.h      |  4 ++--
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 1c5b2b143bcc..55ec6ad9d87e 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -25,11 +25,11 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 {
 	xfer->acpm_chan_id = acpm_chan_id;
 	xfer->txd = cmd;
-	xfer->txlen = cmdlen;
+	xfer->txcnt = cmdlen;
 
 	if (response) {
 		xfer->rxd = cmd;
-		xfer->rxlen = cmdlen;
+		xfer->rxcnt = cmdlen;
 	}
 }
 
@@ -50,7 +50,7 @@ int acpm_dvfs_set_rate(const struct acpm_handle *handle,
 	u32 cmd[4];
 
 	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
-	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
+	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
 
 	return acpm_do_xfer(handle, &xfer);
 }
@@ -70,7 +70,7 @@ unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
-	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, true);
+	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 44265db34ae6..26a9024d8ed8 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -63,8 +63,8 @@ static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 {
 	xfer->txd = cmd;
 	xfer->rxd = cmd;
-	xfer->txlen = cmdlen;
-	xfer->rxlen = cmdlen;
+	xfer->txcnt = cmdlen;
+	xfer->rxcnt = cmdlen;
 	xfer->acpm_chan_id = acpm_chan_id;
 }
 
@@ -86,7 +86,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -119,7 +119,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -159,7 +159,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -199,7 +199,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -229,7 +229,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
-	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 0cb269c70460..242745e8394c 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -205,7 +205,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
 
 	if (rx_seqnum == tx_seqnum) {
-		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
+		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
 		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
 	}
 }
@@ -259,7 +259,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		if (rx_data->response) {
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr,
-						xfer->rxlen / 4);
+						xfer->rxcnt);
 				rx_set = true;
 				clear_bit(seqnum, achan->bitmap_seqnum);
 			} else {
@@ -270,7 +270,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * after the response is copied to the request.
 				 */
 				__ioread32_copy(rx_data->cmd, addr,
-						xfer->rxlen / 4);
+						xfer->rxcnt);
 			}
 		} else {
 			clear_bit(seqnum, achan->bitmap_seqnum);
@@ -425,7 +425,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 	achan = &acpm->chans[xfer->acpm_chan_id];
 
-	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
+	if (!xfer->txd || (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen))
+		return -EINVAL;
+	if (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen)
 		return -EINVAL;
 
 	if (!achan->poll_completion) {
@@ -448,7 +450,7 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 		/* Write TX command. */
 		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,
-				 xfer->txd, xfer->txlen / 4);
+				 xfer->txd, xfer->txcnt);
 
 		/* Advance TX front. */
 		writel(idx, achan->tx.front);
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 2d14cb58f98c..422fbcac7284 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -10,8 +10,8 @@
 struct acpm_xfer {
 	const u32 *txd;
 	u32 *rxd;
-	size_t txlen;
-	size_t rxlen;
+	size_t txcnt;
+	size_t rxcnt;
 	unsigned int acpm_chan_id;
 };
 

-- 
2.51.0

