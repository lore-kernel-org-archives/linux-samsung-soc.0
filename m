Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A095263F2D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154961; cv=none; b=mbmcGL6vICG1wb8Lie57OXM0FpeRVaAolIbyTmonFC7MENccGoX+bdhZepmFd8ZSNisHZGbKoiL4xZmsL1/P0JqhsKARIuvD5ZLAHa/x0zgRKR0pE9f9722UQ/sYpwWDP32IYwE8fU4el4Orevi9ztVhP7Vu0SpMy5VdRQq1WEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154961; c=relaxed/simple;
	bh=z3gIGj1oIvvmH82pocqz/4k2PQOnpGa3jr5JHcWhyj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhZUROW3KFc/GECf1eunHD2uDjm25ikI9jQP1bD+5wghVdL4uDi9PH/hj6QZ6N29T6uLIn86CSCT8L+wEMeI8J7CJdA7ekj+k79bPNcNorl3ln2X+3g8NRZP8QauVpncUvu5MckMDL46/w8CppOL8rZ6hpKuiUavP1BNFx9YFQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAO6xiK7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JaqxpZsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAO6xiK7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JaqxpZsf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJCMBFE3318770
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=; b=aAO6xiK7B2Ahpu0Q
	tStX64yB/Oyj6iYNxsdek7WORUjXVMmB1EL6+Wo81vsth5sEsUNHmvEBxPaakkiT
	3WXMe9musPUKGR66HMiUIVPfcEIYimPkz8v+nn5K5fZ/ot581KTdLa2XOFf9SC3G
	yKvrcxcYJxj5Zm2LKOXeDZS61VYFmeBQk4w+V48PN/LZSjl4Hvuyy9Rak2s+wL9V
	GRCZXgEVJ5hMXictveqt3ggt1808OhVYh55oeeXcA4/BqHqX8Qj8pBVlO07OmyJI
	tUd5Qv3CNWYPQZF0FaRzPBUdlbC7lgYYqyx6sA3bQ0YIuCRo22y6rQg+MYvAEJOf
	t2aX0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2etwgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:35:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74e6c468so25033371cf.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154957; x=1766759757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=;
        b=JaqxpZsf9sw3FdzTGwsPCaYwypSmPdzFIuLChBu5daWVSpFEtrcBDNXLnZt45NbysL
         J+ETCxizcWlRUFQqF7rUhIb2jRfiK0ksET9xwKHjGPTWvjVLlTVjrrhI1O/giT+S4kOA
         pR4U3PSCv4VhDw1lgIaNFXtC/BqhODhXuhTgtKw+Pv4YLsOJcjNNGhrZ31oLNaPizoDn
         cmOaNjESgjj9Hn3HTpJCw9Su7trUQNpmvROEk4L33kHX2M0OZ5nIoX2XHY7nAW5mXmlt
         n+BZRLX+5dl0zovn4B5zokxW52RsRS1njMdEh3Ynq51i7Mfr/orol1Sv7ABYAiihZpaL
         aiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154957; x=1766759757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=;
        b=i1JsRlQ+XIYwvOK8kdI2gidAI9XG/Zb3Pl5NBpPtU4un5/nqj3LRC+TJCW3WL0USdW
         BEixAXwEfAeUwAi0YanMXNz3qQL/kqQBGzjOW8II/eXLmvD44JzQWxHKsanIFvXcXQ+u
         BexfOGcL2i1wjUDwDvzRhA9O/VMTktBXjmnt33wfQLfPRQtr+2GOwIzkyEeRJl/o5R9i
         ogiKVbuiL3WHGz/YuF96lweZcfJZS+9nF5p3rGMZI26Ma9mfvGCuMonL02ce5NIvdLet
         mXolahJVBCSWdmAnW/RZ7C4W4VyknKgWf5+Ly+32dHOfSxY8Yi7aeJ6TsPiVwSRwhX1a
         gb3g==
X-Forwarded-Encrypted: i=1; AJvYcCXXpBMJstndw8/TEuZx4yuamVlw30D6PvINtneIpqGiado4pIC1XQCfnk7pZ74N76MAhWD8mMTXkU3OO74J9lFQsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YU/95uKmFXhDXSZaEY6YCDd9+w6qeYDR1OCXmFuhuW6lDwpP
	1sJ6BRSmc1yrwyR0UTf07odIq0qO0guAT//v/1hoLBbEdbuh0yv0067Nw1NSQRwwZo4JqNj+aUg
	WyaY9vEtqHzyJtDsHZSfnk1h9fh5I92rD8tqMpxAbyVi2iMKkiIMrS/K38yAN8LRIZFOwFw+Pzw
	==
X-Gm-Gg: AY/fxX50kXTXlqs3w3MRrik+IcZzk3P+p9JoDeMTsH8Dswmn2ajNdaI8ea7uaCOCcDm
	olSMazTIZj49KyP/rfJYIC9H8qWR85Sn8C/L5mnG2Qv0rnhthYKd0/UMVAVqQxHtY84OVYyyUHk
	30FhX+x62KC8DX3y3mzqkrU+E26goZiplmjggW7WEqXML3ngwHA+nc9x5Lky9ofYDy6athi6mic
	5LgYg19OY4xCEueozvCAs/gYp1WXFkK4zRKZy44BzNhU2FyBLtOZooWgAVcTz6lqwjPa1AYt61O
	QdTEUOIRFHF7oKz9wBO7C9qTeM2/h+JlXeSyA83Vt0dsF/MORpTpeIVPucVM3yKvau7l758/shA
	1bbCz0mETnsja9PnE4BgIGujU1q95lapsQ1xtVqhD/phdKOQqfq8jo2WsB70JAT6JRaJz
X-Received: by 2002:a05:622a:4c15:b0:4ec:fdaa:b31e with SMTP id d75a77b69052e-4f4abce094cmr43174131cf.32.1766154957167;
        Fri, 19 Dec 2025 06:35:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpXU5pTYf8IAIDbE0Sqzc6Vk3SDvjFDfm4RPQu+aDyXRPlzu/xbQTB4M/gboaQR6K2hZYIIA==
X-Received: by 2002:a05:622a:4c15:b0:4ec:fdaa:b31e with SMTP id d75a77b69052e-4f4abce094cmr43173611cf.32.1766154956699;
        Fri, 19 Dec 2025 06:35:56 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:35:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:31:50 +0100
Subject: [PATCH 1/5] iio: adc: aspeed: Simplify with dev_err_probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-iio-dev-err-probe-v1-1-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=z3gIGj1oIvvmH82pocqz/4k2PQOnpGa3jr5JHcWhyj8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLEcsg/U41BoWF/u0CzNiG+xeoGWVjGVoXoT
 NfSmwwYEgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVixAAKCRDBN2bmhouD
 17LSD/9ruRFSUuxVXUPfzteRn2rDyimSpK7gTLu+xZB/8ccc5jh3NFxaTc82kprKc9KeXopFpk7
 sxqJAClDY/CkpObXefij8urEBNLvrMDnI2eShXdGAumF4Re2rxTN2eN4fpTrEsHeVCeRn/GUiTm
 aqd8AWv2WVpUQocZdUlWsHte9x4AyuaQiclWlO2P/+ESmUygqA526P77fL+zqusY8dl1Qx/mLZl
 0Fj9c5zLge/Pdq6xHeypu8XYSNPOeFtFIu4bjKsusMTEzUmFcfEs4PcejG89bsqU21BGciXyuCj
 VDozY6YnIFEx8SvMmhcSZeXZ1hH9yn6PHBevAuaxu4jdUVVhe7WFjiKht6Q/J1KECutkpfaQ7Ut
 /CZjinA1SFtrdElPEAfnk5RXoXjxH8VdVzcEFz/hbgzOR0pDj81MJnNJYyX0wBCFZ6uqWFfQfxw
 foCaRbwDfrobfvdERQQb8brmubRaYWsJPduVobsoGGGm9GCqzCFf8QoqtaWV0vG55G6vnuLCktx
 jK8PiB2fsLJ6Tf8T938FxIEAkBGN799ClXQq6w07f+8xN1d6kqIGHE3RDvu8eVdfqEvu9PEeyKm
 oUutIFIRV+Ua5vv9o5gi4gWG3SfHKRQq+UEMXE1nm7Z8KS7cy4Kymsd/ds1yZD71QXN8clXwwKl
 b/wRwDEQRYvMMdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: -XngvFvO9OYL3tzuZ0v6njl7bvcaL1pC
X-Proofpoint-ORIG-GUID: -XngvFvO9OYL3tzuZ0v6njl7bvcaL1pC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfX4tqYcIluL+Pl
 SbvDlimZL//Pjl1ymywFBHGik+VK69gRn3Yz5Z2pQtOF+hDFxd3tckvJwMp3bp7HSgMlrPC39E8
 bfOtMYFkglsPG6JSGkjnbpwEFAfOJOQ41QpYFRkSZjpgbb6XUJ9i0aKWOSX0iUcXle/kLAjcZsg
 XH72h0Y/pKQONXw4LfabqgSyJq7R2EqdSajydsM4L8qGtnf8mSI/MxnztUotwGWrZemig8Mz/L8
 QbFBB+yUCBLMPMldFZJX1hsJmjuAXxciaIW8ST+6uS8L8aIOS+VhjcVTlVJCr8quWkV1NCMyZSR
 HFqyVg2WYqtD4wFApksFvbgnHAP4cNFJRrESMA8L/1KKUmjRgzkF57bs2diVt70VWagEItWEAjb
 BskbCN+qUoGBayfgAFPByIPTxCBRduXhX1r14NAScUsE0IWz+DykFso4RKjlpX2PzJPYzGW33oT
 V3yxchLCbpbtlB8zRyw==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=694562cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dK7io7gEiNwTpUlzFjcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190122

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/aspeed_adc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index bf2bfd6bdc41..1ae45fe90e6c 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -535,11 +535,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 		return PTR_ERR(data->clk_scaler);
 
 	data->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
-	if (IS_ERR(data->rst)) {
-		dev_err(&pdev->dev,
-			"invalid or missing reset controller device tree entry");
-		return PTR_ERR(data->rst);
-	}
+	if (IS_ERR(data->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->rst),
+				     "invalid or missing reset controller device tree entry");
+
 	reset_control_deassert(data->rst);
 
 	ret = devm_add_action_or_reset(data->dev, aspeed_adc_reset_assert,

-- 
2.51.0

