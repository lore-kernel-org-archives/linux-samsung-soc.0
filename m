Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF534C83D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146347; cv=none; b=WJGPevUK9NsYL6pMzKAEwmqKb3P+lj2eOOkRtK1tXcabV0hbFrp49XBzuq85rn12oRvmq8hGjzq4fZPwp9gwQA8Zir+UgC8dppX/aT28fFZCP9BfVrdP1cxTgme973+wFF5hkt9ZdVh8433MDvLL4Q/vKtKAZoh6YZ0qQ1Fqg08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146347; c=relaxed/simple;
	bh=81K6U7VafNJyQR2ZQhA/gQisDZ/YzqJjFN8sE3S9KJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6E7WD0l+TCBG7bUfQa14QA8TY5n1H7isZpJ6I1MXK0ehzxEgHv4rMtuM3beH0q3lbsUcMVW8O8iS74f/JLF3K+70PJPJEQsJmCecMMceZb8bkZWsx+diqLz+KDEUC+QgdL3rJAoN+kkNEeg1ai3z8RusxRGTKGXz3t4szw4jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnN+8QeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XwLmQbKJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnN+8QeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XwLmQbKJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B8Mb2E2277051
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=; b=EnN+8QeEnkeRVJ01
	Nqeft8QRtV4Vw8k1szM1XMuRIMxNqF8znOGkkaQmZIyBJ4xU8RxxIlBH3o1jEk+0
	S7u1qMTCayaEFR5RwVYZ+mGLVhib+g6cVqgk+pFv9fcwK7UHpKBgqVpgW33fCauB
	z6zeyuP4GgQV/SdhueGD8ceSw2bNs7T8GPUpOqKb4fUagoivScqintzcCb1nC3xQ
	1v/5BdmU2ptWbdx81p3mr/VZw1OPywz6ed06QeOPFnzUkxkhySZD48u52Mli83KS
	YRXvfI/A09EtpI3gIbuAjjbyMfSXQnYzUG5oM8wqehIznbpel5GxIzsydihAHCmz
	mMmUqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeusjd9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1526519185a.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146344; x=1768751144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=XwLmQbKJrozfLPTjstVlNAtlQHTZjWomjU/l13cQwFHM2OxKSCC6sL3Ej93+0ThjS/
         r4id1fLTnEA+/LcjgmxlCqBrOY3D4G1RCMJgRw46/qrdmZM1V1MbMZcSmDvm5mGjybtq
         pObqUB2cpp0uZV67lqK4WYqjPk8j19LgD925DYrd76vPkAPSIPRVyBsc+siMtJOH9w9T
         OIIC9JvLPes0ZDT7HZrq44c+MrAjM/VVkm3eDmm4QyY0ur6klM/+2vptAOsaegIwJQK5
         Ytg626yMx+gQsVMmBE5jYTQFlsAWkjENr/qypZAx64FyWWvmp7VSDuXBhLuft68B6x/7
         F5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146344; x=1768751144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=L8+Tto2pUWqVgtXsFQWTXa4EzjAcMuKMGETCHoHfpCtR4cKGNY7QjSa1dHAwdGR9Sy
         cpWoAYqzJLGCX3C6bulzwl0DHpKaltN9ji8+P3cd9sut7Jd2ivXzlB+OMtFXi1+lDIkx
         tI5jCns+PzEcQNHWEBpgBlw+I/6cWsAp1QUPNriFNaB/yq+9mGWbQXiPkfiCTbcZ9QMB
         zH14PyEgaNIbgnacZhEHDZU+25bwJuEU0h0pn1sfQC+3G+ROk5Uc9bc+4luJNHgX2kvt
         SWm99araoFa1kAABXmbkr3Ri/UtAa1M10+KOoJZcjwrTCbodiQ7ZTVjzg+lmQTKP7El3
         /hhA==
X-Forwarded-Encrypted: i=1; AJvYcCWeieZwaTt9dXdWZ6V2mYXq95pPqTZYu3d3PmpduvJfr1ZxxdCXxuJAlqDWjrLS7mIgcqDRZEfy15MCy/yCFOVJyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQScIs79VCNZQUCR7CCC09q+pkfo1zvoJpTdvY8YEwHLGznMML
	VC7VzlXau9Q1XGaWh6QIctjmIe7gzZrGf+KXHnyR2o6eyarPF7wiz7A+o4xYfyK7JAQkpZzciaw
	huSgNKA9CssqfISXhq+Gq+ECtQqwElQJ2NikCBAlc1xFzd1Scwe62R2QHond5zK1YrI7+BiVuWw
	==
X-Gm-Gg: AY/fxX5Z17+pL4EnGd7Kjb5/xP5VD0PDiyj4lTjxDkIsjZ+NXrF222I4DoHQ12Z4BvJ
	4LFXHcmHU3ET5svOdIm56P3hkWz3EwflnccdQ9aWrUlCaG18GNGnWJfQfRofsSmNiOtnYNoEewv
	RHBbS9kEEpkvy2D4jfED1vVXGfEeFzixYjvjTtjC5rylcBnlA+cZ4MDaKBLn4GEWraae98xzBh+
	DuhJjph0iNYCyr3veh7Qg+WwIrmrdD9vdyGE0Ymkqq0h/A6yl7MNOUsLlrI36Mufhd6RgMvJhT3
	8v9lbcRWDfUc9Gch3iyMJjz7r9SoMQLGKBwvwuFRGW6d2i2SPNLeqYtgURpxuPn+t1J1zLhuLGj
	/sYkIB8P5jUy0Ts6DUMZr4UJkQCaMfxZ9iw==
X-Received: by 2002:a05:620a:4151:b0:8c1:30f8:c884 with SMTP id af79cd13be357-8c38939e7eemr2071482885a.37.1768146344285;
        Sun, 11 Jan 2026 07:45:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz9O7YN1enXB0wx3Ws7XQpMqq3t0e2A1DTAisft9TmruPQQQTLdjNv5Jgj+wrAeCnztv2Xbw==
X-Received: by 2002:a05:620a:4151:b0:8c1:30f8:c884 with SMTP id af79cd13be357-8c38939e7eemr2071480285a.37.1768146343884;
        Sun, 11 Jan 2026 07:45:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:32 +0100
Subject: [PATCH RESEND v2 3/4] dt-bindings: watchdog: samsung-wdt: Drop
 S3C2410
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-3-fab2d21a2048@oss.qualcomm.com>
References: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
In-Reply-To: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=81K6U7VafNJyQR2ZQhA/gQisDZ/YzqJjFN8sE3S9KJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WgQQOI8xuc4+r7KOXCHUB3EUibNZw62EmtD
 MMnDKY3Xx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFoAAKCRDBN2bmhouD
 1/GdEACXHSiXCBO3zmG9wQ1XItLYf7CTnukRjdr27+vLVZemIeeZXDpraN8MVn6nxSUEZuQ8DYV
 ESDTewwPGB6cX0nH/YlLmMI41ckcffgjLFSwZsZvbV2Ij7KvJ/+Zr+GP3CyyRgxhpMR6hmU5xQM
 RJuoCyZEgsljnceiEOdzatnAXL3dUqyMU+Nc3A78+aFHlrn2O20+Ob/q4QQs52ZK2RRLOovNFdQ
 EumH6G9YBQP6cnoiBasSFZdUT9IqWA8GLujgP5WX6pqSXdy3KgLHM0/OJbai0lZ+ozIrX5mbQQs
 OFLGRXwH6qyGQbwXqbwF8fLpVeNsMDn015u6iOvpLSe628Rty4BanzY9Ofv2Qn2o4sCHUDG689T
 f4Qy0cu7HY0b9EZIu85rFoNFzKhQh7nOC+/0PO0wBiZeWZUxEBVjGxsetyBhaCBHvifIak7RhsO
 NRJcVeGXSnLP4k1B+QG/2YKju4CdgV1muUtonXMfnKV1QTsttXyaIP6uI+c5sCNtsuO7VkL17k1
 Nc7JBUqAlQPXoIlfUHcn7gCtj3zcHaXNz+GODGO3c/KUCTTDU6h0zdGGJmW6hWteDPBsR77dPqh
 kc9e5znP+rHaOEjdjSCcIkV+qgUWnUcS2imEt8FIrBME8xXaWrfhSdj3WrTASXL+0VQX04PmgVA
 sycXjkiLqRbofIQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: knOdFS7qkz2mgKDqfMYTW7bh82gWm6Vd
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6963c5a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=87NIDPt55Z06IyZ_8NIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: knOdFS7qkz2mgKDqfMYTW7bh82gWm6Vd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX2ivGQKhMmvNP
 Jb7UJvBd9w5lBiHzxOdFaNKzqojUXgekELAEUBfH8cALtMX3pW1RAVjq2ExDbOtPwNGIclHoI6z
 V86LpIqebY97MYrOXc2GKoErFAp+5/GCw/BqGDAMGxXl7ksZzYHZ5WZ0SdxNLom1moejNCsX8fL
 SFOAkhH6iWHK7xsJgseWeF1M5k83G4DEAsWETa1WXq0j4gW8WpCrEIdHu383wsicgcGLvHaUTBw
 u9jViSYyuRZj3Q4KlsUwLzczxt/V6rf44o+m6d5Cge+9TyIzbz16i+dCs90ovmAdyR+3g1jMrPG
 fBYzLwLp0u+sS73ApKinZPW7XmQ8XAMaOAxgs43znCjhVqidYTJoT9+6Qx75qRaPQunYLoEKrV1
 4TYjoizt3se33BhQT5RWr9FW3oU9Rxq8LnCXPVIY6SGndTSieHZix8zYHqLeH+QoMc3+3DLZo1g
 QLsrcQX+J8B10KockOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110146

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
anymore and platform is so old, that there should be no out-of-tree
users.  If such existed, they would have enough of time to object
dropping Samsung S3C2410 SoC removal from the kernel (which did not
happen).

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 445c5271879f..51e597ba7db2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -19,7 +19,6 @@ properties:
     oneOf:
       - enum:
           - google,gs101-wdt                      # for Google gs101
-          - samsung,s3c2410-wdt                   # for S3C2410
           - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
           - samsung,exynos5250-wdt                # for Exynos5250
           - samsung,exynos5420-wdt                # for Exynos5420

-- 
2.51.0

