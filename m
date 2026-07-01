Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB242983E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jul 2026 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903470; cv=none; b=JByZAJM3nndAZ22/qEGctSboIr3TRBt+De3fcL6BPt7N7dPAlD45IFoSOq8n5QPUF7/uYG/gEFYM/UfK1q0WlvCzh3E7yp0cqcH+yQROOZVNdOPPL5NreH5KM8IF/CtTyfq1igDLXgywXNA6s8qvOexVAvg1Mecx0wdepfcV2eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903470; c=relaxed/simple;
	bh=RticuU5Azj8Z5luN94Cczq0lVA7vnzbs3xs2/i6ZSI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWNfbq2js596NdMXbp6QMsc27pVEMIglutE5Go8r6j2Wcv3co51OGmZi0UH/iZZq5EZYl3agQU3SsY/cvAy8fByrxTwwCMBDKQHlQ6EvirbWMoLrOipFpPIN9sdJKvGyo6Ym4ZAGUifrfjJmBtrOEV0xLAwEqHurE5RE7PAdjSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgaDmDfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDn71hTe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgaDmDfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDn71hTe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGCrP793706
	for <linux-samsung-soc@vger.kernel.org>; Wed, 1 Jul 2026 10:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DJmIPP1vTuI
	8fvgcGFFjNDDInGpX/ShqWb1hq75wB7I=; b=dgaDmDfsiB+APBUFZKMqC+BSdKt
	iSI8Kc2Cp+J/5mWOSuP1b9WYeOsJJ4rZNT6jsmidXfoeh6EpflpC8ADvyYWRGrnf
	woq2AdCyNb9a0tgABJakaecWcB3QZLTneJVScYKeuPLhy52FkBn4Nzz8T4RTzbkX
	jAFsGWTdsIFsamWy0qlQDDfB5QbbfnNf61GMRt2IiihZcZnG40Dxn/cWXCqDpeSM
	T2PLqkh/eUo7wOt9h/x8o2JcZKMLv1f7noek0KyWqs1rJeiTaZAVajEyoa/7/6hL
	xxFuiw9wPahUQYY6osrbHy5MTzUzeiVhYD8mlQJVOoc/E5V3bzJIM6wMzaQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ag5xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jul 2026 10:57:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e663c29f2so61616185a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jul 2026 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903465; x=1783508265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJmIPP1vTuI8fvgcGFFjNDDInGpX/ShqWb1hq75wB7I=;
        b=MDn71hTeDgbmhmV32y9oIwVYWen0isaUi/JRD0ccpxy8KYPsEwSsDfW7YKSWf7qi5p
         JzyUb9OkEjyuuiaCp+CPU42hptZSpIwxKYjX5yYLiBwTvkyVfRt66T5iWFMK8lz39yVE
         YZE3iciRJ8uY37WD95NzeXy3NM7jS6cMl0ubPW3e1wfo5rJZGPNYIB9/dnVMAdMLs+lZ
         sNngDssjUG/q69IZl7CgZKMKX0gqEw6i2Wx3aCSPvAnwum3e9C601A5Fm40hddKwdpbm
         5n5WlfLYayKc0CdZZg/rbdO9yiXd3yJiL4OxFXPHg6bGPSUh7K+4UmRrweRw2JgiptfQ
         ep4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903465; x=1783508265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJmIPP1vTuI8fvgcGFFjNDDInGpX/ShqWb1hq75wB7I=;
        b=aJe20XtnGNfDTfXSfUbGjCnq2wiprHnDKRCwHo8MtPDRghAwFXGLx0OOTNTVUTfhWE
         ypsr3tgeBRZ1SQDqw2wgOB/1FV+BcMDB1zSj8vzKBrd2Egpdb8J82zC1uCZo0iQphD8l
         A5GlYVxVzzaoQDwlJCkw3kPdrzPEcqw7vq1DtU6BVDkoO2VBIyyxKi7418mc6icV3Szh
         iNVdheDrDU7/MePU5+bBs6qocTjqgwZrYzyw/KztNsheUTnQEshoNelMDPSr/d5jGUFo
         7zW06AlYU4vBLk2nvUNnCK3d/ljyQMVRCHFIson3hTviBVUGJFxsTUzP9+yx8WEc3i9c
         V3wQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7eKFttpvxfbI+KdVR1bahq1DWOhHPL3mZzWw5PPwINbXHDhTqn+lBXQZu8Ix2wjacWZGP2VFqbe/+0/X5uj3WYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziQSsAclnowVOr5R/emczb/lYBeBOpNVxer+PC9MMU46YZfY96
	oAqs8HBf7BzfhOefbPqUg3Nvi0phO5zxiYyVMJETVwIcOitRAf7HFXTYi5/ix9/YHEWWszaNqHO
	m+OKQ69Yxdrr+BwzwkOvmdgXH+gpG8NJ8JgjaEMpapuZUMjNwNpWp9E9gegT5jWImfi8Senkx7g
	==
X-Gm-Gg: AfdE7cmz9MF0P4wJW5qg1LaWpgUQ8N8XtZ3xqKcbP+xMmM4x3BULe1nwfevhT1hwfta
	RorEsiMbBXWhtAqj67B4QyMNImxslusLq6ezm/OSbvt6hCl4r9Rw5BzDtiuvCdCPsdepbTyvzvx
	nsM11aPyJjposPFldM1T4508JPZXsIRKvCCdKRMpjTZo6z6aJAhYr3x1W74cvGZJ+LVr1tjjwt8
	v/8zrBXGFHMLQ561ERGdl7MT2cDB/yt+zkrZ0E5L1a7aagBM7jh3PUWcjUL+DzE14kI3+I2wjDQ
	n6uiTHEo5uHMPQhxiwkjfEOcXdWucu/Xo4/EsFml5JqmzC9YJmECu7BpGqIuL+u1GrN0XHfLwCs
	eyxcNR2Ko/nBwVbeWMGcQybioWYE=
X-Received: by 2002:a05:620a:444f:b0:90f:786c:4a82 with SMTP id af79cd13be357-92e69836085mr753963485a.39.1782903464787;
        Wed, 01 Jul 2026 03:57:44 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:90f:786c:4a82 with SMTP id af79cd13be357-92e69836085mr753960785a.39.1782903464354;
        Wed, 01 Jul 2026 03:57:44 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf1asm17497188f8f.18.2026.07.01.03.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:57:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed reboot modes
Date: Wed,  1 Jul 2026 12:57:33 +0200
Message-ID: <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RticuU5Azj8Z5luN94Cczq0lVA7vnzbs3xs2/i6ZSI4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPKe8ZayEXQHA8G8GMsFxkFrIpacL9L+9DMKt
 RVMhK8DXSSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTyngAKCRDBN2bmhouD
 1ysuEACbMslME4hji5yXC1rheVCIjq1PJwxs3qr2BJloiuc9OFBri2utTcrNFwOfJlCVwRj2S/y
 bDLlIWOENvFyszEvlucXEI1Y0InTywLqzXcwvjU0Lw0RuyLIXjkOp/GMTd++caBLeNuYqH0t6o6
 GiMsi+HmM5DNWm8NVNJ3nvmiyNute6CHRztR82c8rQ8RWzDcXuzwTSah+o+ZNCKt/eYS8hRIIDJ
 5BaNVBTv8ZiXq0GV37636Uh5MKLy+/XFsruxf4m07tWSMZCzv8jeWXqNiAut8oRlYG3JNxhrCyk
 H//4gYxgw2diP/vA+98mZPwUMTOpwaTN7KPWHKVCpWOW2VxyCrktENfMG/pWZikoahtTHgFKZ4I
 FkLoex8WkbiubqcVDmMJMBMyIuqnPOhZbgCODIaai60SjzEy8b9XpmIo48oZ8ndKE7uo2bLRNV9
 lsbX1SgYPfFevdS25FnGeRsigMSUw4gNU2vVYIv0FCbnjgl+IQdMp6fOOUn1nnFsHC9uh7SGbUB
 f76cz9lerJF2GcgEGi6rmEhi/jtbs8Lj6IEgnkW1MWjhRmOwGly5d28Ns3NgSbnwDA0sz4ASCro
 QslPKFFsJX+MVUoc2LNTjr3K0t4Pfcyx5yhmbzUHJOZqzKg+ECZkZfFN89xr5s7dhntsP+02FB5 YDA4m5fZF3RfUsg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8qznq1WrzjXHw4O2fQytLF4W9alV1Uu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNCBTYWx0ZWRfX1SQe5E6AXQKy
 yzhLuZiBFeLNN4P3mxqFBLWk1ymV7Q3ZZPbJ4Cer01walDQonm3dyQSahz34WCCvhXm/khJn40p
 iLib/oP7+/neWPAb+gzL1/N7c++BPJKaoxZVnBvEJfmDxhE/XBMkRj3xMslwlk+tKHQ9uG79pLy
 H0z6sF3mUMHMXYAcSkEGMJ4Out6k01U6D/ZN/kbwstoPqTrOBFyZz+tk8Wzlig+t+hxEMwK1q+C
 h9mEBTjKeHso3DTaR6fYxH94rLWhpZiyHciDDa6kVg21SiJv9U15OMAhY0I5YCZCbnQKmzXDYBe
 WX8IVcfecY/HbN8MQQbQmASZtydhQigHsGcNIWNHUiph8mG0padbrgxl4IH4Xjc89kQsbHuzu1c
 x9wAl4Lr3+bu3luW/tv/sMDB2Dn5I/+0+WYjIMnTWS9RFTVMpBzRdW4rzzIKkG2DcI9poxBTu0i
 c69WryI/C9/Y6N/eqOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNCBTYWx0ZWRfX1VxS+iJPrF/g
 dEv8dT2maiy1xDGgaOlZFI6CtN5E9UeOkibeC6n0rYrhInMXvtczXTG9IHL2+yezm6P0d2DKFVZ
 Ox9xDZmJ2ghdWjiFS6zvG1lL4+ND2qk=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a44f2a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=h5T15lCM5MDmF03UvrYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8qznq1WrzjXHw4O2fQytLF4W9alV1Uu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010114

syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
a subset actually makes sense and is valid.  Provide negative look-ahead
pattern to disallow any modes not supported by the device, which
tightens the binding.

Most of Android-based Exynos devices share the bootloader or its parts,
thus reboot modes are most likely the same, however only a few upstream
DTS define them, so add restrictions only for these.

Google GS101 has on the other hand quite different bootloader with many
known reboot modes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/soc/samsung/exynos-pmu.yaml      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index d124f3ae9fbd..5bd39876e3b3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -176,6 +176,20 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos7-pmu
+    then:
+      properties:
+        reboot-mode:
+          patternProperties:
+            # Negative look-ahead to disallow unsupported modes. The '$' has to be
+            # part of lookahead group to work, instead of trailing outside of ().
+            "^mode-(?!(bootloader$|download$|fastboot$|recovery$))": false
+
   - if:
       properties:
         compatible:
@@ -183,6 +197,13 @@ allOf:
             enum:
               - google,gs101-pmu
     then:
+      properties:
+        reboot-mode:
+          patternProperties:
+            # Negative look-ahead to disallow unsupported modes. The '$' has to be
+            # part of lookahead group to work, instead of trailing outside of ().
+            "^mode-(?!(bootloader$|charge$|dm-verity-device-corrupted$|fastboot$|reboot-ab-update$|recovery$)|rescue$|shutdown-thermal$|shutdown-thermal-battery$)": false
+
       required:
         - google,pmu-intr-gen-syscon
     else:
-- 
2.53.0

