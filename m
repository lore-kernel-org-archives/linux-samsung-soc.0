Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE85432E6F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121993; cv=none; b=ZEEjB3xwbo8K4sou1qQnP094rlGari4O7biLenCr4i54x5oNnzF3CuA3F/OxG29rMPIm+NZdOgPphFxd7RwD+yMJJWOAO9eiqnQ0nE4hq1eyEqAriKzDmfFqWXJqFqQ3yqZu9ynXV4/iuIXNn7dHs7pmjIZxVJ5Z4M4uUKIkDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121993; c=relaxed/simple;
	bh=nTXyroLaQt342/D1uOTDxQ4VLOxeEnoOXRYineJExcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmfxhOqyIFpy5n7CGud9AMfJ82elN0sQuMVSryjtailTFo1tdAopcrklRc9pjJ37H2oqAIdRNQRpo9fL0EHyOi/Av29xIrr6S5btvPO7+mioIyNVNMmZi0fT7lzNUdA34oivudRN9bY/aIxMQD4o/RYOG+43Ftpnemw0PwPiMUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0oI5a+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPZJmo86; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0oI5a+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPZJmo86"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7koM73464007
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=; b=h0oI5a+46j7w5qXH
	Lh/EH92KJacD6FE3Jmhkm7JGO6lyM4Lo0k+lyR803js+Nnqei1iwq0Hrbo+CmPgD
	7DUp0HxzfRgbu1GbIt5bTqBQrvfV/Ja9C4wi9XNVu9ANeGnlY7lStXPKHdHitVcw
	JPOWTTFlzZ0JT6DNloFUWYIjF4XafOIQGQAUmxsUmkOdJ/EqyO1RPEcezkRD8wkt
	WBwgrEg0nCI1mhkwzLyVcIs0h5ocWu0lo7rdUxygY50qMoDoSXEcsL9NnrL00n5A
	614Q35GadzgnY0VaDUdrM03q1wf/zmFko+zU/JhAo2T1eec3Xj7Mg1QZruyDVTA7
	hZx2dQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr9571-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so106645785a.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121988; x=1789726788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=;
        b=kPZJmo86GBygj5H9hwIeZFR9UHQQrqoYQ/uY+w7kOO+QmdrHrSmPceEQROZWRU0vw0
         DfNCae+Ws4rVDqgxBui+ee3tJlnta0NW7C40KVl887FE/HADQLIgwlxrlFszCbWa33rL
         lQQy5gr9CQs1Co54hpb2SCXN1Go6w0GcT4GCYUcBbkARS5Rcj5Xk5EZ+QNdCuu4XHOJT
         /oH8awKMpQKAOLc6l1xM0gR4iaqwV1I8ISZ/x3Y1Ze/AE/VZ5BMlvhicIjeU/wY8Pwbp
         //Lwh5qHIS/cmTjC9GL1Dhg7EI5ogjs1l2msKNJyqebuzpcbFIWvW11JEHpW6mU4iFcp
         St8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121988; x=1789726788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=;
        b=Wcsj7ftqq8qkKfmPvPxEhY30Ik29S+egjJnMhi+FSQ/2UbI9fMB0VO7qihAy4MVecB
         JJpRGL74Wih0C5ldDjTvYaJjH1QQlIi/4bW9rWmNhWXXNQv2mvUz/FXae+vGHuLkvDRa
         jkKgaQCKfUU1RYOMxrc/X+WSooC+dVAkpSC1G0yAOr8zt5t6L0gZD2+S9TGlfNcxelN5
         1RP7Vwge9R8jTmxicGjFGhbhJooUrxqNkxznpvutF5YVpl9l4IrlJK1qnGa1vGAH2UVT
         lJQikh6VvF5tGf/xiW982bO4Uee30id9vD/9bt7tvD7Mt1NM7jTPffc56ebKYDsuVCfy
         CvVw==
X-Forwarded-Encrypted: i=1; AKwUvBxichjGUzop61Lzud/YTfeR/oRnqPHYrrU4zNUaj00txKVysoIQHutRkKzYEYPzmPPCnK8W9ZTm8CXdFcs7CUptkA==@vger.kernel.org
X-Gm-Message-State: AFuF++kloh7qJJTCQzIFzlv02tovBMlDcpydyMOU3WvJe2c5ukjo0T9D
	xQmYhA02CikSZj/cxjLJsJJ6AJd1OvN2py7ocdVRplLVHT278VktLC44ddlmo3ZojzNkdhO0lL2
	thzvhSu5UIagzO+W2ZulDjGkFxwSw6g83cHEHmZEmGujGaW8D3jXkyPXPpSibJlb5fIeElGyvSw
	==
X-Gm-Gg: AYBFou1dV9MeMRgRTpn48ORKGbNg8dRN2XDlbEt7c8dlO9DpjW1ObE8nle23buqhqo4
	TkaFqtZ1uHghAy1mhS/2olpqO5ySXNK7IIcx+WomMhJF+Y85Rzmc5CYhp/D/1KF6JXhObBoqsff
	3/uxIUirzPH0jtnFxH7A+/aaWEseoXZRPqna9Ta4bqOHIeQemqpCVw5F4S344pA0JZHptJpGUWx
	xwxFTeWjTFW2aE2xDY2RBjtl2/WwGEGNy0/qIsyHxXASZf7hgrMWXe4R94SXFuQKoc0I4c55s78
	e6TpcOtLUUHj+fgbJMnSmK/L8M4qdQgBXYBfAjPzmNbweW/eBi1VeRjjEKz2OYZK6eiKh8ChQ5g
	cVI/IMg1Qb2QCHfgAnUyZRBU=
X-Received: by 2002:a05:620a:461e:b0:938:d7e4:7fe with SMTP id af79cd13be357-939ea28d90dmr377176085a.37.1789121988365;
        Fri, 11 Sep 2026 03:19:48 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:938:d7e4:7fe with SMTP id af79cd13be357-939ea28d90dmr377172485a.37.1789121987910;
        Fri, 11 Sep 2026 03:19:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:15 +0200
Subject: [PATCH 07/10] arm64: dts: exynos2200: Drop redundant blank lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-7-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nTXyroLaQt342/D1uOTDxQ4VLOxeEnoOXRYineJExcQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WsRKh1H9BOmCvc5kCLtNi6rt9pY5DbWNDHD
 zBIwgtGfy2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVrAAKCRDBN2bmhouD
 19nHD/4sotXF2SwfMxf8rfuKvpRrDnrTxU+sgSXanMpwDYNBOlfQsjBVMFljPu5DpiyNw5bPswI
 CLAIm57J276BQzxJynFy1N0J6+zKWVPly0pBXHqdDXFzRf756o7fXCQo0ulPUXYNYZBHhZ18JkR
 +Q7OiwsFNVT1plZovs5GZ/o7MFnfGLSnlDhC0PzTVdsQ1q3CwbvBwKA5HFrUOVDlV4YRUjplpQJ
 MtlXPF/R2h1b3gNb3M9BADdaGjXd755ZTR4AShx5QPFGuV8REmWUAizQD9WiL2fWsEpQO70HZwh
 K2uiKd5muhqdK6XPODgFcP0ENuORTboOPZYf2t4v4oIDs8BU5XKnYtjvfMd0d2fJwgL6DWkP8Ay
 4K7jahtyBE9K3iTg1J8EgA5fHuM+FcCgfkuw/AGxxkuSQOX3yx4dFEEAN+/oQZGoRFOoyAY+IJa
 Fj9NFoOZXA0BA+lakio+2XGW8PuHkAzpcJCFO4s7LriNnZelf5MXIyOAu6eFyp5baVHtBlgmpjt
 4aQtMRc4Ovt2POUw3T0hs8kd/X2nymXHQRt9dvaXXIti/+CZtvVMhP3bc9TFg8LRlpgm804iNxo
 dhAn+87Sgg5Jr0H/GZmi0sOEMe8wEubvpXaRLQJX5NzHy9od0OTgy0SaauJaNQ0VskvOY/gWarf
 tR/QZB/wanoS7Ig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: o5RfX7ISkZAlmWXOSxQoZpR-nbnkahnu
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3d5c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xquRIdCsXmQ3_dtbOSEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: o5RfX7ISkZAlmWXOSxQoZpR-nbnkahnu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX2gq1ofGf/P59
 Skv4TBfEw294mPaYtgLNEQjmXAeCkwtpz/BQXnAWvtQjX4YSlKnwuCW1AuPHDzKvrjb5xTM2APc
 c/S7u9Q2KWA8blIT+9aTlRl90OJ3ZKw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX7lVzgk49ogL4
 YnEezeOriyT8kKOpVGcUIkEBHJJHVKa/B8/2qfddhpzzKWjYyZq2l4m2ZGC2liFEbz0dlD/8/fO
 Fh1PXVphtXm8gW/qJCiu7O4j/mwJPz6+rjwOWj6YVteJsF4nwpXHzCk0nSBKb5fJfURrggx8Xgy
 PIks8yGPlGLXWgtSJDdBWQ9Bc3n5h0Bb3qjnxRIjOPShYoYBQw0Kf4/IXrxR/ny49wlGsn6xY2m
 BPIv9v5vgWBgg3605UD34QE3n7Ubff9GXb7t7AffZcwBk1BKneD548UoJ5OAM2ATHLapWr2NcD/
 2m3L86uEZXbNVd9iif7F/Z23RW/eLKnycrimnD/EzyTqKpJSDRD5OPjj9EvcJxU9IqWfLS+WIYw
 B5OrZdDTua/3sLSBvdimzZiWZsQm5dsxatgvAApzpo79+vjcWlaTb0egsRPVDR0eORnyAQCbLzr
 7nbgVTzV+fI+MLDcfWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110143

Drop stray blank lines, as pointed out by dt-check-style, e.g.:

  exynos2200-pinctrl.dtsi:705: [blank-lines] blank line at end of node body

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 --
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index 5877da7baf5c..d5aede3af15f 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -702,7 +702,6 @@ uart20_bus_dual: uart20-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_hsi1 {
@@ -1171,7 +1170,6 @@ uart12_bus_dual: uart12-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_peric2 {
diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index b1c134f22324..3b853d66e19c 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -712,7 +712,6 @@ hsi2c_21: i2c@10970000 {
 
 				status = "disabled";
 			};
-
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {

-- 
2.53.0

