Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6C51F55FA
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Jun 2025 03:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095202; cv=none; b=iCdjfKjyIBm7otJA5QTbmcpvkdGDy94NaV/tliJODNMFdE2muRjoPq2z2yLMses1tWG5NU7an/nPInYmqREA41Axrg4oAeB2as78amFO9k1ex9kouUMLumO2DXP3sStcc1/sxie9LpUBjRl3J6J5z55vj/TD7Kyw+vCjhuwQehc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095202; c=relaxed/simple;
	bh=9zlGo30GCNSbMrsJ6h0xg1RV+1gEkhPqt5tGuwTBh00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4ASihDznRM+ljv2h6uzF4owmY0FJg5/EnqnHtnEojFViEp3ZtbIMx05gcR7v/5Jx5Tr2dPfmXjzUYUSb9ql0NJWnxXimUsj6HEPA6exv4WLSqKEwibsRAeq1am6IkeGhZnPlA70qNKJa/hRmc63XBlMXSrbxyb0Ed6jnIKeyfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2j6TlpN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2j6TlpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXHAO2+jY1bXsxo50PiVK4q6TUh1IfN7fKlHU0JYCOM=;
	b=V2j6TlpN0rrE8CeeurANwNg2JYAoBkhSkzScbCMlgvOduC7XSeJKBjqNEQHUkCWpGCFLhM
	TZ4c1EEny0EUsp2G6j9ts9b8tLqtlk6Afd3Uvh1sNZQdVDir73KzKThRV8zlGPl/mVlCCD
	kUvo3757BL02mdEE5Ko9Fd3TsvU4mkM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-WRIv9wjSOb2byFW1NMyImQ-1; Wed,
 04 Jun 2025 23:46:35 -0400
X-MC-Unique: WRIv9wjSOb2byFW1NMyImQ-1
X-Mimecast-MFC-AGG-ID: WRIv9wjSOb2byFW1NMyImQ_1749095192
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1ED9D180035E;
	Thu,  5 Jun 2025 03:46:31 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 284E630002C3;
	Thu,  5 Jun 2025 03:46:24 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 04 Jun 2025 22:45:10 -0500
Subject: [PATCH 1/4] drm/panel: get/put panel reference in
 drm_panel_add/remove()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-of_drm_find_panel_part1-v1-1-c632e12e131d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=1068;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=9zlGo30GCNSbMrsJ6h0xg1RV+1gEkhPqt5tGuwTBh00=;
 b=PwnWFuSL2mOqVpmilI7vyag4kWY0qQx64BLJk5k/blISrap7GAOY6KekL8K+39wUERLlVUEzo
 r6A1ALUIQJVAHBbQoY9hPNQ3uFgAdg+lUDedlFvVmd78a7utw8mk4A0
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Take the panel reference and put it back as required.
drm_panel_add() and drm_panel_remove() add a panel to
the global registry and removes a panel respectively.
Use get() and put() helpers to keep up with refcounting.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index fee65dc65979d6c03753967cefa6d5c4e597277d..ffa3428b5f52c599b53b1fdc0d0a9181a47c91d4 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -80,6 +80,7 @@ EXPORT_SYMBOL(drm_panel_init);
  */
 void drm_panel_add(struct drm_panel *panel)
 {
+	drm_panel_get(panel);
 	mutex_lock(&panel_lock);
 	list_add_tail(&panel->list, &panel_list);
 	mutex_unlock(&panel_lock);
@@ -97,6 +98,7 @@ void drm_panel_remove(struct drm_panel *panel)
 	mutex_lock(&panel_lock);
 	list_del_init(&panel->list);
 	mutex_unlock(&panel_lock);
+	drm_panel_put(panel);
 }
 EXPORT_SYMBOL(drm_panel_remove);
 

-- 
2.48.1

