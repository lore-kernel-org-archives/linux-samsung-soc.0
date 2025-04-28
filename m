Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF061B0406
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841783; cv=none; b=h3U7tUMw7QBiOtJeZPhR5jWgdWSXWLYKH0bLMQcfUbNt8wCwqE23itWDZ1wSHLYwnfGSlM6L2oUHMXYhkIAIKiXfKpWLfo/1zFhDl9J5eGyynzdMybBBO2eORFo4BpJ2guyFHi4G4/SMZ8HqeySfkOtJDnYm5kn3WtQOamrGdiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841783; c=relaxed/simple;
	bh=/b49vnB81NKamPab6pXiF94lNeuTBKATt/YLaWUSMe8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=BG6t9XOrxKP8rElCsz6kEeX7ysproJcgYKVNpGM0OpuOuFhiTrqaYrecZBon5C9/6w+qarSEK+ujgMvmwI+ybcWrEj8AE96w/Xz04g4flSo+1K72B6aFPzanfjN+XvJHWTR8LSD6QURYJm381GVhmk9ETd+GdJqSfmpH+qWW0PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Y37jAU/q; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y37jAU/q"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428120259epoutp02e1fdce55dd391a5488d786a16523ca4d~6edkpIQoB1888818888epoutp02h
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 12:02:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428120259epoutp02e1fdce55dd391a5488d786a16523ca4d~6edkpIQoB1888818888epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745841779;
	bh=Bm4L8Aca1VQNMol9yyzgzkjnyzS8+ggYjgzFjnj6SfA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Y37jAU/q1mt+4E+oe14HWEZjIo7KfsFJerxqC3cX1c6ydpuiBlF5UDZL4NTcl/i9o
	 mCEHf/ylFFxw1Kb7BSiAiM2d4/cf9ykCF561jdc/zpLpcvT/Fo2Ln4fHyfuYPqDRCE
	 bq5UpvUQH3lAjbw/MFVhSlaHix61X4BP20VUZG9A=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428120258epcas5p30ca5f70f71a5df9b8de11910d8b8dc30~6edj06PwO1311713117epcas5p3S;
	Mon, 28 Apr 2025 12:02:58 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmMXJ4Z89z3hhT3; Mon, 28 Apr
	2025 12:02:56 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f~6eKSeBP7M2838828388epcas5p4b;
	Mon, 28 Apr 2025 11:40:53 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428114053epsmtrp1c3098cf5f1ed0408ee08e14b1630b845~6eKSdPa7Q0239602396epsmtrp1q;
	Mon, 28 Apr 2025 11:40:53 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-2b-680f6945e8f8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A1.10.19478.5496F086; Mon, 28 Apr 2025 20:40:53 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428114051epsmtip19cfc81298abf833ca6d224db61e5b7c0~6eKQSo-O42852128521epsmtip1b;
	Mon, 28 Apr 2025 11:40:51 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	sunyeal.hong@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com, Pritam
	Manohar Sutar <pritam.sutar@samsung.com>, stable <stable@kernel.org>
Subject: [PATCH] clk: samsung: correct clock summary for hsi1 block
Date: Mon, 28 Apr 2025 17:20:49 +0530
Message-Id: <20250428115049.2064955-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnK5rJn+GQe8iE4sH87axWVz/8pzV
	4t6OZewW124sZLc4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1eHZvBZvFl58PmC0O
	v2lntfh3bSOLxafzF9gsmpatZ3IQ8Hh/o5XdY9OqTjaPzUvqPfq2rGL0+LxJLoA1issmJTUn
	syy1SN8ugSuj40xSwUS+iinXLjE3MN7g7mLk5JAQMJE4suAmM4gtJLCdUeLQrxSIuIzEo2kb
	WSFsYYmV/56zdzFyAdW8ZZTYdv8FYxcjBwebgKnExD0JIHERgTWMEl37f7GCOMwCy5kkHjZN
	YgLpFhZwlpiwYw2YzSKgKvHy2gywZl4Be4k1sysgFshL7D94FuwIXgFBiZMzn7CA2MxA8eat
	s5knMPLNQpKahSS1gJFpFaNoakFxbnpucoGhXnFibnFpXrpecn7uJkZwwGsF7WBctv6v3iFG
	Jg7GQ4wSHMxKIrxVBvwZQrwpiZVVqUX58UWlOanFhxilOViUxHmVczpThATSE0tSs1NTC1KL
	YLJMHJxSDUzaCZ3Tw/d7/Z1kuduCWbDl2up5WgfVAiZH7jp2aGlnsY/OcdHVzxZbnFqQFv+0
	NIPn0fzZPhrnw90KXlSpnK89eqd9fieb1b0zXO21fV8ffHXNfLvxj7ziy3cOJXubGo+9s2re
	9uDqbQX3ZecWP1uW/qLhqlheUmuM3vMoOds5+jucNvz2dN7Z87T8S2Vtl9Cu+BMKy5cJMgre
	kt554FXBhDe2pSF/NC2rljw9vsbsgVbOlsR50l2379UEXk3NWpf3+EFWh8ofAfedr3d8q/lT
	krNG+IXN1wsCptccj+078feZYVdVYZLcfKMFNv+8Gur5exX048J8Ta+ZW/+ZUdL1fqKu8dnw
	Qzu9PezPaj1UYinOSDTUYi4qTgQAzwjlAucCAAA=
X-CMS-MailID: 20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f
References: <CGME20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f@epcas5p4.samsung.com>

When debugfs is mounted to check clk_summary, 'mout_hsi1_usbdrd_user'
shows 400Mhz instead of 40Mhz. Snippet of the clock summary is given
as below

dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
  mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
    dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...

Hence corrected the clk-tree for the cmu_hsi1 & the corrected clock
summary is as mentioned below.

dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
  mout_clkcmu_hsi1_usbdrd   0 0 0 400000000 0 0 50000 Y ...
    dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
      mout_hsi1_usbdrd_user 0 0 0 40000000  0 0 50000 Y ...

Fixes: 485e13fe2fb6 ("clk: samsung: add top clock support for ExynosAuto v920 SoC")
Cc: stable <stable@kernel.org>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index dc8d4240f6de..b0561faecfeb 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -1393,7 +1393,7 @@ static const unsigned long hsi1_clk_regs[] __initconst = {
 /* List of parent clocks for Muxes in CMU_HSI1 */
 PNAME(mout_hsi1_mmc_card_user_p) = {"oscclk", "dout_clkcmu_hsi1_mmc_card"};
 PNAME(mout_hsi1_noc_user_p) = { "oscclk", "dout_clkcmu_hsi1_noc" };
-PNAME(mout_hsi1_usbdrd_user_p) = { "oscclk", "mout_clkcmu_hsi1_usbdrd" };
+PNAME(mout_hsi1_usbdrd_user_p) = { "oscclk", "dout_clkcmu_hsi1_usbdrd" };
 PNAME(mout_hsi1_usbdrd_p) = { "dout_tcxo_div2", "mout_hsi1_usbdrd_user" };
 
 static const struct samsung_mux_clock hsi1_mux_clks[] __initconst = {
-- 
2.34.1

