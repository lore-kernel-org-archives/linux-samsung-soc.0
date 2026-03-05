Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB5C3783BA
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701781; cv=none; b=dWV9wbltE26JGz6HquIKX3OqgPv5+pICQZeWIDZdVv+VAVeFoE+jgbVLaUimIdX7k6Jbmpjz1uU1a9u0WvCXaZE/gDD/rjrkRf/9mZLIc/TkL2o7LIfMFOZEcAolvDyn1DkrWP08F68lnjC54MlQ1FUFd+iLC9dUWlRsm5Dbm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701781; c=relaxed/simple;
	bh=t/sgi7P0rEH01LTRs/rGMHpg3gopQTSzKBVQq6gpe18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX/XQ21pqIh24oGh1/dDc1rZ8QkLkrUYWxfsSAlTSUsuMMRE5XKwwC8jNB6pdT+NMDVwqjGa6m/NInyYzF0AkjrIsjhmD4CgGxv+f6H7i4z2HBZE+4O1fAXDTJf8B7JryK3vcUA5tLd/IdXdvhywNBSLBaHFFT/XO2cTdIQTETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0+dBSzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcRh0Xnw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0+dBSzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcRh0Xnw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BpgF3482651
	for <linux-samsung-soc@vger.kernel.org>; Thu, 5 Mar 2026 09:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOhXGxZIJ8v5LzBKTzgeyUeFw8EGCrGa+cTSiBNVIxU=; b=S0+dBSzj4cwEJ2zM
	xSrD7HqQ9miYhvpKaUwx646pGsHlZZ8ODjl1P3QMikTbAOgSryaGtiSphxfczwbG
	2hnpM89U2GOdGBpsLfnDqCfGARIBp4xZ6crrJXyCEegM1ei583iVoCo8J5gX3NBh
	e6cIJ6eIHXXVv6KL3kMIGd/HwpG1KCj5qiJ5rUDrlgxrxXe63X8ziTQ+kb0i4OSf
	razlEh5EY3BrzNl03Bq7heYu2IOqgJjEW/HEZh+IkhTVku9f2DPjr00UlLXcxzzr
	OXZF/7Nq3LpyEosKQKZwIbNzl2D9G/tDiFph2BsW8UCMUvRWpIMxKC9BEVSKA+4r
	Bo24xQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjkrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 09:09:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so831890085a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 01:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701778; x=1773306578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOhXGxZIJ8v5LzBKTzgeyUeFw8EGCrGa+cTSiBNVIxU=;
        b=ZcRh0Xnwmrn/POFu//AvReJ7evv12lw0ucUegy/M7ZCAGLsC8MXHIJvXyZeResqslP
         hdZwpVJn0/5ai2e6kbJ3Nh6hH+OC7gXwGYOERFBfM3WeBGQJB0bsqeKWHr4OWmPxpDhn
         5DFTz6p7pGRVUx7CfF37nvCzskopOACLk40H97Cp+2bl4C/iw6fv9kexEwowyJvPn8yr
         6ElXE/UweTXIC6bhUtrbSIEFqebDsUwN3KXdsClaLaXL+1qEwPhbKEuW7TonklbmcIu3
         urmQ4LClJfO2cdhEK26WcybJtmWcC2BInPp7DuXnxh+ptc1UfvcN73RqnvzQ+MEwKBsp
         Xp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701778; x=1773306578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOhXGxZIJ8v5LzBKTzgeyUeFw8EGCrGa+cTSiBNVIxU=;
        b=CcsfZTVedh+1f3uoZ3VqUzl5olgKKlfa674VU/OZ2rT/PfvRLKCqMQOLpBNHCV6GwH
         /eZPYJm37nntLm/XkWewvR7h/JLZJHhVcxDb8hpO2sfttT6YFAKgHafE3jMOb0o9e/bO
         ZOZUeonxbz4M//gdGnckAX4ROSa/4ZPP1gOx22DULVol7DBy7/3RMRF9+Gq7jDnpsxV+
         Enwn13q+0eoSL4miyhRi1bimUZ7iFH+ukayKne5nB3eyrnayO9vo9wtFoPGjtXjWaNuN
         6S3uff1jb09+MElM9IMuyoPYRuNnsGmY5heqeSJez2MnhZukRP4t2wXyTaTh1O8vwjhw
         PSow==
X-Forwarded-Encrypted: i=1; AJvYcCWiAHw4dA29kdGDFqK6x/gl7FcFfzA5ShB9H5IlAD0WOd/w0MSDfU4YpbCszIu9cfPMK9Jf+qoc8JHV2P53kguAEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWA7zgkShtdVkJT5L7LjiSRvrD4X4COh1OOY1JSV4FSp30UAvv
	aAFY9H5vtS8QMC9rTfn6NLBSTNmpqc3YvEBI5SK+tJh0jgWFLGtJyIqSBXWzrAC+In9YWP2d7U1
	vce1G90plRggX2vn51UbIlJWNvT8caomiWJuDtWCzHx3Z7PGrPlvLy4Qq3p4PnXLV5+9BsE1GVw
	==
X-Gm-Gg: ATEYQzyx8zVpcTNfWXywrrCjZpFoHaZqISFcrTwQ71cQr49h7FeQwl/8oRUY+KErGV6
	YyVkhLr2gjo8SF8U8GvxAb1VksGhjZuo3zi6uP/LC9s4Jljy/esGthracw0Ynr/cyGlrE2wvP3E
	oRu18m7DYwR+HXCUFvXX2X0O57rXobzrPLDEmfS/g+HnyphW57WRvpncNmQRRc4IwM4uD8y1ts9
	GGmT0pbNBnAI1CbyQxb6kD1kvS+Mde4VgY9FXt0ou64AJ1Uukj/OJLRuykTYQ5pMd0vF7zCCBHR
	2zZWkZt4BNBHMve2BGSrhPDN1ztcKKaBuWW10XILI3tWNuID98ej5sbd2QBJpvizJCIl6x4BYzx
	3qoKaaB/bTKLraUFC8SwT7fPFAgaboYypKwJXJymCX0qL
X-Received: by 2002:a05:620a:1994:b0:8c6:adfc:48fe with SMTP id af79cd13be357-8cd5aeff3fcmr617492185a.23.1772701778478;
        Thu, 05 Mar 2026 01:09:38 -0800 (PST)
X-Received: by 2002:a05:620a:1994:b0:8c6:adfc:48fe with SMTP id af79cd13be357-8cd5aeff3fcmr617490385a.23.1772701778029;
        Thu, 05 Mar 2026 01:09:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:27 +0100
Subject: [PATCH 4/5] ARM: dts: exynos4210-smdkv310: Drop duplicated I2C
 address/size-cells
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-4-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t/sgi7P0rEH01LTRs/rGMHpg3gopQTSzKBVQq6gpe18=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhIqDb++ZjL5w2d02vjNcF0zJCMRjuqZtizh
 hIGsPRIbm6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalISAAKCRDBN2bmhouD
 12RvEACNUl2XDJOmNnV/wDCuPf1eLG+y1YzjFNCMOt0aI2BIacy6jEcIF7f7EQUKFX+jLYxRXmY
 jI7zvl7AtT+mnH6NIN0YYFM11BdjYCg4T3J/3+5xPEfubFSbGIztbdZ1pkKh++pyhhw0+Z8QB6E
 ZBuuF/JXsUARhUK5rQMdDx/R2s9CUUFCbzwCfDSTyc2RuDaRFGsSC001WsaHNE8WTrljsGVz/4S
 2IHtu7tlf8OVUuQqJEsxlgEHZjp68kATCow047qIzg0NtDRVMWNakjx/bgYNDIgtL0n+1dsorDj
 UU0pjrZNZ6W3BhOK5i1bZMKZnTQ7Eoe3a+0OIEO2Bb+ngkcV722DNV+sygVydykIpeenh2p6GCX
 jWxoOG5mfWvl/IoTp6OzJ5QDv9xoDHJoi4Jy5UZw8aoIx1fXh2Nd0fS5992ZPfD2Eydqf9tfZkj
 tSW1XsBZ3gRSB2YXlNjJBWtHYvfpm7S9r37B3tFEJCXUNjb0GHiU2RqMIcZFnHGHzbnn03Yf606
 y4CK8vUfv2IOofyMNwH9nlFf+mIFezBLcyh7gev0S06DkBNjrnZ585FXTmGYxSoy+fS000iC7xY
 VxXRUskzZdBDdzyzspT9CoRfhT1hOYfEnUaHjL8rPTU1gBjT2/mZYwD044G+xiHjlz4AWu7fi6P
 Eaiv1MhsVRA4HlQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: XDY_ZOxzK7gdtZvcQzwxS3ef0GfgI_aR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX0cptPyfTZonF
 GBt01RjePEVXVrOXS9OGt6v4+Hd8NI2wTZKXvVttjdfzTnTBEmdq6FT07WxnaKLjXZLTnu47N7/
 57D6VRcRv43QAQ0S4cANeT6JMmJQ8cG/iDUgaWq2rEpv0po6mF/X0hr1SEAMkmW89LVDjBkVC9V
 NaQhgHwS20/rHAoDxPgIKmHzi+tYWLYWtRPtmEYg7KOSuaNy7FTycHnErP89zUXMglPIC8Raedc
 xj+H/WXBWeVqQSpBOTOZ6faX+n+ZubqRjUSlqdqDfxlen4o5JFApMkQNwBGsa+oweDi9ljVFeFg
 GRxNA3xAQm4i2apPaWuzhNamb0QJkKdeaA/Nml8NFBnTJR0nRyQzIaP3pd/70DLRiDXBycA2m3a
 kJWFXRYbQ56y7G+GAVkAnmVLOcpV18mSR1kIKXxKu5OEuytAAARCDZYF+yhl8mD1AeYaF6dlVyW
 PwD9VLKucz/Ki1B2ydw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a94853 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_8SJKKBjhkPuRUrh8E4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XDY_ZOxzK7gdtZvcQzwxS3ef0GfgI_aR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073

The DTSI already has address/size-cells for each I2C controller, thus
the board does not have to define them again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
index 18f4f494093b..a6b73a8967c6 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
@@ -68,8 +68,6 @@ map1 {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <100000>;
 	status = "okay";

-- 
2.51.0

