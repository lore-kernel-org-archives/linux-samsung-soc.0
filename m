Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF93E0C75
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294428; cv=none; b=qY/gW8JAUG4CtZ9gVgLHi5KoX1Ps/7J2Utoi7rv/6uw9tQ6Lvl+fz004b8vPT84aJTdjBbMoHokmZMEELq79OqKsZf10/bnnCgVdWQZrZOEo6pB9nHTu3krWdg2JCGgueURBDOUrT36mLcAUFgiMBwemR8TXExvAyQIInX9F0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294428; c=relaxed/simple;
	bh=dfGrhNe/8a5U7zoIJmFRiK9qopEVvmvIQIwi6yX+Onc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTXW1WUvPSbv8U9wP3TDRw+oJu6HnJqX51ogAm/n+DVsL2a4mo5yTm3ztFZAVWBu7YCw0WsQXN4Fw1sU0zReBRYVXB3YFkglXasdJ/FENQ2/cxuqGJw8iG1fYTULhKjx21oTl4cxGNOXUIDrnU4MuhgDZ4O4rYm5EIOhEjQ4jmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=F39YZTsd; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="F39YZTsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789294420; bh=yZLeOpcK8d38XmjkQqkUC1h4vgXICE4C9Nm+SuuEi6g=;
 b=F39YZTsdEL6e8IpKPmO6puy5UAKRLoZ+PPFnVyeEvCeVmMUUJsE5cusuDBPZIitAxDd+KPIHS
 M+EUxQmz2aM6vQ5Ind6bK1jzu3MrqSFldTPbEu3fNLz8Ep9/FqF3mnmLjcNmgnjnWINRT0UgpAu
 TddoCvQhAfLNa9P/zD5/inA=
X-Forward-Email-ID: 6aa677525d6bf3657bd82a58
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.66
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
	thomas_turner@talktalk.net,
	alexey.klimov@linaro.org
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
Date: Sun, 13 Sep 2026 11:13:30 +0100
Message-ID: <20260913101331.198835-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913101331.198835-1-tturner@lineageos.org>
References: <20260913101331.198835-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
based on the Samsung Exynos850 SoC.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 753b3ba1b607..b4593319ee3b 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -233,6 +233,7 @@ properties:
         items:
           - enum:
               - winlink,e850-96                 # WinLink E850-96
+              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
           - const: samsung,exynos850
 
       - description: Exynos8895 based boards
-- 
2.47.3

