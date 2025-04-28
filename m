Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A7625E82F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 08:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830054; cv=none; b=j7Gqs4kMEUWUKVJbrKkpSzCG4djq2rKUEQlpZJnk90+yeuUhi/HA/xKuit/NU0IT2A8+FuWBkiVLQ0Vn1f22HPReEZCZYgOZKckBayWLaCHntlDXfl47g0LdA9fBOSlvfxebM0Dmx5lGtYxaT7o9YopC+Tyj4aJ0KmjEd/+VMto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830054; c=relaxed/simple;
	bh=ALaiR88qvXFJIUmu58oY0ESBsL6U0JAP269AMEHKkqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=U8EOqykpy7LNK12kHQEbS0uXkLKsfNQvovBzMuD5HzzQoYjM0tLFLNsozfRGEWV+crMUy2Mi8z6TNo+8yy+BmWzyP7L8PRFcOwgl0/m7EW8UnH0Fy52RdPGi9J7vM80jKLSY+YSJQhAEfpl3szvGWDwjxuaMbDy/v2yvnHZVDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TSBuK5Dr; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TSBuK5Dr"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250428084730epoutp042e1dc398eab6c75484e947cf4bfa9aed~6by5TYNCs2874428744epoutp04J
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 08:47:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250428084730epoutp042e1dc398eab6c75484e947cf4bfa9aed~6by5TYNCs2874428744epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745830050;
	bh=p1+Lemg+qbGP6JCQYk04uUjgz5ILrVlgfWOlXzA9lNA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=TSBuK5DrZ531nBgpBoo7V2HYlUy3Ub4EUVoWTY1fWOP901k5jvcy4Yn0zvNm5Sgw0
	 tiDcRVLL7eACFy1sOCg8oD5gbHVD/E9q4YcGsCJi+2AyVejDWH6eV1J6BWC6SpI5uh
	 SoxEHs9yF3qP3NOOuDw1QzJHd/dxk07X4G6/kXIw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250428084729epcas2p296c44e87443066ec54d24bbfa8a82374~6by4qJB9u2928529285epcas2p2Q;
	Mon, 28 Apr 2025 08:47:29 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZmHBn2BQMz2SSKb; Mon, 28 Apr
	2025 08:47:29 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epcas2p486ddfccc41bfba9830bde544b6c292e3~6by3m4Zwk0662806628epcas2p4u;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428084728epsmtrp25df5462bc512891301f9dab2ce97bbad~6by3lzUKR1061810618epsmtrp2F;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-12-680f40a06ee7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F4.92.08805.0A04F086; Mon, 28 Apr 2025 17:47:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epsmtip1f94ab56908a3859038aa68d6f3061eb1~6by3TJUDy1894718947epsmtip11;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] add CPUCL1/2 clock support for exynosauto v920 SoC
Date: Mon, 28 Apr 2025 17:47:18 +0900
Message-ID: <20250428084721.3832664-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnO4CB/4MgxlzRS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CV0f1kP2PBM5aKFWfvMjYwfmTuYuTkkBAwkZg/aQp7FyMXh5DAbkaJrlXX2CASEhKHZ0xg
	hLCFJe63HGGFKHrPKHFi60OmLkYODjYBVYlNv+VB4iICb5kklv8/wATSwCxwmlFi5xkZEFtY
	wF1i3tt7LCA2C1D96teHwTbzClhLdPyeyA4yR0JAXqK/QwIiLChxcuYTFogx8hLNW2czT2Dk
	m4UkNQtJagEj0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOCA19Lawbhn1Qe9Q4xM
	HIyHGCU4mJVEeKsM+DOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ83573ZsiJJCeWJKanZpakFoE
	k2Xi4JRqYKpL/FHsuN93xbWZiywyuJM9u+/FJnx9q7AvkOG23W3B7ZP+JvMqCGSXhckeu60W
	9vvSv/h4YZEph27z7Ph0ML737Zd7QnM+W3VyzTnO+m9Cmv6LR/v+PI/6FS5199DBxEOzonc9
	uqQrxmD1WGyf1JdXpzd+O7v8wY0Hj5JEPJQEIu2m60q5M/iuX/o6cv8etlQL+XzFLfaa02T+
	8icePLIlJd5NWuMc5x++xDNCy+eeXHPnhLmE2aOzfPeXTr59cMKj6gUdDpODT6zh/8uQdVJl
	w6/n8i275dSOzK+c7drxijntxOmsr1PtbO+0MB72VEti2xU8Idlyd7+M2OqdPYozZnSVWvzM
	YvO5uyD9xjwtJZbijERDLeai4kQAlxOQ0OcCAAA=
X-CMS-MailID: 20250428084728epcas2p486ddfccc41bfba9830bde544b6c292e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p486ddfccc41bfba9830bde544b6c292e3
References: <CGME20250428084728epcas2p486ddfccc41bfba9830bde544b6c292e3@epcas2p4.samsung.com>

This patchset adds the CMU_CPUCL1 and CMU_CPUCL2 block
to support exynosauto v920 SoC.

Shin Son (3):
  dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
  clk: samsung: exynosautov920: add cpucl1/2 clock support
  arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   |  45 ++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  26 +++
 drivers/clk/samsung/clk-exynosautov920.c      | 208 +++++++++++++++++-
 .../clock/samsung,exynosautov920.h            |  32 +++
 4 files changed, 310 insertions(+), 1 deletion(-)

-- 
2.49.0

