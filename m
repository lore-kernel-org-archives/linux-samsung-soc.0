Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574764C9DE3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578409; cv=none; b=KgLNWhipEK+7BmX46ItyT2vs4MUQFwD7r41LYXU87MlM2znsSPyE522wzcQ5bxm/LpOzRRWSgxmZbu6ECMG0ILTSY3V8nYEvNyOjAcMF2UcagcMRzgTpeC/OECjMFCQkyEP8Jk0yFznr3KF8ZxZN+ZjlSMdlVp5HoOPIy5QqOJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578409; c=relaxed/simple;
	bh=DvDRUmbdA1hNLtbXg8l29Y6o593XR55fqEPA4seYRpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DpiCax2BHA5fmGSpo3LpgzxppCdpKRkXz8GXx8hIAz80XzhLmCYeu6i1UwMxjr1XiIFVUq8r+3C1IvB/rZpQ16Zy+JJKefNoCDcd91NPWU4h6EGPyLjKv/kVmPMAqUIjGwDtIK20GgeG71IdpqEDtx8EU9djuFxbhc57yRE+qyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6on4X0/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwCBwhOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6on4X0/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwCBwhOL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeLH04056371
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 17:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R8MN1jUSDFS343/7fvvAHk
	6j8IvEcZo9/KawqASQ3kY=; b=G6on4X0/Mla60a3HI91EnVnQVoH8GaUZ1gQN2M
	vYHlwg0qvlPIxzsYyZKr+NJGyEpZcAxSPIlynJan9+qlQsIyXnLXXpEoDxAZQVXU
	CfItnzMo+c3QbHc4HDE0NunTVzkR/TIlKZbzlI7RT4VKrjuK3K+Iw1VsUQba8k6s
	9xGOggaDlMP2vGz2Azs6brFm2cOcbSuaOuMXNYqt8pJWmsHomFb18QiPdhr85tZh
	XE0ITtFp9VQA20WqdIbd5+tXDeJNGV189eNBugECl6id0xFfmRmZo9xDZvAR/sRj
	21/yzWrDofJcQnN3RIs7+8qBUpdf09EQNYQ6BKc4m4uhY8VA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2tev0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 17:06:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso2005179e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789578384; x=1790183184; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R8MN1jUSDFS343/7fvvAHk6j8IvEcZo9/KawqASQ3kY=;
        b=BwCBwhOL+RdQwzJ+q5O3iTRdVoM/iZtLPBibik11t7152G9AygVMw8fB4W/Fxq8YmE
         Nh/3uFVr7ZkJ+XPoQbkrEgB24ECSrMvX5garJVZvAiSE7JwE7/2uqYB5qfjLNj+/rPGw
         ugJQpLqHjx/Jdpq7dZ2qgwzNEmYOxKQkc5isicSBZzEHNk79TYWVYORNd1pblzQITnId
         yumzt3j3mCIsy5lW6eU4XslwZJDxquWIIZB8lG51zqYVo38vXRoz3iDp7rqtjxdPjA6y
         CBs4Pvtw8sHdNdbzHCA9iFjkc8fVXgDMxS1hKzmEERa8dsLETvKchQqwzIh3/mgNDNlL
         rclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578384; x=1790183184;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8MN1jUSDFS343/7fvvAHk6j8IvEcZo9/KawqASQ3kY=;
        b=DCgWuVZSxH6aAk/+/i+A6/vK04q6+UYLX+At7zS7POUioc5HKpdfgtKzN64IvGQg9b
         TUFWCNvdTwX+gCr7ziRlJm9avxl3OufeR0X03towxpFxmFn5J1th4tyVsmm8AAgQVc0a
         vDVsSomZcS2lYuTIEIL3vvPOH0IuxZ+00909+4SAU8qxTI2821EShVx5Jgg1PnMHYvGD
         T74GApLqchYKGG2koIVmkxBPfj3vFzZfpu0Rue7kIQTkHrJH+IgX/l3C8d9l0he7pw9E
         3Cd+xgVrIULnl6xeXDcJirL6FcVBqsXy6AvRwwP/bmJZyDSrGKqSs0L5HK3svTUIIqHs
         vrMA==
X-Forwarded-Encrypted: i=1; AKwUvByqmp9oXWuDGA47kDrpLXZtn8f0BZBnZXqyI95POjYc4kLqeB3sq3cPfEs9B0u8KGhi3UPZixh9x14pNe/BbPTj6Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nsZae3yo7Euv63NHdfGbttXul2+70xe67cm7ImiIcsgp/t/Nwg
	YtGj24Hz5omGkwkX1lgxHXuZU7pj+k1RUewI6T/7/AVc8/5NdLntBzj7KD2wsr7inVGjohPLg9y
	6hZq9GyYGnHra4cEgVo6cx1/bd8ZcaAqyCeCSB4DEg/XA37Pa+xCpcAEOlYTzgb9Aoi+6EmFf3w
	==
X-Gm-Gg: AYBFou35z2BBF8e2G7VRk4Y2Ho5CeGpIo9dRXXHK3hWBb78083qqYqA3ghust3dbzZK
	v9idO4j4EpLHCFR0S76laVvHGT3PWePN1gBinhfFLL4CEoaqvgb6ZP4+TskLVrKw6r0i6OnVH/N
	LqnhmTRc5jAXx/urNtzFJad38BlGCLf297NwlHs2pNDTS3ZmoKeTQ9XJ2Wh2oXQFHws4ql9M7bf
	dy/wDmxUXM7/RUEv85Ya3QtDMn4Kd6ETIjh2n/tF76CQDbfrLW8FZU6lI885J2ZVyxjcwlurkux
	Uv+ALB3rQdvLUM4HgrxO6D/Z2KJh7v7QWGpy95KWdN3xDc1b2zpPxndP7F3SfEjrC3ZoSQpwL98
	JkZX+OqJTwyFRJdDivMVvpVc=
X-Received: by 2002:a05:6122:6314:b0:5c7:ea14:4fe7 with SMTP id 71dfb90a1353d-5c9a574a8acmr223973e0c.9.1789578383723;
        Wed, 16 Sep 2026 10:06:23 -0700 (PDT)
X-Received: by 2002:a05:6122:6314:b0:5c7:ea14:4fe7 with SMTP id 71dfb90a1353d-5c9a574a8acmr223943e0c.9.1789578383352;
        Wed, 16 Sep 2026 10:06:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344bfsm7951293f8f.27.2026.09.16.10.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:06:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
Date: Wed, 16 Sep 2026 19:06:16 +0200
Message-Id: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBSEr2K69hFawYgr72FY9OcJNdBiX0s0h
 Ltb8ARuJvmSyTezMMJgkdj1sLCAsyXrXQZxPDDdS9chWJOZiVKcy4ZzUBWYSEBypOQ60ANKlya
 gGKyOoL2L1iU0gOYijVHayBNn2TYFfNj3vnRvf0xJPVHHTb81ekvRh89+ZeZb7//VmUMJjZR1X
 dZcV0LdPFHxSnLQfhyLHKxd1/ULDkYRg/cAAAA=
X-Change-ID: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DvDRUmbdA1hNLtbXg8l29Y6o593XR55fqEPA4seYRpk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqsyK0nTkSriwe/0MMAuYN/f8r3VaRJQpQYSlC
 XYDy3ELxdKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqrMigAKCRDBN2bmhouD
 1wmHEACWWgibWkjIlfqAt2MKy9hE2yYOPIVsZ8DGJ26S3kKVqOosYVDeaZk9FLCPPdT2B4RAbs2
 j0FXA6Nw3bX6XsRI64oIWE5z004fs/SitB8i4DZgriK/+QWFuwtFuk7JAmdASf6mV6yaeMI4J2q
 +s7TcTkQzqIMGYn2N3OyJNVT1H6axeXTi91VSZ8theoYSfKxwNE08lJoZEYZraNfOMg4fyKsRn1
 K+Gg2mzWXzwHtvXdzAE7VS4QdgW4aIsPvEwI7nAXIFNo1/+Nohfp2qmV1z9W2CTcLXo6YLLLKPu
 XzYvxdlSiFSfQ6xIbSGYyw5kIyRyAkp7Lpx565zautGlFaBhnZDP+ll4541fd1h+m48aW+N/xYq
 uvGr6t35lybnW/541vys1fCdGLdkeJesQsgrPEG8bGvblCEC0uPgpsy0Tla3HAd7vFm4OlKIYQi
 6HxHqbLBZKeb/Fz+aq1aNsWeYiA2xWW7diaY6bpCDY2r56calFBTZDRZx4KMRY0ropOo6bFKJw1
 DE8vozcjKQ/zDXCQ/FyAsR98/zTJBasPJGeurSyxSVOtuLLZvGI4vBbKqRoyaAI4XAnzqA1eDeg
 NWanNJg0jxQ2eAyDMZve3tiBJrIciBJ2iCr3HIM3qhKK+XH9l6dTzoiFlSvqIr23srP6mYi41aS
 Ge74esyIK+t8Hcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: TzcrKyjoVGFSiUOVP9d4h2g0PED7daC1
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaacc90 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=xKH-exNoj8ZXVN6IjzYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: TzcrKyjoVGFSiUOVP9d4h2g0PED7daC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX+EzXo01DBywi
 FOkOU01jeKD13hGA3l3CGZSB3OkM9FNrfTLJdDNeBK+iJvSh1aK4k++HtcmyXLnjdaoKqjZCRzm
 +Cf23r1JjlbB1HZ5DJfNlTHTRA6jMePkytNJv6PV1xznC/fb5J5phtjn/i4oQ+wRfKE+gmNyZgJ
 Hpfe9lcFsn41Gi6RY8SP889/Z7baKJahqQLatGAh1EdJcrScpTFd0Kda1Vwh64V+d43UyfVFIfm
 ibv+3nH7XqPglAHRa6+yteSyAeTkPllQ6nSz+KTydkVRscK8Hgzfh+H2//QuTPEYia9eZal7p1h
 f27w7FWll1bfMbyP7UKQLbHhRKCYtghJTSP9XEzEjX0A0Qj3ZdP0pMHJbDa+QIs1Te8xUWzIX63
 qcWCV1JDof0jFnOKf3U+jZ87DLA7DlpIarCEXM4a64FVXkuZh9Or6O7Pa1jrBFc2GpqhiVFs+Fs
 s+dLgXPkTx5pf05dGPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX6BJ+D3LDtCYW
 QVO0pFucuBly4WE2sWjNpiZCj1yERcve1SRW+1+lI6qp5EuxidLQdjGgLQt60fNATatqEhEOKei
 jUlVM7rH49HokV68c7mZJzNqU0VdcI4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160234

Changes in v2:
- Do not reorder CPUs because cpu@4 must be the first one/boot.
- Remove applied patches.
- Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com

Not yet complete, more files will follow. I probably won't re-order all
Exynos5433 soc nodes by unit address because it is way too disruptive.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      arm64: dts: exynos5433: Re-order nodes to match coding style
      arm64: dts: exynos5433: Re-order properties to match coding style

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++++++---------
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 108 ++++++++++-----------
 2 files changed, 102 insertions(+), 99 deletions(-)
---
base-commit: 9e8494291f765bb1a8f43e36fb6b9146b20bc12e
change-id: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

