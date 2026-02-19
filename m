Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310D33EAE7
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500450; cv=none; b=onYfhu7P/P4DF9jqqf6bobqMCDVCnPFPDrAZynwmtDo0NaJKD40wOvjZRCKe5mCC4jklfUj35Ru0SAmcX5bP/GEHSVz5h4LpNIoRy1w4a2SE4aNUmI76933Ywo7dqJ5TAwN/XU1lvyJ29iegvOtzdyo+udNGDT4YguVeA1YCBMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500450; c=relaxed/simple;
	bh=sMLN/7ZBA2P0C1881XG/mSB/uFAs4yEuNbwucOSQHKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OY6SEoiZzm2qSeEQ3FY0w/7Mc7ggrM8tNC8dQ+qwOsGk672EpK6lVVRv9ml5K0RIohAfvCurr+rSzU0ehMQaIgF7zpGhOp6Vl+20QZJkiaTT6Mq7jBRiT/rxfnEGsRP4zCXbk6bUOLBsH9UmIuvKLeTo0ef9UaBFrUHmo5CyBXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfzLxZQB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kU9CNYp1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfzLxZQB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kU9CNYp1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JABDgM1623650
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ou7ebgKBjCjOIB9PlzrTghR5gcm+XWioNOKUO6+BOOU=; b=JfzLxZQBhQzr6QdO
	7G0D5NxmxR5cqL2xJIaTgYGafNC98yQGcmxG/Imjjpo8eZcrSdIBqcuXGHw4wkDq
	bVLBa5isbqlWc/7YiqRORbOKgdtotkCtH8+d8cqKRK4VzD6EDifIwSyLZJ/Gojtx
	uf1oc+NaMG2qI7qyc6FWYquhSleNqz5PF9jkWuhzbEk3kau/3QylRbhnzFKxOT+B
	yHzGHLKJLakSkgi7JHVxaPyBHRs51v6SPu2mDVjM0tAPPljwzeUM4EOrTCDbBsg2
	8GpD+1o1JAk/HvIwlgDB6PL3HMDEXYqxBbOFOjvSxl7vGa5o0chggVeOTUy6fuk1
	nMawVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7ubfeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:27:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so638136285a.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 03:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500447; x=1772105247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ou7ebgKBjCjOIB9PlzrTghR5gcm+XWioNOKUO6+BOOU=;
        b=kU9CNYp1ETF9O7NKHhBpU7iwuAUgXFsR2nXbHaxh0TQrdpCnmGZXWnYWHyiqBdOgI6
         1E0DLmse0OmSavjZC+HDRuugssKYlEFyUtfIm1Ufo9aRo0A9oxVBAoxupQEl/Etielhm
         Q+fv3ZnVY1GTIrTuGWXSKy1NJxvCHVHMRDqZTISDbI5SLlKEW8AQyKux0UOYJVLnLhF/
         x1PtOra44Uz8O/hQWOVQW2l8qwWNdF+F56TqAGnRYGaFluS2BmDClwyolSDm6ouc60Dq
         5ii+MVFsn6ps4u/jsIvCb+eKz3mXgaMKCCuD6LsCcxxHZJh82zrRBVhnhfT7KY4BdLUv
         8LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500447; x=1772105247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ou7ebgKBjCjOIB9PlzrTghR5gcm+XWioNOKUO6+BOOU=;
        b=p6Rrhm5s2aVnaxZpSR1Y7l9cyGt4nEUcUWATM9LiYhVt9kkDwqzjKW/b39fHtonPH0
         FzS2KTEeMV5xA2eis2TZiNM/sQe4pa1xLwxquHVkMyG+pb8WHMlfL2AobrxLDb1wgsaz
         Y9exQstLSA6s44dWOeSSB85dJGQIpQs5lp9GjRZrYz0pzhxh4H5kS7dN9Li/s1TI4ub7
         5NAJCIQqNFuSpBTAhI54TgEDPZIEVvd9eu0XiHQEQQy0uO7udCf6teuaH3030c8jK9TH
         QvRcsDAQsglUJhRQHzsVc0NeXI6aLwplubTf/EX4hc1n6bUutLSDjoRMwUJly6NszMmj
         VAJw==
X-Forwarded-Encrypted: i=1; AJvYcCVfWlLtSPGPbq4u4QLbFqmnldCl5/ZVxcPVNRSe6VQ9l7/p21s3/xukgPfKP0HkxfXhLeCUxD7Vd6nXdlgaKIDfcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynmZBwoHnE9+KlfowQTC3VhOgoCWJvQmlcoX60QFntKT3W72Og
	5FraQWHLpc5jFKU49Gg/VrSfWc8CEbY77EUpfT5HpEwGF7WyuRJ53dR4ui9mmoyNz7v8YWqJpt6
	z8TPQi0qCOdfY/PlM0AuW4fsIhy7JHceb9I8BXoTFJKnQY2fDaIH4XxpjGC7cCyfrOZ+JDQ7+OQ
	==
X-Gm-Gg: AZuq6aL0wNo2HOwze6tBFkYcJAEL/Vo2ak5HbNrGmfZ5V5kb8KGpeaIT1jqv58j5myc
	BW2nYHBIDvJUKbR4iKT18lyZ4sqfQZHiUE0LebzU7k79lLf/MNtRZO5SHYX/T2WPANmRz/wN/aV
	SM9qsPmYyyOzsiqF5rEprpQ+9P6QPu/WcW7K6ueUdvDF/AdmKsHNZJPcWkGstrQmpLR6weu7JSc
	IqEvheUMGREGSC/E0t/2f3sYSz5zNttsAiFwPZeX3UVnL7kArtg+1nBiDUf7qi79nowBuA5zY9+
	M/KCpD5rlqZLgkASOMEuhmjbX/5QGctuQQF7YsqV16iQX7L6YOtNH8nQoE8n7wiwJ8qy26HYiQs
	wHa+d4NvqrSUcuv35mC0DN9ZCIor6mV1LrP2zWS2/KaQe3w==
X-Received: by 2002:a05:620a:4447:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cb74058e0fmr576147785a.25.1771500446938;
        Thu, 19 Feb 2026 03:27:26 -0800 (PST)
X-Received: by 2002:a05:620a:4447:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cb74058e0fmr576144185a.25.1771500446487;
        Thu, 19 Feb 2026 03:27:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:27:11 +0100
Subject: [PATCH v2 2/3] firmware: exynos-acpm: Count number of commands in
 acpm_xfer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-firmare-acpm-counted-v2-2-e1f7389237d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7024;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sMLN/7ZBA2P0C1881XG/mSB/uFAs4yEuNbwucOSQHKk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOY5cA/feqbe9rvzIDKDL7Qpbm2bFuPWfPSY
 9T0ZWTRZFSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzmAAKCRDBN2bmhouD
 1zoiD/9dC38H15MV/QMCaANwKiwL/JatPkLP7TNRvJ88xastlsXzFSPEwFJp3L9DtbGJOBkqWiA
 sF7HIlc2Sf9xINNV5UN6n72HkadHHp24tUr9N02/4MC6+wd8UqIBtmGiZ2wy0GlSbrmTC+bbA1d
 OBOSU7sGAa2BOrIiqPMaXohj1xDdzpE6S/huoFBnRMdoNLeEB57dCvU7RYjs1SOTduYFjrcoO5W
 3HsUKqkFtjoH9BzSzjgSFvZ97juKc4bic5Lk9v3SQY8FDn5CQzg22fl8+dnVrUjePuSpd2TYT/2
 C1bnRXycAsmdwBxGmQQUqdfVevX0ClEXDUdl+0uhhL86O6KY1Yf8e+qf5BXsJT02Bf+WrfJU03u
 IB3oKJU5E7C/CNAJRQandkdJOWl37MqXrVjMAOGKfjEhSWlt0pcjGB4871/zJxmsIoLaxWhRX/Y
 AixdV18ReBbuCtEEUuiLLv4dzJ2HtFORaR7DitaWgAiskMdHdRg6tGvly8H5UZpL/WPWYeFCLlx
 /wn09R6nfXhcSWUNOUE3CXxepPmCnuVwyOUDfjFJ0P+Nh2WSrfFrpcAHknt3IG4lL0jqASBKkVT
 Ad/HXweYA07hJ42K/4GSK6k/pX18QSD3+pi6j9xiQ67YpwVJSJY/TToZDRHpiYVGfn6rk0+lBMK
 kuEvko5lxhmmmZg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: rfgQ7gKj-GuEJG2qplqRwBcjlXNTxgGJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX6Cnlu2CllPgM
 umf6qytSn36UXU+uvzkKkEs7bs/Q093Iyz0AavfeVewoSjerVjnjd4uL1FW2AJVuhyHQcyzz2P0
 gZISSfqG3J3AoE+6rb95f+uPEBo+O5cfQ8lFZuXxxnbLUeNeIgd1Ae13z1LjSe4gAWXUcW1CnSz
 NlOTYYixjOVkytVoyQB8NNg+7YEca+tPK5++CuesMwQNogKUwK+/N8ro3c0kp2NiIaBDcsqm4+q
 7VQNI1oxHxOthqVngK0CoZSp4ZCKH25jHnuX8JZqM6wXykjKpe8/FDpz+kkxwDtG4phRbhvM0Uv
 DWLTdRfyHtb1bVT/9luIKxu8OxeQ+IXfdNVOj3DlEdkvxs9n/VNQFQ3JRUrwmDa6kyQn/WTkeXw
 vKkVeCur8ViN7oB39190BPtXOuBn3FE+MidfiaZST66R7xLX2x5FM7BdTAtGXWZInaTBNsp1Uzw
 9SGJfy1WC40eWP9BTww==
X-Proofpoint-GUID: rfgQ7gKj-GuEJG2qplqRwBcjlXNTxgGJ
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6996f3a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=OVqkz_Oto1G4WS9Ues4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105

Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
so could mean length of the buffer or length of commands, and these are
not the same since each command is u32.  Rename these to rxcnt and
txcnt, and change their usage to count the number of commands in each
buffer.

This will have a benefit of allowing to use __counted_by_ptr later.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c |  9 +++++----
 drivers/firmware/samsung/exynos-acpm-pmic.c | 14 +++++++-------
 drivers/firmware/samsung/exynos-acpm.c      | 14 +++++++-------
 drivers/firmware/samsung/exynos-acpm.h      |  4 ++--
 4 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 1c5b2b143bcc..485fc77ad4b1 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -5,6 +5,7 @@
  * Copyright 2025 Linaro Ltd.
  */
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/ktime.h>
@@ -25,11 +26,11 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
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
 
@@ -50,7 +51,7 @@ int acpm_dvfs_set_rate(const struct acpm_handle *handle,
 	u32 cmd[4];
 
 	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
-	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
+	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
 
 	return acpm_do_xfer(handle, &xfer);
 }
@@ -70,7 +71,7 @@ unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
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
index 0cb269c70460..c616ac951a0d 100644
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
@@ -258,8 +258,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 
 		if (rx_data->response) {
 			if (rx_seqnum == tx_seqnum) {
-				__ioread32_copy(xfer->rxd, addr,
-						xfer->rxlen / 4);
+				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
 				clear_bit(seqnum, achan->bitmap_seqnum);
 			} else {
@@ -269,8 +268,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * clear yet the bitmap. It will be cleared
 				 * after the response is copied to the request.
 				 */
-				__ioread32_copy(rx_data->cmd, addr,
-						xfer->rxlen / 4);
+				__ioread32_copy(rx_data->cmd, addr, xfer->rxcnt);
 			}
 		} else {
 			clear_bit(seqnum, achan->bitmap_seqnum);
@@ -425,7 +423,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 	achan = &acpm->chans[xfer->acpm_chan_id];
 
-	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
+	if (!xfer->txd ||
+	    (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen) ||
+	    (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen))
 		return -EINVAL;
 
 	if (!achan->poll_completion) {
@@ -448,7 +448,7 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
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

