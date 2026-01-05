Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D53339868
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620075; cv=none; b=dTDqh8I9ax/daAgwabP83sjNMtgBNWSSze4Qcf5wZDdtI1tu3NdQtNfC1pe1Zs2wzpEEjLXlV4FKzTxxxydI3eSv2fEGkDFPy2WcSrDnTPUMcxZtpvv89DoD4ayDXgrOWxICvMXq7Uu0LFgoub8muLHz9C/K7doAKsvp6gyv5Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620075; c=relaxed/simple;
	bh=9xYA0AmVAhViPtU3dAaeClRgRl0bvu0O3AlHrFxfqFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3jtoXhs7N8F6mCkOAszRhfb3jKOesmVEP1S/vWib7J8TPIECoqACMmD+dTHEZoA4xMtN/njWMRNXse75EE+J7XzoNquQd7oHV3r/fZipSUfeDWeWpwFNpcU+J6aVUF9gvOytZRo6zf71fwuEUUmuU5P9qWRC7KoZf+t46GM/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0LFytSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IHgkosfO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0LFytSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IHgkosfO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059vnH13541351
	for <linux-samsung-soc@vger.kernel.org>; Mon, 5 Jan 2026 13:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=; b=i0LFytSmb8lkHp83
	dtwiy4k/HqZDJd/ezwdRDTgPfqIdxQoFFjiuYEMMWn6yHfuPpugBHmB7AgnOFrfy
	0mnTR+NQVJJRoIWNAa8eU+8jhFn6Tc5EHqfJA2qQueEyZ4IDHUl7rfaxVaFzcnLn
	7vsT3eF0QuDrcYPYCp7GOQYGTVkdQ/paqYtDxM+pdAZTbeEuoq+iWp3r2bMZZpeI
	0w7A30mPMK1AHLtlh847Ti4gbk6oqBvxlvUwlZhLHsC/XbskcjBcU6d4CTfcwX/u
	KhT+uZomlRkhhdgZ6c3hiyK2xenBKW5ll1Nc9YhVqKnrfBCd13tEL3viR2j+++3F
	jFq7hg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shmd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 13:34:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b8738fb141so563183485a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 05:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620063; x=1768224863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=;
        b=IHgkosfO/k1GzJa6jDbZlABokPf/9j24kQLGahf1gSt7yXsNBPjXU4pAhpoHI18U+e
         uet7N+NpIC58YCrlc27Rt/nIWuIW/RuFDLOwl1byqKo8IzgXDw392+JO9pXFUSH4Bip3
         o+k1EWjwnRuDfZYmWTXYPII+cYdTv00qQYyZ5kVv3B3hQzQOrBfm8YbKf54QBjPBSUYf
         Y6fpK1NIo10zvQzxgz/8GpmFShXlHU/GldyypphV5J4peW5GVWTc9fKViTfw9AJ9TWxz
         XrUKQCdE2+5t2CUMyMRG2vDTxeLB0/dhsY2Er2Ult5eEVfuf+en+0Vf74v4SUIgbiKRQ
         13ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620063; x=1768224863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8OmmJNn+r/Hwt1QPUnzFTymxge+nDosrd+T12lTVRk=;
        b=i4BNwBEsLfOUtuyhP46ciK2OXFKq397Dva7Wx6+P4bGW8QLlrhqV7TrWtsNop2D/hv
         0bvnHnYR4kw5z0gMyYAlIUnEYxK7skJgp1a/qhPUGh42FYI0XB9LDkagMYIFvv9h79Q0
         xlrCJXAtvknbj/yg7h9ec8x3oj/7uA+JOBpwgh8YCM5L1Abz/SCWF6XkcCQKy7KVZwUz
         2Czm508+4ieDnOjn6VjR0JQbXPF9Oqe+jfJ+zouJ9HltUTzyFU81gx3JJ2BJEcVYPHWZ
         VD/kRgOUMF1nH0bb8Tlzl+PRd2C3vmf761rJNPHlfkEpLENra4bPax0iyEvZlmDy2uoi
         bLNw==
X-Forwarded-Encrypted: i=1; AJvYcCWHfSii93k68moeRezuM/KYHmjlZ21mH63kHw+hAr135ruT1rHfG5Zrq5ATwb1YMK5gLy07wJ0wn/0BFTnABl8hYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA2U527QTB9dFfnjLKVmzzVgeyhEfGP9QNUelab397JPmCUOPi
	6zeYdVxd0zCBKAJGuWku903De/hGQyvsGJAqqpoJH4+KyBZu/ehIz0n0U7x2O5ZVUlOWSKd0DdU
	9IrxHeVMYdEDLqeIQ6DW9S3pgdn0Al8XuBOAxqX9oVT+k85JrRpPoalaossoxerDTp0lJ6NhNQw
	==
X-Gm-Gg: AY/fxX5p2MqZtDO9w+rie1OltYu870Nf7hTl5deiGWVsOxfgHduts7H0YQwST8FxChA
	MX/5Ytq/8RoTJ0BzesChiisK9c6bjIEgY4AnLCTNvVIG5ZpEAO7Ue28VCA8fB9Nt6Ch81dSLR3d
	okvpOjcvtq6yvvuMb+t1qcKyYJDPpET8woQCHQAwXlknm+BGCCgGhnmPYYifK3W9LY4o43hZNky
	53PrhAdgyxVJWHa4UNlcDQG238Qa6En/zAI5UmxxYb8fBMz/psYrzTWKGmS0iuSd9idZvJQUatO
	rHItonbNGa/AaHRybK0Y2b7t/F7R206V2EiFpLoHssPYoLUw3zwqmgkvB39ZbitxBfZ3ImLGKLj
	/0mzy/JBUOHH6Hi7KlVD+0HuI+VhAFyWmQw==
X-Received: by 2002:a05:622a:244:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4ff46bfa6a5mr90855331cf.24.1767620063369;
        Mon, 05 Jan 2026 05:34:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH22+wbC/8ocAPNid4zwKCPLpHyZ3rp4TFMtIubPKSch4hbyut4GTVmx04qGX7V0XRikuXA6w==
X-Received: by 2002:a05:622a:244:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4ff46bfa6a5mr90854841cf.24.1767620062896;
        Mon, 05 Jan 2026 05:34:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:49 +0100
Subject: [PATCH 11/11] cpufreq: s5pv210: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9xYA0AmVAhViPtU3dAaeClRgRl0bvu0O3AlHrFxfqFE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW72/y4CuyYTjdCordJY87DDcZCQImkSMPz5au
 +HhLxRd3cWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vwAKCRDBN2bmhouD
 13e0D/wKDkZR+oKRpnlwWONfu2Y2/SNHWR8KA7TqekRFYafhYbZkvcHqlge7N3lURLyM9PvTjwk
 zqjR+rondooIsMzxGjfU+iaQiN+jQpeqV/bWMs2T3BEY5zOlToLQpNrr1gOyMpu4MZvIEVU11/R
 ezB/P2yn3Ejt62QO08r4mKcEQSzjz/ncjSX+7y7kkqpx+02YnR4dlQmCZDlS1qPShxQYg2lqu0s
 hCxjDvW2sunRizv8gjInpk6FT9u/Mlg3FvmWKBfQmKDcYB09lYkvXRkUZzAGEuv0dhAZEuLZ9/H
 B22GVb/cxXtk6U6GPjEw7x+IrpIPbpq3Oo6Fe/xr+gAgDdbfYKkC0ltJ8W9NaJf/SOEzzNy5Wic
 YFVfKTzRWchTMRonhmvPXLoxwvQZ5kuEW1zj5aiIVRpgsADyNKpkFxV7nuFKs4mZlYxTuPtTWPy
 brKRg+KVLL3PyLr5ooNsLN7MZhpwVlV/QNogFw+fY3dphKjRo4qMbZqjW90dB7Rgu5BAF23NWq2
 o5Vg+Gsx8Yee//iPiZovGUYQZAF4+k3D2Yku7y8PmhNwvzovMT3WQ5L5MdQJjSsrAxZasbnJ+pi
 SWqICNkVItqpBHbl+hZ4mVYVIPNvroxc/QTm2/E79KJhE3397HEt5Y6oQeKvZFOFdesUKeV7mmf
 YPx3kGjETmm70cA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bbde0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8YWg2ve-cigzn2S1SOoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX35rjETBhvcrO
 WAjb+os8RqSdLUWjDkdBNjK9jaPRw3wmHLsMmxWzDQmNo8dE1zmO5M1Zzl6SCsRN+XqoapimBjs
 5lNyG1VeXdstM4NBfL5Cx0VhsI7fKbC32UUyjRSJOeANGPzrWmjN/T2X8+IdRzn/oDOMpZ8Uxef
 EOAGq0IEZR/XNMUN+9VitNBdA8K2jS8PPv3SIi9VGbw4H7JjDMflb+7uiFs36Q2OFOp1KsQukIN
 WDsB+dD6i2wOF05QotRhuZhB5xq3ojkLsYItORH5BIBNo9ca6PXBCUjuGt3hO0Zj00VZUcwfndG
 D+DoSkshezF6mcQr7MwgiZf6ws6JJS78ub9UebewLmAJhBL652f1p3wvvMEnakz/NFEyqyyF5uL
 AE2UBT4HTPRF+f5Q0GzHs9gWb8hMavIHhjZ0US0g7ki/0LYARpI/K9wSrgH931MfYZbcKzoR4ZB
 WBR6vkAqjZ3/WyLU3mw==
X-Proofpoint-ORIG-GUID: 012Y-23-O98i-FIR2o4dODV7Fs6WDLRD
X-Proofpoint-GUID: 012Y-23-O98i-FIR2o4dODV7Fs6WDLRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.  Note that there is another part of code using "np"
variable, so scoped loop should not shadow it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index ba8a1c96427a..e64e84e1ee79 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		goto err_clock;
 	}
 
-	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
-		id = of_alias_get_id(np, "dmc");
+	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
+		id = of_alias_get_id(dmc, "dmc");
 		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
-			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
-			of_node_put(np);
+			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
 			result = id;
 			goto err_clk_base;
 		}
 
-		dmc_base[id] = of_iomap(np, 0);
+		dmc_base[id] = of_iomap(dmc, 0);
 		if (!dmc_base[id]) {
 			dev_err(dev, "failed to map dmc%d registers\n", id);
-			of_node_put(np);
 			result = -EFAULT;
 			goto err_dmc;
 		}

-- 
2.51.0

