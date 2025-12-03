Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD7D30AD13
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Dec 2025 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784792; cv=none; b=B+I1rim4tOqM9EqG0KFX6Y6vLz8yHZecL/Pf4z4zW7EQxXvR4E6Of+dzDmNEnIm+PPbaHoczD0hqJPhvxs6jKXodQvrS0HWZaPVsayyjZkiOGAOKyxzRNaUyTygyItjnfQcsH/V3azd2VFw60xLROKe1gqa2V2izONBYBQOkdGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784792; c=relaxed/simple;
	bh=2ooYuXW2EEg0Gh600UznJ2oGF7blDoe6Qje0LB7FtpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qByfsw/Q+mB04BKPVMfbjaMOMH9DcFwnzmPIoz0UJvQfOAnqUytB4Vv1X/Z0vwWvOjb2hp/ZcHalw0LMUKBeDv+ZZ7DQxomazRzjZ+uKQlTRdFrj+XZSUm2NGTWkCyt2GNfc/xnuADz1KBLEkXRLmc3xzP2G+iYE5uqymAJBd3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdVEwHlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbTvEwLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdVEwHlS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbTvEwLc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3HnLLe1928890
	for <linux-samsung-soc@vger.kernel.org>; Wed, 3 Dec 2025 17:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplh
	MSVyrzKo=; b=hdVEwHlSU9+PVg6RP0EyVa+JR3rNWGftQdDd/3zjv63xijWkW7n
	HdtEcVL6LB/PFlxgKecDVbBa+fL9WOJ3LHKGmV6B9cSuBJf/gRn5qwRO7P4rOq2y
	a3sS2fLUmtmNnFgHQWaWeDVJgxgBezKLBuhIbSse8W8lb4toE6UOOCQ3jhmGZ1N2
	nEVPCWHWvrhyJZ054ZeWBi5aWzN8agxhzNW9w/qB6QVgvTmNeIaSxKXU9KpmTi3z
	Sgo3GHnsTNGC3gcspbJ8AQIWSSTaKbjCDvTXh3P3+NLHAA6BB2f71LVMDX66OB5F
	ups9yUqH2eS5Zf4bUqr5ZFOphcz94mWY9bA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjyqhdyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Dec 2025 17:59:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e235d4d2so1121854585a.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Dec 2025 09:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764784789; x=1765389589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplhMSVyrzKo=;
        b=JbTvEwLcvtgAXilkZdNkxFIyqMl9DrKDXg4RmjqppA7IuOGqiT4Fi21okZSpb8fY29
         FVVcCqkNuMx8296vZjj9UNf5ZI0mg5DZzz1X7Ihm9T/ReTpXPrLg3w5ulCIXbiY3D9R9
         j4JP4RJkL1FNzDNWDe2U6fBSqJSqy6OmNyPTm3OCa8MR375TU+L9KQUjGkRoaLTiRT7u
         ZjyosedPHWL0mxKAPzDs0iSTAaCH0lGDq79a87iymbnAJgby/P81Xlckxx+zVigTRoGZ
         2SEhi9qnnpAVm2Tut+yqizCJk9LldLYXx+8Li/U09LvMth7bzizf+//C1cz/yLoPmQk4
         TKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784789; x=1765389589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplhMSVyrzKo=;
        b=NOgQPdYYFWiiQBumwY3TZTvwZYmBnx9YkjgkPiA2TURh/S9eim40lTYQNQRjSMhJ98
         yiGBzHnwhRoze/yJXC0RTzEw7l8YPNKbxWBnJlawB2PW6HrWCgx+JxH4ET5nvfogzqbB
         2aymYkYa9ylx5+rtvQ12COC15xj97M/YD5Lv7pmOiQSp16uT0ZwHdK7taQchHyczPQUu
         yMbKTRhe8FO5TDRToeAE3USvm0ZdlQR6HVqCvdgsjK6DyJHDRdJ6ROY6Vlj5+4728Ynv
         mprB5UXn0sxEsQ1XoFL6awYNoEebwfguufY2Q8rl1Uedi8wMocBM0rPHn01zJ6GjS5sL
         p0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXx/RwHdVJXgDTlc17/WvkNhN58M5kJrxcgP3pkCYhWtP52Fb6vGtBYIduVHFSBxfOo0vFsXXl80pF+4UxBIrssog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyISM7qfDxCTza1FcOZKKZIsd6uSoOB1+dsr83kV+YEQ+NIwv55
	b9F/DF4hIN9S7S64jcr99wlS1mB888tvYlXKyJSAnYiWLntTYACuBzGGX8wDFGH1aPXukKlm4u0
	h3LJBF8NXsO6dmjoa04oCwNTf+/jpPzZdetvOWeleSxs3ljbd6kmZ80smZqDq1fJaetjaIURdfA
	==
X-Gm-Gg: ASbGnctNM2mjsK7IVStEV295PQqyn2f+wPMFCQ25x+nZFCgqEOtnrfn5G2It7Rs+/oT
	peUEio58Ve3mgTiM0urCRN79PRoWs2XI9G5EPzUL4SWbBqobg59nXABInb3Hg4BS48KaKJ7n7FI
	75azw3IJV3TCsSHdYvticVqGo8z1oEqJaYnUIWSfT73d0oLrOJrLzbt8ppr2bjI3Y7vptevG7wl
	2BphLi7HLEce5m7kot6UWewBziKULBYQ07g5sFVj8yjd2LJ4JwTNJ2xP+9ViBomhe9J4hcXAWjn
	XZfusR8stIcWxUV6qATrqacX3raPs9x0JczK+a07F2dtnPnl7P2QDHDV5CNL1iwO+nYoTMDQr+A
	+uJQrtu/DNafPcYlmgfUX3HflBw==
X-Received: by 2002:a05:620a:372a:b0:8b2:f0dd:2a97 with SMTP id af79cd13be357-8b5e59286bdmr462805185a.37.1764784789276;
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8yCiwktBCyzrwBa+KnVsA4n9L5lmxOOSzRd+h3w1NjUHwMZOWIoUMSZ3WspaThXBEBWKrbA==
X-Received: by 2002:a05:620a:372a:b0:8b2:f0dd:2a97 with SMTP id af79cd13be357-8b5e59286bdmr462801185a.37.1764784788755;
        Wed, 03 Dec 2025 09:59:48 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm43022473f8f.26.2025.12.03.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:59:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] samsung: drivers: second late for v6.19
Date: Wed,  3 Dec 2025 18:59:42 +0100
Message-ID: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fu4Hi/WfIMo2rfWLyC73B8C3fZMMk7cwdUGFfSUsWvw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMHqOfAZzaHRmIY77uLC1yV1FKmzMk1E/y3ggh
 IkPPQ8GXTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTB6jgAKCRDBN2bmhouD
 11vkEACHyrGt7dVfCAqtf5VUyVStg0GjUNrYTlUnoFRd7h/NNsKt4ZT3EzAXtiXyeAR+aUUzb54
 yCkjaXwRJov/dMaxXyinFcOJtsBGuBuu8AtJB7XZnaP2VXaREE5bcwrHtEuBmmfjE//GFACHG23
 IgVQtND2c2o2xsm4U++bkR5tLC+L3UZIMtnbaSNeRafOfQPTerr6OTQy0uqITQKcy9XZNAPMgiT
 0BBrI4JkOSI/u19OskOjHHjA9dlS+bi3jnicIQX8z4dPyo+fAaS2xRmNQK20G254/6CU0DXK9IN
 PcIbCl9QEJqYfSFtn52NEkhuSQ2psY2HClZ9kQa0bELa+8spg8Xg+v+8V2igaEbwvkNF2kYOz9d
 FuEDizS5Pk22xud6Rr3iqMj14yOe6qo2DblRcTGGkGj0mM72A1k9na9SbUYxnAwYObY6d6OkH4A
 8dzuyV1lQKaoJtMJpBLs0nGPVcNAy/STstJJFoS3xNePKg6b0SJixMP7V5h0lqlKB7oCJMtOydq
 ZO3D9l6+aHLuMvqbE9G/Ldv5eNE7m/NmReQ3v1N1rIgglQgF8E8mD3KdDJRwOIWO+vf3zqMsRKa
 Uby15/w4cFdR4K9hhAhkhPMilkwREXAsa8MqkHp3xUuq/kpu+ITxjDwOD/Z634gxlgoSycIKtHb fvTZSnx1HsJCHsQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69307a96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t9IKhzsu_K_-cmMu5D8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: AYDYToX1zKFKNNXRDqAs72lFu9_B8jin
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MiBTYWx0ZWRfX+mrQAIyV0Y70
 fiXchdxzWWsBN5VZrdsfBzPItVtzJ7dLfJpsabPhtFh3D3gE37Q6Iwito3lWZSZsoZD7JarBK8w
 frt2CH8wQoiQtI7R7KjQ7GmQM+4xAEUiPzLBNU0qEsJqOCURMWjh81kWA7c9Si7RWYntIq8k6BO
 oL6UohXrbiasHdTqCqFz1zOP5aj20OqyW4Ihge+Z0Cwfk4AdAgP17/Y/YyWiUSXwsO1N//Ptfdj
 N7+8/XTAyL638eS188X8cGfZAjQxWyognwpISCWpRy9XPfgwsGFmVb94rDH8dnxtbHCIecU35o2
 39RtlxtDLk0Ee+Uqooag4maDPCGZU2piH5cM+liaOuK5W0oVO01i3tOd55fuAYkqzrFFHdnLitG
 6EjgSN4q1iusLQbCkaHfiYdnQCuwdA==
X-Proofpoint-ORIG-GUID: AYDYToX1zKFKNNXRDqAs72lFu9_B8jin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030142

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi,

Second drivers pull, but rebased on master/6.18-rc1, with late fixes.  Would be
nice if these go to v6.19.

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.19-2-late

for you to fetch changes up to 990eb9a8eb4540ab90c7b34bb07b87ff13881cad:

  soc: samsung: exynos-pmu: fix device leak on regmap lookup (2025-11-27 16:55:38 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.19, part two

Two fixes for Exynos PMU (Power Management Unit) driver:

1. Silence lockdep warning being actually a false positive, but quite
   disturbing during testing.  Issue was introduced in v6.18.

2. Drop device refcount when requesting device regmap with
   exynos_get_pmu_regmap_by_phandle().  Issue was introduced much
   earlier (around v6.9), with code being rewritten in between.

----------------------------------------------------------------
Johan Hovold (1):
      soc: samsung: exynos-pmu: fix device leak on regmap lookup

Marek Szyprowski (1):
      soc: samsung: exynos-pmu: Fix structure initialization

 drivers/soc/samsung/exynos-pmu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
