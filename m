Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795251719;
	b=nAvXQTycu1gemb5q3wAjVGeEUzmEH2nP/SD1z62+Oo0MrLkzU2jas0olm9q8Ipo2Ys5y
	 0UiJqCY4DGCqSevss4QnXyvsQHCbFhTfyqAdyyXsluDClRNLx4ra/xlNxG1lekc2Agvw/
	 suZ72MzMpgDeml3rHX7jU+CPyJznjpvgRtoYaXxwWFNHiILP5QkBq+WOXR+wkn8dL4AqF
	 L7NfxEtEI12H/NQQ+RL8/8WWg8elC3jIp6EanMpUU2gReIoFuwjTysE24fHZ+l42zbfSa
	 mqeikIUv1M51VhIPBldr3xp9lXNPQJSr4M26CcqQ77Whpou66XoQurHLoe4uIvehGbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795251719;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
	b=N1sCPhQVjQe7omHCf5EW8o2UrF1ftXnDhhzewqco5VmkarAQjGtvCiH03286LkWouF2S
	 yhL5sHI/KFN2WMJKlaowV6CpFNcqC+0Elc/Fdc53JRx8yiHXzHQLMVA6BX2dTH+TL2f29
	 Ti8u+8bmPpfc5q9N02h/FPghZnMrnC0B/DkvIyKKeTG3ThhqsBGWIPYldfUskea0W1FfT
	 Wn26hqRdA3emOYSi92Puxu4LWGMGSZAFrM+9Z6gUraWr5+UWAMzEVSKFDQeX8QlzoB9Rh
	 g+gn2GbeDEN4XxTtlkAp47vnVozotwIqEi73lc1bc7AF9LAmcIIL8QQKxS90OF5AynQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ommer.net;
	spf=fail smtp.mailfrom=ommer.net;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sQe+0ic3;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KNavj01W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB396606A334;
	Sat, 21 Nov 2026 09:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB396606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ommer.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ommer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sQe+0ic3;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KNavj01W
ARC-Seal: i=1; a=rsa-sha256; t=1795251715; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VMZB0uNEfphvUQJLdhbzgbA9D4G7EnoVsE/YnkDlIfNVF1uTDRezRNkAaW/m5bfmYk
    1L+Su+eEOkp5QEZ7o9y2DIInqf3MP+SJa8WtH/KszbPm/DxsebcxNHDFD3HYvCLBvI1j
    7CGW3sdHjBUj6zzDE1qt9TTIZD4TnMHRTTTitXGyajN1TNnUwoc9poMYs3IPJICfMP6A
    oQ4cU+j2DuxmAxzEIwmwhpiTeoV54l/eW2x4ZcnBq4ymJ/vCfa8TLQOylkE0k/tJ9tPY
    wxy8RV3Qm9vxfxAckxwQ6nJ3QbCyFx9x46+ORaFwNmtj/SeGpy4IOGRPp6QBAFVMpD5x
    ZVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251715;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=D7cYI7oWLRzopB0Y6wQYlN8JlspdqbPWdqGPbaVOKcIPtm1wQG8rsVdBMSz/bspIZb
    0eHIqMLhExfEBXbp6AomU4yyzeZJ+cpDOTRtLKoiszyt/uqwPkTXJkjYVgATZzAha+yd
    baCSB/Wy4qj+QLieBA7jo2vGGbIyOJBd1gXFei3sgHrkxbf9ZVQljRnMkjaEFd/SiZA6
    Nf/wwaE8bw0U7NTfOmUd1GFJPmvXw9AdJzC4DJmBpfnOZ8ZOdg6YBKIZohPPR6jA5EFH
    4KGnxCE+Ohjs3H67LVcqHn7t7sIcQw79yF8UP7JcnPlMHneJWeb+ieMe5p6x7d/1PgnL
    MK4w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251715;
    s=strato-dkim-0002; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=sQe+0ic3JZ2lHGhQm93Jw5bMi4H5T/o7VzaN6ESH/26kU4aBcBaGfTg7elj/UzYoJJ
    3GNDTxJolqSEnB3M8fm7mMCSjAydaODdD2enRZGMw/78o7eVnxzmS/MoYXcjY52pM6kc
    RqolROEy7X24k45h4RUSPI3HdeNOzLqeLPEx/C5iE94MrwYhaDYbzELmTO2Fdg9rzlLJ
    Gh92PUh6KM2RlwIfN/bBCkx0dzqR0Jl1h+R663WN8OAzCoIeCQTjV0ZW6lBEqIwI0p4E
    PizfqGrOqhW6HDFWU8Kh26FxgdSQElKcsnRakJbak6xJmnWXcnB53hULIG6hsppmmrnZ
    mesA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795251715;
    s=strato-dkim-0003; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=KNavj01WbiMmyb/12DVzWKSIomR3BLy28bZmH41coIYc8eX1xWHyBoLyMkXjPq8EJ5
    NvCOXpJK8kpnqxFsUuAQ==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL91tVCD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 10:01:55 +0100 (CET)
From: Henri Ommer <henri@ommer.net>
To: krzk+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henri Ommer <henri@ommer.net>
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: samsung-boards: Add Samsung a20e
Date: Sat, 21 Nov 2026 10:01:45 +0100
Message-ID: <20261121090146.39170-2-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121090146.39170-1-henri@ommer.net>
References: <20261121090146.39170-1-henri@ommer.net>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Adds devicetree bindings for the Samsung Galaxy A20e (SM-A202F)

Signed-off-by: Henri Ommer <henri@ommer.net>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6f3e02a63..49e9cfaca 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -227,6 +227,7 @@ properties:
       - description: Exynos7885 based boards
         items:
           - enum:
+              - samsung,a20e                    # Samsung Galaxy A20e (2019)
               - samsung,gta3xllte               # Samsung Galaxy Tab A 10.1 (2019, 4G)
               - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
           - const: samsung,exynos7885
-- 
2.56.0

