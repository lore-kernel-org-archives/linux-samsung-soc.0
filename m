Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375372D780C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690935; cv=none; b=hEtzPVIioUY9Iw4YN+wAK0fbNseE3wn+GWiAk9xW5NuB0lNA80/jhnDRH5QwUnPz9hCVzIgs6BuxRDvhmJNkWU5lprZiZ1zUBx2YPfEhwGbN0wIA1hnd11RXOxhhH9ldpblLdGHaDrTNWdeo/KLtyBD9JFHBxEpupnsDu7iq/G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690935; c=relaxed/simple;
	bh=oqF2IaCk8/DIpqq3qRCWxnErPuWRL2cMFXqdcUOAGkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntg778F4qAJz4JKDcCHZt3FYz2l28SF4Kv1VegnflpbWkQw7NzO1J9ApzpERDZbYFgLvy7C+fjzmmNXEVrRTsA7wxvYxPWmjTgXMdtAfQl/lqHamLSJGsBbYz1k0cDS9yo9GZo8rKol0RrLn7YbV01tcdgZqDoxNEualWPoxUFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JuDZ0sro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qr+1X4XD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JuDZ0sro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qr+1X4XD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60649fIX2255371
	for <linux-samsung-soc@vger.kernel.org>; Tue, 6 Jan 2026 09:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLVtP0znVY6PZy+iwEU179garS/faVZ3ElWkNffkw50=; b=JuDZ0sroPqI9l7rd
	Ba0jWnvV8P+FAhqShgypQEUYb0dNLA7vm9Qdbm+G/FwccP2oRreTP5E8bhL5nwuY
	pseX9SR0EqF3aCDxRiYxNkWx7R8c9qv8l+UL18eLuKuNPK5fVCtkkpshutYHauWR
	/BC1wISWWmSjPRxoSy0lJRBQzbaIhXrkdMaca2wY5GlyQj0w+O913mqHoWpq2Vug
	v1ZPK9K9DCm9H3GBEbS0AbqrwTBrlIja9uYBuXWftICLugoQEq/WOWQXhG+luRdh
	7CKKxgU7sdMLRn/VeLWdpJUOJ774eKOjEuh5Q4HOqKK7wLJzcHfWUj40RXuMwg38
	uX0Aaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu420uqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:15:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb0ae16a63so90818585a.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690931; x=1768295731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLVtP0znVY6PZy+iwEU179garS/faVZ3ElWkNffkw50=;
        b=Qr+1X4XDk/lUhPuC3t4DKFEpIlS8Em+ZutCN+W44U2n9MLgB98T1gJjDxauM7MvWBm
         46RN5jfQ1yyUPsdLDyl2CrAy4MWWMrlPpD9TX1y3FdVtFI7nIHFUZFwjEki3BUQr+bux
         xLzR3FV73rcjOpwwqpGcCMX1RWjtESqCgi7hxv+J4FqWgHspfkGVkGuXJH8q1bbd60A5
         RPEhopuuia3zfE+e98rYGC+SSJpjGsoGB2u89R2N757z70Ncf4yXpzafq/a6AXjJWkoP
         vNWX6iYIp+YGTrDQzS9RUI3pAWn+Fs5OvVXdYtr1rNlBdms8CPw+LRoihfshCswGyc1l
         hUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690931; x=1768295731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kLVtP0znVY6PZy+iwEU179garS/faVZ3ElWkNffkw50=;
        b=ir0cs02z3ByikTFF4G02EMVegd4pp1ms3OEIP3JEcWBiD2OTGlI2FgnTfHUpi3KsXs
         DQiDWyJ+Hw6hu9MekO0ZJC2nWn1XgajsVVG1Gi+7M7SMWwdDjW2b59GSV9y72B+raBkW
         g3uacsRoID30MFUfDaWzNOjxbnVGMmQ17lhQJloMGIpn7LoIpzFNqm+uhX3hTrffWP2G
         6yf3RBWd8hj8PpLZBMseftseNTgRtFfLhRLLVrOnPREQjduUgHqD/TIa+UgZyzjA1MST
         jnAS8LojxfjOSWiQLS6DOb3Nb/ihIjownDfyIb0IZaI+YgYw6gxPXoxpvNx0jqkGZYT3
         JzRA==
X-Forwarded-Encrypted: i=1; AJvYcCXIjV5+iAEdKZddbWiPtnWTYYKdNxMRntldqXyqUXwfnPrzp4WAfnoljcOTcYIkXtlabnu6rz3hU1jpnBDIJimTDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMTHUIknCb+oh4ADpbK0vI29l6J0GTYDV58pQ0Soe+nmfO8Bs
	81mPJq932ejd3dumjvKt0pIV+NJChQgeKRytx52V87oHW2eAc+iNrQvK2mikZCH2RlS0YjGAZ4D
	zuwif5CXrB9zfTrtvqBIvtqQISuE4za+UlDkpyP5tdZs8k5D0bUC1IRDwCXXFB2ZCzTwPSZYiUw
	==
X-Gm-Gg: AY/fxX4BhY6qBElKvakSClAqv9KE2ieRgHnikbxoHxjImC2vvYqydTnXVdFoQVMsIuU
	nlELLkzAHy87mdgnxRKZRNhcEbZgoBZ9KC2pycGJZ9WHXRIRMS7ONsiSFThl9bxAJC9rCAXfbI0
	tB1mpmVwwKQ1BB1HZiWIgmuGVeG7jYAS2NNgZNo6UIo/cZjNd7wF+Ew/mPlYy4K5dwRWkB5H8yZ
	JQmGrhlpXOt+NG7ANDd9XjR/W7hcl7vo4NOYAXenBG8HkLRfThXiHms1Du8IAzA+xZQ9zeLbwJG
	JI8aP+I7kI/yfrw5VZmo5ur1QsQ3fzUcunsExoHuBU8iswF2T6t6SPVDlFNAYZWRkbhIQVxXAax
	eFEI0Y52KlIAyv8fQRF67fPszc/95MORr2A==
X-Received: by 2002:ac8:690d:0:b0:4f1:acb9:a929 with SMTP id d75a77b69052e-4ffa781b9a5mr26338221cf.83.1767690930769;
        Tue, 06 Jan 2026 01:15:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg4OWE22L/p1/XvBGl1nJqnLjKHLzvm3+SkvN0ogaxYpRilKzOfbx1IfTBfwIK3NoH1EXUlg==
X-Received: by 2002:ac8:690d:0:b0:4f1:acb9:a929 with SMTP id d75a77b69052e-4ffa781b9a5mr26337681cf.83.1767690930280;
        Tue, 06 Jan 2026 01:15:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:12 +0100
Subject: [PATCH v2 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-2-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oqF2IaCk8/DIpqq3qRCWxnErPuWRL2cMFXqdcUOAGkw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKih0+eXMcylP/gbvVOhdImQsQItFRSegy0G
 pHh0g0vCpKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSogAKCRDBN2bmhouD
 13RmD/9yu46d1PZmOsUNbM+bFCAZttIbuf1AQe0A+jcJbyNEOTGx5GJHZdJ/Wpr5Bp/BW0BZoU/
 R4ScVgC6WKih5Sdkbc0GkFvEoA7M2reTrhkCtOYSJHri9iRE6EejlNFGVn6wWSsU4cx0IYcZ/fe
 IeLK+FnLzC/elo57C3wc69KTz4Kz4kgYqwS+mObAY3y0SMPBGAS3neGdpJJv9n1cMJYrWr1xiD+
 udCtzLDkYanbzCTFl+mMPJS1Y2hzFD7xwLWQRsSPAw8nYLrL96L7x34ew06SpAXhO/xAsP+P5+o
 DZN+odYBbjpE8WtO5FdiMIIRuAYJW0ydrwh6hyaauQeCLWWorXnMBA7st7pDJJRALHgv7ZNVc+6
 WwaS0N36aXZtZ6Ucu/Ci04X3T/G5KttoGuUV2xHt/uKwG8ToaXOMNEzIKm52CkJwCfkpPg4V94l
 HgOSJikLpaNAPdwpMPXADf1Im+9Mn1Pn2qtXRUCIgnaMcfieZsV64RmHjRhmR+vzU93s9aoQclo
 Y7/yLgjK1b+2sLqYjh22nt7wQLG96DA9MupSeBJJzhs3VaSQh8hOzdajuADyEVbBFQlvY9wwDJ1
 NkPiW06PhEVCLKqSQnd+uk/1DWVGImBTrHHYrYWP2Fwwy3UKl04PcC8ph/NALHX2amtvLpjFf4N
 SaOSGPsG4nreAQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695cd2b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8
 a=TtkSn9LXl2vsqZFf_0EA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: nNoppXoSh-PnWlCKyZdoWU3HELSO_lPk
X-Proofpoint-ORIG-GUID: nNoppXoSh-PnWlCKyZdoWU3HELSO_lPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXyu4O08jX4whv
 Pya00s5d7KVsSlW/qCBZLywGRYraHr5w3bkzegqE2AhHtQabyTeck0R61+u2dmGKFN1Xmyaw//g
 IHBV3/nil5xMleBcNIik42VT1qlN7u9TJP6bwtwt332/E0k8jisNrfqr9CPLs9JTwF2owFXSHUE
 nsD+Tk0E4zGGfZ/VUSvNPJLbUncFdTcHufVUmf+mrmR4Dy5Fauv8rSOswPqHmHdJ836adiGyTBN
 flzqEeVzPVqh0/XmbVTDb4BLLAAyH5gmfwN8fvafAvsWH3YHcERk1ptmd/cuMh894P8VjjpOgin
 /h2vowwb8+QQtbaOW08QrLCNFoe2HmUkvHCEHO3lYQDk3y0IsYVLaUcIdN4nPdKS6pTaUzHW7Ca
 at1zVtAMLefAgrRFVIotBPMkIk3WUhPhxKJlSQL/OKE+/ovl/vJSYxlzkEe1J30Xyq6G4DS4N++
 8ieuMb6unVSMPhI1hDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/arm/mach-at91/pm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 35058b99069c..68bb4a86cd94 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -982,15 +982,12 @@ static void __init at91_pm_sram_init(void)
 	struct gen_pool *sram_pool;
 	phys_addr_t sram_pbase;
 	unsigned long sram_base;
-	struct device_node *node;
 	struct platform_device *pdev = NULL;
 
-	for_each_compatible_node(node, NULL, "mmio-sram") {
+	for_each_compatible_node_scoped(node, NULL, "mmio-sram") {
 		pdev = of_find_device_by_node(node);
-		if (pdev) {
-			of_node_put(node);
+		if (pdev)
 			break;
-		}
 	}
 
 	if (!pdev) {

-- 
2.51.0

