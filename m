Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E708930E0CB
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690953; cv=none; b=bk8/uF2tjunlfn06ybI7ZsELowazukJvjcOzwq47IgHT1HAfVwg4ckZTjKCbkC8nQGzr+RDBge9FHHgJZr75qSqaSsYPS1prELhbxfKLuS/HPJdPnRPvxc8Pg0XklCQJUYlsuqFBnStsYB9ETQIsfWFhOJiu+laJBhTLDmv4xRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690953; c=relaxed/simple;
	bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=esoiIUGsPlX9yeYQ3C6R/6BzT7LR+NL/StWXmZ4EgptwAKTBAG5M7FcdA1leqeYe/Dj6pi34mdHVIUer4GpXq5EgcGLMwz3cdZxGVjSKyF6yYkVqaOZHuF4CAoAZwb5sR0qP5KeS7VGO9BY+0ACHz9dG4kpnXhmafNGOH0xsDz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2y2OUhF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sfx12r/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2y2OUhF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sfx12r/y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t4ki3295007
	for <linux-samsung-soc@vger.kernel.org>; Tue, 6 Jan 2026 09:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=; b=K2y2OUhFOKBTeAtq
	0u3zoFdkyq4eSfwn01b61VxjwIpsk8g7AtXa3/k74ZPY6EZPoSZsi4cKkD2i3QOT
	vDh1SZqJ4Zx3seDvUjM91DML6YuJjIugh3lC0Bl01rL32fUPu1QWlXVOULAGSzJ5
	wI735DOof3sDJ9L9n05wfTrhAdsr1E42NWlVeRE0h0CHNegkr722qKG/ej9/TydZ
	5oevEigT2LrTmQSq35sMNSUpi1IqH+li99Lu29RrjfsDs5bTMHwG0RmBQJokrY+q
	7FgIQI7FVfEULJD9NMGXqhL/2gBnMN1FnxITSuIm6OLnRrQQFi0zV/Nb+0qKnpEI
	Ym/P/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00dpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:15:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso11695361cf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690948; x=1768295748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=Sfx12r/yqDwbOFU3kZIxkQaQ0xPT1d2uYZQibqEQJiK7x0nXpz7o78d4eSfoayvPAB
         M/yep8JWx8WpeRucOmh6g7JjvJ5ETOhlr7fwuCZ0QQjlgzZlXIgnQcsHo1X3dT8qUGKt
         ymTNmsAOOPGE/vim45d4um2cD8jZtAxPe7N8bPPI4KiYkDZKRMb0iP8copx8oPiJm5ix
         mhACuJvqCEx8auojX+DM58bfaqz+yRHJKY/6NKDGXDLia+9c8AxwsqXhQkU/8ytX5vFn
         DwdvLM3LrKnJFsgUNd63sCB47r05BFOsuXAov0BQfj1W8z9JteryDwZD+bUU/qpxGttS
         ZE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690948; x=1768295748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=TvWndtKFoNIFDOiPoICNPvdT7VKme4vw1X8o6s2cAhjYrT3pueFaF1Lro5ZSxBmrYJ
         t025UBFhLZ7C9i+Y/y0/mW5e00HhC4nmMi93S3MGXlyvREHa/wxB0yZKAEu8H5Df/UAd
         RNEVErq4xyTOkpOwiZqTWLd7Sw9uOQ7cvwfjlvF1CQTUQdJ5rrLiQNbIj/Nh4v8HZWIq
         6JWWfWb7TM6rUY/mrT09aHBEz9kEIzPQT98KMH03Mq8AJMuUZd9eAJFXubb+6QBJ15O4
         8TT5VywCT5T9ZggBfDXcczLaXOo4YlYG8Tt4tjzpsiRio3OMayJg80+9TsUJS/68yIbp
         0IXg==
X-Forwarded-Encrypted: i=1; AJvYcCWSSZsP3FlyagU5vawaRqho+VUIsMMpTA8SNh265a40DdRh4B6/3NjWp6E2vrG9DFaFA6AwFp3sHGtaOf+Fon+Wsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypYPOZe+yzjEdMkvImNshAZ65829ENrU957HU4xpMqkIYKBKKJ
	aQHnQeeJIyT8ArVFYwWhe3chUPdnkPX6l6or50ol3ePelooyHFheI8ScAwOAo+ccVFF/3RE7g8M
	FAXoSKkFEgQmRwA0UkJX+DDy3WsNvvrwlSC9KC9KFq42kjapxkhM+h9ethwKdu6EEof8ppKqhwQ
	==
X-Gm-Gg: AY/fxX4TUlWf4RdlcPacbXDeAiRIxkTSxxz1GWlpdsgWIGskrdnfhMdN7queMrhhmrF
	5apQ6LTaD4Vy5XSjKJGWpIyQHcm5DesqIIKbGSq8EDi8X+CWwtvHO60uL7VXJqusK70lrzSrUN3
	SlfddpNugHs0c5MFlERHH9NcAx0yPUPfavoittJVwbCRITfqy9aG41gcn4dCPdmN9A8iwHWLuZa
	+eNt71Sw+UIXA4gY66zS6cHWdRj32XE7DpNfFib3jWYhZ+8ypxqAsgK3vYwX1Ubm1eEewgPNGaF
	5Xndn9IWMNmYXnsp1BtENPVcJ7UNdWQeg0uj6i3VLbgox4/CIRU077cT6goEC0e/89xuN8WjCPR
	xma4Ugt7yHCtu1KQ4Hpaw4e12ENIHvcRP8Q==
X-Received: by 2002:a05:622a:34f:b0:4ed:b83f:78a3 with SMTP id d75a77b69052e-4ffa77aa653mr26990851cf.47.1767690948199;
        Tue, 06 Jan 2026 01:15:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHlsqdZImWyZR63WwFSMPpAOaqhhQOEY6qsvs8J2TYEGoLxgoyQ+tQ2SIrX93DUzAU0HOBJw==
X-Received: by 2002:a05:622a:34f:b0:4ed:b83f:78a3 with SMTP id d75a77b69052e-4ffa77aa653mr26990431cf.47.1767690947749;
        Tue, 06 Jan 2026 01:15:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:19 +0100
Subject: [PATCH v2 09/11] dmaengine: fsl_raid: Simplify with scoped for
 each OF child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-9-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKoTrzxQuj34DrlmfL4gkQkEqmVwpmfV966k
 v59U9aryviJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSqAAKCRDBN2bmhouD
 1xq5D/wLkQTsn/q86zmdnRKEfkOqoz59r5ZsIs4UkOT6p3gUQrAkGQMknuX75jZWDumDlMMzr4m
 wm31zU7SZgxaiwsfheFrSVHIGnXEldOci2nKTq3QVc713Rj8YZXHTqSQmTgeS7pDi5ZcDDDxrEJ
 +/brmshxXLsTtWWuSapoo40bEXBBUxscI8K3embILPzkizJQtfBb1t2m+bONrtO00as6BuPRVhQ
 IShnvdBTOwbCDRpo0WZ3twrbajEdLMOq+QIZlaEZuyMI4Qu7bU6s+SMXevITYOOlfgO2vZWSQ4Z
 S4STHxsPHVZunvspOch+78go59+OZtMYWhMrl4XYpUGeHRuP2qou5RsrZ8OnYEDw+uUL2FoHljs
 dT8P2D0dXjqMiT6Omgq3mZJudvmLAn6UqUODK/GvT/+iphjlu4qToc7iBShU/pwQ9z0NAS6H8sa
 D1AhlzYysND44RVmdQtX4txfFqs0/c4tR7ucfYjneGkWIgcxDrq8WBHZO5jwL6j/WirnUX/+jxG
 KcU81Km4LTP+iTvv9zqqCOXweuoC0Pv3RpavjT8c+5tY1U71Z00azyzpP+ibdlrx2bzIqD2xiW9
 0kIO857qBHsEIIbcdpU+pgch9fb2zFg6dT0l5ZLAdQHGvChNJsgtzfWml3v7QtVFu2RdKCrnn/o
 lRzC6hj6dWUEK5g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX/qm4WtP4GwI+
 Jfjduej1T/KJ5LQjNdBD5QOd0iTx3Nb/oL9G9JKi5aCi6bYfDHdogXf6fSxAUEOejh37pW8j2iu
 aaF6fUFnB4ueecjpHQFbctDyaSPNi6pCB+6ZuoOPKjWI1DzJ1jo6RNQGFMg43M6k9twhP5hTcCc
 9fwrxWBX+ffryaS28oAm21BveND80mNjqxgi+gt2Vv0BFJT/H499uaVFeV65l7IEEC82aWwz3zl
 9Y+jIQXkjJuWbvZhx6X0uFV8ZV3C4FyhU5fz9rfQIp+mup+WIXZjA+nFgGwQh0REBCNj+Fqavos
 UExJ5F8Riqp40GgJ2XH7cGWG6PRjVVv5trKNjDc8Q6VMFkXKmsXA8ATOju391KxpGU/9u75tChd
 6f28RqYxcQq5BlDiO4zJUwBgXscjLsuEkXtdwDPt/CF8bBMutBNXwP2CcWQjQUlZWAd+ozJtRv2
 abWatemW3cBWVyVTb4w==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cd2c5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 0hFURyrmpW-RFwUtgWlHy_FIhSKgTb6K
X-Proofpoint-GUID: 0hFURyrmpW-RFwUtgWlHy_FIhSKgTb6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/dma/fsl_raid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 6aa97e258a55..6e6d7e0e475e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -746,7 +746,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 static int fsl_re_probe(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device_node *np;
 	struct device_node *child;
 	u32 off;
 	u8 ridx = 0;
@@ -823,11 +822,10 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	dev_set_drvdata(dev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
-	for_each_compatible_node(np, NULL, "fsl,raideng-v1.0-job-queue") {
+	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
 		rc = of_property_read_u32(np, "reg", &off);
 		if (rc) {
 			dev_err(dev, "Reg property not found in JQ node\n");
-			of_node_put(np);
 			return -ENODEV;
 		}
 		/* Find out the Job Rings present under each JQ */

-- 
2.51.0

