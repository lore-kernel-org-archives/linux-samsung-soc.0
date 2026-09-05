Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776FA395AF8
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628172; cv=none; b=VGRkZT3kqgoaxIrruoFsrqO6fEcSPNNj39FcL8bWvp/uMSZfQG0s5YCPVOdQtArlzWPSuI9HW+MFrEvQKNo36RHXKESQGr1Gnhn81o4zNj+WAL19VwtIatMNfYT8TCh+hSW7DF9WEgMr/5mgLI+IBJrtCHqDAzf9qJW06orDJ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628172; c=relaxed/simple;
	bh=zTyJirzSszRFxuUJU2B7RhWAHrtcRnorYI+I8rDYpJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZh/tWErcL89x0ATJ2XwGEkwBaVHDkDMURTUbvB79HHTTWmZ9zoiNAuyhlOjapef/CBYT6psRoMU8xv6/eExB++B2id/vaiKrS9BJloZXz+nRKLVrolFvV8mtr7xWfD7ZKF0CZzLNHVH731/78f0g9alMPaTJeCBruw41RTUaoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=nNMqkSjf; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="nNMqkSjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1788628164; bh=I596eH/N/ALTurMBAJDjCPnR2ONjyLmzJkdM+R3U7Zw=;
 b=nNMqkSjfaIxADv3bsXaJae3gg1ls+n1Ko/Z1LQVQFxW0QWsmKvmp8PwR+fLQ9IvlZR4EKeW/e
 x42lDRw8J7GfT7aPhDm98AlnjH6Z8+epOgxrF9XTi37CrccRIuXuKyPEJuwkZVhh+neNS6DIXCE
 n59jzOHAB3aVys26Ciu6c4A=
X-Forward-Email-ID: 6a9c4cc2a8f35195ccacae25
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net
Subject: [PATCH v3 1/2] dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
Date: Sat,  5 Sep 2026 18:09:13 +0100
Message-ID: <20260905170914.1640-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905170914.1640-1-tturner@lineageos.org>
References: <20260905170914.1640-1-tturner@lineageos.org>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
  - Add Acked-by tag

Changes in v2:
  - Introduce this patch

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

