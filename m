Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B716EB7D
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715064814; cv=none; b=WHSwEUyCK+cfDX4xJQk5XcUjgDX5K776wODcrWR+59aE5mSsUK31Eaw+peF9iN/+rzj1IT2tLdfISPPaoJZIgwmJfBAMrAXsd8GMToUh0ItoWGLqtJ472X99WT/JGBz9aeQrYRN98qCWPUjxB7361QxmHKyloPFULuqi4UabyLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715064814; c=relaxed/simple;
	bh=3RVvsRY1riTPp8sqDGfDnQM5b6i9tEX131EAEMlxZF8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=Ad0dw2NR0IpMQ9bON53D2ygbhk8OSBW1ZuONsQE6DrWqo33NrE/n7grRJPByqkm/imV0aDuW12TNnPDT7lAUolBYh9QN/XTAW5e/MQghlz9NCoVltHFe8t/7LKL8AGxYt3SK1jACF1DdScaNt5t+4Qb3xrk8ejZZ8PCS5piN1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iPfbnJGS; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iPfbnJGS"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240507065330euoutp021293babfd925f1fa0bfedad68b37a59f~NIluo2rOd0206902069euoutp02R
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 06:53:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240507065330euoutp021293babfd925f1fa0bfedad68b37a59f~NIluo2rOd0206902069euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1715064810;
	bh=eGoaR1cIusQXJ8HGszq3XedYwmA8e6M2e4szE7nyD7E=;
	h=From:To:Cc:Subject:Date:References:From;
	b=iPfbnJGSaoEkBjf8wcCayg0N9yKaEhRwuu9NB0GUfPKerKgrd3a66/s+YmXgXlknd
	 ajTcQCqmcxmzqWWamu/iHEEM2ODnffvAlZN/Y382SpQ6PL7z2fKQyxWZZ57UUrFcp1
	 XYtyNh6kJJqeYPEnPqHJePNukErB1+04snA6iZCU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240507065329eucas1p2bfc600f68aea28788abf5759c5001158~NIluS1qsR2883828838eucas1p2K;
	Tue,  7 May 2024 06:53:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id B8.5A.09620.9EFC9366; Tue,  7
	May 2024 07:53:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48~NIltzrzOo0851808518eucas1p1P;
	Tue,  7 May 2024 06:53:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240507065329eusmtrp1729755638095f476e43a6d601f79ef25~NIlty-OXS0674306743eusmtrp1v;
	Tue,  7 May 2024 06:53:29 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-39-6639cfe9aa01
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 4F.74.09010.9EFC9366; Tue,  7
	May 2024 07:53:29 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240507065328eusmtip2fbe4dfd32b595dafac4fc32829954ab8~NIltMuPbH2367823678eusmtip2m;
	Tue,  7 May 2024 06:53:28 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: samsung: Don't register clkdev lookup for the fixed
 rate clocks
Date: Tue,  7 May 2024 08:53:17 +0200
Message-Id: <20240507065317.3214186-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djPc7ovz1umGcxaqm3xYN42NovrX56z
	Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3eLiKVeLw2/aWS3+XdvI4sDp8f5GK7vHplWdbB59W1Yx
	enzeJBfAEsVlk5Kak1mWWqRvl8CV8WTzdaaC0zwVtx7eZG9gXMPVxcjJISFgIvHi4372LkYu
	DiGBFYwSew+tZoZwvjBKLN2xhQnC+cwo8f5JOzNMS8uJaVBVyxkl+te1ssC1nJnRyAZSxSZg
	KNH1tgvMFhFwkNh1bDLYKGaBJUwSK46fYwRJCAuES3xeNgusiEVAVeLk18dMIDavgL3Ejftb
	2CHWyUvsP3iWGSIuKHFy5hMWEJsZKN68dTbYGRICSzkk/h5vgmpwkZg68xELhC0s8eo4zCAZ
	idOTe1ggGtoZJRb8vs8E4UxglGh4fosRospa4s65X0AncQCt0JRYv0sfIuwocX3xJbCwhACf
	xI23ghBH8ElM2jadGSLMK9HRJgRRrSYx6/g6uLUHL1yCBp2HxNPfn8FOExKIlTjev45lAqPC
	LCSvzULy2iyEGxYwMq9iFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITDyn/x3/uoNxxauP
	eocYmTgYDzFKcDArifAebTdPE+JNSaysSi3Kjy8qzUktPsQozcGiJM6rmiKfKiSQnliSmp2a
	WpBaBJNl4uCUamCSPxM70WLXjtlapfri6UYuSsu18q8dOd4QLvp53YVNL0OD9F+sPyr0w3H/
	+10PtdZMnbx/aUfjiuun938PNEp5tf78CT63q2usfZb/TmzhvnWvTjtusc8yzX+Xv5XMeBR+
	6ql1kOgyi/0nJx/ZxjpzT5JJk+QGni+6DiF8S+vWByi15V9c9VBsk1PxRzf5R80lzA/SMwL3
	nsp4Vll+QCZ6p3eSxpLo+KS+7oWbjlj6sd3/33171Wf99T9Yihv+RLh/TLK5V/vQ6kyVvorB
	TmOlzQfXzOVte7/RcgKzq0MOo8hzqcDnYTfDa7ae+R/07ubSy6d+7I2ukZBQ+LpWbN4S8603
	a53PxMy5/qHkkJMWixJLcUaioRZzUXEiAJQOl+irAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsVy+t/xe7ovz1umGcz6xmPxYN42NovrX56z
	Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3eLiKVeLw2/aWS3+XdvI4sDp8f5GK7vHplWdbB59W1Yx
	enzeJBfAEqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRv
	l6CX8WTzdaaC0zwVtx7eZG9gXMPVxcjJISFgItFyYhoziC0ksJRRYv2jUIi4jMTJaQ2sELaw
	xJ9rXWxdjFxANZ8YJabNvcAEkmATMJToeguS4OQQEXCSePT5JjtIEbPAKiaJiSd/s4AkhAVC
	JZ59/gFmswioSpz8+hismVfAXuLG/S3sEBvkJfYfPMsMEReUODnzCVg9M1C8eets5gmMfLOQ
	pGYhSS1gZFrFKJJaWpybnltspFecmFtcmpeul5yfu4kRGOzbjv3csoNx5auPeocYmTgYDzFK
	cDArifAebTdPE+JNSaysSi3Kjy8qzUktPsRoCnTfRGYp0eR8YLzllcQbmhmYGpqYWRqYWpoZ
	K4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUwRdd/tjN0as0sljARF6xpO/t4Mp+h48IlW0wd
	0hj4PRSFUiVi5f8tX7Bl0eHI9tA5ykvZ/29Pktb0UTrU73HP/vMk5s5NDNs3OKXX6tv8XzNJ
	7UDO/iXzPXzLU2o/6Wdwn5r+/DVDXm3knugd+pP1SwuPzvPY3jThivDe8ueaH8/23K3+aFIT
	mFd6U+P3zMzl1o9MUn59tTGe8tD2S98k1xcdZcsnBm/a+346/8aJP6/eLD6qOE8pgZvzxIzk
	Tq9bZkp7j7cdzub9wfvc7NGprXu3SahJegYZaxWo//5fEBgl28hibSK1e/KTI2+0UmovpnD8
	vS0zzWS6c13quz/diZ/1dU84JnS46j7M3DpbiaU4I9FQi7moOBEANh+jkf8CAAA=
X-CMS-MailID: 20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48
References: <CGME20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48@eucas1p1.samsung.com>

Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
clkdev entries") revealed that clock lookup is registered for all fixed
clocks. The mentioned commit added a check if the registered name is not
too long. This fails for some clocks registered for Exynos542x SoCs family.
This lookup is a left-over from early common clock framework days, not
really needed nowadays, so remove it to avoid further issues.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Here is the fix for the mentioned 4d11c62ca8d7 commit, which fixes
booting of Exynos542x SoCs:
https://lore.kernel.org/all/20240507064434.3213933-1-m.szyprowski@samsung.com/

This change is independent fix. I've tested it on all Exynos based boards
I have in my test lab. It would be great if someone could test it on
s3c64xx and s3c24xx based boards.
---
 drivers/clk/samsung/clk.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index b6701905f254..6342ff411757 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -151,15 +151,6 @@ void __init samsung_clk_register_fixed_rate(struct samsung_clk_provider *ctx,
 		}
 
 		samsung_clk_add_lookup(ctx, clk_hw, list->id);
-
-		/*
-		 * Unconditionally add a clock lookup for the fixed rate clocks.
-		 * There are not many of these on any of Samsung platforms.
-		 */
-		ret = clk_hw_register_clkdev(clk_hw, list->name, NULL);
-		if (ret)
-			pr_err("%s: failed to register clock lookup for %s",
-				__func__, list->name);
 	}
 }
 
-- 
2.34.1

