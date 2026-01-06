Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063B930C603
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690942; cv=none; b=E3wVu3dmeTkE/bRGRw7wEJmANRlXRoAF5GbGyKE+QaT9lBj75z+pk6ioyelOOT9AfbqQfo5HslHiJqToF0eYU1oYtnqiqf/RjatLf6k6RIEO4JjDSLS95Z90M2TODQmW2dHep9rA6xqWzLLvqPIySHveUJyZMfEHEUhMD0knZLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690942; c=relaxed/simple;
	bh=CcL2dBoqkb70hXswIhn+u0x+0kkWxrj/nvOKr2gseQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFXYnU5PXGK4NHY7WViB9n8O11o++et3XxrCclDv5tCL8zwwWSJcWRYhbwnoN1SN4Zb7JpL2IjyK2xSssqdg8uTZkxQaaaCR5lH7Bn7Hc4m8uhdFoDk2jgVEBpHCG/1ps6jDG4/ta/ybtevPfMy3iQclpAVAiUvQpWKdr15rXdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt7QpBhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJ+Tcw4B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt7QpBhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJ+Tcw4B"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q0ns3213733
	for <linux-samsung-soc@vger.kernel.org>; Tue, 6 Jan 2026 09:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=; b=Bt7QpBhUM67lRrub
	XnhKKB/sVehI4YaGtZlLkz5hDTDM9DeNSWuXNh0C8tuEs66yE8SE4L2HFkIJ+1r4
	37crvmDEv9n6qX4w3BuxHFL3Dzasr21YsgYjE+V/lOyP1mM5Scr04D7q/OyJDFTv
	EgIvS3g/lGoT60ng1HhzWTJS6DRGyrrmnB8Za3UmCbpP9UHUSE8paeHp1Y1u0Wpb
	eecYByuk2JSYiUhBsTy77Gh0Q7rYypE+bGjOvukgMFk4k0ET/Cydzdfg+yIbvS7m
	X9gfda4OxOHA4zNrxIEzqQU0rjXq1NK8hIwBoXsSyKZJ5QxET8VpcSKtMXeNBNXd
	6H9o2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd9hed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:15:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a360b8086so20561356d6.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690938; x=1768295738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=;
        b=cJ+Tcw4BuFojabw9qxGnEOFHNiDcvQ3luKIqd5Cg4Wzl0CjTjy2om7CtMs01k/1uZ0
         YaLrqN2RieEOJf7vYUFF7mxWWLnosD/jqbhWeKkVu9iyHMjF5xjeAB3Le8ccXzKlmz9R
         hl93aQyc94CuYgCdVcA/dVn+U8o8hI/rroTiDpl/mHeBjHjVrpGSqQmeaPOQvGqLyCEd
         WvLWaZw1eFYYEGeUk2ot3cuFOToBKBApUosQhygKDSQOC8jSVcnJuxrDQp/N78D5k9ks
         3C6nD9h+NxvCRdimQnX/FyZCk+aJTLaK0A87OPqhhBtwMtuWOsH0mock9A0T/oSSQCfL
         7xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690938; x=1768295738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=;
        b=t8DowrZcawdyJfBLsTiVsmT/1vgwwdtLvt51PM7hgfwaj59gmf+FBwvR4Uaqbd1dku
         zufdmcKuqwI5fG2S0GzVMEpV/dVT7ZbS6pXigFj+NyNBEGhnOgP8Xnr8gfRtR7Swx0VB
         2xkCZiYn2zuDXyazW9s7wL6NGFwfX2jL8EpAj3muLI49Keqo1Kf25KOePpNuGySoeZnD
         NR9PbU6YqRoCesu+y3H9yrfjmqF9tBDgR6iglnVXiJd2pPJEwjWBiZoPlv9UtIeW66Hh
         QIlT9l1dyB8YNdRPM/UPVQDSihZGm3ZSBkwc4Yb0LxtnuP4fkCJH5hy6VT/zq1gkt2Hg
         4dIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1bCFa6f3E3KD8jmAAyjLdozHJIfR4I9nlaaXM+IWS3lILOhAy2ph+oeV12U+2nB6JZoaLxxNiMJkYn0k16RuT2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGtVbdddL8KByQ/c7aEEhM6S6n3xWcS7KjLbus+yU0IF/yCe/y
	BrHbE/UGz8SEccg17hGBRDsFJY/gMf96G2s+VXf6j8uonMPJ+QCfwNan2l5QuM5h2i6hxYCmcrZ
	CfzzsQl4ANcULzdPGRbU3KaUdWVwQKzkBTYaji5+Q+1ZgPHJS1hUPwLPri3nzzaS/BcLPKPCfHQ
	==
X-Gm-Gg: AY/fxX5p/0ok3WmAk0G2Qx2cf6X2S5VdCek71XYL951cJO6DCigttISMc+3AaDVkxrJ
	xjxHx2q7tUq2vmenXclZmMHzSsHtHW8ffKBMXWiwsH30mA371cYNhAXbELmiAxPUtPRMtg1VIH0
	p9DfEGVlLghH6a1HtLwELnleeqedBiE1RBCPQR7Fa0zMI5O7MucSrLtr8D7HO0m4nexLnD7mktH
	XEc1cKNs0F7G+G5zger1ofBOk13IW+Ou+RNwXPrVN2S9LzxGAw75n8yvOH+O6yh53MbRVcUYpYu
	bHqhoMHkVKUYPAbfgndDpl5zOOH+HyEAHXl1vIpGfebx0vGfkzQgL+pNXOe1rocUP8fuW9btX/e
	ploqwXBKcBY5glwpXmS9vaJ5v8wVZtIcZSg==
X-Received: by 2002:a05:622a:588c:b0:4eb:a6c9:e839 with SMTP id d75a77b69052e-4ffa77c0648mr26146871cf.47.1767690938068;
        Tue, 06 Jan 2026 01:15:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjHrSISO5W+RHtbFoxesZK1qbi3BFpaO3DUV/f+DVaCU9q3ACBvIruRc8VJXRXhXWn+bAw1g==
X-Received: by 2002:a05:622a:588c:b0:4eb:a6c9:e839 with SMTP id d75a77b69052e-4ffa77c0648mr26146461cf.47.1767690937572;
        Tue, 06 Jan 2026 01:15:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:15 +0100
Subject: [PATCH v2 05/11] powerpc/wii: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-5-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CcL2dBoqkb70hXswIhn+u0x+0kkWxrj/nvOKr2gseQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKkBhQzmnu819Q1j3S59efOSUy8B8frf8Oif
 oFQAFjLyXuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpAAKCRDBN2bmhouD
 1yFFD/oC2ftD9ryyYMAcCvww+JY1z1bD7uWaP5uh6DpPPH76O7rLf8NpHji9WYn3FS9/PeQRqh1
 QgLs2r7YAAG+nbEFuKlb8u5XWcJxalKZsThHBEhmMq/E9c49Zs2f/bm7Z8tGnb8CUbJp6v5TgEZ
 kPhDgH79CQWn8LfXHbXpRKW2xi6Iyg51k8KYVRB/YYRSIwG4mA0jujcBb8iSVPxSg/ScCoC3l4P
 nPn+xtmqDh9NSprtqdFkKQ0sPGNzjqXWy514od6NbTwrPip53myf/RgO2Y3Lo7E5O+UrwXtKBGy
 yPzGvp0MgPbX72kUDCy2i4FOh6PAKWTGD4eUNPkIQtLvIbcOAGrwhQHb2pXUbKTnr64CzSHWnru
 mtUFlUOtgbNGfzogdjslxK8HfRYdV+9YLLYWh5mZIr4i13LSlbSoUfTeECsZByZFXoWWmbI1zRV
 DBwB/2ler64x0rk/oYEBpDXQ0bZECG0Wx68RkRTnpkTQu9s0BdQCVihrXMNXoEF8pMGzMM8ylQT
 3nzvdbVOuIfPuyY+P7M78l2itk6VPF0jKsd5vJ7F49JOGmNFEBT2ceurCdOD0S1XC8uwPmYU6bZ
 +eR/9kV0Zn15DeBOjTgdU4qJKyy1mjkCFv9BD0TRdUDd9TSfgJCFWV72V7YLdumfeyPEDL4/RZd
 iAua0BTHZRiL5Ag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: uoh2CKMVlD3g3urtDDBuSxSPsWstMMj5
X-Proofpoint-GUID: uoh2CKMVlD3g3urtDDBuSxSPsWstMMj5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX0Rcr2VCicD8e
 VBpmA0FYtexgwtGWYxMRvo/BpWBEW4JZR5vYnu+zpyW7sbn3yUumJN4wvnWsjz6XmINMSV8+NNF
 ol4+k2GbB+k9ybk+jNPrel0rb9ws5ng4eHvnv83lPssZTTrIkOQfvxHEKU6ZwKXa+6S7ApyPFSY
 nZ2UvMOicBL6xeOfJcGVq93ZDZ0bc610U9/UxWt8NzVOBpyiaLVx26joK8fiynNuhm44HzElDaP
 NPyQErX1NvcpZKs7Oip9Fr7g99grsgXtLkbjYlvzXojsGF5gOB0ehaazvx4Teug93Q6F2AWIVs9
 tysVw3nnzE0UvopJrpTaGKDB5KhRIN/93q2gN0ZhaEonoEJ47AoKN1uXoW6gzOpUh9Stg9ckphw
 LXAXkZgOcDlbgYB/a/lxfnaVp1ZhmhnlUTfThaVhA8SFuVHgN8namDsRhWx/j4UA+ycI12OaW7p
 0fuinWZKqRJHDnQXsRw==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695cd2ba cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uffMIp6nSmQIayL3VFUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index b57e87b0b3ce..1522a8bece29 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -201,11 +201,10 @@ unsigned int hlwd_pic_get_irq(void)
 void __init hlwd_pic_probe(void)
 {
 	struct irq_domain *host;
-	struct device_node *np;
 	const u32 *interrupts;
 	int cascade_virq;
 
-	for_each_compatible_node(np, NULL, "nintendo,hollywood-pic") {
+	for_each_compatible_node_scoped(np, NULL, "nintendo,hollywood-pic") {
 		interrupts = of_get_property(np, "interrupts", NULL);
 		if (interrupts) {
 			host = hlwd_pic_init(np);
@@ -215,7 +214,6 @@ void __init hlwd_pic_probe(void)
 			irq_set_chained_handler(cascade_virq,
 						hlwd_pic_irq_cascade);
 			hlwd_irq_host = host;
-			of_node_put(np);
 			break;
 		}
 	}

-- 
2.51.0

