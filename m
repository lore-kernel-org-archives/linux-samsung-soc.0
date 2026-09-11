Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936243C048
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121991; cv=none; b=b/3UJWaQFCbD1eWTXHvktOozgrucjMDaVp+g9NHE3AldBw5X9/Dd6WY6zI4ZLypSujFkBImo8n5DnfGEgmzyEirqwUBYDAR8OvGhkFuhPqUdU10zenSsQFnOtwYb7X4lcTmYezjmpG0OmJRMj3+1q/KkdG5y3umd9Wt7m9YlBDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121991; c=relaxed/simple;
	bh=vco5czYvy8Dqq8yCRPA7S19Gw3sKCZ5D1fpl0hI6ESk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1P4YiiJux4Eq2qNuNixdMoogvEp3MZGW73aEUdUwa9mGW1qgsHbThWLPWz942O0WY1u9zWb1a4ZDi0s5a0NgAxn3rCs1ol09vQVM0JTFTmA/i94AYlDtSUavKhHSqEsTDodpE8GLgmx6h4njNmuOoQ6gPjsGNPSt65mcrdDPhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGrHmxuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aotEifB3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGrHmxuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aotEifB3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7khb34045772
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=; b=mGrHmxuZgXMkVtCi
	8DlMRKIh6kDJfzNgMkAUsAqMAHbuJTVOX6PD1ei2I2S1vuBAMmPgDM8XwEj7tePo
	upaxFnyDlMp1opOpejlbuW6qZGz6TMpCcxLirPwkKnkvPy7bk2NIU8c6UAa1ciyO
	l3aDWtsiOpAZCAjWNZMusuBA/49fjWixQbQyVkskoOXFDuEVKRLCHfd9S+9e1MK9
	qh+DntA7aE73/EXhN+Z+tYMEWu+sYf53Sj36LsebF/2n0YNEQ8lyy6IaJTrT0BV+
	gWIYXicRPID8ddkTTPkbpJh5lGGliJ/JjWgCE+HIijbldBuLjiArO+uIvbZfo8MH
	P5FIGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q12yyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so63180485a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121986; x=1789726786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=;
        b=aotEifB3p1V+UxxlYE/Qrq0IJESkasMRQWu/31Zh2OTbu8aipIdN4++vpfmOa1Zp7c
         w6o2zWEVN5XMxrQALmutnQc+MvqQclWPxM3br1PMkoexrQzi1xm1zIH9wmuz49DCGm4A
         KhBt3ozwKSO7/uAluzdfQouZx8infvVwJXgNSIFywcBFx/GsdxUQBlv/FD3/hE8t0q50
         0NAMYQalJEyNy1vfIqmo6UvhJkUzThSbFk5tnJEmR6QH29RjirF+tkFGobrslPTCGt0P
         kvi/3mxyYTGyXnKMPWDfy59MaAgSF2NMmvyTfRf1XDvoBdGdx+ivmajW20N+J2p04Lfg
         0Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121986; x=1789726786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=;
        b=WGDw8mC+Ufy973NNFrSA6qc/AL8AJaAAQ7qogcSq3J6fwgYCEIAwiPuyPYSBuCWmT5
         YIB/RtuLsNcuYNRp/QAOjxiIa9KKk3J6ujihvdaxEhSKBfI+eHq/vKWj62asFZz9lpQF
         3g70N2cpaO5/60tzkP7QYd22pdBOZEuVcp/BCJM9+NnN/f0mphDK3LshRnZAsI4KEb0N
         TUDgZboqtbF9PGBOdrVDNobj1csdIvgPdVv5dZdmZ8tIq4e1CwE6hRr6tqHNfoeSQRrA
         NHvBrEuQcAoUHLnY5zKmzDn7SHWDHPncBl72+w819HnZB+ZTsLS0j6+84P2XpaCbPnOF
         yogA==
X-Forwarded-Encrypted: i=1; AKwUvBwDdRHMe72b8Pat9MB8KKssKA0y2u7oxmfYn+ayogKQJ0ZMigBXw4o/LXLKeR0egtePrXt7XZjKW54fw0x1fqw/xg==@vger.kernel.org
X-Gm-Message-State: AFuF++kEGcD0VK/vLxlCROfCY2PpdVO1t8cm7cfcSaNU+nVFteOeKa6Y
	eXU5zzBoX2FDiB3sVNcrShtV+5q6jgibTMXb+jHrcYoA1LuSlAhJPESI4TwuY8Bjzk61Xikycbv
	fGOdLH892E7DD5JDzD8fxB/dV9vTiaStyZRBZMtetHLAwZ0LuubELUkBRX3F9FKGH9Wj6ssLtdg
	==
X-Gm-Gg: AYBFou1FJO7K95Y5SnX3KRjeqy+vRMGo5YlOM4BUd3y4M4X2V239vsmYwQRj5SfawSG
	sT2LiPpOuB4d+SijmRFYUsItYQouCqlYXCa+peLi1cdi8iGCq8uCPPdfZc7/HJePXOA9RIlvREp
	Uen36oVo6V8+XvKX+msIn+iICTdC48jutJqe6hbK3wsmSjgwZufv27Yi7oaagZDNEMVmXn7HnnY
	qGiwIAbd0T4rNvxIYR+DIKnBjBDZlqgH4IH2bpuYbTeFIfTRaOlQIn/N43A7NSiv6aY86cn3ArO
	23OivJHH1LIjV4ovrdInbL9zMkSl0JoU9XzNsv23YUKqeqGiFtcMejDpnXQxFZ0wCFRg6F+8b5d
	RXkPJu0Ah+DyEE/Q5O+FDPDQ=
X-Received: by 2002:a05:620a:2806:b0:939:6cd9:1fa3 with SMTP id af79cd13be357-939ea0e6c84mr438847085a.4.1789121986438;
        Fri, 11 Sep 2026 03:19:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:939:6cd9:1fa3 with SMTP id af79cd13be357-939ea0e6c84mr438839985a.4.1789121985851;
        Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:14 +0200
Subject: [PATCH 06/10] arm64: dts: exynos2200-g0s: Re-order properties to
 match coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-6-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vco5czYvy8Dqq8yCRPA7S19Gw3sKCZ5D1fpl0hI6ESk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9Wr3HcGmsAwVxD0+CL0kWH34cqmPGClsJVqn
 IvuKMIV2mOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqwAKCRDBN2bmhouD
 1wU9EACWsjwmfkQv7ieRcIAag7lPpS5DcrTqm4TRiK2v8XxLoZt8D12U6YK+Z+cXJTI0W8QTphY
 czKOWH7V/JYVgmBpA1GP0As60ahUJ09ezo9KINsAwGz1ndkD2OK4vPmSA7hhWNtJQBmFZ6x+O03
 Hf1EZKtee/BrR4uEAxY83KMA8IeEev5sXD95EGdTwj/vsn2C5KfKMIi1zwDI/13mK42lh/KjcLH
 +1zx5UexwYXulkzG3DbQxLC0Bt3A70KKSttynvc/dUiqRYDqipMRYc83xwiQ0FJnEGyBCEM34FX
 OvFJ46MGpWwDVxo2uQAQFoEHOyeNre8nHY0hI8noRC0qJpsGR/4nNehsXPaL80RVSx93c14yAFs
 9mXgFMRrfRkvLBUUSUuF1Rsi8tqoa6Z8f3wtD1ovE0xeVz7gqLqaKWZ3IGP+lNACKsCtFbLjYQ7
 NAfjXPbRPLz/3pWOezTZkP72wHSgzjWuSpRL+Xh7e7iGeSc+OiQmYbG+NlbQjSBpm6CRbCQQ31w
 nwmnKaDaVAkEhvR9u/tZgOJevrFcYMCZUeT17hRQTBKiNYaXuJWvYFSAYR80FT+Qb8VmxdEHmO9
 L/S4sHaQh/Ahbht7OrfrWfE0EGjWQNED0MH2jz8sHGqKUZ3CTRsRREZ0hLtYTSZm9PPEVUpZJmY
 913o/nlTqWv0/xQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa3d5c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=webegsIPGkF9SanNryMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX+DwXu/DnKcz8
 p0KIG4ZeF9xEaV2RFJ4TtZUykJC1wS3JSe/t2AKaXbVouTD/MCmzCGZ6oBe5aJ1Qoz0bDNLnLaB
 aQ/VFrUOsesUhN7kRUzzh8fN1V8zb1CrgkFw9Vy9HKW42sh321XxUvSqD2opSvDHGwMH2lMfpbG
 3jLYD/3MOue5ZOwkbifknlH1a7BkPl76tybEhizovJxZhQIYmglnkE5GI67EvakhbOR4EP/cCKd
 o+x+iisH3NOvcHHBjgcXm4JOrrSsbTKpK/3MSXWiS+rRorRm+DEYcroj5oAXkorKCBELOfWPKuO
 8+U6H0erdxi3L9hLyj862qAPD5zxa6gzzp3vJL0Rnwfb++FXzKpGlEkc31kPFED+kuYwLgRWY3r
 /nURzfQh6fHst9wU6HvnDcpiy43Oh58xOwFVRs80Rml2oFnwyJtLiw1kMrds9bfKv9+5FyVaaYh
 sHdCPGUohTiU7JV0uoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXzUbqkczKF7ba
 ew+13IUQKX69PbRruTYWv1ZfNXeRld4mwJJx4Q2CdFa83PFiiYE2bE4xukqkJWUekPBkKuzfQOK
 16XFEI1UeHksYXAFfapmL1EpaTEbn6I=
X-Proofpoint-GUID: Qp9A9ySRmSSHGzta-MtTP44t_epSEHGn
X-Proofpoint-ORIG-GUID: Qp9A9ySRmSSHGzta-MtTP44t_epSEHGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  exynos2200-g0s.dts:72: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
index 3687bbaadce7..30772bf77252 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -48,9 +48,9 @@ gpio-keys {
 
 		volup-key {
 			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&gpa3 0 GPIO_ACTIVE_LOW>;
 			wakeup-source;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
 
@@ -67,9 +67,9 @@ reg_dummy: regulator-0 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		cont_splash_mem: framebuffer@f6200000 {
 			reg = <0x0 0xf6200000 0x0 (1080 * 2340 * 4)>;

-- 
2.53.0

