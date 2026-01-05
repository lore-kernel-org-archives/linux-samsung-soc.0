Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD0B33B95A
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616105; cv=none; b=alhk02Mc/wxImMqaQzEYBVfJy2GcIyGhAYZd8ImTytDAs9umYjxFcF/hsWBwuhP/XJLa8UQmpf5Cjknr1W7g00kilLtjk0hhszOYjdKwK0wlqZG3SCuNuDkWn/3IYXnipdPI/yfnvKk3/BjtJuhoRFM9I/Rn+4I1oXmrTBaqOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616105; c=relaxed/simple;
	bh=PpB/m1gJTMQMTX0vFxuSFv/chuv/UflEufPn0M3zptk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmyY6AzeAvMDHjX9le0cQ17yjG/ceJpHR453y1FSYSpDVKyja3Xq991K6+4Jl3E0jWk/lm7mNKExU/I/PApiunLTff/0ShXcqpGN1afi0/wQsmJ7goS1leoE121/eRHoOy/rovSxq1utjEM7MhFSrjUs7XTQchhXEtmC/Jp5UgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBI69wSI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRJTWqlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBI69wSI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRJTWqlV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058JKXk3838852
	for <linux-samsung-soc@vger.kernel.org>; Mon, 5 Jan 2026 12:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBFYHO0C6Kk6N+QrFXXXFlcKOp9qo98Yeql0J+xKQe0=; b=eBI69wSI/osXsl7O
	qRyjkGuMysg9O8lz8xtVuXcwubY6v2F+C0GRWT/5z+rQWNGoubCdc5CbZO5V3A78
	oJY2G9setfBVLvNV0mif9MQoSJohxQ5sKNax5Vc0kTxtLL0IM+/ASxpaw35NtVSI
	WcDZA9xEQDSjgTiGZTQvxB+/JEeLykLrybV/mJzd7XHo4MHsJ8dh421HL6uJmSy0
	uYSi9CQT4XiUJV+8MGK5sPAXV9pONYMVWIYC81S8NQVLBBVrDFSUYe4NSsJCCOwz
	nbMe2tWAePT4ihOqcDDRF2C2dOGKL8LV4EEKEMxbd6eazd9rQpJvwjHXrArs5kx5
	hvuG7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0hx5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 12:28:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f4822f77so378886325ad.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 04:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767616100; x=1768220900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBFYHO0C6Kk6N+QrFXXXFlcKOp9qo98Yeql0J+xKQe0=;
        b=PRJTWqlVtNJgJ/q7pBcCa/zsrzitL5lqmfTeYXA/4GsJiMVQNKufzwTFv7ncdBhziN
         AdDj6EqrsZTGvm7CaaYXiTKceT8/4bOip1KELvzZ1D6pM3YYlqXEowaW710ZnOKzcdSP
         n1KHlhxhfsREARQDBuRQARhKiDqqQdRKhbkm7LXbRrG/4SWJwp1dweLLa8G8eLY9BVgn
         DblgP3ON3wo95GxzsFJueRMirHnTGYWiCdaJmcWql23G8V1Mq5LlTbdF5xJdaKPZoD5/
         MiqmbKPEd3bvcbYIvMI1m4Ue8oEAscccaaem2HjqdvHv8BrDn/hhE6eAW3mwD0tVzLiU
         oa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616100; x=1768220900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBFYHO0C6Kk6N+QrFXXXFlcKOp9qo98Yeql0J+xKQe0=;
        b=JlhnJgUQOLmkkYspXAgt9BZB6JVuE8Vz0rMwXT/r4EELprCMBDphyOim4m9j5hVDzR
         H6AVg3mtWjdl5QWjIi8CgiLof1WSAesAsuHWhwMfkM6n4OS86oSI/I8x+M48wVXAdjfq
         B2kAKrtZ3mZMYntTSna9abGZ3dZVxt0rmU4otexsC5EF9lkt37RLP1c594foPFeyRq3m
         8TihVYCzIrBYIqc5+T8R/uWlj95lAyCswGoD/F0jTrfj/RQXH3QZfiKrcad4jmi7P5yW
         vtX88jx2iKX2pBej/W2I5PS9UqC7XmJNyFW0SbiXa4m+BFIM0dsfQBYeYTRP7abFimWL
         GPjA==
X-Forwarded-Encrypted: i=1; AJvYcCVUhmt14BfQTqoUAgdZGuB0HXmWU9LLK5eDa/UCGl6Kdmf6oeygXysxJOXPVywSfH9fm6YoIThRO05R9LEToEGgoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhI6YrpX5sP3N4VQgx7lbrkLEoToyxbprAUtUl3+IIwQuUx2UB
	dPMsSjt0UZKr+xfyMRNfUTHFfiXMmkM99l2tYC/h87/3fmqUGvgYyop8IErQlydXQuAKFS3ZmjG
	k8ZG7uK66DOh8wnDTDkGHg+UXT+5f+Klgac+099KnBfPokkagW1NGnWPmyKvLgZDjdEVI4/5UlQ
	==
X-Gm-Gg: AY/fxX6hBPSrwiacGPdNJGYRLOqKJIDsXyMigk55gNR9HZ8EtNENg1V/JLv8kbW9Wfo
	lBohIthkb1RKIwjbpvG2j5ngXA1/eMVTcdX8xfimfE39U8vLCATFXWdlT8BT/vKO+BTeBUwu0cW
	dSl8ttVgTTJ5frdMiiL/2+eT8KSqKycjcQXUN2mOeCLZMXDqXYITAisZ5e/uHSiu4BaZNnzyMgL
	ijtSZDJDXrhQTqUENePh1FP4ZkGg0mqJtkCBWYx4KsSqtLILflD8ozuZ25w+h+qknj/NEwXuR6E
	xeUKJE8N7FcseCi+pGFZgP83r4+CHIupPL7ZyL2PHOyGxxLB3pqZ83pX5Bb3TD8xat8uQMtX/b7
	B9oxeybfV1h9hLQqCIgIbA2XGLJIW6LOnlDM=
X-Received: by 2002:a17:903:2f82:b0:2a2:f2e6:cc54 with SMTP id d9443c01a7336-2a2f2e6cc7bmr512249565ad.4.1767616099591;
        Mon, 05 Jan 2026 04:28:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0UKyUvXerMX21bnjBAhF6AG6XXCayaIe7tQngiVFg2WkvJ67HwAbgKGU99xM74jozlgyeNA==
X-Received: by 2002:a17:903:2f82:b0:2a2:f2e6:cc54 with SMTP id d9443c01a7336-2a2f2e6cc7bmr512249235ad.4.1767616098933;
        Mon, 05 Jan 2026 04:28:18 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a10sm448109275ad.26.2026.01.05.04.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:28:18 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 17:57:54 +0530
Subject: [PATCH 1/2] PCI: API changes for multi-port controller support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-dt-parser-v1-1-b11c63cb5e2c@oss.qualcomm.com>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
In-Reply-To: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Chuanhua Lei <lchuanhua@maxlinear.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767616078; l=3103;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=PpB/m1gJTMQMTX0vFxuSFv/chuv/UflEufPn0M3zptk=;
 b=GZFtZaD7jCyIpCFrp+hdjsax21pknJcBxL8vAxnhFDnfZj47lMwrBRAT21E3qZGvMjJkEW8ux
 BqW2LAmuAn6Bin1Gz5N2VInqCcnD4NPJG2jM/9hN2ngl6jFso9HAv9x
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695bae64 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ujblt7VnwxmsJrSXvRcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfX4Nf69b78VQZk
 g3e+jA1SV20zkN/aj6eyiFxniJVQl17mxVkpnmJRNKU8Tz3wYt1bwX9fsUQ3zoPdr3iRmQevhjY
 EtnpvMznjNvghg3GVUNoR5i7i0A6rCTU0G+kfrUf2EvCF220kBxoTu1TuplxZa7tURiwtO9Pbo0
 EGI236Bf5FiRjdbIUuwrY1UzvQQ2I8TGFYl8Nvo0Nl59rlOOezwZ2/sUMUuKYfKZBe3XginORTp
 ytVn1Id1yrY20Ackjze9ih2KaBeZVgzxEmc5DaXI/Nccp9/etZlk2YwnI/iuvIQ2htqo+VZ9KL0
 XbZCCopa/qtSX9FrUMDm8fL9qghL2esVMOhVZbmlAqtud5oQLa/vmEbDOCtRNYqgZh/ZUoaVArf
 nv9j1lG0p8Rw5uG9B+fazY8WFnAePQLbNl9TvQ66LWqK+L79J7tkpPEvU4LkTRrCAuuB5rrj/Uk
 6NwmQIub9tkZP7zTVnQ==
X-Proofpoint-GUID: bJsNTBc7RmxpxqjNwixuseNE9rl5VfPu
X-Proofpoint-ORIG-GUID: bJsNTBc7RmxpxqjNwixuseNE9rl5VfPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050109

For multi-port controllers, equalization preset properties should be
specified in individual root port nodes rather than the controller node,
allowing each port to have its own configuration.

Change of_pci_get_equalization_presets() to accept a device_node pointer.
This allows parsing equalization presets from any device tree node,
which is needed for multi-port PCIe controllers.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/pci/of.c  | 6 ++++--
 drivers/pci/pci.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3579265f119845637e163d9051437c89662762f8..d09eff40b523c920c9ca3eaa64f784765b3c5bf8 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -971,6 +971,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
  * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
  *
  * @dev: Device containing the properties.
+ * @node: Device tree node containing the properties.
  * @presets: Pointer to store the parsed data.
  * @num_lanes: Maximum number of lanes supported.
  *
@@ -981,6 +982,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
  * errno otherwise.
  */
 int of_pci_get_equalization_presets(struct device *dev,
+				    struct device_node *node,
 				    struct pci_eq_presets *presets,
 				    int num_lanes)
 {
@@ -988,7 +990,7 @@ int of_pci_get_equalization_presets(struct device *dev,
 	int ret;
 
 	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
-	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
+	ret = of_property_read_u16_array(node, "eq-presets-8gts",
 					 presets->eq_presets_8gts, num_lanes);
 	if (ret && ret != -EINVAL) {
 		dev_err(dev, "Error reading eq-presets-8gts: %d\n", ret);
@@ -998,7 +1000,7 @@ int of_pci_get_equalization_presets(struct device *dev,
 	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
 		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
 		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
-		ret = of_property_read_u8_array(dev->of_node, name,
+		ret = of_property_read_u8_array(node, name,
 						presets->eq_presets_Ngts[i],
 						num_lanes);
 		if (ret && ret != -EINVAL) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 34f65d69662e9f61f0c489ec58de2ce17d21c0c6..72fa6db95b8a75f6e69b8019d1eb2262b6a46c13 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -965,6 +965,7 @@ void pci_release_bus_of_node(struct pci_bus *bus);
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
 bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
+				    struct device_node *node,
 				    struct pci_eq_presets *presets,
 				    int num_lanes);
 #else
@@ -1013,6 +1014,7 @@ static inline bool of_pci_supply_present(struct device_node *np)
 }
 
 static inline int of_pci_get_equalization_presets(struct device *dev,
+						  struct device_node *node,
 						  struct pci_eq_presets *presets,
 						  int num_lanes)
 {

-- 
2.34.1

