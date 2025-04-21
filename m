Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A798438FA3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2025 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247660; cv=none; b=ZDr3U6FtrKK9YSIVKmpbniWKT+72+tv+NV2NMAgf6C8Tjz0ip9cyJQiFQ4BBlA5kpuGwX+xk4e2bAGeDbQxWCp3EsKPQmAXMEzWxb3fmfj7v1OfeuC9uqAyOZ/hGdpHyyZZs2Ae1Thmpl+3P5LglrklQm6y0T2E/IQBq17hb9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247660; c=relaxed/simple;
	bh=8qQKK6iHVZRFxXDwRbHy9dFUrW2W8xmRopS1rbR5HBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aHpZ1vpYVdMSecpj4oQY5OZFU09ufeU4ESi0QrnsouUdrYiMtq+4nDpqlwguX3wfbZ/qwu2DVSjBQYOzYWquDWxaWe2+Jlx6MI35EtVYz0NakXpzjTVhzQrbz5a9p1n4tRq5KEHaMnPZUVpdDZmO4zQGGybsuG/RWcePwW5TbSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=q5p6dxjk; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="q5p6dxjk"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6sdZuvbDkiSFB6sdduVHlN; Mon, 21 Apr 2025 17:00:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745247650;
	bh=hvgOCveyWcT55hGDFl+zrCOGaTfBGCvJmO/UgmwljUs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=q5p6dxjk2V6jat3S3UlHHttbHBSbf5NzhkhIZN57kY6EzNUXND4oIwlpFB6+NJvGT
	 u60Xyncyaf2A1rpKbZ1thHxRiw7eISNDs1kclTQ0X31UpPbyjUkPewpMj72y9jsTlZ
	 0dxSsn4WU851rfsn6MU/Gc0mOe/BW4tuTg0bO7RRCBYGUYhhG4EdORoU3z75GDYhQG
	 E3452sANXI5aju5lIM+W5lTBGS/j7ofBkQhPEPE92W8UgHB5bVESMhR6/sqooF2Ght
	 qLljc7U6i9MY0GlW7hRqWGu0WqfDObCvsphraL3jzl9+0wZkD264S4e8WrId+8QKaQ
	 JCtAX25CnAA+w==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Apr 2025 17:00:50 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	m.szyprowski@samsung.com,
	ideal.song@samsung.com,
	beomho.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 0/3] mfd: exynos-lpass: Fix some error handling paths
Date: Mon, 21 Apr 2025 17:00:32 +0200
Message-ID: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie fixes several issues related to error handling paths in
drivers/mfd/exynos-lpass.c.

I've split it in 3 patches to ease review, but it could be merge in only
1 patch if preferred.

Patch 1: Fix a leak in the error handling path of the probe. It should
be straighforward. This patch is already R-b.

Patch 2: Slighly unsure of the order of the code. In the probe, we
enable pm, then lpass, so should we disable lpass, then pm?
This patch is already R-b.

Patch 3: Fix a leak in the error handling path of the probe. It should
be straighforward. This replaces patch 3 and 4 of the v1.


All these patches are compile tested only.

Christophe JAILLET (3):
  mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
  mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in
    exynos_lpass_remove()
  mfd: exynos-lpass: Fix another error handling path in
    exynos_lpass_probe()

 drivers/mfd/exynos-lpass.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

-- 
2.49.0

