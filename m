Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6F1917FB
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Dec 2025 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784794; cv=none; b=h6t7n5FcX6BtbQ32brPz4UuL+1e5BwVOUUDB1NDhkZ5bgLKchNhUtJ4NL0RNWCr0Qg72U/wQFTMCDcTWtqbfr3zzPtMcZvu0A51xqyRsTnqVudyzUMssBHmrDt8e6qxBVvS2eIkGOczppg4KFFIzroT2qK1xiqKSggRtMqrbvPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784794; c=relaxed/simple;
	bh=zJ62/ivIS8xYXbPhT09JHreQwFGE4n//CNIlb+GcW18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3ybfRqjRaUrynJ5QpQ7YnprXH/lGXLzyOIHmlxIsG0Eq5KuxG+iBEwRqECQJfJXvE4oG8YHvWWfYg1MjUy4nnGVBkPIHC8euHbU/7KQNqDI27NKjqYZOYWV8lVvND+n/AGchnJoFMRKj5rISRaSv/D+W+wA3T4Txzffmx1+To4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boTCbJnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XV4wDNGZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boTCbJnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XV4wDNGZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3GmH1374648
	for <linux-samsung-soc@vger.kernel.org>; Wed, 3 Dec 2025 17:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yAL8VogV//K
	elnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=; b=boTCbJncTmkJz5Z05YGhH3tfyh4
	PFoPqhMzNKQW7Jr8kEq0S7a9FxV0rz5qyY6ewtXZHCVAi97ENyCrDdog39hCkbX2
	3QiNzLYU23yxTIaHmy6aQdxhgK2d12K6wbgMazkTLk9IY2Qndx8xR1AkssrhDIqe
	3yO3U4MmonorDK8ogIcCG1RCOwwhWOq1kWLsRVXBDcY8Z1zlHO1Ihts3dM87uaN3
	WfJ24PQHmV4xfKB+kYqpWglKtEwARIPYm1DMRAtPKprmsp11rlQnvjDoKrSsx+S1
	csdVQkiuEImnG/v4EXUfft6h5dT3H2rSeRHHCgD6RV3YCdkRNZRvAfE5ujA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0b97sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Dec 2025 17:59:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so2027817185a.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Dec 2025 09:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764784791; x=1765389591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAL8VogV//KelnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=;
        b=XV4wDNGZrVpOYuyzg7VzzKo+qY23yfhDUvRpvpQrmuck6FSiCiv0dn515VWfHJKOfZ
         D6Y1lcSK+kvuDAmawphSLh8RwB9DU6GfkfXbFMhoOPga0AqS8lgBiCbW+97Y5IlNV4DY
         QnKoO13W4Ew8D+8kF7d/ACc7FcNMSWt9iA4DS+9TBUMxaoaEDzWw6OInA75lG9H5Ym70
         4i2Ew5QeNIxMpx1x8YaMwdQDo1rmAHCHfZ55g+QnZWFK+Q2/otSxOqqRWKi9UVglmzbS
         azt84X+ycrdftZvJIR8JpTSdGgBPetqeIiQpWNQrIpT/ckt1nHAEcFtArymf6wPzzJis
         1MrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784791; x=1765389591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yAL8VogV//KelnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=;
        b=FSuJ7ZkFAnguxgIsZIHGbghy9uEzx4cL7IlN4XSficQtlQKrf3DorVa9gfnb0KSvAY
         7hE8AMJ0QScdv3Jsg15m8biZMRNEwJHOmDKgKwOfWFb4zK7XR8PN9lYNrvzGUlZPIem0
         bY+45RVJqx+34hSGbruql32u3+uoF3yBMhdW+P8NdMu/VI+hzcu6hM8xaWJjQu6YVkln
         jfCZ9rxsQ1xLxKi2qra1Yu3NiNslWnDvSlPUftVqTOjDz/OjYM9lWoTRD/DrPCiNscuv
         dWH/hKaU3qsR+QMJ4rfZFIR1R9/zhSLj7XlqMSrpzXlbJW+VXDpAvcj9Kxk+Jep+t/ZP
         nlzA==
X-Forwarded-Encrypted: i=1; AJvYcCVmyG7ec1wZaHHb9FOTiZHG/DpoPtCSmOIULjGqk8zDg705CITyLfAbeE7weIy9xMPe5jng2NbiZjIwwkQKtl7ZjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBpZL4vVFQBgOmlcEs2B87UlPuLGDHQfAknIbFh5sjEJzRIrsF
	ehOQmTxK+JPqAPUratghqKm62nQJwOm/+kE4NXET34EtEb3WMXJ5UejMO6mpT0MWk8zeArpKPuK
	mJ3d3u7v4aMnMGIcD34hCasyXBvW/+qMIhyno1TwHB3gRyC65Jgq3yHPnWp+RDwZoLGNw710b1A
	==
X-Gm-Gg: ASbGncvUPvuMn2VK1iUs3b+/tb+Ui56YyqP55rXJyEOsgkhTboJgbMcq+wd9z1Twbbi
	TBnT9LcU4cB1uKs4HrVQFsoW/cVoVc0XodKFbwD/dQOUn4wjSYVmtBLMahnJB4plXBD85XK51B0
	HxMnNnpLu19XKfKIglXBO48fxsh8TX5hL1KLraYOKAyJx/3WCUyxR7+W3QVmavvRaSB+HYQOVIM
	vUNePt9z8kxPRZJ0Tlx5Ekc+K7AWtsKqoSMJUIQKvRlVT/2VLcHaPgMKQjyYEvaH6R+44ef0kcr
	ejB6udJ7rwLpToRRzu78e/njTTUtPk0/vDtiENnXBkmwm1NXw0qabGlMrN/2T+iQJ/IkuBsOvpc
	zEAoYk24Tvd5UdQTR6YqiBXndaQ==
X-Received: by 2002:a05:620a:2699:b0:8b2:e8b5:1ea2 with SMTP id af79cd13be357-8b5e47d2c2dmr403590485a.30.1764784790567;
        Wed, 03 Dec 2025 09:59:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMqNQEARbZr9/oK6MMzo9BUY+5vFbT++kUu/tsZ7SRGCq15kGWqxGZNGHCNhXZ7PjMLuDsvg==
X-Received: by 2002:a05:620a:2699:b0:8b2:e8b5:1ea2 with SMTP id af79cd13be357-8b5e47d2c2dmr403586985a.30.1764784789940;
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm43022473f8f.26.2025.12.03.09.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] ARM: dts: samsung: fixes for v6.19
Date: Wed,  3 Dec 2025 18:59:43 +0100
Message-ID: <20251203175942.296554-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m+NCASzHGv8zbwfQcRW8e9SM38FnXWv5JTQtDseDbCs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMHqPNP34dvI557Hyptu6xyKt0sX8hkxyVjedE
 Odd1itsAv6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTB6jwAKCRDBN2bmhouD
 1yW1D/9IbiKc33R5Dh8VWT+9Pmo5NLig72GQbFRrfnt5zSv7alB/TSPA+FeC/MT+XwoA1NlCbRC
 vyuXHeeCYjl+93h7eztnSsHgHf4wqnykc0c6sCR72k47nYp0NK2ZZKqSkhi2RE6h+4GAvetpk3O
 EA8i70AO/gqMf8MBiZXieuOHIhTpgpN5HH/4qOVIZFjHCtRrGoUJnTRPltNflwKUmICW4L0RsQd
 4SawfPw3t2Be/7P4zbtfylAqEWILfFkXICqWQtVev8LVMyivcvDGv5Fqh/zBMLnnffqkElMH+h/
 UQz6I6x+1IlARp3nzKj/dKQuTyeBM9RA8l7CNfjhEIFVrwzSOTfkpl8JSyWlKh/lhi7i61jfyYY
 /N2o5DnDkgQYWT7l9adqxEmzWcyc/1GPSPAS4+RD+rOC1PiJkhik5dq9P8d3VhY+UlsdX+I55KZ
 dF5cum3CmfO4UQAzTaWZMkbda9TGVuzoS3kQJcmeMT+x+ZJ5dmv0xWQyVYccKNIikdDIneVHELE
 Ap47Zm7gTOi3FTX+WUmgur/PsCfDRhWZxK2p/BaiuVRTi/ZWIITMXkjaDxpfVR/21afDzhTxU4Q
 oewr+T255Cpc31MofCF3I2+gltpyXKqx5/t+eTbYWsDSxf1/8r6Ynnrcoa6qsE2uiTG7afYjw4S oL9ES9x+xhWZkUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69307a97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NxKsXlmia2VYF-03mHgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: A1Fd09ok-1ry5MIo1XgE9OBtzw-4gpvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MiBTYWx0ZWRfXyI4vxJ0L6EUd
 dnYERsvwXyomhS5H6quhWgVsd+xyj96CYSKzL3lrEhTT8BwHMGnAB7+8GLta72d8ROsuWyeIopb
 KGab9nK+uKpj8uYPOjx7lZbDJGTM+I0raw/Zaww+F/ybhSHIxA7podNA7keLncssoVkcBmRQLX0
 2dS6r52bMTNgTWN4lw4OjxnoJDYKS2GXI2kQjm1TIPbhYg4589h0OGXkqXe8q1YtRmOEktkJv0q
 0wTOpoFx97221Ni20GYPwUxqNahTcBNTSjchHeBH0XRc4Dj3dwQCp8sifR2N8FgOeBfQGHHBBxe
 ibCV1ddD4eP1GAW81fj0bi74N2KKpGsIzXNRKUdj9irb0J14TYol1UEt2TEOvwfWR3F2ysNcPVA
 BAFg5UbVT7JqA2id9Qg2k1jUPCRzpA==
X-Proofpoint-GUID: A1Fd09ok-1ry5MIo1XgE9OBtzw-4gpvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030142

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi,

Non-critical DT fixes, broken since v6.14 by a change in brcmfmac driver, but
we noticed only recently.

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.19

for you to fetch changes up to 2ff147fdfa99b8cbb8c2833e685fde7c42580ae6:

  ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend (2025-11-27 16:07:16 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.19

Fix WiFi on Exynos4210 and Exynos4412 boards with Broadcom chip after
system suspend and resume, by using cap-power-off-card to power off the
WiFi during suspend.

----------------------------------------------------------------
Marek Szyprowski (4):
      ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts          | 1 +
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi         | 1 +
 4 files changed, 4 insertions(+)
