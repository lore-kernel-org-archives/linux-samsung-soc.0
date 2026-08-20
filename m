Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C9147424D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787234705; cv=none; b=Xo4kZxbF2zvtaZt3sztqRjzZGaTv4zuP5ZwlZ2pUV/MboHSnRjcj2CjShpeO7zHYd5e4QIllcXHfDX8VgWYQn5uUV/rfs1i9pdJtNvXoVrpwIiRiOBkO73o4DCKbhdAO2H0tQ0tIRFFd7dt9E2xsWXOfzIuWe/4z83+P+hwm51c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787234705; c=relaxed/simple;
	bh=EZipOWOzVyxEwLZC5ozioVkSx5AwVMWapHRN/NSt6mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXG5SVFsEpli0BZ7BRVpgrpeDIqCJ1z5DhXxu0q0dY/nebCM37Tu5Oh8cXiFEgBqlz3VCOPK0YW3AurGbIgkR7UKVsrS3Roy5Wouglm97G0pB2bBosKHzEZAJxj1AHf8biwtSau15lBVPnZJ3nx9BorVgPBbfOoQf/6GiRGOv68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=YgdDCjPb; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="YgdDCjPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1787234702; bh=rbw8xQ6r3piVMAmakyWDIwjPOKwVFsaRkmQ0YOAEGp8=;
 b=YgdDCjPbkiXFy7zG+sxPT/ybrmfjR4reVrhZA9Ws+ELxOUx3IzX+oGy/kL/Nh9O2ayK/InEb9
 RDTQs5rrMzKaIKmENeGC9iXOrvI8VhesSd8Dpr9Prew35sYvCnTX+wnXtvFcmeMmbCBI/D+RCNu
 5cmg4fDNiOdfOuXehj6vy9E=
X-Forward-Email-ID: 6a87098cd69df34e1c493377
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Turner <tturner@lineageos.org>
Subject: [PATCH 1/2] dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
Date: Thu, 20 Aug 2026 15:04:38 +0100
Message-ID: <20260820140439.83220-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820140439.83220-1-tturner@lineageos.org>
References: <20260820110620.1881-1-tturner@lineageos.org>
 <20260820140439.83220-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos850 SoC uses the ARM Mali G52 GPU, document its compatible
string with the appropriate fallback.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 9db9f84ad964..ece2b637cd41 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3562-mali
               - rockchip,rk3568-mali
               - rockchip,rk3576-mali
+              - samsung,exynos850-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
       - items:
           - enum:
-- 
2.47.3

