Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D4F24E4C4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384348; cv=none; b=lKr/LRxp+3vBXttGhHYkZ5zMQKzmS55NAmfy4tZtsc2r16Pf+B6ANNDQvWkeDAOoVz/bC7yijWboo6pFnFhj+QTjg6q8xr2/3YNbAPnfJM5pvio9sN9WLGC0yd3nkKbSJrAK5RxH2nYltOEZhsf9Ecj5bYeFEk7nWgjx7cOrOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384348; c=relaxed/simple;
	bh=bjgn3wpCOHUAnWkKuqlsfrv+Q3rmpUxgAwluUP/cFu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zmb50f/z7LfiMzZeo0EQFVr9lOXwqZcHGYHW/r3HhPLnrUruuh+ig+nPo27p7LgFga+uQP9thQRTjLCG66HAiNaNMS8Co1Y0OFiQxk3Vw6MJGG5Y9wXxS9QKAvdyAwyuY8g3pBOMxaxkGC+lnIoD8BIcBTcomEw0W49xbG5UbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALRE5RHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbZGkMvY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALRE5RHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbZGkMvY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9xnbM1329378
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AYQiLDZX9H+phcth+NaC0V
	fgkiHk4oqa3Sm/pFSCv38=; b=ALRE5RHzABXNvDtDp8SGnMr9AJm9S/x8rWQbhi
	LXmntAwFtWR2g8TXigugawxLMtFAOjUwu+BpHmgCRXyadjXDfOUbv08RGo0n68mQ
	aj/dCpOlOWrRZO/aN2aJpVLw6zPah/iU9Ayzs4J6qRzeTPb90CbMkC9wdLw1a+8q
	F7BFYOUnQvONA8poZVd8NXbQ/gELaQSNsbbMmGcAVR0E7G0MwJSNmbMhPTxFYUqR
	p+/1I4+JNSLr+kCYS1x3s+slezROc0lzNf8xURtObzIsfysKsy7OSXWYdKNi+N/e
	cW9leBYo9JWP04y10KuBzmU46p/m6G6GOLcpwmGE3tWw2xUA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhaj5f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:52:25 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9546466000cso4195745241.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777384345; x=1777989145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYQiLDZX9H+phcth+NaC0VfgkiHk4oqa3Sm/pFSCv38=;
        b=cbZGkMvYHvBie2QDXoUzSxAQBwZCMtLHTm0biF7M3U0H8g4TVjafSA8hNcOEaCrhes
         dqe9COYknHxi/ECrKAVeCcYkn5Is5D5cN0NrOvmHnE4Q13SXe7Sze9jNAHbIZao1PObZ
         tqA0BoLxPuvdI2y1J9NVM7AKXK3iI4L//8pTs0pvC97JJ2nWZc9bTdpKr8IaqcisK6WI
         fppKENhs2TQZH7RyXHPTjNi10c44wHERtaToR0qTbmDh+OwPWTYrZNM/FQH02jFuC3XJ
         oQ7qs4oGCzn7WIZj2o4xqWnfrQGHCQrh2t5khMPOc7i3YDoTeXboBtcRLllWF7wYqQ91
         VA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384345; x=1777989145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYQiLDZX9H+phcth+NaC0VfgkiHk4oqa3Sm/pFSCv38=;
        b=MrsVwLkuik/5OoTVp5BeRPO1laxm7VKb8r74u67+fLFIGp/XMPWpmHThxLoJZFUeOr
         XqDcLps0PMYMuVXn0k+3CXn1KXWlLz/2DrYDcNJZ4MmMfO9ASf1Ikbh5mwt7mB8xz29g
         wesI7oJjAHAcnFpu/deyeGGfEdh0Ry9F1vKjnsVB0AuHRH66mkqQEsLnF3PZ5pRKxAOI
         ese1nkiP0pOopuqkuINeR4LRHzhvqs++2yVtqDgwY9i79UWl+Nryk1yBXlaWRkxO4a2a
         k6vjW/jpLDlB02unakJ2gC6SqP2J1iXCV01Pc9hUDo4tZrf+uW1R/RVuFitPTelC1rn2
         51Aw==
X-Forwarded-Encrypted: i=1; AFNElJ8X284AAJZaIT9Hnm+eLedtiWBlcdTqQzChki1MMFL2/ycaHoBKbwWtRgC4iOBfTKWWB7+pcw4ABEhFZh/fnfVObw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbasKKWgYOo9IuhqeijMGvf/ZVdellWCd7+BeNCSYbXcqbi9KT
	H04JMBojZ/xGx9WOWAAzr6IIBrmy2X/vmEdAuJZYTEePyVbJJKMUham5ATn8ab8nhnVVOTY4XfO
	4BGTxTVkf15risnJIayVY13ulC2lISv3U4I1oGBaRIRMv33TJgpSCsF5ZoUBYCnmiPV//znIRsA
	==
X-Gm-Gg: AeBDietDhBYOCSO0foI+/fduOg28x1EwXhqhS0RAFyjTZ6s88o0xCo+RPp7yQwiPTgZ
	YGEPDvU17VhxeiJQVnVxZaC+0A8EHhL2GGM3FtYGzF4RnTozLFf5k9t1lr2Ole2UTaKEWnkprPC
	Oykzx2u58dI0u6bL+/zbBNPPZY51kXoQZX+kP0xXfB0jwi/d3Gy+rNiyBdkxGN07CYtGTQff6xQ
	PvKGyTolq1jF3JXFpAGAxXHrPogyz2l5afRjKKNxFt3k/uCq/cv5b9ObHiwZ4Kn8iyintsyEZXD
	tMmJgnjMdrF7YduGTU7fOiAAl/XQWj6YJBol8FXQN7SWz7QBwwcrt9ZjObWvaUcuDutL9tBrgWY
	fv0Ghpwb2qBe1Gl+6/5zLUV8qpKR832MLOmGzP8XMcB+y3Z8=
X-Received: by 2002:a05:6102:4b0a:b0:601:f386:9ed2 with SMTP id ada2fe7eead31-6280936c531mr1245458137.7.1777384345228;
        Tue, 28 Apr 2026 06:52:25 -0700 (PDT)
X-Received: by 2002:a05:6102:4b0a:b0:601:f386:9ed2 with SMTP id ada2fe7eead31-6280936c531mr1245417137.7.1777384343994;
        Tue, 28 Apr 2026 06:52:23 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463ff5a1acsm6379916f8f.33.2026.04.28.06.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:52:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-samsung-soc@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3] mfd: MAINTAINERS: Remove Krzysztof from Samsung PMIC drivers
Date: Tue, 28 Apr 2026 15:52:16 +0200
Message-ID: <20260428135216.100135-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=bjgn3wpCOHUAnWkKuqlsfrv+Q3rmpUxgAwluUP/cFu4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8LuQA5mGdH1LLmcpTJdqo/rynaH5k2emRdK7/
 j3jVbv8faeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafC7kAAKCRDBN2bmhouD
 12vDD/979dMW9Lv5TcfGQUR93SFSuL+1Nszqr73yHvGoGQi7tfCWP49r+21+UIm0PR7dfn40ZxD
 tkMVoFEFukIuwMwboMc3ISCA3hVJzi7szQ6B4BXYUMG0BvZNHJJ4kYo/1XH6z8bjZB99KRSXgXr
 ylryIAcZ1mC7su9G3v8oyfV8qLiM8YVhdelL7eB6r6N6aojpD8aZJtPM0K6nQkC28UOta+SFDTh
 dvEzMbSPxjLuTkSGzVeHBJWTBL0vr97utaIkbnlUQxswphOQ1w4D1Gpyyq50Az3UxmjmE7q0+Ff
 v/A/InLJOJAzH3KNUvliRHGgEQnVEDEQvXR1phNQNXw/R7HmboIAwFyf92nHzt24U8gAe2jWhb4
 x/35uBb5gYdPe6GyZNQB6d726BeIz6VXvIvA+OBPIIXsSRL/dVmuBre/V0RVfr0Tg4cTO6m8h/c
 sDwEkNb1FAQOGCK6g8GEFlQm/42/BDNYatbOrmMklv4/nc5/ij60uOqsaQE44aNJOV8nautroYI
 0TNCZuGn924j9eb/i0p/TOo5u3qSbHgRK8zGOG38kXMJL+R+mwGUnthd7vZ1u7ojQT/6MRlcT+h
 1EVrDPhu6kXrkx3W4Qr3kchHeAQc4YYKttGUDceij956yim5BVc89lQt+TH4JqvXrtv+ojoJimH /UzgrRlGEojnSCw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzMSBTYWx0ZWRfXyyFym6OfADb7
 cklWqUQAHjZ9aIY82m+PXXac9jLkUiuKsHoO5vl1l/m+YWpQzcPKJCOHmzfnGgIR/yPvY1LKGje
 yqO/tC/6YEr9WUFWJOrLUaeOuBlF696+SmEbtxnJGAqYkpdnHFmGWUBQNEDN6uxFbLrp5j/zkLQ
 u7UVzb6M6hrP9WsYcNrI7h6bSB2lMOdX02bUeOphLRZ/tv6xwS/Xer40w+55vWr1jW78uEn/ooG
 LaxmqE3vb3FZTLxQ6fWimUHWB1JTj98VTzRSnbGgQpH6LDAvSmE6EzjiqK1XJ0Tl6PxXqcGMFN/
 CEycOcWDiCjvfEWOlVb3tolrkSMsaJxIoI9/4SoUH+pPUkXmRGzCxEgy4dtZQ6pqtnmPp5hpeAa
 ZRZ5prf6y0K3spBNEZS0ybst6/bkP0Uw/RMFBnl8JHbAn5G8QDcRgD7akzt5VbogzELEts6lX1I
 4xFDBbvepz0/gYsmXig==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0bb99 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=UA6_GPJISWn7HxH5klEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9-ufr3gBpNhRBgAlcI2EWXDPpIQhhuF8
X-Proofpoint-ORIG-GUID: 9-ufr3gBpNhRBgAlcI2EWXDPpIQhhuF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280131

Due to lack of time I did not perform reviews of patches for Samsung
PMIC drivers last year, at least not in timely manner.  I still can
perform limited testing of the code on hardware, but that does not
warrant having "M" here.

Maintainer should be responsive, so drop my name and shift these drivers
maintenance to André Draszik (from previous reviewer role).

Cc: linux-samsung-soc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>
Acked-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Squash with other credits entry.

v2: https://lore.kernel.org/all/20260116175646.104445-2-krzysztof.kozlowski@oss.qualcomm.com/

Changes in v2:
1. Add CREDITS entry
---
 CREDITS     | 1 +
 MAINTAINERS | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 17962bdd6dbd..1537f2f70582 100644
--- a/CREDITS
+++ b/CREDITS
@@ -2241,6 +2241,7 @@ S: Canada
 N: Krzysztof Kozlowski
 E: krzk@kernel.org
 D: NFC network subsystem and drivers maintainer
+D: Samsung S2M/S5M Multifunction PMIC device drivers for Exynos platforms
 
 N: Christian Krafft
 D: PowerPC Cell support
diff --git a/MAINTAINERS b/MAINTAINERS
index 162f0809d15f..0c3b3c910334 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23714,8 +23714,7 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
-R:	André Draszik <andre.draszik@linaro.org>
+M:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
-- 
2.51.0

