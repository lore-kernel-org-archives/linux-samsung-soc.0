Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E55168BE
	for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Dec 2024 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733013885; cv=none; b=OTE8cCaBNXexq/Ym8x3S6Ql25rWLl7WDlVZItISvgspEf2Fti+VnQTVzQmQUU9X7i+V7H6QidIzd20B13s3vLDITurFTDmCO9VtUqaTW/ITs2yoa34V0Qr2XPqfSpCQiI46YUhgnGUPO8euCcJLi+Fd41bmVPYAOLRVrDyoj2sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733013885; c=relaxed/simple;
	bh=m9cAK5FN1NFJb6UQkn9k+gemX+2/diBeTweGL7F7R7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a15yIuUbP+HmGHQpZzyyp3bs1rGhCrRagrLr/5Ip372DZ1cqk9fldu4lPhnfH4ty6xCf+phur+MT/2Xrife05XX25W+FYALGKt/WRvPF5FMq/+IkP80AbfzAWMNnxFHWv6RX3afsTj5Zh73EqD0GOsNvjPpQcMIvLTJfmKa5dxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atE602nR; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atE602nR"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d0cfb9fecaso1017587a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Nov 2024 16:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733013882; x=1733618682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDP6TwU0/tWdPmghJyb5pX8fLQAMwFaK6bFPGzZBnzs=;
        b=atE602nROzQ6JDfkjK+qFsGSRTR6UQRSLr46LU+aPuOb+5NjKV7o1V9O7tNzHJOBmr
         Zkz4uxypCZklDkEgUOnhPcF/bP9SrvPUavuZT7n/5qIR2bZAcmVPs5PJwnAc/Nx5Xrju
         7gon2W19qcMaqQ53NapmdCfduBQZCL8UT4j2phPg3gzRCPp8GJF/hppFOX20Vpo/Ztdp
         482UmEXmaVYiajbfpqCrvDiBGgwU7z3WYH+3wq8BWtrAEcU2GwIfITCCo2M4PXAWCz4J
         BeEKT2fSOOKUfVQk7IFuzwqRu9BxyUk8MvNs46W8FD6nybVBDxfhmB64GZFRY6ugPNNJ
         5XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733013882; x=1733618682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDP6TwU0/tWdPmghJyb5pX8fLQAMwFaK6bFPGzZBnzs=;
        b=NryRE+vaeb9Kwb3GJDv5z4KhJKpvBbrw4jxEN4+5zmQYHqcWoIml2FSIBDcee+2DeI
         TStC85XeTrO0LNvJs+QNXN5RbIWetTylnotqBZ//Uq0nLzX0yysQuz7UySVUR82adpeg
         Zx0WDcgdbMzuyeVHPdj4nCOA2NVRWhM6phsfBa1+a1i8klKPgXSRoYRKXxtZfqEfFVpl
         QlZIUmUPlDJYnyR+zQ+hQ2LaKU9QO56EQ2WynLQDQqYtVOOyV3GQybTN2z+qmzmaLf8D
         d2ej3v1qvqW31VGISpLOcjvIhEaJIYvDlQQgsg8sFq8EmazlfXDkdrP8TpUidZqidGW7
         xySQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtbN8izvyzADVWVJ1HZKw2o/NgQFG2FN1fqe7vQIRG6qJpMn0mkBjNQe9odAY0yo/b7ZwoTGOW2eLA/ru2EwWyww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFb8L+jBcPbgokWE7TYwFbGXxnWbpIu9mGoNZ2LqEyweCv1YA6
	W3jvknZf+iJu4yKd2r1cPXtX5DfmQmCyneY971g5xtssixY8xloEmg3h6v0pEqc=
X-Gm-Gg: ASbGncuS/XqGAF4vKRtzg5SQx/g3LXzNCjJKXWA5VCTBXjvRh05Hll9W0GlDfxBZxI4
	yrdKvL22R+AlvB3yOhxlw1unZ4eVejxqIz095a1TnddUsw4TZ+70mUh1b8+7S1IQZM9R91wCs/J
	RshdYuuLqKed9yikBD27pLMHzYVtjkLWoplNCFvCy5XSS9y2v2VoPGcDVE1W//Cb4TFyAvIWwvG
	oQxdsgCKht2ipgA+5T82kFDPENH39p2zQ7YWCmyMQx9kx0m8sX6UOLFPQ==
X-Google-Smtp-Source: AGHT+IE5Iodta2UQP6qjtd0G2oZywxiR+z/FGF+U8cJWDKR8GZEI1K1wlfh9Q8JImD1VouVwulpc4Q==
X-Received: by 2002:a05:6402:26cf:b0:5d0:8f25:24ff with SMTP id 4fb4d7f45d1cf-5d08f252625mr12479352a12.14.1733013882366;
        Sat, 30 Nov 2024 16:44:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 16:44:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:13 +0200
Subject: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m9cAK5FN1NFJb6UQkn9k+gemX+2/diBeTweGL7F7R7w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS7FZMmMFV20DgQUuh8v5FF4nWRo8BcSipooZa
 EIAyUUoJziJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0uxWQAKCRCLPIo+Aiko
 1dDwB/wJfW4xZABPDcU/eL/SukBx0cSr5TyqsC+NOU/8rIY3SPpHoNzt2tfD+tYhv2vKAqVGaT+
 Y0Pd3xmibwzv12VUOjFt+1ZbNthzF8qyG6keOs747UGZJQ69PhRds6t4Rw0KD2DFD1qgLnoX/w3
 NmWud73M/PrrwTQ2hUm3HuLVNhUfXRhEp/60uu1faJkCzG0RKUK8ibOREThgoBWt/fKvWDG+Ohf
 Vsyc20q84GR6TrucJQRzobBfpKYBr77Vpb3pn0XZ9hGN3YwhCtLPDipCwnoXnmPkM17bSL8dJW4
 kP1LucL4uQp1AahjZxJZFLIhzCNDNlresD4ccZFTjoNzadBW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d0a9aff7ad43016647493263c00d593296a1e3ad..d83f587ab69f4b8f7d5c37a00777f11da8301bc1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -401,13 +401,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 */
 
 	if (status == connector_status_disconnected) {
+		drm_atomic_helper_connector_hdmi_update_edid(connector, NULL);
 		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return;
 	}
 
 	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
 
-	drm_edid_connector_update(connector, drm_edid);
+	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
+	// CEC support
+	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
@@ -487,7 +490,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	 */
 
 	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
+	// CEC support
+	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 	if (!drm_edid)

-- 
2.39.5

