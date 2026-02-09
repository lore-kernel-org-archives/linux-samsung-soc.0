Received: from v5244.v57ae4e16.euw1.send.eu.mailgun.net (v5244.v57ae4e16.euw1.send.eu.mailgun.net [161.38.204.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004421770B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Feb 2026 04:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.38.204.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770609852; cv=none; b=oToahrmGauGWMBgtHYQNVSo5VIcpbN2YQg5jf/Lq8JaercXhl9czLexJAP2X+VC8f2dwCR3/IEc/8ZB+jnbzsqUFQ0nCZKEpomEtYG6IFHXeCMxIP8zc2kIRHo6kroZ1HgLJYqrZU6iJSJbo1TwdqNzSD5eizy5e+jjncAKaRus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770609852; c=relaxed/simple;
	bh=w5ul6MViOpfJt+Z315j6OqUJHAeVUTaHG+zQThTFf0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfEHzoml+Vk5oJQxCP45g0Lhpb//aDDznyAqFu/zdXvoPaCbNrnIu94cggQt76LGHY5N2BJrSPKN4kichMIXG6t+bvCed7SDYiXC/rg/FLVDa7af7SXCUJdr+r8uvN+C5AXKgALBJVn2DGBr09nTp1n3oXFtyvUxnGOoZFPnm3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lvkasz.us; spf=pass smtp.mailfrom=lvkasz.us; dkim=pass (1024-bit key) header.d=lvkasz.us header.i=@lvkasz.us header.b=MHzzkk79; arc=none smtp.client-ip=161.38.204.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lvkasz.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lvkasz.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lvkasz.us header.i=@lvkasz.us header.b="MHzzkk79"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=lvkasz.us; q=dns/txt; s=mta; t=1770609850; x=1770617050;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: References: In-Reply-To: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=HKQeOGFpMmrwu4yHYiRCmHa7Pqx2vqHzDFG/d6in2VU=;
 b=MHzzkk79R2PhnbwNtMO4xdb+s+nyfDNsDE+9SpAOKO/9lS9U4zn62inzxirAgoqM9pKO7rD8yUl67TvNGURzB5UKGXSnRofv8Usy2YB/UBZck9nsG1/1PdOuuSev+Z0bKgdCVR1QPtMey3Zy+8hzbMIRLvS4YCVBbs+qOAy4ZUk=
X-Mailgun-Sid: WyI3NmU2OCIsImxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZyIsImRjNzRiIl0=
Received: from msi (5.185.72.109.ipv4.public.orange.pl [5.185.72.109]) by
 9fd7231a5c61cbac2e381b8639e4b8fc9d01b70453e48563643f27cc8fa9d90c with SMTP id
 69895cb9017cb293c926c3b3 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Mon, 09 Feb 2026 04:04:09 GMT
X-Mailgun-Sending-Ip: 161.38.204.244
Sender: kernel@lvkasz.us
From: =?UTF-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
To: Lee Jones <lee@kernel.org>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Subject: [PATCH FIX] mfd: sec-irq: fix non-constant case labels in s2mu005_irq_get_reg
Date: Mon,  9 Feb 2026 05:03:58 +0100
Message-ID: <20260209040358.2123413-1-kernel@lvkasz.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260126-s2mu005-pmic-v2-6-78f1a75f547a@disroot.org>
References: <20260126-s2mu005-pmic-v2-6-78f1a75f547a@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Case labels must be compile-time constants, but the original
implementation used array element values like irqf_regs[0], causing
a compilation error:

  drivers/mfd/sec-irq.c:218:9: error: case label does not reduce to
  an integer constant

Replace array-based case labels with explicit S2MU005_REG_* defines
for all four interrupt status and mask registers, preserving the
original logic.

This addresses an issue in the S2MU005 PMIC support patches [1].

Link: https://lore.kernel.org/all/20260126-s2mu005-pmic-v2-6-78f1a75f547a@disroot.org/#Z31drivers:mfd:sec-irq.c [1]
Signed-off-by: Łukasz Lebiedziński <kernel@lvkasz.us>
---
 drivers/mfd/sec-irq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 44a1eb074a08..73a611ba0502 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -215,9 +215,15 @@ static unsigned int s2mu005_irq_get_reg(struct regmap_irq_chip_data *data,
 	};
 
 	switch (base) {
-	case irqf_regs[0]:
+	case S2MU005_REG_CHGR_INT1:
+	case S2MU005_REG_FLED_INT1:
+	case S2MU005_REG_MUIC_INT1:
+	case S2MU005_REG_MUIC_INT2:
 		return irqf_regs[index];
-	case mask_regs[0]:
+	case S2MU005_REG_CHGR_INT1M:
+	case S2MU005_REG_FLED_INT1M:
+	case S2MU005_REG_MUIC_INT1M:
+	case S2MU005_REG_MUIC_INT2M:
 		return mask_regs[index];
 	}
 
-- 
2.53.0

