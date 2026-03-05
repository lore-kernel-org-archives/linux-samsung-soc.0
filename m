Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D7377EB5
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701780; cv=none; b=pBfbjwoug8UFy893IFdqmZ8lSLOdeQrUZXNrlGI9HRUqffKwXragRxy4Kz5cIw3Tv9c2v8sVkO/DS79oMbK7dEYSXlQl42adbFldaTPW6hCM4Ivj9hNXwEmQufzHznElN85YdQ7Oq2Tnn4+uxkVC1ITIOfy3oSNMbgPCiEocPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701780; c=relaxed/simple;
	bh=+ET7cBxh4ZoH3YN/EYv8cNqrlKIIjGzn2UDYqXcCK6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfhQdIitpjCcn4IPDq3iBXCAa1tr7RV7XnDQoOm22IJFRgKu3YtTIDUEV8MllFHFzIhvAG8V0FkWQ+nTMt79tWcpC8S8jiHVxSKvMLi3NlfA73mFugNltFduGhWaKm4N+yeZECRaDGvuwqprcQXQ9wM3wcEN2EgOeuK85XghcS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O47AUWOP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITGgh7VF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O47AUWOP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITGgh7VF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62590ZIJ3473599
	for <linux-samsung-soc@vger.kernel.org>; Thu, 5 Mar 2026 09:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWM+zFw9puuVTnXKWNi+w+/4+fyEV8c1VB6uPAwJH3Y=; b=O47AUWOPnSykjiuk
	Y3Ee9exj5809jy+mUUmuMYltHRgxuyzOV/SqdZ+Tc/L4g11ADsXQtweMbYuOiAJo
	rI0pZzj3B5E9tFceZ2zy6bdlspDYp+h90beqjTpgKxhwT9p2JHG+5kYgPud3JhAC
	mzHCS5ylcEeSFghP1cxGJzXkNHoTGxZQpDUAZ+dRkV0yDN1oGmiLM9DWVjUZp8EE
	Hkv5+h9xWD0WKDVlo9S33ws++HV/0PoQDmUk82RKrNKUfAT8XYfFGhxt0p/UlR0H
	mFC2mU1IR0n3f2U8iSKvgbSw5ybVJsUkugVE8cbXKOB9aKbTwp5Y/e2KW9yhj0zl
	XlXclw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1842fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 09:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so5317218385a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 01:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701777; x=1773306577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWM+zFw9puuVTnXKWNi+w+/4+fyEV8c1VB6uPAwJH3Y=;
        b=ITGgh7VF6hyv0jGP1mPs8QXC97qM0syqNFhlimmyDKG2FTn9apQp/djCqdCZy5dsiB
         L4l2Zlt3Rzi4At8sHEnHMoehjaiPo0y71JG/6SGhl84hGYxUAaFN1LJd+xiWJ2HUEYe7
         Py2DJwrACvZD2XvooMNt/4XkurxZXCXUTBChmJy8hvG8p3zdnkRQuoaeKIw9W8e3+kYS
         Ld1We3L498s5IeO9/+US4+Rdt5SVDQDdRC4AYnz44sjK7wnKOzcbNxvZxQeoFicXtlgi
         Rps82FYpR+TESbK5SLNnzbtDHlIkUDtSiJ80+SY4/Ez0+E9ElNTIKK83CpqeM3h5tB0G
         r42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701777; x=1773306577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWM+zFw9puuVTnXKWNi+w+/4+fyEV8c1VB6uPAwJH3Y=;
        b=PyqVnkIi6mtauL1NgTP/Mt+VzXInC9+eBDQuH8avNbC7ZMfjdWS0ZNQT50Enuzh7EU
         QDFalumJGNouqdKcqbMjdVjwTxuaT0300CkJ+SinUZXvdi0NCJr81l7hV4llbYEetzrn
         pheQgskaeC4d046Db/BnoCU87fhYIIcStEL+MmshfEvnxKkqaZISfe94mojYUWyWNGJ5
         F0POHI720mFwXVLKIYMhGtUv5B0ZdY/Qpq8LgOQyZVxit9hkAgHR2H/jeWUKLBEeJl5l
         /LhJXXfNxQuaPugubKKVjPsL1TaeHA8rtfXLcMwrs07H8u6/f4pFH/gjFeg+XcDYb2gc
         4pkA==
X-Forwarded-Encrypted: i=1; AJvYcCXi3YNElW5Ikl3gxwaWG8yrYTqHiZBh8KkVVCIoWsafB3y+QIhRPBB3PCJyuk5dHjYetuOFmIpPeX6YfEzZ1uDILQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf1Gjm+41mBJRfnam8ziY1l+1ze7PwUw7f9T6+XoWLy9S2s+90
	fdyW8g/cTUDAvR86/rscq1yjLwgEUAxj2ELtjqL8B7IXE+0ZomizzqoyWZO1z+5Mz1P5sroQYWP
	KEtODbQRxwE8lz+2iBpngHykDBtQu3HREPFhbgfKP0ngdU9ksHjVbZ8d9OItZwrbvz0+S2rb6tg
	==
X-Gm-Gg: ATEYQzxzzh0mYR0DKdJYnrJMcyc0UHp+ALtwQWyI7WKgRnb6iYTN/s+ok7/wbWtREpF
	aVYo+xgqRZdGtTuWTNd6CCa3XnEUzbZpjHO5A/cBrxrztWP0IKfwZM8XjinYYvrRGJ5p9XPrJcH
	Vbf75j9N1J2B5lY9eV/0gDWrMZNBXK7JYDDEjn6GUBE0GExTG2rSIxy8gXoZ6V/wLmfczwrvMsK
	qJ4J1JEc/fGZ3IPsLYGAMn/oe3ULRE/6cpRdUm6w5jQ2UMRrqeia+OxqVjOyMTw9kNEyqj/R9+g
	mKpSSAx7kOVA8BpLNCaEd31bim31qtdDTQUqOcjwjIa4lHvKRYMp77nQhJnkMHcicmQLfP9NPkg
	rWPiCYz7j5Cja6o0H54lKBZ9KrRLcZNJ+xTnhFgf1uDbb
X-Received: by 2002:a05:620a:4481:b0:8c9:eada:f3f with SMTP id af79cd13be357-8cd5afaa760mr560825285a.67.1772701776976;
        Thu, 05 Mar 2026 01:09:36 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8c9:eada:f3f with SMTP id af79cd13be357-8cd5afaa760mr560822685a.67.1772701776532;
        Thu, 05 Mar 2026 01:09:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:26 +0100
Subject: [PATCH 3/5] ARM: dts: exynos3250: Drop duplicated I2C
 address/size-cells
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-3-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ET7cBxh4ZoH3YN/EYv8cNqrlKIIjGzn2UDYqXcCK6Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhHF5APwpdgOAqymUIGEGtC/e9vFagAeyBKf
 3jTywOELFmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalIRwAKCRDBN2bmhouD
 1xCnD/9YybO09CYqjGiaazgfzRedT7I3mzW26QoSpBWP57AxsfDi1dBnylZi/Gog6EXrm4+CI6B
 TuDy5K1MwuJ+nsbLxkWZJtjqXDsBcZesczQp1/Cj/8M3wPJYdT1CI+AggyFA5n3RwJbO8/7aDhO
 VWkRNZJaCI79dgMcW4C03eacgA+tV0G2SJBtwfhQo3YsWLp9v7CM0VW62yJ/z8AnPWKlOCnP8qD
 CoMnBrK2he9j1ppabWuXowCAxodgM8jV43a3NW9T2EAZGlKxlvdU8mBT7H6sTyBuuN7Cy955Msd
 V5dw5/o0g46ma5bfbyG4kvzSoF3A4DLUYbt4wjtz86g3XxlMHLz3PyBMaIupXuMYGrfTFzp2j1z
 4q2lNnMxCGvZBxss9PxaZiPvMk6c282BVdlEdmgL73OEPCX6Q8CuMrG7R0aw4zAsRA2PUBjTd0Q
 OKl03w2MeMHaAeOyOEJzp7x/5cKSnXbVXXT69XljhizTAhtrUFsPAawwbPX09wL7BbaS3sWqlyu
 5Z4gmGtV9rrgLIUA+SAKCrmZH1ZmTeVhdaUJJJw2KPoQbcMak5noS1A4rNGhJVtXW+MVYWEFgef
 9O9/KZsSLBSqogcO4cbvmPI3ndunTZIqs4UffzsQLNxL7e4gCC7Por5+9kqfNZGnBgyTH+GfZ+R
 Uz+1A7HrmnpvIGw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 8OjUNIM0Yz6_ep57HPdsM6qGpNohU-BU
X-Proofpoint-ORIG-GUID: 8OjUNIM0Yz6_ep57HPdsM6qGpNohU-BU
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a94851 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ARXnZHKw_jpq6KYG4RIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MiBTYWx0ZWRfXyEhFxMyY2Sp5
 1eK0X+OsjvRtoVJwI9SU2HeGptIK7jrjmbsO2+6HcpROoOkcOv/ZfIlB2va+NmPC3N3ft/Cz2DI
 RAgLOtt4ErtJ8lqDPYfLwOsdXII/YXIfGmOEFq4+9IX1FK0+ZC7KTHsID9MQBv8FOeLUmpQEPMn
 KYA0sTLFVbTQuGfN8HEgsZB6foiARBkZ0bwJVgFIHN2VUe3onRxZ158GL2P7CdisTzvpD53aIM6
 0JFE6Bp7W2+JPGM1zITqL0HdNtlNioCiT9uCC8ivhOrM/YnYEUVNCoErzomhgW9pDC1kwvAOBPW
 8O9zEkIvhsgXOJRvtJHMWaiuZI8zUc6afHLOg91+zCZTJUIUhks4nM52dhfTNDLyP5T80C4/qZq
 ZIWC1+T2iuKHu6blk0Rb3L+UjtQQWUa0mMdV+e6vsFf0GnPG91bhywye0+J+SBwVIK7Goche6bN
 pqL8hcguivP/PKfd7xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050072

The DTSI already has address/size-cells for each I2C controller, thus
the board does not have to define them again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi | 2 --
 arch/arm/boot/dts/samsung/exynos3250-monk.dts    | 4 ----
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts  | 4 ----
 3 files changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi b/arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi
index 3fdd922e635c..059c0f44e164 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi
@@ -74,8 +74,6 @@ &gpu {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
diff --git a/arch/arm/boot/dts/samsung/exynos3250-monk.dts b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
index 68236c7297d7..d59ed46614bd 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
@@ -191,8 +191,6 @@ &hsotg {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
@@ -414,8 +412,6 @@ buck5_reg: BUCK5 {
 };
 
 &i2c_1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <400000>;
diff --git a/arch/arm/boot/dts/samsung/exynos3250-rinato.dts b/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
index 36d2171c1ce8..fa983b732898 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
@@ -263,8 +263,6 @@ &gpu {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
@@ -594,8 +592,6 @@ regulator-state-mem {
 };
 
 &i2c_1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <400000>;

-- 
2.51.0

