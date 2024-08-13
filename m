Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6033A19AA5F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Aug 2024 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546559; cv=none; b=Bw2UpQtSiSjhPogB438revxya0Rj/TVRNHEzFk92n/Gm83gg1HcDFkrgDMsuP/vaNo7BDpJ55E5rt6fdUvLD+EA/iXjn0SP9xt6x/eaXx4eI5dxjIQvaahalyoVpzWze8g5w7UXNs0LY3rzNg6p9A5Xd8yT7+LjeNGgEmGLGaWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546559; c=relaxed/simple;
	bh=kbA17NJL8Bg6bVidDlRjnvQZMG/VAgKi+5BtuEC4yqU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TDJQrJ+BJx6KG+vz5inikY15Dtg3lYZyIvaVkJ5uQIHU0K3BzBEsvO2VzxeGd0n2VDVQvY03QoKtoM9DpS9KrHu30d4D456OKLAaymmoQcAO5vvrHaL92kl1PtDM+sE82TuYksLZY7gYgCrckz/orTPFANpbR09mwxzCW+rh+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wjp8J0RZ9z1S7lq;
	Tue, 13 Aug 2024 18:50:56 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F642180019;
	Tue, 13 Aug 2024 18:55:47 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 13 Aug 2024 18:55:46 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <linux@armlinux.org.uk>,
	<cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: [PATCH -next 0/2] Remove unused declarations
Date: Tue, 13 Aug 2024 18:55:43 +0800
Message-ID: <20240813105545.1180788-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)

Remove unused declarations, thanks!

Gaosheng Cui (2):
  ARM: s3c: remove unused declarations for s3c6400
  ARM: s3c: remove unused s3c2410_cpu_suspend() declaration

 arch/arm/mach-s3c/pm.h      |  2 --
 arch/arm/mach-s3c/s3c64xx.h | 11 -----------
 2 files changed, 13 deletions(-)

-- 
2.25.1

