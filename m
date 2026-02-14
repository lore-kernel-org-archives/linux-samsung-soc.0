Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8B2FE59B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072810; cv=none; b=tV3PSpEO7uW8hPpborvDgKaeKNxNf1BE8m9GN5cTXPMA/J4TZwFYyj3zkFuIfBndjyXVKuD46xDUqEP/9GHnrCmSdEElGDYty/mXExhsQFqINYIhPIjTC42TINF/9KlNZvaiDE9OBUNm1XXgEXf48/7gNrazBbMe5WTFJUfbjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072810; c=relaxed/simple;
	bh=2ONiiqucp8rwwjeLYwP2GWKV3pJxf48A4/L5huMYhgk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G63kzY46MlPGnO0mY8F48hDDfBcFsqN1qiKasXkPTCU0lt2w/SibUjfuXBLB3ZTBBwqwebd2hUYVEjbI1h8MBGQr6q8xmV3/HsMW5ekfp8/7CqQ3fFE3+xhwFEXlgnzlYG+E9HIAT8gjKv5m97N6xsYXxbhhxUjoA9KCYiMrPnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8ReBtnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYSdU+Zt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8ReBtnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYSdU+Zt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61E9T8mN1561321
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xb/pzIo7QtIHMST3kDc3Ym
	bGjD9C0q2jOrYRWsvjzV4=; b=Z8ReBtnuB+YPJaGb7uXNpFv0dU7e1SypluZuck
	T5zAt9d2rbmfVRoPlSwKXrgwcRFJpecKjHgnjAnZcQitB8AbLngBMoQWeaXAn5x9
	i6hBiLSeDuS2bzI9i8kQXjmK5/RGgOXe+odKRl4M7WfXMpW7fYOBeSibmVX3dtrl
	7Iww/cQEz5qrRiojoXaLN0oeiKg7PKkQ9uBZR8T7QzMlG5QKU0XBXZfXyMsDW59n
	+47o+PZx1QQWjt+nnZXvtzuFXTGs7gyopyMv2yk1frtJHb3ntFmKDBfHwRlTUs3i
	MyLIZLZz0wZ6yKt0VZ/RoGwcS5l/vTqVSmXLs6QpLUFd9HYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagmy0skq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 12:39:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-504888a2a1dso72861381cf.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771072799; x=1771677599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb/pzIo7QtIHMST3kDc3YmbGjD9C0q2jOrYRWsvjzV4=;
        b=jYSdU+ZtQUWrvfbBNYn7gzlTVA/fpXCafUxCu+OUUwE0ULr3rz/gMmIzA0AaLfPRMJ
         2dq+9WKrJ/PwPd/03BqX113Ct4Rug+GGSmQRNE7gBqKdH/+bDL8Ho8zQF8EJOmr3sOP2
         l5vtp6QnR8wCZ5kVyKRExp+WUBACPo/TEy1JG8pow3v2tQYldAQWfW3d9NAcJ31TTiEe
         8hEAhMgLlh4wXhbp9U3VTZu+/HSo6InGFn6Fa7DhFBV0b9sWoL+Rasyxg9aZuO/0xxd9
         6AWxdox0xDxTe9XMbJQGAvpqRsmZBFbpNmI9lqQX36/AaMM7ZyH+U/zkCcEMl0erNAs2
         SAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072799; x=1771677599;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xb/pzIo7QtIHMST3kDc3YmbGjD9C0q2jOrYRWsvjzV4=;
        b=d1dtRvopeXAEAYPYwBolpUJHElp0us4TiLYBEwGH0YZtOs3TyvZWSqb6btzwKdbFs9
         j7qkUMLrmiKvkiQFYR+c8xlVfoIgEhlHj++EPHnCK+O0vGzhV95SyUyWL6Y9zWWoIOP4
         xLNMjdiYGU9cKihilKmS1SrnAE7G1FCCqcNQXmRFxjLcHyIvCzxHv5E0YmUm6EIsCPTP
         8HYsDuFzCtVdQZR5n2quD4+jSnQFY7wxBSxLCWtYoX2vehVsVmVWTE7Ew47UwsbAUme1
         r+SEWN+L1OwrAd76xM8aXmlG777JZqGzntA5WyGr0oepAsTxxAmPx3/CikrA7FbOarAF
         iGBw==
X-Forwarded-Encrypted: i=1; AJvYcCWSc9K36tuo0LLwQN4BsngOQ/hIllXosVm6lAJbdCZDw8z0XMQKTHbQCEECG9EmU9g/fz7PdSqzgvPvojOEApNkoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdXA3v2m2gcEpS7Q27mHwG60M/JaAKjcglWj9C1c/AfLK+W6K
	8BWAaVLl8PeyZ3vD1UWujFQL1+PeTYa9ETUn/TYKbXNDT+669CUfJ9DtEz5CuOxTQu4fZEomb/a
	rFb5Trh/oSooFE2alvxHRhrWSnVBo++UmGrATYdcm+3Z0d/w181dToACi0PgPWuXwewmKJvT4xY
	NL7IND0Q==
X-Gm-Gg: AZuq6aL48z/Fs0EZhu/ZXpDNxqlmInRSV81HZfH2De5rqkxNxts59Dr327vz2OJrT4j
	RL6aJ+jgmU9v8TwaVKuJI7YtLkO+t5ccOFVdwasn8VjIbs9E7KqQ8AWSGMz3MAeQcwVBpCvzPcg
	jN/zLQNXJx2V8VsF+YlL94Oa0zk0/R1Fwu6KYnK9ylG78P5DFzrivLQek2IS47RcIEGZ0hvOE89
	wbp/M2i8QTv7Bc7eviTnlaC43UkwGppf/2kIvQJfeCQg7zIzWHJ0Lmq5+ZFa/JDwGJHnN+fPgfL
	ISzvs4fCH3mvv3iavm6qjnoegzmTQXpLcNVWu0yM3sbbxFdVGMd/ZufSyPc2fJ1bLseoK2zWemZ
	Lyi6TtbBA3Ui/U9DJ5sF7EvPTf1piD5mM4RnorKIafyxgOw==
X-Received: by 2002:a05:620a:bd5:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cb424bafbcmr554203485a.80.1771072799096;
        Sat, 14 Feb 2026 04:39:59 -0800 (PST)
X-Received: by 2002:a05:620a:bd5:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cb424bafbcmr554200485a.80.1771072798555;
        Sat, 14 Feb 2026 04:39:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm13644215f8f.3.2026.02.14.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:39:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFT 0/3] firmware: exynos-acpm: Use __counted_by()
Date: Sat, 14 Feb 2026 13:39:39 +0100
Message-Id: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAttkGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MT3bTMotzEolTdxOSCXN3k/NK8ktQUXSNT0zQjC/Nk45TkVCWg1oK
 i1LTMCrCx0UpBbiFKsbW1AIdLyPlrAAAA
X-Change-ID: 20260214-firmare-acpm-counted-255f287c3dce
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ONiiqucp8rwwjeLYwP2GWKV3pJxf48A4/L5huMYhgk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkG0W2H6AKwxvD5z8NpRIIHogIgO+FxKyPSD21
 Nx3J2SgRnOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZBtFgAKCRDBN2bmhouD
 19foD/9Cqx9EUziHMahtUq6/t26GEQ9mlLm0mCCkm7Bw9XFArPV5wat7RCeuSWufRj4C4c2/I1A
 7gT1G6Xf3ELFwmzH/06/lA6rtdOIARLJ6vxGEUQoJLr/VixcUgKDUN0KJkaDnhwGxmIvmJubm0d
 O3+zip46n4ZW9mGzEsGNUVKp7ruayuSvSLx7bHNdNxHmih40JPSanL1MGHicCraxoN3rELl9ftM
 qiwtXUetwwj+mNY+m8UFUYhNwLV6/iG7NfFKBDR0aib/iLXBALOoZ34xKRmt03p9MIZOuFfSdDt
 zWFeJmHEDZ0lzothX9GjNRI+gb+2m293CxcdKBXlWtKbY8o5x4KfULxF3jUic7Mzx3Y6YkTpGRd
 uNw04jah2wsa8iJwxLenBN2UY9fK4gNlswGSZhjU21cKEU4OfE94mQt2sU1ZhgcKgSHzoW/CMNf
 wUaWh9OfBh3A0gCrA/MLxWTII58DhjNFyGUIacVBUJ4Qb3IlfWyVM+BPPzJSxSoQT217DneNxWl
 s38A21SAGi7fzVV2Zrxo1K1BNsJy8Tu3pJH1Az2i9gWfxqouYGP+FSdCadbAfCHsDC/nkwU8uyZ
 h05GYwxczzAKG7hCSRr2p9YPRU0C+e8r21CTXYvG1j8p4rmnqmORlxfi3xvJo+XyHF8sjNUDaT/
 A0dUA6VD6b6XQWg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: sK2P_5TYqH_SkeK44b9lJE7lLaNW73f1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEwMiBTYWx0ZWRfXyt5pkIFIjbkG
 cbGoDuaC9SE6ZlRBbO5FCXZFl9WaZr/bAWAsN+ipX/CfwLJCBE62DF4WCmQrNZ6fIubSVrdJE2M
 48Nvl6LjX0TmSKJZptJMQ4YuK7CiMRWzjGVA3EdEj2tHi8ydldSjBE4M4N2fznro7Kn01FThQlG
 Y/BQz00kuTBf/eWMEy5TVgp/27qG1tqpDIZ+v6nSEDmKdWHd4mg63DogynynLRfn/L6AZK5qXcN
 iL0TAnOfj5MmzBDu5menrZ0QtfErB5tHshJiO7Z16Tu49hnx7pUwd12WIS1PSK3MEQLwaN9ZN26
 f89jZ+Mg7J3TDhr76HFeNDSpqrG40ohsuyzFitmuaOSTudeemv2C/YSg0lY9l2snt7QxeXZ7rhY
 BYWstr3mg+Tz2h5SrXD020rOolbVmo5wYSQ8gZ3IKBx7ZdxqObfritNJ0EfZMimCdOoeAKkSZQH
 ghdBVe8dU793DWuWdUg==
X-Authority-Analysis: v=2.4 cv=f5xFxeyM c=1 sm=1 tr=0 ts=69906d1f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=xOK8jz_NIFPa2TsfdJ4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: sK2P_5TYqH_SkeK44b9lJE7lLaNW73f1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_01,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140102

Improve safety of the code by using __counted_by/__counted_by_ptr.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      firmware: exynos-acpm: Use unsigned int for acpm_pmic_linux_errmap index
      firmware: exynos-acpm: Count number of commands in acpm_xfer
      firmware: exynos-acpm: Count acpm_xfer buffers with __counted_by_ptr

 drivers/firmware/samsung/exynos-acpm-dvfs.c |  8 ++++----
 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 drivers/firmware/samsung/exynos-acpm.c      | 12 +++++++-----
 drivers/firmware/samsung/exynos-acpm.h      |  8 ++++----
 4 files changed, 23 insertions(+), 21 deletions(-)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260214-firmare-acpm-counted-255f287c3dce

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

