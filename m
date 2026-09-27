Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0936E3F413A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Sep 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518387; cv=none; b=GQHxRaqsZrALxtAvcPVmSvQPIPrjFfh1wEJCPRiFVYiQ0jvNWeizNh3DuW3LHIYGaplKCKwAlYQ18FAgUtHurMrGHdMfZgGEMCbx7DKP0lU9hvYQRPGpa9a/TttDETaTNh6nxGqIviF47G5vG4LvXm5ceIIwSngK+KR+blLvHy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518387; c=relaxed/simple;
	bh=n1oTma4CHJHlr07UFERPMOUAKaqITTbrYwG7n0Bg834=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=H4Z4G/nupDvsyWpc4qPn0+bBd8ToLK6n4gLrPy4SM1T6VtZ0DvlM2/W8/Yh/FHnERy7NYATD8bfgHIStcqKqKKi5a4svvI59Yx9MrKRW14Pv5pVnl8S+GzQ+TYmv4iqrhMh7sSwPvCFf7VKA6q7i0fXSAliUdx39RElNf/ZmZpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=c8dRyYEy; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="c8dRyYEy"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260927141256epoutp01f5fd0c619ea238c236209fd34b811b31~ZMvoVGIml0307703077epoutp01j
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Sep 2026 14:12:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260927141256epoutp01f5fd0c619ea238c236209fd34b811b31~ZMvoVGIml0307703077epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790518376;
	bh=PS6eCa2NZNuq64ET4dYTcNZjHyvP/yRqiPXWx2KBgcw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=c8dRyYEyZ3Gz1uoMZxEELjLuvUHz/AnRJFAWALBPnPQidlDKYl06LT6mSYCMAXdWc
	 BUF9zaVPdcd12ZTGFU/xwW1OwuMbhJzsYndaL9umcEAbCf7TikBc0lts6t1A4BcXOm
	 D+2Ap0Jidl38SLKP95MHAYKLOCSjXvFIfu5krDRs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260927141255epcas5p1088d4a50e979e74a6b018b4bdf8c00d2~ZMvnHMNIk2230922309epcas5p1W;
	Sun, 27 Sep 2026 14:12:55 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ht5xf1xqgz6B9m7; Sun, 27 Sep
	2026 14:12:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260927141253epcas5p371d497edc6756f13ce2215af4f380fb4~ZMvlfjE8w1569815698epcas5p3E;
	Sun, 27 Sep 2026 14:12:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260927141251epsmtip176f4593c5d43b70bc2326ba33f240016~ZMvj2IvIW2206322063epsmtip1K;
	Sun, 27 Sep 2026 14:12:51 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux@roeck-us.net, hajun.sung@samsung.com, wim@linux-watchdog.org, Alim
	Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 1/2] dt-bindings: watchdog: Add Exynos8855 watchdog
 compatible string
Date: Sun, 27 Sep 2026 20:00:59 +0530
Message-Id: <20260927143100.3576195-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260927141253epcas5p371d497edc6756f13ce2215af4f380fb4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260927141253epcas5p371d497edc6756f13ce2215af4f380fb4
References: <CGME20260927141253epcas5p371d497edc6756f13ce2215af4f380fb4@epcas5p3.samsung.com>

Add the 'samsung,exynos8855-wdt' compatible string to watchdog DT
binding documentation. The Exynos8855 watchdog nodes use two
clocks (bus clock and source clock), require samsung,cluster-index
and samsung,syscon-phandle properties, similar to Exynos850 watchdog.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index a32c47831577..517c0e1cd78b 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -25,6 +25,7 @@ properties:
           - samsung,exynos5515-wdt
           - samsung,exynos7-wdt                   # for Exynos7
           - samsung,exynos850-wdt                 # for Exynos850
+          - samsung,exynos8855-wdt                # for Exynos8855
           - samsung,exynos990-wdt                 # for Exynos990
           - samsung,exynosautov9-wdt              # for Exynosautov9
           - samsung,exynosautov920-wdt            # for Exynosautov920
@@ -52,13 +53,13 @@ properties:
     enum: [0, 1, 2]
     description:
       Index of CPU cluster on which watchdog is running (in case of Exynos850,
-      Exynos990 or Google gs101).
+      Exynos8855, Exynos990 or Google gs101).
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos990 and gs101).
+      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos8855 Exynos990 and gs101).
 
 required:
   - compatible
@@ -76,6 +77,7 @@ allOf:
             enum:
               - google,gs101-wdt
               - samsung,exynos850-wdt
+              - samsung,exynos8855-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:

base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.34.1

