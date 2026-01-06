Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F229B8E6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690951; cv=none; b=qO71ssqeuT1wvh3R6mfruqcWPzDEICJl/BhUbQJ7SvtLQuy9be0nXOmd4WGVWMYkBJcp4lly/E6P+5kaX6UpMy5+1DO1dvB7C3JZMJGnIUoG3fz7P1CGBoJC41YkAqOEgqm/O1hCH0Fx82XjUivywG5GU04AindCqenrvVUex/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690951; c=relaxed/simple;
	bh=B2RAEF97ngkNBnHTIi768G91uQ5BuNJ8Fv2Rhei9uNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gb0dltMp9hMpxSMD/8kY+jUVgLvEAGx44wUhjISF8WXbcuVcko0bg1I7LZWeBGyMwk0wajA2oGQVCCeYdugyHRoQOo8MCIGhVA9mWFCbtcO84LTz3pz1RQ5ubUDVBmv9tz/Sm4b6BCyX1JMZWrQpvCUWzddUf9+zB15RPR70XLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtyVQoF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhkDJ9Qi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtyVQoF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhkDJ9Qi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QTrS3272112
	for <linux-samsung-soc@vger.kernel.org>; Tue, 6 Jan 2026 09:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=; b=NtyVQoF+ceBRN0bs
	ZCjO/WD8II10dIXjRhh26LBPwj+8DJQmjrFB4Cj9YMGhRP+c1CjxwUU+syFQgKq0
	/Qh2QqrkQq3SR7xNIJ+Z2fhI7/kQH5zCJDOtyLrfyhXxire21mu62dpmL4ySsXqX
	zJ7qDDRZ/gcH6vGY9Y8hW1fG7rRbY0BmB8xoJbTmxvH5gzzaUzv7KpnLNtvKHPXk
	wtPraP0WL3YMGPLtWpesV93pNYhCbCtuKYSxJXXlXclYl2TeL+EpEC/l0CzEdLge
	pwERZjupNDyWwzqWeU7ulWmbWZc8FqqBq27fznfJj3teew0oQ3Td3Dy093kyozJ1
	vsz1Cg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02qg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:15:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d2aa793fso24094261cf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690946; x=1768295746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=;
        b=IhkDJ9QipV01AFTgsW6PLd3HYAbUsDgLD4lVoOM+44M9SuAaB08iz/jAW6at8Yefkv
         BFKmwMjTa1l/er5int+hlC/GX9nY0XoqZvR7F2CNnKYJIHiEy9YrzbDpcPY5JdLrRzPV
         XmlewbKA2gnKSMnLpxf5Z31Og+1/BYdeAhdH1bf4Fwv83sAkmbsLMm5PcigscuKnoqop
         2+L8+poOlTcia4kdxm+Fk0vOw5orL82w21tZxs7VIQr5ApZjz0FAfBlZPF5MN8fe3nkr
         UuvoLCbi/bzypYgfNUgMSKZGiQS+MHw0dsxYM/SqkQ1mixUuysBb+ZpBOFXk3a0RpMAP
         QJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690946; x=1768295746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=;
        b=E9kwQiT8FrwW9Z4ymuhvecZIny97xgLJxWaN0vUNoY/Ijs2GaLcJj19WlZC2SU9K5D
         A1+LxYFSFyHV5bdvNg7BWhOthFjYPMgVJr4Kom8OpKZ7n1Z38YlLWC3ViNi+Y+Cn84kz
         hge1yiVYzAy46360/Bm0HTMGmsz06WLAZNg7F4AzCiXbW+Dh6qlbBtKd0VxVjNd7y0km
         DmKYqU53bcgKsj3Iu7HGg6L+p2yNjfGFxSHp+hNtS2tFvPBRe5yW/i4ZpOqOc0jqb0lu
         yN3lQOMHWoa2Cmi6xslAQdIdNiTMXcU08l5rYBvy5nMHNZl1wuj0h18qIKatoz3mgEPR
         Ohlg==
X-Forwarded-Encrypted: i=1; AJvYcCUTvE642huwhCcxdotry8gf59kcwfY8FSe0gdMCN07CKOhT59UDdNObD3bw/JpkccFVhCB8cm/5zkoUjrsu/YX/aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzMeESAiqME7fUwBOBbLdCv0U93WfjaCFMmrzILSoUX4KFXuMU
	KwA8+SHQGzXJGo5hITGvYoDeuF2ocmG9LTSlxTCz5ci1N/tv4g2OLaAN89i9AW7qB1kaEzUjyvG
	mwx3nL3auaRZ8KykI6rNwcZg9oF8/UofBGFV50HQzgeyhwj9szm6tFjl0VyZrvdbfsiRxTd59IA
	==
X-Gm-Gg: AY/fxX6oKZLI17wDsRdNAAknP7Qi3HZXUPGLojDTZq2iqNjU7GA6fCOHd7MtnE0v5Xn
	jy//HLqZvJJ3jvwyxZhsVfCdJMixBnJxW/YbB/7OSZK0ahw/l5YyDXFGj6Zs8fr6+tP22aeGsRD
	OwTlpaeqfdAwZW7tuH+UvKdpZW1U27YhkwBr3RVZRL+hoFr4YhDu3OefZ374tGdGlqtgzndXRM2
	cDuoBA/h2xb/eaRnDgLZwPGR9SAcOA80EKExZX+3jahG+2Bzm2Il98t43JLQXAZHmSkcGJLgbBY
	V8Y3J4SoDMFtP50LkR1spHbyDSEFmTlHZv0VCBejVzNYBzyjBqTXEoh4gb16Gu5eIgLbmlj2H9h
	mj+KeMkw0Dg4TWXuBtpZHMNuj4kyTxliGpQ==
X-Received: by 2002:a05:622a:486:b0:4f1:ab34:a0c9 with SMTP id d75a77b69052e-4ffa782e976mr28103351cf.81.1767690945685;
        Tue, 06 Jan 2026 01:15:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+GiS707Ezd61sp0fMv7YHWgjS4AynuPW8/ntoYHo/pOSzK7gjRauU4L2KRKcyyV5Q/7R9Yw==
X-Received: by 2002:a05:622a:486:b0:4f1:ab34:a0c9 with SMTP id d75a77b69052e-4ffa782e976mr28103051cf.81.1767690945195;
        Tue, 06 Jan 2026 01:15:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:18 +0100
Subject: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=B2RAEF97ngkNBnHTIi768G91uQ5BuNJ8Fv2Rhei9uNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKn0NuTErJaGzdb4wCVzMIKofdqMitWHqhMq
 EMTzwe2JBOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpwAKCRDBN2bmhouD
 18PGD/9FFNjyRevfgPdzpoydpdTM0f0f6RbmG4ZFfdELpbX7T973V0+MVSxAbrtEAiCSpiGv2lb
 XekSg8Su9wpX5jTWIXiR6qx+XCdrn3wCNm8xz6ZtzPGSPwd51hEiIOAmHMk9/8WakntDOCqmBFs
 DDff7uGHZGlsFnmRvh3UnL6nyxD2HgRmwPGfEuvjF3XVh62KU0F/rAuzZbDw8ebYL+FgvAg67df
 D8E106iSvRWjyrOhasN8Zi0Q7EJTyGWcc69ScNa3U9R7BsZKACIWooO69WY54aOs/PgxgBcXLSw
 2f7QWw19t9X5tvnxSJthY2zHcBwlupi7Bx+m5NTOBl2LCajdFgES2ramoLhlQwdSJ8i+4gra/K+
 i9hBTemvE35IHyWsXLOCppibb3vyGXzmxYhXTHBgtxelsicK6hUZLNGHUkPbO1tA0UybdgN863+
 x13nxG+wm74AHPncWZULH6rmNykZJ/r9QkkguX9BW5NWZ8KMkIUTBJi7Wo6BpLGUFBtWdsOUn6b
 Kowz3HrP38XO64o6h9ZwV4Wu4qCruCojveanB5yc37G4WiPATUPtoJ5H06RQ7HqkIF1FXlHx8yf
 OcI0QHN+fBdwvlCcXF49fS4W27bN+Q6093BKrwmTx3hp9/EJFT61Ey44RWSslB/UXFKQWZtYjRL
 gpsx9atEIP9pe3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cd2c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=75aRx82TGYjwQxWndmAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: mqND6dVXrFmxFmH1wyx5yQPgCjkgjLx7
X-Proofpoint-ORIG-GUID: mqND6dVXrFmxFmH1wyx5yQPgCjkgjLx7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX2B4OlWKRORLs
 NQVBIFbxv4/ezsN0AUDvaXDRiYUAWRzzadelAUdJNeJpO5bVjQAWfgcCLGJq7+OW00xVyc0pntu
 sPmLkQCnDR1rvEkk5tMdZLM6bF5hrS1pP6i8OZfDL2xZHInrm72HSiL6M9JXx16K0R949IzpI32
 cPewIrb79ltmpLDKLQu5t6VeP9u6i2ckQcBKvBZMrt1VQyd4DCd0no33oGzJm6qLhCR5M2JN6ol
 LpYBNnj2M8EVsS7FCbMlrm3sRXzlGK25VAmlXx5qe74URFSB5VT5lERKNxIX/K7LPHHZ1jKUaK8
 MWbhMLKWoxpz9Og/T2W+3ioYWEjH8p1CalrlI5V2oblEc2cf18xQ+jGxfvMhQKQHW6Eb4otYIyy
 +lEfoLpVM5DQYRHpzKSiGnopEVK/O6V45EaSQidz/KFQKVHn3LM5mCSj8bxVv/9yBGpA65sGmNb
 7/sq/EK9Tn9n9Gf6Prg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on first patch.
---
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0

