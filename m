Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA930C61B
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 09:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690944; cv=none; b=fll7tziPyppGhmgO0/XWsLSd8qNs6hf3gN+pD4zii2cAR8P542L7j136S179wllmziKwrBE9QnTsEITFNBNC+/g7++b9yfmwIzv4nXCjuIjC2b1mqTdPe47gyjzmwd4WksC7y6l2RuDFiL54G9eK1NtYmt00RtbRDj7W5mShTZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690944; c=relaxed/simple;
	bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhi2+/9ByYCb/pO8wVn4dr/AYcJr37mssUj/OKWffGxH4mYfCfMiTuNuNt27EKYcvgIALiLhcRN9WQ+nkjbnQL95IcldBEAM6gQE4nmX/aTYGW2ICyyFETW8hNwEASAOatoX91uvT4RQACs0534QzlPUdA4v0tKgzwNX3fTW2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyH1dS+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rq4Yt+tc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyH1dS+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rq4Yt+tc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t4sL3295004
	for <linux-samsung-soc@vger.kernel.org>; Tue, 6 Jan 2026 09:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=eyH1dS+OWuLPBbeG
	s6hOZ3gPsINaPKOrfyjBZOYXLnvlD7li5rlELpB7ldxLd9kQ2KYk2Z+zYUHfK5gW
	e5GPW6fTyqXI0escRoH94iGB1zGtMjBZnbRnFOMMvZi47Qd9wlpf0yJWAitw5Eyn
	ylirZ737//9kxEzncgjqxzmIvOcACfLle6eg1DiI+Nuvnp/abfn2Cp+7VMtqibYw
	T+a1EWqQjq5TSHQfZw6x4HRDjrYUVxeJHF9wb8M+Uzwo0TnANx7YEcDmYoDxmk8N
	6w58V4ZY2xDwbsa4QYVIkMT+IWa86zpFI99Q4K2JShlug2NVO3Ww04Shpg4Z64WB
	eJOHuw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00dnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:15:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed782d4c7dso12546241cf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690940; x=1768295740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=Rq4Yt+tc2zZu/AlhJpBYCujwM1+tG1cO+Zi+TJPotr0Awjvn75+Jv4iKTJ62TsTRVh
         ixdVyOn9HvfPWVPhpu7BC6CvYaM4Lssasl6V3Ujyx6KaV7eBVGnZvM3D9T5VhWZoYtr6
         zaC9Ci0mu3iqsKuQUxPOf21eUPoIxPiBAX13Ot8iblhsOH0kg62DH+d1yzb7CcpkRuUI
         6HQg52za2aIbBTO25dX8+gGv14bxJe8uk7hluKcwV22NKCnHp8cwozY5rJvChLVPI442
         X9sWaUaemcgwCbFoczuJKXpam03CrRoGNk2lgQ7xdmLRyIKUoT2FW7V5kQgK39a9fLtm
         /o4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690940; x=1768295740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=bKxmLuTFNv1c1hinEUKt8bqDoKSSIjWqoONsCbZ9K+lNajkIUhuLoaMrU5U4yP8C67
         w4Iwf3Wbc/21JohvdDUVrolFKW5HIOPgYYDi53FCSBFRSvH7Q5gjR55qiEXE9cJ/iUsC
         /DOgIQWHaohhAUAGz1VBt707gB2nnUa2jc8wnuFfzjuyoy0C7a8q++jHVmmhHCuVoEVT
         c7NucPXr/sajrHxZyi9IJ+g820g2Vw/XSUVDyPrGiZghpci9MuF6WKX+RvHDbNO0zBJe
         coZMV8b7CR2XfRlv0K4KoH4xvNeY44Re53cpq3TNwoyneR4lUdmsowhKS+vWHXb0J8f+
         3GTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2NlAAFeuX42XCIuegIEezD9UBt2Gepqlw3ztBJcWZe2BEpd0ficdaSWDEkR6Z9+lg7jHHKqnmtTdwp4smX/AMOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLqM+/lVflaxM+fcA+JPbw/cpcRNUkOav7FXtInYIUuT8qudP7
	8FckGtoPpZL2cu60OUzobWhYKTHXqtRqEzGalgYJnIUStcAbQLz16p9GNk7ky/cmRXzKOONcCOM
	eh0nb7l6GoMlE+ZOJHiKmq5EDP0QsPwKJ6ENFVVg48a1gIOMAGVTvSkQsnrL7XGZd9uOmSzH94w
	==
X-Gm-Gg: AY/fxX47KBed40oPlVzC+mq+foemDpMOmFAg5FO85FYIQLw4ngkWa6DIwojK9rjCPaV
	MyHcqg0awhCQ/HHP3jog6TGpXWYRFqMGivcn4hODQ99eiSk7tY4EYmtAXNnCAnREcd3W80u2rEH
	DD85uoeFxrWHpCaxjVfuQX+/A8N6wo7OoTeBLMJj6YOyDa/I+10oV0EieBNvt8y5Q1cbDNUa28w
	WdIRqLQ9SulSIZ65ggH7kwTr/KhYjUxrVw1POSYYBVtVtMKZsi/B6/MRLH2YWWcPCokFFK4pPTv
	MQyAbuzlg/44xn/U8dOGcZEt1xGSkl2m44WH/e4nSBB9O+RWUlrMDBIDsiIApR2iOB9gKOWhqIE
	F4821WLxCjw4DHmHRpKpNMqNS5pykLRXB3Q==
X-Received: by 2002:a05:622a:5808:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4ffa76be5acmr30003681cf.18.1767690940499;
        Tue, 06 Jan 2026 01:15:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn9FxKXGa2KHpYz+ZQQB4vTjxpZoVrkeL0JR870oJdg4LQQUiHW7/3aZHLy6E81IxKYYFXcA==
X-Received: by 2002:a05:622a:5808:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4ffa76be5acmr30003321cf.18.1767690940057;
        Tue, 06 Jan 2026 01:15:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:16 +0100
Subject: [PATCH v2 06/11] cdx: Simplify with scoped for each OF child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-6-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKlGprAVyAJUtewyF+XMt0Npi5Nw3QQowqDq
 LDolXwelDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpQAKCRDBN2bmhouD
 1x2bD/9ffIJpL4ZbW/U/j7/3q3tt0Sx4jOdt9UJON5xtLy+81KBOaJWv9oTsWblixcG54IEdSDb
 ky7CLtrOVRm2nsU+I+NZsivbLdkjDaUUYYJ81APzHmE8NPDhiTh1Zl6G+lqyRBDAciyuQmWRs7E
 ba/15aAWk7sWBXMnoydUPhZ15VDFbuKdoCVhGGh89+SlpzqvH93ZbAfMKTExQ6AJ0Bayl24XUcL
 FbEJPOpqJtUYHuZHEkGiAX4yAD53c/uHVRFnAWjHNNeZ64IowWM1AFsZRN2iOWJdR7k7DJ3ds+6
 2Qb+bTqYFQHlnXnreN+NqCM3//8G1U3N70mQbcHVtFHdky/nIN7AbCjrIOupaGoxj7F1vYXeiVJ
 kM2BSyYeiztbDN5XccMSa7lqvsMOIhrgV/6k1j2cxdn3adot66K95rAS0SFrBfPlg/fIrbtTeFK
 rT+cX64PbBE3jYVR5Flq8Q2Dj0SdVyluiX9dsS55YjBMOEGp6nsElIsWQulojsCkVMAlpuW/Y8F
 E1A7pherppgI/uQw8ZNgElbPB3AlJ/xlc9SXmU2OcQwTKB+UoVOn6RBNt9D+MpE5bWw8IhXUt/t
 cgiUVpMoOd1sWskTwc5hQT4lNJafHtAoK7gy8E/OPOx5MlQXiuNUnDTrRv0EZK79EeHYlEtXJBj
 iUssT4/AzCEIFfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXzpXv5SRHqZ1b
 Htokao7IRPb5EUQ6esOX1G1EU+lwX6lovCcDxWdQ9AjsvTwTljKU0NOSZyZ9pjWFopQUu9lXvwM
 bsI5GSuUon4ytI5/ibStqnjZL3X7AAzs1If9JQBDkKlktUGAqaZym76hC6Q/zjakHMIHbwQsCRO
 fDgFqpWpYS8vy/JLFDBu0tEeVPis6kT98ysL5gVnqjLmVffQvwTkwo1rxzC6wGg2sTPh2x1g22I
 c10xIOQncSsNBLv2/Ewa1q8GFeh73kzN7xcbZBkQXSIBHmY8rCIR1uWyz9w/CTfkdXT0X2yudP9
 0GpRXVMgsnOnL/McVLm1CChyTaNlFexgTZ1H+MoWvHIxo0Ooz6JLAHs/TihrI+YQvtWbNu619Cw
 DV3PgCm7XtqY5HckM9OcMq2+QepmEPhTRu9ANZq9xH/DnB+bw4IK20m2/kA3Lqgni2LHpdCqrns
 fidrE4fGg6i08IYJlMQ==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cd2bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBFd75AfmJVjEZM8J80A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _90Z1LUJubm0O6cIdWoET4ZQ9jnz8EFD
X-Proofpoint-GUID: _90Z1LUJubm0O6cIdWoET4ZQ9jnz8EFD
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
 drivers/cdx/cdx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index b39af2f1937f..bbde529aaa93 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 {
 	struct cdx_controller *cdx;
 	struct platform_device *pd;
-	struct device_node *np;
 	bool val;
 
 	if (kstrtobool(buf, &val) < 0)
@@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	cdx_unregister_devices(&cdx_bus_type);
 
 	/* Rescan all the devices */
-	for_each_compatible_node(np, NULL, compat_node_name) {
+	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
 		if (!pd) {
-			of_node_put(np);
 			count = -EINVAL;
 			goto unlock;
 		}

-- 
2.51.0

