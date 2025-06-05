Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A0C1F8EF6
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Jun 2025 03:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095206; cv=none; b=Oq3Bc1QLx/FWYITGHLc8KNmRTlBUl0wbubDewgUDjMKFZ+a/NMn7PBEEjkZUM0F4T0AVshAGcIcztdWNbxqv60V9spegM0HJa1CuaoxCWMv2hxsFSLLsy2W+2k56Wch6Iri020EjLyWbTNQ0nECNKsLX71JsS2HS2qKINZcgJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095206; c=relaxed/simple;
	bh=MUHWOWeXTgH9muEniE1HyqfCld1wHUnfwns2dOYTIa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GazDgOHMOWYeII4196VuFls2wy7kMTpm2B0D5rc//TepYDdqgP2Zvn9GdLN7Z/CaW5GVkwm3MO8fne5T3n1EO+NVp/a/eMVMP510XK/KVPd+OXfAtEOeC4CmbCAP/IYvu5JGvv4/a8cEoun2AWpiZeAWhMPC8ny+f8XSUmy7P7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LkdYwNw1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LkdYwNw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6e2st0+iShieSpNODIcFg9Fz76rcQ8IPCC/t8w4mYog=;
	b=LkdYwNw1vG61c152ek2cYT/9p1Ye/U+fxed61PnPfaLsK4OUl6MIluaiHEqV2G+QMxeury
	IvhuhcMqREcbWVjjwAAXXqqmXeTEbtE8URu0hn+aVw7udJGmMfnz6p6uMKVVD5/ozAPuGe
	XSSqeNfqPccK9TEhVZDWBvxO37I+LH0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-qugyn03mOlKnyIwd7JPoig-1; Wed,
 04 Jun 2025 23:46:41 -0400
X-MC-Unique: qugyn03mOlKnyIwd7JPoig-1
X-Mimecast-MFC-AGG-ID: qugyn03mOlKnyIwd7JPoig_1749095198
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E3511956087;
	Thu,  5 Jun 2025 03:46:37 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 333EC30002D0;
	Thu,  5 Jun 2025 03:46:31 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 04 Jun 2025 22:45:11 -0500
Subject: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=724;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=MUHWOWeXTgH9muEniE1HyqfCld1wHUnfwns2dOYTIa0=;
 b=cbmycYmHSdj0wZkt3skRJ+iJH83a782N60NXKJyhCr1Otr9BxxDh1Y4WRMxJOXiqnntYUVaDi
 RbiUhWsYhRoDKaddXeGeS5o2Wqs82qUAiaYXWug1uhWM7Kz5R6/4y/o
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Put the panel reference back when driver is no
longer using it.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573de657af7fd14388 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 			dsi->out_bridge = ERR_PTR(-EINVAL);
 	}
 
+	drm_panel_put(panel);
 	of_node_put(remote);
 
 	if (IS_ERR(dsi->out_bridge)) {

-- 
2.48.1

