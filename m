Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F88274FC2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344823; cv=none; b=XxQDVlTeACR9W+TMaKqv5Kl6sgjXCIQH5kipNHpIAYQRw4s0mmh3hUmesRmbLu2uyfTaUQvtYFLyxGd8b3qbTCz6I460SMNnAJo0SYKbxavwGFnKWtTzvtAl9X3MifLvRx6f9wjtkMP+CmFbcrSd4vUFnbh5RU3sRtC56MLFwFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344823; c=relaxed/simple;
	bh=U7tIo/+hPh5wsSDVa2lALrOfs/J4zuc77cFA4O2QvIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=jF7vNd3p9VHJudxEXX/JaQ/9dRbsVxGVCGXlXX+K/o4tW9WFfg/eL1dWdZp8bpWG4tVYEdq8qy5w6ImsPQYwad6hGDTVDK46oHWXoOYRdNOwuMEgMTx2GgON9fXONkmaN/CI80UYHJSdON//GP1IUQ8vWWwXbpo613LNr6L6lFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IJ/QZ3xB; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IJ/QZ3xB"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250724081338epoutp026cd013dd62b5648f084728090630ac80~VIdLAKKbX0995809958epoutp025
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250724081338epoutp026cd013dd62b5648f084728090630ac80~VIdLAKKbX0995809958epoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344819;
	bh=ohWkVViPltngJsHO7QO3hWauv6Xr0PKpOtjgZtEomck=;
	h=From:To:Cc:Subject:Date:References:From;
	b=IJ/QZ3xBh860Y+YV68K2mGFTVfAPqPNyQKBqTeeZ7ReOwu9Hu2I6xY/wDbY6tMFZV
	 Eeuniks0YSdlKMOHkD2++iWfjlDyCF4Td+41Gwb917VtI2LeYNhdURhFxqgwHBOvi2
	 INNcV2CRufee+EAt3eNM6LK980px1U12TJfSqW5k=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p374500980da4a71c430cf64110e52ddf6~VIdKLs-yC1011010110epcas2p3L;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bnkKY2kssz3hhT7; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb~VIdI9bMNu0887108871epcas2p3I;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epsmtip13c1b034ffc2b18f9512c58cb6a28178d~VIdI5pJXI1874118741epsmtip1J;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 0/4] Increase max timeout value of s3c2410 watchdog
Date: Thu, 24 Jul 2025 17:08:50 +0900
Message-Id: <20250724080854.3866566-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb
References: <CGME20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb@epcas2p3.samsung.com>

The ExynosAutoV9 and ExynosAutoV920 SoCs have a 32-bit counter register,
but due to code constraints, only 16-bit values could be used.
This series enables these SoCs to use the 32-bit counter.
Additionally, it addresses the issue where the ExynosAutoV9 SoC supports
the DBGACK bit but it was not set.

V3->V4:
  - Merge patches [v3 3/5] and [v3 4/5] into one so that Quirk and its consumer
    are part of the same patch.
  - Link to v3:
    https://lore.kernel.org/linux-watchdog/20250714055440.3138135-1-sw617.shin@samsung.com/
    https://lore.kernel.org/linux-watchdog/20250515075350.3368635-1-sw617.shin@samsung.com/

V2->V3:
  - Correct the incorrect tag information.
  - Link to v2:
    https://lore.kernel.org/linux-watchdog/20250514094220.1561378-1-sw617.shin@samsung.com/

V1->V2:
  - Modify the max_timeout calculation considering overflow
  - Separate tha max_timeout calculation into a separate patch
  - Add max_cnt in struct s3c2410_wdt
  - Set max_cnt once in probe function
  - Add patch that uses S3C2410_WTCON_PRESCALE_MAX instead of hardcoded one
  - Remove unnecessary inner parentheses
  - Link to v1:
    https://lore.kernel.org/linux-watchdog/20250513094711.2691059-1-sw617.shin@samsung.com/

Sangwook Shin (4):
  watchdog: s3c2410_wdt: Replace hardcoded values with macro definitions
  watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
2.25.1

