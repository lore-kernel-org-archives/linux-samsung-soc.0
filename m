Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD762ED859
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383100; cv=none; b=lBw3Q4UKvBT9cOrxJv+ef3OWI2dllWU7mtUi9be2aj8AMmgC/2+AzmovxUTmZ+d1qzMNEegySqvrslqTvvv9t4nr3nlDqc9TfUiofi5ad250TUnUTgp5wVepHXzIXHMvJGP8v0S2WvonWgV6+a/QPBSPre0XQe66TnbGXa1cRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383100; c=relaxed/simple;
	bh=9NKEhvYdRAJ4FWTGiYoKj2Ww3AowxSsxc1dQxyBeCG8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cdaHia3qmC5iZyqbmBc498vHxNFSmyl5BYrJlYYa0M4zYwg2XOvoeavsadYKQzVfn9eL2KMBcNpSIlMSFvN5kXeXnYcJbUU35xqEjvsVV7PwQLUEBARuJXV6xc2PTd7yvOp1bck0zqpFlwELZ+JswhpNXCspaqxnWxXAlk4W9go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=GRYA+R7v; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="GRYA+R7v"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1753383086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=INETfDhMq3ho0Q60P+GXV/uFAEh01ayuK4bO9zYR/ns=;
	b=GRYA+R7vJlTq3AzhSrftA88pU9Y1cw6OIuQi6mamNuUIQZX1qwndjfVPQ+lqoED+VQRZgB
	YCEP9B/xrt0qjECHrXk/jdFPe3ruqI838fjusTre+8YuXdvX9MExuZ83O3oxjSuuRZIlnI
	jycLYjytZmYKbGcndhN1xf1aHmrqMek=
From: Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 0/3] drm/bridge: sii9234: use extcon to detect cable
 attachment
Date: Thu, 24 Jul 2025 20:50:50 +0200
Message-Id: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIqAgmgC/3WNQQ6CMBBFr0K6tqYzFIuuvIdhoXaASRTMjGkgh
 Ltb2Lt8L/nvL0ZJmNRcisUIJVYehwx4KMyzvw8dWY6ZDTosAaG2NM3DqN4q8xlLb6NwIrGxhhD
 9owKIlcnjj1DL0x6+NZl71u8o8/6TYLNbsnIB4V8ygXUWyQeKDttTCNdO+P0iOSqZZl3XH8iHr
 yi9AAAA
X-Change-ID: 20231218-exynos4-sii9234-driver-d817d4b511d5
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559; i=henrik@grimler.se;
 h=from:subject:message-id; bh=9NKEhvYdRAJ4FWTGiYoKj2Ww3AowxSsxc1dQxyBeCG8=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBogoCg0x8hvkodlf8ALwjY3RHUD2RmAgqs6FmL8
 kt8p2FtnDmJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaIKAoAAKCRCwB25JC3Fh
 a2DJCACnYjkp/VkdrAd5XAL2q8gfhbACxnvuQcM/AxVHUR43WFpUl68v+308QtenpZOE28qN9sg
 llYpwCjtGbYgOykvvcQ7MQDSw8KLF25uW8SkMFJSxCCwVcEaxz+tGBGfG+OFJ4laIedZ07NGSMQ
 BOQ4K7UYYRCF3qhU68l8uG/vGmXRIfcNCXItjYc+lBG80BYhFqoNZ2cErPV+0EM8ZMRenrMPeMN
 U9AIqIjkiRvpPHA0Bj3StnqqJw69QkkhghQggESQYg6+DYDtO4YB3zmZWzqkHZOfQBzTAhnmMt9
 fSDdq72RxJZ5oZq6GP1UBpRAVk8yl8lS3OsY27SgMY1xROVG
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

Hi,

This series fixes so HDMI through the sii9234 MHL chip works when
cable is hotplugged, by making the MHL chip use extcon cable detection
functions. Patch 3, that actually implements the extcon parts, is heavily
inspired by commit 688838442147 ("drm/bridge/sii8620: use micro-USB
cable detection logic to detect MHL") by Maciej Purski.

Before these changes, HDMI only worked if cable was plugged in before
booting. If no cable was connected, then wlr-randr still showed HDMI
as connected, with 0x0 px, which confused at least some UIs (phosh)
and caused problems:
https://gitlab.gnome.org/World/Phosh/phosh/-/issues/828

Tested on exynos4412-i9305.

Best regards,
Henrik Grimler

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
Changes in v2:
- Add dependency on extcon in patch 3. Issue reported by kernel test robot <lkp@intel.com>
- Link to v1: https://lore.kernel.org/r/20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se

---
Henrik Grimler (3):
      drm/bridge: sii9234: fix some typos in comments and messages
      drm/bridge: sii9234: use dev_err_probe where applicable
      drm/bridge: sii9234: use extcon cable detection logic to detect MHL

 drivers/gpu/drm/bridge/Kconfig   |   1 +
 drivers/gpu/drm/bridge/sii9234.c | 121 ++++++++++++++++++++++++++++++++-------
 2 files changed, 101 insertions(+), 21 deletions(-)
---
base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
change-id: 20231218-exynos4-sii9234-driver-d817d4b511d5

Best regards,
-- 
Henrik Grimler <henrik@grimler.se>

