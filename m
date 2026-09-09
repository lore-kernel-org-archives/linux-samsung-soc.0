Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78A256B85D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963488; cv=none; b=VMFl4fKFx2tTNnwVDpRItCYOSykYIs6ajlbjDF94wtoiZq0RmFj5mbGP9wytD5r/LAEKRUiF+shK/olM+22lTVYCvMvb3MM2Gm+98nZOz2z0NClvBpkuHFE0bLmA3rWo4X1ETB5kEzWaTarIuNCeXnWB0yYHDmDl2x0y9RQzi1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963488; c=relaxed/simple;
	bh=mGJJghFSItEhhFNqrC/z616uuKMInTO+a8FIm23jRQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Auso1k9FYrIJuoK2zYXzXxXfUuABM2y7by3dqY2fAEydYpy91JR3QIyXcUB7U86SKgYC8W6qBhA+O1Dy2KiWC1D8GbyqanVlVDZAJNBso7JqI8jqSoegeqhFiDRwBDR+BJr3x10tuJ+vKmoKQnLXU7R72/EoMb3F41HzMFSSF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzpJHeJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMgFXtMn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzpJHeJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMgFXtMn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCprF1401036
	for <linux-samsung-soc@vger.kernel.org>; Wed, 9 Sep 2026 14:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=; b=UzpJHeJf8hlv3pxg
	yKv31LFTgKIFGnY7P7QAKlfHUPvZJp+vWADabvrqDzLJ0jOogQuhxWippFaoI/5b
	RQkSgzQqRn0Ewkwz2GlIkbZLJJPfslV8YLy+7aasW2+4manAh9XRt/ukayGZf0Kq
	SydQh+Ljkif4K2wIXT1Qb7wwGIntc/9SqLyN9IYwgk7vhJKLkxOXZ3G/bgYX40Eu
	DlJfLa3h5w4fGmYPYMn5tzvEhU59XNVqvugYTUC/bywpB0JBm62HaEElBQzjGHFV
	sUj6m3fL0ZThH4pW5n7EaxXIvR28+H5pd5ft6KNNFgA9pO6fZqdHerV8thBA4/nm
	ebqs1g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x0j4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 14:18:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73858d44c8aso1316594137.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963485; x=1789568285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=;
        b=TMgFXtMn49hRkeDB4V+bEou8t168dFdOfbmP3Fo0tnBA9gR8+gjWpT/7jDEDqsHz1W
         afZu/Gs+p3+ryyMYligWQEHnkadM6jnt7C7QM/Gk7GuvPBrC9kvlprMPLwwqI/8tvNF2
         Uwvw0UPnJUxYFjjt+KSAGNV9QoN1batU+obQ6Y1QaRPqklF2jMJa0hABNzIlCd3YItjR
         6oJmEYBvL1jvF0o0eQSDVTF34E1nSrHWEU2chF7HXETKJL6ayN3BPp9zTGH76/OaOLDg
         Hc9oFVI97pwZEUXrKq1DWxloQwUrthTsGENSaAE21mx64yu/qytMJoFFY8UXr+pEumi+
         Yolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963485; x=1789568285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=;
        b=jif02LE6JgnAJOc+Tpsz5H/uTyFmllftclRZLod7iqgnnpzBnAsq8X9wQzQYEjKXsd
         JlYKK6RTHzBMHz++a7c/qN4OwAF+fSg1G/3UtyETX17cU76YI5o+MdQjhchyzZJn0uyU
         ziDXqLM2FaYkjz1w3lTZF5WIpy7zRJgnR+lp65bTyxukguU25HT1FbusqFa5adaT61zX
         HDsCYun4l1TbJONa9BadOuR7KAqMzBlyOTHjkoVZtLS7U85b5aF1/Ut8oG0AEb+gjr8U
         dVR0yBDLIIhPxlnh8DvtsUVdnyKSTmX1DMdmiN0NtRtTfEyV06vuf1BbYcVNVImhIjxM
         SvNA==
X-Forwarded-Encrypted: i=1; AKwUvBxNq/jg4lRF5JjgXUdiRn9yVilMB18KeoGdVpgKUUZQ/t+az58mXyNwb3owfKHXgSiLXIGDhCWfQnQ7qQeeyPSMdw==@vger.kernel.org
X-Gm-Message-State: AFuF++lEEgH0OXim3gqiu698P0fU1sWmAcn1o2LSb/UyhXevs2+GrvNZ
	c/dKCFVQ/K3ooOd1EOIpSLd7ee9iDoi7mCryF8UFILz4bkt+ELjHQ27os/Ek3zu9Bsnwgd2sjpB
	q/i0nTC2EjpaE8lAcsIDM214QTtSgUK1SJ9m+gMSgth/o4xxOM29FZsTcqR8ksqtehQ+Whaqj4A
	==
X-Gm-Gg: AYBFou0z6Sn6X5LQxgbs+MGd3pqf27BfXh0i/wd326QrY6eUu12QHJJbSI6ax04W+nv
	iUen9qkAps2UN5wrp4mK7SUWsJdpZAL3OmJtt+r21ANn/omOjXF5W5O/6X+X98a+LMhTB/B66CZ
	RjPFO5v3hlPLg4G48cawF51fFthExsB8/VbQ2jwL8irlTirk5pwJnWDQMMbtnENAj7JpIhzJx2T
	jAw6y1xLpZFP8tU1B1cTumKO0njL83O3fpPhT5wDKRYeHcemkI4RI9znzuRNjxzQ4eCMKy1LPpn
	dE/bcAht7mDauiaYQtBdqA34M4ST0s9mDxYVhmVoLs2j5GysyY7zZ6W2nqdo5rsntcwuHAE+/jE
	tfHSEES+8dew9CPcsvD+1ur8=
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr14276765137.7.1788963484682;
        Wed, 09 Sep 2026 07:18:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr14276686137.7.1788963483961;
        Wed, 09 Sep 2026 07:18:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:52 +0200
Subject: [PATCH 1/5] arm64: dts: fsd: Fix indentation of CPU nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-1-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10829;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mGJJghFSItEhhFNqrC/z616uuKMInTO+a8FIm23jRQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqSnUhp42JJuvjT3lk3UeBlFe+BA511LjOHB
 X1afbmVYLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkgAKCRDBN2bmhouD
 161AD/9mHusuedUPugo8y7rihvDXRj5hNQMmPMf3I2kYcmb6DlNz5HFEBKiA93IpMmRcmVzNVP1
 jOt+GuRW3tth3JwhtIvFwkvfQ5xVU52RHaImHEi73G0VF27aNsNbEuhz5r7J+uMTE5cfdFkWZ6/
 mTkwuWw0vzIH4z9VB4n2mRogC5rcUY4jTicX698ADjh8XJz7i8v1JPhfDIvcMyCzFCHhfdXdjZ6
 DY70NfUwa0yjE6m8PPt62Jr1b4GQkQHd+yus1z0ZctWG06gf7xHEHOIThUP7Tb0h8L+wr+h9Sof
 TmK7/NVPUNdyKklcwBN/fWGC9OCLq1yf0uUWODKVYOZIgA86CLEIKozYiQgRQCrlQhxl9V+GCNw
 kKDWkKH8sJtYJ0TER6jKd7P8pw+zvl988ecA6puaWil7Urhffx/Z6hsUntSgB4LL9CSj0eJENhk
 7N5i1+kKJYie1VM6GkcYgVtPKmAyUtVJwHPsZ+eTOFDWi1ayRkJkxn6EVEioQsmcWVrpkA9waiz
 yBi2I2PtS5h01MDdsb2x52sefkdhniAZKPK+Si1dxmRd20nuW+jQ/sgOuJllKrn/nfuK1fXi0hP
 0W2il9WcZOM7jm9YGxaTGW1HgMRxu6EgCH9NuU9p4NzV8dNF6unLOUy+bj7TxMl8YCXJSTjSVDe
 d1/lHF8PegC4w4w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: gqrK1-owQ4QQSF0oFihTVX2Eaexr2-7r
X-Proofpoint-GUID: gqrK1-owQ4QQSF0oFihTVX2Eaexr2-7r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX8TvcNe/kjSnS
 j0GarxF8z5BE4vejB/GDY1nHS8VmpwYSWCGk3JksZxfoBetWnYCsFTsZ2ob/idWwL7JoxMdAmig
 DPlFMRmmw/pNZvQ5bUz7h8l+1wZFphw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX5GNQP3o2a30s
 vbCnTpCT67iJu9FdKLMyeTxVAD3P1GkDD0pSdc32eoGie9yPXegu6BqqkyewsRVJN3AWyagkeaC
 gHUiKml/tkLKWITCrE09Oh7ggSpBdYNJ0FRhZqwmFFsWkOdurOEKTbXoYZxmySdrzBrte9Tgv1D
 1NlDjfunM8coTc+EMgUWwwhNE0fgeLV6QwGj8baW5SvDyZ+CH4hl3ui6lVYPB+5yUwyAN+dlzZD
 eP3u4axFd7rC6CRPP4CjyzogKVgg8sflenhKM8/a/vzB9Sq1FT+NSPt8SZJCaqA0hguUouQwMCV
 48NHP/mgTm0hfTYpBJZA1gS4/HKRrUv0iU2oEScKSL46yWb1evn8d5F9GSO9hIRom+mTXRnKzcP
 ImQcDlsRjvfBXa0qDgr6pd8tzHOhnmVH1BY56+4G4s7ETaa7YF1r/rHV3tdkvWDxtpI7BUyxD/m
 Ovzf1ER+xxR0j66LqDg==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa16a9e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=X3D6fG5ZlVyqGMLsjZoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090160

Drop one tab too much to fix dt-check-style warning:

  fsd.dtsi:198: [indent-consistent] indent mismatch (expected depth 3 * '\t')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 310 ++++++++++++++++++-------------------
 1 file changed, 155 insertions(+), 155 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 6766c78243a3..d076ea634f4e 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -96,196 +96,196 @@ core3 {
 
 		/* Cluster 0 */
 		cpucl0_0: cpu@0 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x000>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x000>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_1: cpu@1 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x001>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x001>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_2: cpu@2 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x002>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x002>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_3: cpu@3 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x003>;
-				enable-method = "psci";
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x003>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		/* Cluster 1 */
 		cpucl1_0: cpu@100 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x100>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_1: cpu@101 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x101>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_2: cpu@102 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x102>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x102>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_3: cpu@103 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x103>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x103>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		/* Cluster 2 */
 		cpucl2_0: cpu@200 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x200>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_1: cpu@201 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x201>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x201>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_2: cpu@202 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x202>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x202>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_3: cpu@203 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x203>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x203>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl_l2: l2-cache0 {

-- 
2.53.0

